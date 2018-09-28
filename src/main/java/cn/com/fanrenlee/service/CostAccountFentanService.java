/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.Statement;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.costaccount.CADItem;
import cn.com.fanrenlee.model.costaccount.CostAccountBaseInfo;
import cn.com.fanrenlee.model.costaccount.CostItem;
import cn.com.fanrenlee.model.pro.Cncbl;
import cn.com.fanrenlee.model.pro.ProCost;
import cn.com.fanrenlee.model.tables.TCostaccountFentan;
import cn.com.fanrenlee.model.tables.TCostaccountJob;
import cn.com.fanrenlee.model.tables.TCostaccountJobBaseinfo;
import cn.com.fanrenlee.model.tables.TCostaccountLevel1;
import cn.com.fanrenlee.model.tables.TCostaccountLevel2;
import cn.com.fanrenlee.model.tables.TCostaccountLevel3;
import cn.com.fanrenlee.model.tables.TCostaccountSrc;
import cn.com.fanrenlee.model.tables.TCostaccountSrcDept;
import cn.com.fanrenlee.model.tables.TCostaccountSrcKdgzl;
import cn.com.fanrenlee.model.tables.TCostaccountSrcNls;
import cn.com.fanrenlee.model.tables.TProDic;
import cn.com.fanrenlee.util.SqlUtil;
import cn.com.fanrenlee.util.StrUtils;
import cn.com.fanrenlee.util.doc.ExcelUtil;

