/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.pro.ProItem;
import cn.com.fanrenlee.model.tables.TCostaccountFentan;
import cn.com.fanrenlee.model.tables.TCostaccountJob;
import cn.com.fanrenlee.model.tables.TProDic;
import cn.com.fanrenlee.model.tables.TProResult;
import cn.com.fanrenlee.model.tables.TProSrc;
import cn.com.fanrenlee.util.StrUtils;
import cn.com.fanrenlee.util.doc.ExcelUtil;

/**
 * 项目理论成本算法
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Service
public class ProService extends SimpleServiceImpl {

	@Resource
	CostAccountFentanService costAccountFentanService;

	/**
	 * 保存原始数据
	 *
	 * @param inpd
	 * @return
	 * @throws ServiceException
	 */
	@Transactional
	public Integer saveSrcDate(InputStream inputStream, final Integer jobId) {
		//删除旧数据
		deleteProSrcDataById(jobId);
		
		List<List<List<String>>> srcData = null;
		try {
			srcData = ExcelUtil.transExcelToData(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
			throw new ServiceException("excel解析失败");
		}
		if (srcData == null) {
			throw new ServiceException("excel解析失败");
		}

		// 原始业务数据
		final List<TProSrc> srcItems = getProItemsFromSrcData(srcData);

		// 保存业务数据
		String sqlService = "insert into t_pro_src (" + " pro_code, pro_name, dept_code, " + " dept_name, t_job_id "
				+ ")" + " values (?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sqlService, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TProSrc item = srcItems.get(i);

				ps.setString(1, item.getProCode());
				ps.setString(2, item.getProName());
				ps.setObject(3, item.getDeptCode());
				ps.setObject(4, item.getDeptName());
				ps.setObject(5, jobId);
			}

			@Override
			public int getBatchSize() {
				return srcItems.size();
			}

		});
		return jobId;
	}

	/**
	 * 从原始excel数据中获取业务数据
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TProSrc> getProItemsFromSrcData(List<List<List<String>>> srcData) throws ServiceException {
		if (srcData == null || srcData.get(0).size() == 0) {
			return null;
		}
		List<TProSrc> srcItems = new ArrayList<TProSrc>();
		List<List<String>> sheetDataItem = srcData.get(0);
		if (sheetDataItem.size() <= 2) {
			throw new ServiceException("第一页数据不符合规范，至少应有2行数据");
		}
		for (int i = 0; i < sheetDataItem.size(); i++) {
			// 忽略标题行
			if (i == 0) {
				continue;
			}
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 4) {
				throw new ServiceException("基础数据行至少应有四列数据(行" + (i + 1) + ")");
			}
			TProSrc srcItem = new TProSrc();
			for (int j = 0; j < rowDataitemSize; j++) {
				String cellData = rowDataItem.get(j);
				if (j == 0) {// 第1列-项目代码
					srcItem.setProCode(cellData);
				} else if (j == 1) {// 第2列-项目名称
					srcItem.setProName(cellData);
				} else if (j == 2) {// 第3列-科室编码
					srcItem.setDeptCode(cellData);
				} else if (j == 3) {// 第4列-科室名称
					srcItem.setDeptName(cellData);
				}
			}
			srcItems.add(srcItem);
		}
		return srcItems;
	}

	/**
	 * 计算任务项目理论成本
	 *
	 * @param jobId
	 * @throws ServiceException
	 */
	@Transactional
	public void execPro(Integer jobId) {
		// 获取任务信息
		TCostaccountJob job = costAccountFentanService.getJobByJobid(jobId);
		if (job == null)
			throw new ServiceException("任务不存在");

		// 更新任务状态-进行中
		costAccountFentanService.updateJobState(jobId, "1", 0);

		long timeStart = System.currentTimeMillis();

		// 删除旧任务相关的所有分析数据
		deleteProDataById(jobId);

		// 获取原始业务数据
		List<ProItem> srcData = getSrcData(jobId);
		// 获取字典数据
		List<TProDic> proDics = getDics(job.gettHosId());
		// 获取分摊计算分摊数据
		List<TCostaccountFentan> fentanLevel0Datas = costAccountFentanService.getFentanLevel0(jobId);

		// 项目成本计算
		ProItemHandler proItemHandler = new ProItemHandler(srcData, proDics, fentanLevel0Datas);
		proItemHandler.handle();

		// 保存-计算数据
		saveData(proItemHandler.getResultData(), jobId);

		long timeEnd = System.currentTimeMillis();

		// 更新job状态
		costAccountFentanService.updateJobState(jobId, "2", timeEnd - timeStart);
	}

	/*
	 * 获取字典数据
	 */
	private List<TProDic> getDics(Integer hospitalId) {
		return jdbcTemplate.query(" SELECT * from t_pro_dic where t_hospital_id = ?", new Object[] { hospitalId },
				new BeanPropertyRowMapper<TProDic>(TProDic.class));
	}

	/**
	 * 保存计算数据
	 * 
	 * @param fentans
	 * @param jobId
	 */
	private void saveData(final List<TProResult> items, final Integer jobId) {

		String sql = "insert into t_pro_result " + " (dept_code, dept_name, " + " pro_code, pro_name,"
				+ " cost_direct, cost_serve, cost_all, " + " t_job_id) " + "values (?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TProResult item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setObject(3, item.getProCode());
				ps.setObject(4, item.getProName());
				ps.setObject(5, item.getCostDirect());
				ps.setObject(6, item.getCostServe());
				ps.setObject(7, item.getCostAll());
				ps.setObject(8, jobId);
			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});

	}

	/**
	 * 删除已计算数据
	 *
	 * @param jobId
	 */
	public void deleteProDataById(Integer jobId) {
		jdbcTemplate.update("delete from t_pro_result where t_job_id = ? ", jobId);
	}
	
	/**
	 * 删除原始数据
	 *
	 * @param jobId
	 */
	public void deleteProSrcDataById(Integer jobId) {
		jdbcTemplate.update("delete from t_pro_src where t_job_id = ? ", jobId);
	}

	/**
	 * 获取某次任务的原始项目数据
	 *
	 * @param jobId
	 * @return
	 */
	public List<ProItem> getSrcData(Integer jobId) {
		return jdbcTemplate.query(
				" SELECT " + " pro.`dept_code`,pro.`dept_name`,pro.`pro_code`,pro.`pro_name`,pro.`t_dept_id`, "
						+ " ca.`cost_asset_amortize`,ca.`cost_old_device_special`,ca.`cost_old_house_device_common`, "
						+ " ca.`cost_other`,ca.`cost_people_fzzys`,ca.`cost_people_hs`,ca.`cost_people_js`, "
						+ " ca.`cost_people_qt`,ca.`cost_people_zrys`,ca.`cost_people_zzys`,ca.`cost_vc_funds`, "
						+ " ca.`people_count_fzrys`,ca.`people_count_hs`,ca.`people_count_js`, "
						+ " ca.`people_count_qt`,ca.`people_count_zrys`,ca.`people_count_zzys`, "
						+ " ca.`work_count_inhos`,ca.`work_count_kdgzl`,ca.`work_count_kdsr`, "
						+ " ca.`work_count_mz`,ca.`work_count_xdgzl`,ca.`work_count_zxsr` "
						+ " FROM t_pro_src pro LEFT JOIN " + " t_costaccount_src ca "
						+ " ON pro.`dept_code` = ca.`dept_code` AND pro.`t_job_id` = ? AND ca.`t_job_id` = ? ",
				new Object[] { jobId, jobId }, new BeanPropertyRowMapper<ProItem>(ProItem.class));
	}

	/**
	 * 获取原始数据列表
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getSrcDataList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * FROM `t_pro_src` t where t.t_job_id = ? ");

		values.add(params.get("jobId"));

		// 项目名称
		if (!StrUtils.isNull(params.get("proName"))) {
			sb.append(" and t.pro_name like ? ");
			values.add("%" + params.get("proName") + "%");
		}

		// 科室名称
		if (!StrUtils.isNull(params.get("deptName"))) {
			sb.append(" and t.dept_name like ? ");
			values.add("%" + params.get("deptName") + "%");
		}

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

	/**
	 * 获取结果数据列表
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getResultList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * FROM t_pro_result t where t.t_job_id = ? ");

		values.add(params.get("jobId"));

		// 科室编码
		if (!StrUtils.isNull(params.get("deptCode"))) {
			sb.append(" and t.dept_code = ? ");
			values.add(params.get("state"));
		}
		// 科室名称
		if (!StrUtils.isNull(params.get("deptName"))) {
			sb.append(" and t.dept_name like ? ");
			values.add("%" + params.get("deptName") + "%");
		}

		// 项目编码
		if (!StrUtils.isNull(params.get("proCode"))) {
			sb.append(" and t.pro_code = ? ");
			values.add(params.get("proCode"));
		}
		// 项目名称
		if (!StrUtils.isNull(params.get("proName"))) {
			sb.append(" and t.pro_name like ? ");
			values.add("%" + params.get("proName") + "%");
		}

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

}