/**
 * 成本核算分摊算法
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Service
public class CostAccountFentanService extends SimpleServiceImpl {

	@Resource
	ProDicService proDicService;

	private String safeString(String s) {
		return s == null || s.trim().equals("") ? "" : s;
	}

	/**
	 * 保存原始数据
	 *
	 * @param inputStream
	 * @param job
	 * @return
	 * @throws ServiceException
	 */
	@Transactional
	public Integer saveSrcDate(InputStream inputStream, final TCostaccountJob job, TCostaccountJobBaseinfo baseInfo) {
		// 校验job信息
		if (job != null) {
			String sql = "select count(1) from t_costaccount_job where t_hos_id = ? and year = ? and type = ? ";
			List<Object> params = new ArrayList<Object>();
			params.add(job.gettHosId());
			params.add(job.getYear());
			params.add(job.getType());
			if (job.getHalfType() == null) {
				sql += " and half_type is null ";
			} else {
				sql += " and half_type = ? ";
				params.add(job.getHalfType());
			}
			Integer count = jdbcTemplate.queryForObject(sql, params.toArray(), Integer.class);
			if (count > 0) {
				throw new ServiceException("同一医院不能上传同时间段数据");
			}
		}

		// 生成任务描述
		String jobDesc = safeString(job.getHosName()) + safeString(job.getYear()) + "年" + safeString(job.getHalfType())
				+ "成本核算";
		job.setJobDesc(jobDesc);

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
		final List<TCostaccountSrc> srcItems = getCadItemsFromSrcData(srcData, job);
		// 原始业务数据-开单工作量
		final List<TCostaccountSrcKdgzl> srcItemsKdgzl = getCadItemsKdgzlFromSrcData(srcData, job);
		// 原始业务数据-项目年例数
		final List<TCostaccountSrcNls> srcItemsNls = getCadItemsNlsFromSrcData(srcData, job);
		// 原始业务数据-科室对照
		final List<TCostaccountSrcDept> srcItemsDept = getCadItemsDeptFromSrcData(srcData, job);

		// 保存任务数据
		final String sqlJob = "insert into t_costaccount_job "
				+ "(job_desc, t_hos_id, hos_code, hos_name, year, type, half_type) " + "values (?, ?, ?, ?, ?, ?, ?) ";
		KeyHolder keyJob = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement preState = con.prepareStatement(sqlJob, Statement.RETURN_GENERATED_KEYS);
				preState.setString(1, job.getJobDesc());
				preState.setInt(2, job.gettHosId());
				preState.setString(3, job.getHosCode());
				preState.setString(4, job.getHosName());

				preState.setString(5, job.getYear());
				preState.setString(6, job.getType());
				preState.setString(7, job.getHalfType());
				return preState;
			}
		}, keyJob);
		final Integer jobId = keyJob.getKey().intValue();

		// 保存业务数据
		String sqlService = "insert into t_costaccount_src (" + " dept_code, dept_name, dept_id, "
				+ " cost_old_house_device_common, cost_old_device_special, cost_asset_amortize, "
				+ " cost_vc_funds, cost_other, t_job_id, " + " work_count_mzzxsr, work_count_xdgzl, work_count_inhos, "
				+ " work_count_mz, cost_people_zzys, cost_people_fzzys, "
				+ " cost_people_zrys, cost_people_js, cost_people_hs, "
				+ " cost_people_qt, people_count_zzys, people_count_fzrys, "
				+ " people_count_zrys, people_count_js, people_count_hs, "
				+ " people_count_qt, work_count_kdsr, work_count_zyzxsr, " + " cost_wscl " + ")"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sqlService, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountSrc item = srcItems.get(i);

				// + " dept_code, dept_name, dept_id, "
				ps.setString(1, handleDeptCode(item.getDeptCode()));
				ps.setString(2, item.getDeptName());
				ps.setObject(3, item.getDeptId());

				// + " cost_old_house_devicecommon, cost_old_device_special,
				// cost_asset_amortize, "
				ps.setObject(4, item.getCostOldHouseDeviceCommon());
				ps.setObject(5, item.getCostOldDeviceSpecial());
				ps.setObject(6, item.getCostAssetAmortize());

				// + " cost_vc_funds, cost_other, t_job_id, "
				ps.setObject(7, item.getCostVcFunds());
				ps.setObject(8, item.getCostOther());
				ps.setObject(9, jobId);

				// + " work_count_mzzxsr, work_count_xdgzl, work_count_inhos, "
				ps.setObject(10, item.getWorkCountMzzxsr());
				ps.setObject(11, item.getWorkCountXdgzl());
				ps.setObject(12, item.getWorkCountInhos());

				// + " work_count_mz, cost_people_zzys, cost_people_fzzys, "
				ps.setObject(13, item.getWorkCountMz());
				ps.setObject(14, item.getCostPeopleZzys());
				ps.setObject(15, item.getCostPeopleFzzys());

				// + " cost_people_zrys, cost_people_js, cost_people_hs, "
				ps.setObject(16, item.getCostPeopleZrys());
				ps.setObject(17, item.getCostPeopleJs());
				ps.setObject(18, item.getCostPeopleHs());

				// + " cost_people_qt, people_count_zzys, people_count_fzrys, "
				ps.setObject(19, item.getCostPeopleQt());
				ps.setObject(20, item.getPeopleCountZzys());
				ps.setObject(21, item.getPeopleCountFzrys());

				// + " people_count_zrys, people_count_js, people_count_hs, "
				ps.setObject(22, item.getPeopleCountZrys());
				ps.setObject(23, item.getPeopleCountJs());
				ps.setObject(24, item.getPeopleCountHs());

				// + " people_count_qt, work_count_kdsr, work_count_zyzxsr "
				ps.setObject(25, item.getPeopleCountQt());
				ps.setObject(26, item.getWorkCountKdsr());
				ps.setObject(27, item.getWorkCountZyzxsr());

				// + " cost_wscl "
				ps.setObject(28, item.getCostWscl());

			}

			// 处理科室编码，防止出现.0
			private String handleDeptCode(String deptCode) {
				if (deptCode != null && deptCode.endsWith(".0")) {
					return deptCode.substring(0, deptCode.length() - 2);
				}
				return deptCode;
			}

			@Override
			public int getBatchSize() {
				return srcItems.size();
			}

		});

		// 保存业务数据-开单工作量
		String sqlServiceKdgzl = "insert into t_costaccount_src_kdgzl (" + " t_job_id, dept_code_base, dept_name_base, "
				+ " dept_code_yj, dept_name_yj, kdgzl)" + " values (?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sqlServiceKdgzl, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountSrcKdgzl item = srcItemsKdgzl.get(i);

				// + " t_job_id, dept_code_base, dept_name_base, "
				ps.setObject(1, jobId);
				ps.setString(2, handleDeptCode(item.getDeptCodeBase()));
				ps.setObject(3, item.getDeptNameBase());

				// + " dept_code_yj, dept_name_yj, kdgzl
				ps.setString(4, handleDeptCode(item.getDeptCodeYj()));
				ps.setObject(5, item.getDeptNameYj());
				ps.setObject(6, item.getKdgzl());

			}

			// 处理科室编码，防止出现.0
			private String handleDeptCode(String deptCode) {
				if (deptCode != null && deptCode.endsWith(".0")) {
					return deptCode.substring(0, deptCode.length() - 2);
				}
				return deptCode;
			}

			@Override
			public int getBatchSize() {
				return srcItemsKdgzl.size();
			}

		});

		// 保存业务数据-项目年例数
		String sqlServiceNls = "insert into t_costaccount_src_nls (" + " t_job_id, dept_code, dept_name, "
				+ " pro_code, pro_name, nls)" + " values (?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sqlServiceNls, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountSrcNls item = srcItemsNls.get(i);

				// + " t_job_id, dept_code, dept_name, "
				ps.setObject(1, jobId);
				ps.setString(2, handleDeptCode(item.getDeptCode()));
				ps.setObject(3, item.getDeptName());

				// + " pro_code, pro_name, nls
				ps.setString(4, handleDeptCode(item.getProCode()));
				ps.setObject(5, item.getProName());
				ps.setObject(6, item.getNls());

			}

			// 处理科室编码，防止出现.0
			private String handleDeptCode(String deptCode) {
				if (deptCode != null && deptCode.endsWith(".0")) {
					return deptCode.substring(0, deptCode.length() - 2);
				}
				return deptCode;
			}

			@Override
			public int getBatchSize() {
				return srcItemsNls.size();
			}

		});

		// 保存业务数据-科室对照
		String sqlServiceDept = "insert into t_costaccount_src_dept ( t_job_id, bz_dept_code, bz_dept_name, "
				+ " dept_code, dept_name) values (?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sqlServiceDept, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountSrcDept item = srcItemsDept.get(i);

				// + " t_job_id, bz_dept_code, bz_dept_name, "
				ps.setObject(1, jobId);
				ps.setString(2, handleDeptCode(item.getBzDeptCode()));
				ps.setObject(3, item.getBzDeptName());

				// + " dept_code, dept_name
				ps.setString(4, handleDeptCode(item.getDeptCode()));
				ps.setObject(5, item.getDeptName());

			}

			// 处理科室编码，防止出现.0
			private String handleDeptCode(String deptCode) {
				if (deptCode != null && deptCode.endsWith(".0")) {
					return deptCode.substring(0, deptCode.length() - 2);
				}
				return deptCode;
			}

			@Override
			public int getBatchSize() {
				return srcItemsDept.size();
			}

		});

		return jobId;
	}

	/**
	 * 从原始excel数据中获取业务数据-第一页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TCostaccountSrc> getCadItemsFromSrcData(List<List<List<String>>> srcData, TCostaccountJob job)
			throws ServiceException {
		if (srcData == null || srcData.get(0).size() == 0) {
			return null;
		}
		List<TCostaccountSrc> srcItems = new ArrayList<TCostaccountSrc>();
		List<List<String>> sheetDataItem = srcData.get(0);
		if (sheetDataItem.size() <= 3) {
			throw new ServiceException("第一页数据不符合规范，至少应有3行数据");
		}
		for (int i = 0; i < sheetDataItem.size(); i++) {
			// 忽略标题行
			if (i <= 1) {
				continue;
			}
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 3) {
				throw new ServiceException("基础数据行至少应有三列数据(行" + (i + 1) + ")");
			}
			TCostaccountSrc srcItem = new TCostaccountSrc();
			for (int j = 0; j < rowDataitemSize; j++) {
				String cellData = rowDataItem.get(j);
				if (j == 0) {// 第1列-科室代码
					srcItem.setDeptCode(cellData);
				} else if (j == 1) {// 第2列-科室名称
					srcItem.setDeptName(cellData);
				} else if (j == 2) {// 第3列-人员经费-主治医师
					srcItem.setCostPeopleZzys(getDouble(cellData));
				} else if (j == 3) {// 第4列-人员经费-副主任医师
					srcItem.setCostPeopleFzzys(getDouble(cellData));
				} else if (j == 4) {// 第5列-人员经费-主任医师
					srcItem.setCostPeopleZrys(getDouble(cellData));
				} else if (j == 6) {// 第6列-人员经费-技师
					srcItem.setCostPeopleJs(getDouble(cellData));
				} else if (j == 5) {// 第7列-人员经费-护士
					srcItem.setCostPeopleHs(getDouble(cellData));
				} else if (j == 7) {// 第8列-人员经费-其他
					srcItem.setCostPeopleQt(getDouble(cellData));
				} else if (j == 8) {// 第9列-卫生材料费
					srcItem.setCostWscl(getDouble(cellData));
				} else if (j == 9) {// 第10列-房屋、通用设备折旧费
					srcItem.setCostOldHouseDeviceCommon(getDouble(cellData));
				} else if (j == 10) {// 第11列-专用设备折旧费
					srcItem.setCostOldDeviceSpecial(getDouble(cellData));
				} else if (j == 11) {// 第12列-无形资产摊销费
					srcItem.setCostAssetAmortize(getDouble(cellData));
				} else if (j == 12) {// 第13列-医疗风险基金
					srcItem.setCostVcFunds(getDouble(cellData));
				} else if (j == 13) {// 第14列-其他费用
					srcItem.setCostOther(getDouble(cellData));
				} else if (j == 14) {// 第15列-人员数-主治医师
					srcItem.setPeopleCountZzys(getInteger(cellData));
				} else if (j == 15) {// 第16列-人员数-副主任医师
					srcItem.setPeopleCountFzrys(getInteger(cellData));
				} else if (j == 16) {// 第17列-人员数-主任医师
					srcItem.setPeopleCountZrys(getInteger(cellData));
				} else if (j == 18) {// 第18列-人员数-技师
					srcItem.setPeopleCountJs(getInteger(cellData));
				} else if (j == 17) {// 第19列-人员数-护士
					srcItem.setPeopleCountHs(getInteger(cellData));
				} else if (j == 19) {// 第20列-人员数-其他
					srcItem.setPeopleCountQt(getInteger(cellData));
				} else if (j == 20) {// 第21列-开单收入
					srcItem.setWorkCountKdsr(getDouble(cellData));
				} else if (j == 21) {// 第22列-门诊执行收入
					srcItem.setWorkCountMzzxsr(getDouble(cellData));
				} else if (j == 22) {// 第23列-住院执行收入
					srcItem.setWorkCountZyzxsr(getDouble(cellData));
				} else if (j == 23) {// 第24列-消毒工作量
					srcItem.setWorkCountXdgzl(getDouble(cellData));
				} else if (j == 24) {// 第25列-门诊人次
					srcItem.setWorkCountMz(getDouble(cellData));
				} else if (j == 25) {// 第26列-住院人数
					srcItem.setWorkCountInhos(getDouble(cellData));
				}
			}
			srcItems.add(srcItem);
		}
		return srcItems;
	}

	/**
	 * 从原始excel数据中获取业务数据-开单工作量-第二页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TCostaccountSrcKdgzl> getCadItemsKdgzlFromSrcData(List<List<List<String>>> srcData,
			TCostaccountJob job) throws ServiceException {
		if (srcData == null || srcData.size() <= 1) {
			return null;
		}
		List<TCostaccountSrcKdgzl> srcItems = new ArrayList<TCostaccountSrcKdgzl>();
		List<List<String>> sheetDataItem = srcData.get(1);
		if (sheetDataItem.size() <= 2) {
			throw new ServiceException("第二页数据【对医技科室开单工作量】不符合规范，至少应有2行数据（一行表头，至少一行业务数据）");
		}

		// 处理业务数据-从第二行开始
		for (int i = 1; i < sheetDataItem.size(); i++) {
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 5) {
				throw new ServiceException("第二页数据行至少应有五列数据(行" + (i + 1) + ")");
			}
			TCostaccountSrcKdgzl srcItem = new TCostaccountSrcKdgzl();
			srcItem.setDeptCodeBase(rowDataItem.get(0));
			srcItem.setDeptNameBase(rowDataItem.get(1));
			srcItem.setDeptCodeYj(rowDataItem.get(2));
			srcItem.setDeptNameYj(rowDataItem.get(3));
			srcItem.setKdgzl(getDouble(rowDataItem.get(4)));

			srcItems.add(srcItem);
		}
		return srcItems;
	}

	/**
	 * 从原始excel数据中获取业务数据-项目年例数-第三页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TCostaccountSrcNls> getCadItemsNlsFromSrcData(List<List<List<String>>> srcData, TCostaccountJob job)
			throws ServiceException {
		if (srcData == null || srcData.size() <= 2) {
			return null;
		}
		List<TCostaccountSrcNls> srcItems = new ArrayList<TCostaccountSrcNls>();
		List<List<String>> sheetDataItem = srcData.get(2);
		if (sheetDataItem.size() <= 2) {
			throw new ServiceException("第三页数据【科室项目年例数】不符合规范，至少应有2行数据（一行表头，至少一行业务数据）");
		}

		// 处理业务数据-从第二行开始
		for (int i = 1; i < sheetDataItem.size(); i++) {
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 5) {
				throw new ServiceException("第三页【科室项目年例数】数据行至少应有五列数据(行" + (i + 1) + ")");
			}
			TCostaccountSrcNls srcItem = new TCostaccountSrcNls();
			srcItem.setDeptCode(rowDataItem.get(0));
			srcItem.setDeptName(rowDataItem.get(1));
			srcItem.setProCode(rowDataItem.get(2));
			srcItem.setProName(rowDataItem.get(3));
			srcItem.setNls(getInteger(rowDataItem.get(4)));

			srcItems.add(srcItem);
		}
		return srcItems;
	}

	/**
	 * 从原始excel数据中获取数据-科室对照-第四页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TCostaccountSrcDept> getCadItemsDeptFromSrcData(List<List<List<String>>> srcData, TCostaccountJob job)
			throws ServiceException {
		if (srcData == null || srcData.size() <= 3) {
			return null;
		}
		List<TCostaccountSrcDept> srcItems = new ArrayList<TCostaccountSrcDept>();
		List<List<String>> sheetDataItem = srcData.get(3);
		if (sheetDataItem.size() <= 3) {
			throw new ServiceException("第四页数据【科室对照】不符合规范，至少应有2行数据（一行表头，至少一行业务数据）");
		}

		// 处理业务数据-从第二行开始
		for (int i = 1; i < sheetDataItem.size(); i++) {
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 4) {
				throw new ServiceException("第四页【科室对照】数据行应有四列数据(行" + (i + 1) + ")");
			}
			TCostaccountSrcDept srcItem = new TCostaccountSrcDept();
			srcItem.setBzDeptCode(rowDataItem.get(0));
			srcItem.setBzDeptName(rowDataItem.get(1));
			srcItem.setDeptCode(rowDataItem.get(2));
			srcItem.setDeptName(rowDataItem.get(3));

			srcItems.add(srcItem);
		}
		return srcItems;
	}

	private Double getDouble(String text) {
		return text == null || text.equals("") ? null : Double.valueOf(text);
	}

	private Integer getInteger(String text) {
		return text == null || text.equals("") ? null : Integer.valueOf(String.valueOf(Math.round(getDouble(text))));
	}

	/**
	 * 执行某次任务
	 *
	 * @param jobId
	 * @throws ServiceException
	 */
	@Transactional
	public void execJob(Integer jobId) {
		// 获取任务的状态
		TCostaccountJob job = getJobByJobid(jobId);
		if (job == null)
			throw new ServiceException("任务不存在");

		// 更新任务状态-进行中
		updateJobState(jobId, "1", 0);

		long timeStart = System.currentTimeMillis();

		// 删除旧任务相关的所有分析数据
		deleteJobDataById(jobId);

		// 基本数据
		List<CADItem> srcData = getSrcData(jobId);
		// 基本数据-开单工作量
		List<TCostaccountSrcKdgzl> srcDataKdgzl = getSrcDataKdgzl(jobId);
		// 项目年例数
		List<TCostaccountSrcNls> srcDataNls = getSrcDataNls(jobId);
		// 项目数据
		List<TProDic> proDics = proDicService.getProDics(job.gettHosId());

		// 分摊计算
		CADItemHandler cadItemHandler = new CADItemHandler(srcData, srcDataKdgzl, proDics, job, srcDataNls);
		cadItemHandler.handle();

		// 保存-基本信息-总数量
		saveBaseInfo(cadItemHandler.getBaseInfo(), jobId);
		// 保存-分摊数据
		saveFentan(cadItemHandler.getFentanMulLev(), jobId);

		// 保存-一级分摊
		saveCostLevel1(cadItemHandler.getCostLevel1(), job, cadItemHandler.getDeptCodeNameMap());
		// 保存-二级分摊
		saveCostLevel2(cadItemHandler.getCostLevel2(), job, cadItemHandler.getDeptCodeNameMap());
		// 保存-三级分摊
		saveCostLevel3(cadItemHandler.getCostLevel3(), job, cadItemHandler.getDeptCodeNameMap());

		// 保存理论成本算法结果
		// 科室级别数据
		List<ProCost> proCosts = cadItemHandler.getDeptProCosts();
		// 医院级别数据
		proCosts.addAll(cadItemHandler.getHosCncblCosts());
		saveProCosts(proCosts, 1);

		// 保存理论成本产能成本率
		List<Cncbl> cncbls = new ArrayList<Cncbl>();
		cncbls.addAll(transCncblMap2List(cadItemHandler.getDeptZjcbCncbl()));
		cncbls.addAll(transCncblMap2List(cadItemHandler.getDeptYwcbCncbl()));
		cncbls.addAll(transCncblMap2List(cadItemHandler.getDeptQcbCncbl()));
		cncbls.add(cadItemHandler.getHosZjcbCncbl());
		cncbls.add(cadItemHandler.getHosYwcbCncbl());
		cncbls.add(cadItemHandler.getHosQcbCncbl());
		saveCncbls(cncbls);

		// 保存实际成本算法结果
		// 科室级别数据
		List<ProCost> proCostsFact = cadItemHandler.getDeptProCostsFact();
		// 医院级别数据
		proCostsFact.addAll(cadItemHandler.getHosCostsFact());
		saveProCosts(proCostsFact, 2);

		// 保存价值点数算法结果
		// 科室级别数据
		List<ProCost> proCostsPoint = cadItemHandler.getDeptProCostsPoint();
		// 医院级别数据
		proCostsPoint.addAll(cadItemHandler.getHosCostsPoint());
		saveProCosts(proCostsPoint, 3);

		long timeEnd = System.currentTimeMillis();

		// 更新job状态
		updateJobState(jobId, "2", timeEnd - timeStart);
	}

	private List<Cncbl> transCncblMap2List(Map<String, Cncbl> items) {
		List<Cncbl> ret = new ArrayList<Cncbl>();
		if (items == null)
			return ret;
		for (String key : items.keySet()) {
			ret.add(items.get(key));
		}
		return ret;
	}

	/**
	 * 保存成本费用结果
	 * 
	 * @param items
	 * @param type
	 *            1-理论、2-实际、3-价值点数
	 */
	private void saveProCosts(final List<ProCost> items, final Integer type) {
		if (items == null || items.size() == 0)
			return;

		String sql = "insert into t_pro_result " + " (dept_code, dept_name, pro_code, " + " pro_name, t_job_id,"
				+ " cost_people_direct, cost_people_mid_yw, cost_people_mid_all,"
				+ " cost_house_direct, cost_house_mid_yw, cost_house_mid_all,"
				+ " cost_spe_direct, cost_spe_mid_yw, cost_spe_mid_all,"
				+ " cost_asset_direct, cost_asset_mid_yw, cost_asset_mid_all,"
				+ " cost_other_direct, cost_other_mid_yw, cost_other_mid_all," + " cost_wsclf, cost_ylfxjj, level, type"
				+ ") " + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ProCost item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setString(3, item.getProCode());
				ps.setString(4, item.getProName());
				ps.setObject(5, item.gettJobId());

				ps.setDouble(6, item.getCostPeopleDirect());
				ps.setDouble(7, item.getCostPeopleMidYw());
				ps.setDouble(8, item.getCostPeopleMidAll());

				ps.setDouble(9, item.getCostHouseDirect());
				ps.setDouble(10, item.getCostHouseMidYw());
				ps.setDouble(11, item.getCostHouseMidAll());

				ps.setDouble(12, item.getCostSpeDirect());
				ps.setDouble(13, item.getCostSpeMidYw());
				ps.setDouble(14, item.getCostSpeMidAll());

				ps.setDouble(15, item.getCostAssetDirect());
				ps.setDouble(16, item.getCostAssetMidYw());
				ps.setDouble(17, item.getCostAssetMidAll());

				ps.setDouble(18, item.getCostOtherDirect());
				ps.setDouble(19, item.getCostOtherMidYw());
				ps.setDouble(20, item.getCostOtherMidAll());

				ps.setDouble(21, item.getCostWsclf());
				ps.setDouble(22, item.getCostYlfxjj());
				ps.setInt(23, item.getLevel());
				ps.setInt(24, type);
			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});

	}

	/**
	 * 保存理论成本-产能成本率
	 * 
	 * @param items
	 */
	private void saveCncbls(final List<Cncbl> items) {
		if (items == null || items.size() == 0)
			return;

		String sql = "insert into t_pro_result_cncbl " + " (dept_code, dept_name, t_job_id,"
				+ " ys_cncbl, hs_cncbl, js_cncbl, op_cncbl, house_cncbl, spe_cncbl, asset_cncbl, oc_cncbl,"
				+ " type, level, zzys_cncbl ) " + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				Cncbl item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setInt(3, item.gettJobId());

				ps.setDouble(4, item.getYsCncbl());
				ps.setDouble(5, item.getHsCncbl());
				ps.setDouble(6, item.getJsCncbl());

				ps.setDouble(7, item.getOpCncbl());
				ps.setDouble(8, item.getHouseCncbl());
				ps.setDouble(9, item.getSpeCncbl());

				ps.setDouble(10, item.getAssetCncbl());
				ps.setDouble(11, item.getOcCncbl());

				ps.setInt(12, item.getType());
				ps.setInt(13, item.getLevel());

				ps.setDouble(14, item.getZzysCncbl());

			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});

	}

	/**
	 * 保存分摊数据-
	 * 
	 * @param fentans
	 * @param jobId
	 */
	private void saveFentan(Map<String, TCostaccountFentan> fentans, final Integer jobId) {

		final List<TCostaccountFentan> items = new ArrayList<TCostaccountFentan>();
		for (String key : fentans.keySet()) {
			items.add(fentans.get(key));
		}

		String sql = "insert into t_costaccount_fentan " + " (dept_code, dept_name, " + " count_direct, count_all,"
				+ " fx_l1_people, fx_l1_device_common, fx_l1_wscl, fx_l1_device_spe, fx_l1_asset, fx_l1_vc, fx_l1_other, fx_l1 ,"
				+ " fx_l2_people, fx_l2_device_common, fx_l2_wscl, fx_l2_device_spe, fx_l2_asset, fx_l2_vc, fx_l2_other, fx_l2 ,"
				+ " fx_l3_people, fx_l3_device_common, fx_l3_wscl, fx_l3_device_spe, fx_l3_asset, fx_l3_vc, fx_l3_other, fx_l3 ,"
				+ " t_job_id, "

				+ " fx_l1_people_zzys, fx_l1_people_fzrys, fx_l1_people_zrys, fx_l1_people_js, fx_l1_people_hs, fx_l1_people_qt ,"
				+ " fx_l2_people_zzys, fx_l2_people_fzrys, fx_l2_people_zrys, fx_l2_people_js, fx_l2_people_hs, fx_l2_people_qt ,"
				+ " fx_l3_people_zzys, fx_l3_people_fzrys, fx_l3_people_zrys, fx_l3_people_js, fx_l3_people_hs, fx_l3_people_qt "

				+ ") "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountFentan item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());

				ps.setObject(3, item.getCountDirect());
				ps.setObject(4, item.getCountAll());

				ps.setObject(5, item.getFxL1People());
				ps.setObject(6, item.getFxL1DeviceCommon());
				ps.setObject(7, item.getFxL1Wscl());
				ps.setObject(8, item.getFxL1DeviceSpe());
				ps.setObject(9, item.getFxL1Asset());
				ps.setObject(10, item.getFxL1Vc());
				ps.setObject(11, item.getFxL1Other());
				ps.setObject(12, item.getFxL1());

				ps.setObject(13, item.getFxL2People());
				ps.setObject(14, item.getFxL2DeviceCommon());
				ps.setObject(15, item.getFxL2Wscl());
				ps.setObject(16, item.getFxL2DeviceSpe());
				ps.setObject(17, item.getFxL2Asset());
				ps.setObject(18, item.getFxL2Vc());
				ps.setObject(19, item.getFxL2Other());
				ps.setObject(20, item.getFxL2());

				ps.setObject(21, item.getFxL3People());
				ps.setObject(22, item.getFxL3DeviceCommon());
				ps.setObject(23, item.getFxL3Wscl());
				ps.setObject(24, item.getFxL3DeviceSpe());
				ps.setObject(25, item.getFxL3Asset());
				ps.setObject(26, item.getFxL3Vc());
				ps.setObject(27, item.getFxL3Other());
				ps.setObject(28, item.getFxL3());

				ps.setInt(29, jobId);

				ps.setObject(30, item.getFxL1PeopleZzys());
				ps.setObject(31, item.getFxL1PeopleFzrys());
				ps.setObject(32, item.getFxL1PeopleZrys());
				ps.setObject(33, item.getFxL1PeopleJs());
				ps.setObject(34, item.getFxL1PeopleHs());
				ps.setObject(35, item.getFxL1PeopleQt());

				ps.setObject(36, item.getFxL2PeopleZzys());
				ps.setObject(37, item.getFxL2PeopleFzrys());
				ps.setObject(38, item.getFxL2PeopleZrys());
				ps.setObject(39, item.getFxL2PeopleJs());
				ps.setObject(40, item.getFxL2PeopleHs());
				ps.setObject(41, item.getFxL2PeopleQt());

				ps.setObject(42, item.getFxL3PeopleZzys());
				ps.setObject(43, item.getFxL3PeopleFzrys());
				ps.setObject(44, item.getFxL3PeopleZrys());
				ps.setObject(45, item.getFxL3PeopleJs());
				ps.setObject(46, item.getFxL3PeopleHs());
				ps.setObject(47, item.getFxL3PeopleQt());

			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});

	}

	/**
	 * 保存基本信息
	 * 
	 * @param baseInfo
	 */
	private void saveBaseInfo(CostAccountBaseInfo baseInfo, Integer jobId) {
		if (baseInfo == null || jobId == null)
			return;
		jdbcTemplate.update(
				"insert into t_costaccount_job_baseinfo (" + " total_cost_kdsr, total_cost_mzzxsr, total_cost_xdgzl,"
						+ " total_cost_zyzxsr, total_cost_inhos, total_Cost_mz," + " total_people, t_job_id)"
						+ " values (?,?,?,?,?,?,?,?)",
				baseInfo.getTotalCostKdsr(), baseInfo.getTotalCostMzzxsr(), baseInfo.getTotalCostXdgzl(),
				baseInfo.getTotalCostZyzxsr(), baseInfo.getTotalCostInhos(), baseInfo.getTotalCostMz(),
				baseInfo.getTotalPeople(), jobId);

	}

	/**
	 * 删除job数据-原始数据、分摊数据
	 *
	 * @param jobId
	 */
	public void deleteJobDataById(Integer jobId) {
		jdbcTemplate.update("delete from t_costaccount_job_baseinfo where t_job_id = ? ", jobId);
		jdbcTemplate.update("delete from t_costaccount_fentan where t_job_id = ? ", jobId);
		jdbcTemplate.update("delete from t_costaccount_level1 where t_job_id = ? ", jobId);
		jdbcTemplate.update("delete from t_costaccount_level2 where t_job_id = ? ", jobId);
		jdbcTemplate.update("delete from t_costaccount_level3 where t_job_id = ? ", jobId);
		jdbcTemplate.update("delete from t_pro_result where t_job_id = ? ", jobId);
		jdbcTemplate.update("delete from t_pro_result_cncbl where t_job_id = ? ", jobId);

		jdbcTemplate.update("delete from t_job_zone_reljob where ccjob_id = ? ", jobId);
	}

	/**
	 * 删除job
	 *
	 * @param jobId
	 */
	public void deleteJobById(Integer jobId) {
		// 统计数据
		deleteJobDataById(jobId);

		// 原始数据
		jdbcTemplate.update("delete from t_costaccount_src where t_job_id = ? ", jobId);
		// 原始数据-开单工作量
		jdbcTemplate.update("delete from t_costaccount_src_kdgzl where t_job_id = ? ", jobId);
		// 原始数据-项目年例数
		jdbcTemplate.update("delete from t_costaccount_src_nls where t_job_id = ? ", jobId);
		// 原始数据-科室对照
		jdbcTemplate.update("delete from t_costaccount_src_dept where t_job_id = ? ", jobId);

		// 任务自身
		jdbcTemplate.update("delete from t_costaccount_job where id = ? ", jobId);
	}

	/**
	 * 保存分级分摊结果-级别1
	 *
	 */
	private void saveCostLevel1(Map<String, CostItem> costItems, final TCostaccountJob job,
			Map<String, String> deptCodeName) {
		final List<TCostaccountLevel1> items = new ArrayList<TCostaccountLevel1>();
		for (String key : costItems.keySet()) {
			TCostaccountLevel1 item = new TCostaccountLevel1();
			CostItem ci = costItems.get(key);

			String[] keySp = key.split(CADItemHandler.CODE_SEP);

			item.setDeptCode(keySp[0]);
			item.setDeptName(deptCodeName.get(keySp[0]));
			item.setDeptCodeShare(keySp[1]);
			item.setDeptNameShare(deptCodeName.get(keySp[1]));

			item.setShareLevel1(ci.getCostShare());

			item.setShareItemAssetAmortize(ci.getCostShareassetAmortize());
			item.setShareItemOldHouseDeviceCommon(ci.getCostShareOldHouseDeviceCommon());
			item.setShareItemOldDeviceSpecial(ci.getCostShareOldDeviceSpecial());
			item.setShareItemOther(ci.getCostShareOther());
			item.setShareItemPeople(ci.getCostSharePeople());
			item.setShareItemVcFunds(ci.getCostSharevcFunds());
			item.setShareItemWscl(ci.getCostShareWscl());

			items.add(item);
		}

		String sql = "insert into t_costaccount_level1 " + " (dept_code, dept_name, share_level1, "
				+ " dept_code_share, dept_name_share, t_hospital_code,"
				+ " share_item_people, share_item_old_house_device_common, share_item_old_device_special,"
				+ " share_item_asset_amortize, share_item_vc_funds," + " share_item_other, t_job_id, share_item_wscl) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountLevel1 item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setDouble(3, item.getShareLevel1());
				ps.setString(4, item.getDeptCodeShare());
				ps.setString(5, item.getDeptNameShare());
				ps.setString(6, job.getHosCode());

				ps.setDouble(7, item.getShareItemPeople());
				ps.setDouble(8, item.getShareItemOldHouseDeviceCommon());
				ps.setDouble(9, item.getShareItemOldDeviceSpecial());
				ps.setDouble(10, item.getShareItemAssetAmortize());
				ps.setDouble(11, item.getShareItemVcFunds());
				ps.setDouble(12, item.getShareItemOther());

				ps.setInt(13, job.getId());
				ps.setDouble(14, item.getShareItemWscl());
			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});
	}

	/**
	 * 保存分级分摊结果-级别2
	 *
	 */
	private void saveCostLevel2(Map<String, CostItem> costItems, final TCostaccountJob job,
			Map<String, String> deptCodeName) {
		final List<TCostaccountLevel2> items = new ArrayList<TCostaccountLevel2>();
		for (String key : costItems.keySet()) {
			TCostaccountLevel2 item = new TCostaccountLevel2();
			CostItem ci = costItems.get(key);

			String[] keySp = key.split(CADItemHandler.CODE_SEP);

			item.setDeptCode(keySp[0]);
			item.setDeptName(deptCodeName.get(keySp[0]));
			item.setDeptCodeShare(keySp[1]);
			item.setDeptNameShare(deptCodeName.get(keySp[1]));

			item.setShareLevel2(ci.getCostShare());

			item.setShareItemAssetAmortize(ci.getCostShareassetAmortize());
			item.setShareItemOldHouseDeviceCommon(ci.getCostShareOldHouseDeviceCommon());
			item.setShareItemOldDeviceSpecial(ci.getCostShareOldDeviceSpecial());
			item.setShareItemOther(ci.getCostShareOther());
			item.setShareItemPeople(ci.getCostSharePeople());
			item.setShareItemVcFunds(ci.getCostSharevcFunds());
			item.setShareItemWscl(ci.getCostShareWscl());

			items.add(item);
		}

		String sql = "insert into t_costaccount_level2 " + " (dept_code, dept_name, share_level2, "
				+ " dept_code_share, dept_name_share, t_hospital_code,"
				+ " share_item_people, share_item_old_house_device_common, share_item_old_device_special,"
				+ " share_item_asset_amortize, share_item_vc_funds," + " share_item_other, t_job_id, share_item_wscl) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountLevel2 item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setDouble(3, item.getShareLevel2());
				ps.setString(4, item.getDeptCodeShare());
				ps.setString(5, item.getDeptNameShare());
				ps.setString(6, job.getHosCode());

				ps.setDouble(7, item.getShareItemPeople());
				ps.setDouble(8, item.getShareItemOldHouseDeviceCommon());
				ps.setDouble(9, item.getShareItemOldDeviceSpecial());
				ps.setDouble(10, item.getShareItemAssetAmortize());
				ps.setDouble(11, item.getShareItemVcFunds());
				ps.setDouble(12, item.getShareItemOther());

				ps.setInt(13, job.getId());
				ps.setDouble(14, item.getShareItemWscl());
			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});
	}

	/**
	 * 保存分级分摊结果-级别3
	 *
	 */
	private void saveCostLevel3(Map<String, CostItem> costItems, final TCostaccountJob job,
			Map<String, String> deptCodeName) {
		final List<TCostaccountLevel3> items = new ArrayList<TCostaccountLevel3>();
		for (String key : costItems.keySet()) {
			TCostaccountLevel3 item = new TCostaccountLevel3();
			CostItem ci = costItems.get(key);

			String[] keySp = key.split(CADItemHandler.CODE_SEP);

			item.setDeptCode(keySp[0]);
			item.setDeptName(deptCodeName.get(keySp[0]));
			item.setDeptCodeShare(keySp[1]);
			item.setDeptNameShare(deptCodeName.get(keySp[1]));

			item.setShareLevel3(ci.getCostShare());

			item.setShareItemAssetAmortize(ci.getCostShareassetAmortize());
			item.setShareItemOldHouseDeviceCommon(ci.getCostShareOldHouseDeviceCommon());
			item.setShareItemOldDeviceSpecial(ci.getCostShareOldDeviceSpecial());
			item.setShareItemOther(ci.getCostShareOther());
			item.setShareItemPeople(ci.getCostSharePeople());
			item.setShareItemVcFunds(ci.getCostSharevcFunds());
			item.setShareItemWscl(ci.getCostShareWscl());

			items.add(item);
		}

		String sql = "insert into t_costaccount_level3 " + " (dept_code, dept_name, share_level3, "
				+ " dept_code_share, dept_name_share, t_hospital_code,"
				+ " share_item_people, share_item_old_house_device_common, share_item_old_device_special,"
				+ " share_item_asset_amortize, share_item_vc_funds," + " share_item_other, t_job_id, share_item_wscl) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TCostaccountLevel3 item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setDouble(3, item.getShareLevel3());
				ps.setString(4, item.getDeptCodeShare());
				ps.setString(5, item.getDeptNameShare());
				ps.setString(6, job.getHosCode());

				ps.setDouble(7, item.getShareItemPeople());
				ps.setDouble(8, item.getShareItemOldHouseDeviceCommon());
				ps.setDouble(9, item.getShareItemOldDeviceSpecial());
				ps.setDouble(10, item.getShareItemAssetAmortize());
				ps.setDouble(11, item.getShareItemVcFunds());
				ps.setDouble(12, item.getShareItemOther());

				ps.setInt(13, job.getId());
				ps.setDouble(14, item.getShareItemWscl());
			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});
	}

	/**
	 * 根据任务id获取基本信息
	 *
	 * @param jobId
	 * @return
	 */
	public TCostaccountJobBaseinfo getBaseInfoByJobId(Integer jobId) {
		List<TCostaccountJobBaseinfo> infos = jdbcTemplate.query(
				"select * from t_costaccount_job_baseinfo where t_costaccount_job_id = ? ", new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountJobBaseinfo>(TCostaccountJobBaseinfo.class));
		return infos.size() > 0 ? infos.get(0) : null;
	}

	/**
	 * 更新任务状态
	 *
	 * @param jobId
	 * @param state
	 */
	public void updateJobState(Integer jobId, String state, long cost) {
		Date currentData = new Date(new java.util.Date().getTime());
		if ("1".equals(state)) {// 进行中
			jdbcTemplate.update(
					"update t_costaccount_job set state = ?, update_time = ?, exec_time_start = ? where id = ? ", state,
					currentData, currentData, jobId);
		} else {
			jdbcTemplate.update(
					"update t_costaccount_job set state = ?, update_time = ? , exec_time_end = ? , costtime = ? where id = ? ",
					state, currentData, currentData, cost / 1000, jobId);
		}
	}

	/**
	 * 获取任务
	 *
	 * @param jobId
	 * @return
	 */
	public TCostaccountJob getJobByJobid(Integer jobId) {
		List<TCostaccountJob> items = jdbcTemplate.query("select t.* from t_costaccount_job t where t.id = ? ",
				new Object[] { jobId }, new BeanPropertyRowMapper<TCostaccountJob>(TCostaccountJob.class));
		return items.size() > 0 ? items.get(0) : null;
	}

	/**
	 * 获取某次任务的原始数据
	 *
	 * @param jobId
	 * @return
	 */
	public List<CADItem> getSrcData(Integer jobId) {
		return jdbcTemplate.query(" SELECT dd.dept_special_code, dd.dept_type_code, " + " src.*, "
				+ " (IFNULL(src.people_count_zzys, 0) + IFNULL(src.people_count_fzrys, 0) + IFNULL(src.people_count_zrys, 0) + IFNULL(src.people_count_js, 0) + IFNULL(src.people_count_hs, 0) + IFNULL(src.people_count_qt, 0) ) AS people_count, "
				+ " (IFNULL(src.cost_people_zzys, 0) + IFNULL(src.cost_people_fzzys, 0) + IFNULL(src.cost_people_zrys, 0) + IFNULL(src.cost_people_js, 0) + IFNULL(src.cost_people_hs, 0) + IFNULL(src.cost_people_qt, 0) ) AS cost_people "
				+ " FROM t_costaccount_src src LEFT JOIN "
				+ " (SELECT dept.*,job.id jobid FROM t_dept dept LEFT JOIN t_costaccount_job job "
				+ " ON job.t_hos_id = dept.t_hospital_id WHERE job.id = ?) dd "
				+ " ON src.t_job_id = dd.jobid AND src.dept_code = dd.dept_code WHERE src.t_job_id = ? ",
				new Object[] { jobId, jobId }, new BeanPropertyRowMapper<CADItem>(CADItem.class));
	}

	/**
	 * 获取某次任务的原始数据-开单工作量
	 *
	 * @param jobId
	 * @return
	 */
	public List<TCostaccountSrcKdgzl> getSrcDataKdgzl(Integer jobId) {
		return jdbcTemplate.query(" SELECT * from t_costaccount_src_kdgzl where t_job_id = ? ", new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountSrcKdgzl>(TCostaccountSrcKdgzl.class));
	}

	/**
	 * 获取某次任务的原始数据-项目年例数
	 *
	 * @param jobId
	 * @return
	 */
	public List<TCostaccountSrcNls> getSrcDataNls(Integer jobId) {
		return jdbcTemplate.query(" SELECT * from t_costaccount_src_nls where t_job_id = ? ", new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountSrcNls>(TCostaccountSrcNls.class));
	}

	/**
	 * 获取任务列表
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getJobList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT j.* FROM `t_costaccount_job` j where 1=1 ");
		// 任务名
		if (!StrUtils.isNull(params.get("jobDesc"))) {
			sb.append(" and j.job_desc like ? ");
			values.add("%" + params.get("jobDesc") + "%");
		}
		// 任务状态
		if (!StrUtils.isNull(params.get("state"))) {
			sb.append(" and j.state = ? ");
			values.add(params.get("state"));
		}
		if (!StrUtils.isNull(params.get("createTimeStart"))) {// 创建日期-开始
			sb.append(" AND " + SqlUtil.toDate(params.get("createTimeStart"), 1, 0) + " <= j.create_time ");
		}
		if (!StrUtils.isNull(params.get("createTimeEnd"))) {// 创建日期-结束
			sb.append(" AND " + SqlUtil.toDate(params.get("createTimeEnd"), 1, 0) + " >= j.create_time ");
		}

		sb.append(" ORDER BY j.year DESC,j.type desc, j.half_type desc ");

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

	/**
	 * 获取任务列表
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getSpeJobList(String year, String type, String halfType) {
		if (halfType == null) {
			return jdbcTemplate.queryForList(
					"SELECT j.* FROM `t_costaccount_job` j where 1=1 and year = ? and type = ? and half_type is null",
					year, type);
		} else {
			return jdbcTemplate.queryForList(
					"SELECT j.* FROM `t_costaccount_job` j where 1=1 and year = ? and type = ? and half_type = ?", year,
					type, halfType);
		}

	}

	/**
	 * 获取原始数据列表
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<Map<String, Object>> getSrcDataList(Map<String, String> params) {

		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * FROM `t_costaccount_src` t where t.t_job_id = ? ");

		values.add(params.get("jobId"));

		// 科室名称
		if (!StrUtils.isNull(params.get("deptName"))) {
			sb.append(" and t.dept_name like ? ");
			values.add("%" + params.get("deptName") + "%");
		}

		return jdbcTemplate.queryForList(sb.toString(), values.toArray());
	}

	/**
	 * 获取原始数据列表-开单工作量
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<Map<String, Object>> getSrcDataKdgzlList(Map<String, String> params) {

		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * FROM `t_costaccount_src_kdgzl` t where t.t_job_id = ? ");

		values.add(params.get("jobId"));

		return jdbcTemplate.queryForList(sb.toString(), values.toArray());
	}

	/**
	 * 获取原始数据列表-年例数
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<Map<String, Object>> getSrcDataNlsList(Map<String, String> params) {

		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * FROM `t_costaccount_src_nls` t where t.t_job_id = ? ");

		values.add(params.get("jobId"));

		return jdbcTemplate.queryForList(sb.toString(), values.toArray());
	}

	/**
	 * 获取分摊数据列表
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<Map<String, Object>> getFentanList(Map<String, String> params, Integer level) {

		String tableName = null;
		if (level == 0) {
			tableName = "t_costaccount_fentan";
		} else if (level == 1) {
			tableName = "t_costaccount_level1";
		} else if (level == 2) {
			tableName = "t_costaccount_level2";
		} else if (level == 3) {
			tableName = "t_costaccount_level3";
		}

		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT t.*,d.bz_dept_code,d.bz_dept_name, "
				+ " (select d.`dept_type_code` from t_dept d where d.`dept_code` = t.`dept_code` and d.`t_hospital_id` = (select j.`t_hos_id` from t_costaccount_job j where j.id = t.t_job_id) ) as dept_type_code "
				+ "  FROM " + tableName + " t left join t_costaccount_src_dept d on t.t_job_id = d.t_job_id and t.dept_code = d.dept_code where t.t_job_id = ? ");

		values.add(params.get("jobId"));

		// 科室编码
		if (!StrUtils.isNull(params.get("deptCode"))) {
			sb.append(" and t.dept_code = ? ");
			values.add(params.get("deptCode"));
		}
		// 科室名称
		if (!StrUtils.isNull(params.get("deptName"))) {
			sb.append(" and t.dept_name like ? ");
			values.add("%" + params.get("deptName") + "%");
		}
		// 被分摊科室编码
		if (!StrUtils.isNull(params.get("deptCodeShare"))) {
			sb.append(" and t.dept_code_share = ? ");
			values.add(params.get("deptCodeShare"));
		}

		if (level == 0) {
			// 不排序
			sb.append(" ORDER BY t.dept_code");
		} else {
			sb.append(" ORDER BY t.dept_code DESC,dept_code_share desc ");
		}

		return jdbcTemplate.queryForList(sb.toString(), values.toArray());
	}

	/**
	 * 获取分摊数据列表-分摊-不分页
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<TCostaccountFentan> getFentanLevel0(Integer jobId) {
		return jdbcTemplate.query(" SELECT * from t_costaccount_fentan where t_job_id = ? ", new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountFentan>(TCostaccountFentan.class));
	}

	/**
	 * 获取数据列表-原始-不分页
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<TCostaccountSrc> getFentanSrc(Integer jobId) {
		return jdbcTemplate.query(" SELECT * from t_costaccount_src where t_job_id = ? ", new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountSrc>(TCostaccountSrc.class));
	}

	/**
	 * 获取数据列表-开单工作量-原始-不分页
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public List<TCostaccountSrcKdgzl> getFentanSrcKdgzl(Integer jobId) {
		return jdbcTemplate.query(" SELECT * from t_costaccount_src_kdgzl where t_job_id = ? ", new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountSrcKdgzl>(TCostaccountSrcKdgzl.class));
	}

	/**
	 * 获取任务详情
	 * 
	 * @param jobId
	 * @return
	 */
	public Map<String, Object> getJobDetail(String jobId) {
		StringBuffer sb = new StringBuffer(" SELECT j.* " + " FROM `t_costaccount_job` j  " + " where id = ? ");
		List<Map<String, Object>> items = jdbcTemplate.queryForList(sb.toString(), jobId);
		return items.size() > 0 ? items.get(0) : null;
	}

	/*
	 * 获取分摊基本信息
	 */
	public Map<String, Object> fentanBase(String jobId) {
		StringBuffer sb = new StringBuffer(
				" SELECT * " + " FROM t_costaccount_job_baseinfo j  " + " where t_job_id = ? ");
		List<Map<String, Object>> items = jdbcTemplate.queryForList(sb.toString(), jobId);
		return items.size() > 0 ? items.get(0) : null;
	}

}
