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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.Statement;

import cn.com.fanrenlee.model.common.JobStateInfos;
import cn.com.fanrenlee.model.costaccount.CADItem;
import cn.com.fanrenlee.model.costaccount.CostItem;
import cn.com.fanrenlee.model.tables.TCostaccountJob;
import cn.com.fanrenlee.model.tables.TCostaccountJobBaseinfo;
import cn.com.fanrenlee.model.tables.TCostaccountLevel1;
import cn.com.fanrenlee.model.tables.TCostaccountLevel2;
import cn.com.fanrenlee.model.tables.TCostaccountLevel3;
import cn.com.fanrenlee.model.tables.TCostaccountSrc;
import cn.com.fanrenlee.util.doc.ExcelUtil;

/**
 * 成本核算分摊算法
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Service
public class CostAccountFentanService {

	@Autowired
	JdbcTemplate jdbcTemplate;

	/**
	 * 保存原始数据
	 *
	 * @param inputStream
	 * @param job
	 * @return
	 * @throws ServiceException
	 */
	public Integer saveSrcDate(InputStream inputStream,
			final TCostaccountJob job) throws ServiceException {
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
		final List<TCostaccountSrc> srcItems = getCadItemsFromSrcData(srcData,
				job);

		// 保存任务数据
		final String sqlJob = "insert into t_costaccount_job "
				+ "(job_desc, t_hos_id, hos_code, hos_name) "
				+ "values (?, ?, ?, ?) ";
		KeyHolder keyJob = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				PreparedStatement preState = con.prepareStatement(sqlJob,
						Statement.RETURN_GENERATED_KEYS);
				preState.setString(1, job.getJobDesc());
				preState.setInt(2, job.gettHosId());
				preState.setString(3, job.getHosCode());
				preState.setString(4, job.getHosName());
				return preState;
			}
		}, keyJob);
		final Integer jobId = keyJob.getKey().intValue();

		// 保存业务数据
		String sqlService = "insert into t_costaccount_src "
				+ " (dept_code, dept_name, dept_id, "
				+ " cost_people, cost_old_device_common, cost_old_device_special,"
				+ " cost_old_house, cost_asset_amortize, cost_vc_funds,"
				+ " cost_other, t_job_id, "
				+ " people_count, work_count, work_count_kd, work_count_xd, "
				+ " work_count_inhos, work_count_mz " + ")"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sqlService,
				new BatchPreparedStatementSetter() {

					@Override
					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						TCostaccountSrc item = srcItems.get(i);
						ps.setString(1, item.getDeptCode());
						ps.setString(2, item.getDeptName());
						ps.setObject(3, item.getDeptId());

						ps.setObject(4, item.getCostPeople());
						ps.setObject(5, item.getCostOldDeviceCommon());
						ps.setObject(6, item.getCostOldDeviceSpecial());
						ps.setObject(7, item.getCostOldHouse());
						ps.setObject(8, item.getCostAssetAmortize());
						ps.setObject(9, item.getCostVcFunds());
						ps.setObject(10, item.getCostOther());

						ps.setObject(11, jobId);

						ps.setObject(12, item.getPeopleCount());
						ps.setObject(13, item.getWorkCount());
						ps.setObject(14, item.getWorkCountKd());
						ps.setObject(15, item.getWorkCountXd());
						ps.setObject(16, item.getWorkCountInhos());
						ps.setObject(17, item.getWorkCountMz());
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
	private List<TCostaccountSrc> getCadItemsFromSrcData(
			List<List<List<String>>> srcData, TCostaccountJob job)
			throws ServiceException {
		if (srcData == null || srcData.get(0).size() == 0) {
			return null;
		}
		List<TCostaccountSrc> srcItems = new ArrayList<TCostaccountSrc>();
		List<List<String>> sheetDataItem = srcData.get(0);
		if (sheetDataItem.size() <= 1) {
			throw new ServiceException("第一页数据不符合规范，至少应有2行数据");
		}
		for (int i = 0; i < sheetDataItem.size(); i++) {
			// 忽略标题行
			if (i == 0) {
				continue;
			}
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize <= 2) {
				throw new ServiceException("基础数据行至少应有两列数据(行" + (i + 1) + ")");
			}
			TCostaccountSrc srcItem = new TCostaccountSrc();
			for (int j = 0; j < rowDataitemSize; j++) {
				String cellData = rowDataItem.get(j);

				if (j == 0) {// 第1列-科室代码
					srcItem.setDeptCode(cellData);
				} else if (j == 1) {// 第2列-科室名称
					srcItem.setDeptName(cellData);
				} else if (j == 2) {// 第3列-人员经费
					srcItem.setCostPeople(getFloat(cellData));
				} else if (j == 3) {// 第4列-通用设备折旧费
					srcItem.setCostOldDeviceCommon(getFloat(cellData));
				} else if (j == 4) {// 第5列-专用设备折旧费
					srcItem.setCostOldDeviceSpecial(getFloat(cellData));
				} else if (j == 5) {// 第6列-房屋折旧费
					srcItem.setCostOldHouse(getFloat(cellData));
				} else if (j == 6) {// 第7列-无形资产摊销费
					srcItem.setCostAssetAmortize(getFloat(cellData));
				} else if (j == 7) {// 第8列-计提医疗风险基金
					srcItem.setCostVcFunds(getFloat(cellData));
				} else if (j == 8) {// 第9列-其他费用
					srcItem.setCostOther(getFloat(cellData));
				} else if (j == 9) {// 第10列-人员数
					srcItem.setPeopleCount(getInteger(cellData));
				} else if (j == 10) {// 第11列-工作量
					srcItem.setWorkCount(getFloat(cellData));
				} else if (j == 11) {// 第12列-开单工作量
					srcItem.setWorkCountKd(getFloat(cellData));
				} else if (j == 12) {// 第13列-消毒工作量
					srcItem.setWorkCountXd(getFloat(cellData));
				} else if (j == 13) {// 第14列-住院人数
					srcItem.setWorkCountInhos(getInteger(cellData));
				} else if (j == 14) {// 第15列-门诊量
					srcItem.setWorkCountMz(getFloat(cellData));
				}
			}
			srcItems.add(srcItem);
		}
		return srcItems;
	}

	private Float getFloat(String text) {
		return text == null ? null : Float.valueOf(text);
	}

	private Integer getInteger(String text) {
		return text == null ? null
				: Integer.valueOf(Math.round(getFloat(text)));
	}

	/**
	 * 执行某次任务
	 *
	 * @param jobId
	 * @throws ServiceException
	 */
	public void execJob(Integer jobId) throws ServiceException {
		// 获取任务的状态
		TCostaccountJob job = getJobByJobid(jobId);
		if(job == null) throw new ServiceException("任务不存在");
		if (JobStateInfos.RUNNING.equals(job.getState())) {
			throw new ServiceException("任务运行中,请等待任务结束");
		}

		// 更新任务状态-进行中
		updateJobState(jobId, "1", 0);

		long timeStart = System.currentTimeMillis();

		// 删除旧任务相关的所有分析数据
		deleteJobDataById(jobId);

		List<CADItem> srcData = getSrcData(jobId);
		TCostaccountJobBaseinfo baseInfo = getBaseInfoByJobId(jobId);
		// 分摊计算
		CADItemHandler cadItemHandler = new CADItemHandler(srcData, baseInfo);
		cadItemHandler.handle();
		// 直接费用
		Map<String, CostItem> costDirect = cadItemHandler.getCostDirectMap();
		// 全费用
		Map<String, Float> costAll = cadItemHandler.getCostAllMap();
		saveCostDirectAndAll(costDirect, costAll, job);

		// 一级分摊
		saveCostLevel1(cadItemHandler.getCostLevel1(), job);
		// 二级分摊
		saveCostLevel2(cadItemHandler.getCostLevel2(), job);
		// 三级分摊
		saveCostLevel3(cadItemHandler.getCostLevel3(), job);

		long timeEnd = System.currentTimeMillis();

		// 更新job状态
		updateJobState(jobId, "2", timeEnd - timeStart);
	}

	/**
	 * 删除job数据
	 *
	 * @param jobId
	 */
	private void deleteJobDataById(Integer jobId) {
		jdbcTemplate.update(
				"update t_costaccount_src set count_all = null, count_direct = null where t_job_id = ? ",
				jobId);
		jdbcTemplate.update(
				"delete from t_costaccount_level1 where t_job_id = ? ", jobId);
		jdbcTemplate.update(
				"delete from t_costaccount_level2 where t_job_id = ? ", jobId);
		jdbcTemplate.update(
				"delete from t_costaccount_level3 where t_job_id = ? ", jobId);

	}

	/**
	 * 保存直接费用和全费用
	 *
	 * @param costDirect
	 * @param costAll
	 * @param job
	 */
	private void saveCostDirectAndAll(Map<String, CostItem> costDirect,
			Map<String, Float> costAll, final TCostaccountJob job) {
		final List<Object[]> items = new ArrayList<Object[]>();
		for (String key : costDirect.keySet()) {
			// deptcode-直接费用-全费用
			items.add(new Object[] { key, costDirect.get(key).getCostShare(),
					costAll.get(key) });
		}
		String sql = "update t_costaccount_src set "
				+ "count_direct = ?,count_all = ?, update_time = ? "
				+ "where t_job_id = ? and dept_code = ? ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				Object[] item = items.get(i);
				ps.setFloat(1, Float.valueOf(String.valueOf(item[1])));
				ps.setFloat(2, Float.valueOf(String.valueOf(item[2])));
				ps.setDate(3, new Date(new java.util.Date().getTime()));
				ps.setInt(4, job.getId());
				ps.setString(5, String.valueOf(item[0]));
			}

			@Override
			public int getBatchSize() {
				return items.size();
			}

		});
	}

	/**
	 * 保存分级分摊结果-级别1
	 *
	 */
	private void saveCostLevel1(Map<String, CostItem> costItems,
			final TCostaccountJob job) {
		final List<TCostaccountLevel1> items = new ArrayList<TCostaccountLevel1>();
		for (String key : costItems.keySet()) {
			TCostaccountLevel1 item = new TCostaccountLevel1();
			CostItem ci = costItems.get(key);

			String[] keySp = key.split(CADItemHandler.CODE_SEP);

			item.setDeptCode(keySp[0]);
			item.setDeptCodeShare(keySp[1]);

			item.setShareLevel1(ci.getCostShare());

			item.setShareItemAssetAmortize(ci.getCostShareassetAmortize());
			item.setShareItemOldDeviceCommon(ci.getCostShareoldDeviceCommon());
			item.setShareItemOldDeviceSpecial(
					ci.getCostShareoldDeviceSpecial());
			item.setShareItemOldHouse(ci.getCostShareoldHouse());
			item.setShareItemOther(ci.getCostShareOther());
			item.setShareItemPeople(ci.getCostSharePeople());
			item.setShareItemVcFunds(ci.getCostSharevcFunds());

			items.add(item);
		}

		String sql = "insert into t_costaccount_level1 "
				+ " (dept_code, dept_name, share_level1, "
				+ " dept_code_share, dept_name_share, t_hospital_code,"
				+ " share_item_people, share_item_old_device_common, share_item_old_device_special,"
				+ " share_item_old_house, share_item_asset_amortize, share_item_vc_funds,"
				+ " share_item_other, t_job_id) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				TCostaccountLevel1 item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setFloat(3, item.getShareLevel1());
				ps.setString(4, item.getDeptCodeShare());
				ps.setString(5, item.getDeptNameShare());
				ps.setString(6, job.getHosCode());

				ps.setFloat(7, item.getShareItemPeople());
				ps.setFloat(8, item.getShareItemOldDeviceCommon());
				ps.setFloat(9, item.getShareItemOldDeviceSpecial());
				ps.setFloat(10, item.getShareItemOldHouse());
				ps.setFloat(11, item.getShareItemAssetAmortize());
				ps.setFloat(12, item.getShareItemVcFunds());
				ps.setFloat(13, item.getShareItemOther());

				ps.setInt(14, job.getId());
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
	private void saveCostLevel2(Map<String, CostItem> costItems,
			final TCostaccountJob job) {
		final List<TCostaccountLevel2> items = new ArrayList<TCostaccountLevel2>();
		for (String key : costItems.keySet()) {
			TCostaccountLevel2 item = new TCostaccountLevel2();
			CostItem ci = costItems.get(key);

			String[] keySp = key.split(CADItemHandler.CODE_SEP);

			item.setDeptCode(keySp[0]);
			item.setDeptCodeShare(keySp[1]);

			item.setShareLevel2(ci.getCostShare());

			item.setShareItemAssetAmortize(ci.getCostShareassetAmortize());
			item.setShareItemOldDeviceCommon(ci.getCostShareoldDeviceCommon());
			item.setShareItemOldDeviceSpecial(
					ci.getCostShareoldDeviceSpecial());
			item.setShareItemOldHouse(ci.getCostShareoldHouse());
			item.setShareItemOther(ci.getCostShareOther());
			item.setShareItemPeople(ci.getCostSharePeople());
			item.setShareItemVcFunds(ci.getCostSharevcFunds());

			items.add(item);
		}

		String sql = "insert into t_costaccount_level2 "
				+ " (dept_code, dept_name, share_level2, "
				+ " dept_code_share, dept_name_share, t_hospital_code,"
				+ " share_item_people, share_item_old_device_common, share_item_old_device_special,"
				+ " share_item_old_house, share_item_asset_amortize, share_item_vc_funds,"
				+ " share_item_other, t_job_id) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				TCostaccountLevel2 item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setFloat(3, item.getShareLevel2());
				ps.setString(4, item.getDeptCodeShare());
				ps.setString(5, item.getDeptNameShare());
				ps.setString(6, job.getHosCode());

				ps.setFloat(7, item.getShareItemPeople());
				ps.setFloat(8, item.getShareItemOldDeviceCommon());
				ps.setFloat(9, item.getShareItemOldDeviceSpecial());
				ps.setFloat(10, item.getShareItemOldHouse());
				ps.setFloat(11, item.getShareItemAssetAmortize());
				ps.setFloat(12, item.getShareItemVcFunds());
				ps.setFloat(13, item.getShareItemOther());

				ps.setInt(14, job.getId());
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
	private void saveCostLevel3(Map<String, CostItem> costItems,
			final TCostaccountJob job) {
		final List<TCostaccountLevel3> items = new ArrayList<TCostaccountLevel3>();
		for (String key : costItems.keySet()) {
			TCostaccountLevel3 item = new TCostaccountLevel3();
			CostItem ci = costItems.get(key);

			String[] keySp = key.split(CADItemHandler.CODE_SEP);

			item.setDeptCode(keySp[0]);
			item.setDeptCodeShare(keySp[1]);

			item.setShareLevel3(ci.getCostShare());

			item.setShareItemAssetAmortize(ci.getCostShareassetAmortize());
			item.setShareItemOldDeviceCommon(ci.getCostShareoldDeviceCommon());
			item.setShareItemOldDeviceSpecial(
					ci.getCostShareoldDeviceSpecial());
			item.setShareItemOldHouse(ci.getCostShareoldHouse());
			item.setShareItemOther(ci.getCostShareOther());
			item.setShareItemPeople(ci.getCostSharePeople());
			item.setShareItemVcFunds(ci.getCostSharevcFunds());

			items.add(item);
		}

		String sql = "insert into t_costaccount_level3 "
				+ " (dept_code, dept_name, share_level3, "
				+ " dept_code_share, dept_name_share, t_hospital_code,"
				+ " share_item_people, share_item_old_device_common, share_item_old_device_special,"
				+ " share_item_old_house, share_item_asset_amortize, share_item_vc_funds,"
				+ " share_item_other, t_job_id) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				TCostaccountLevel3 item = items.get(i);
				ps.setString(1, item.getDeptCode());
				ps.setString(2, item.getDeptName());
				ps.setFloat(3, item.getShareLevel3());
				ps.setString(4, item.getDeptCodeShare());
				ps.setString(5, item.getDeptNameShare());
				ps.setString(6, job.getHosCode());

				ps.setFloat(7, item.getShareItemPeople());
				ps.setFloat(8, item.getShareItemOldDeviceCommon());
				ps.setFloat(9, item.getShareItemOldDeviceSpecial());
				ps.setFloat(10, item.getShareItemOldHouse());
				ps.setFloat(11, item.getShareItemAssetAmortize());
				ps.setFloat(12, item.getShareItemVcFunds());
				ps.setFloat(13, item.getShareItemOther());

				ps.setInt(14, job.getId());
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
	private TCostaccountJobBaseinfo getBaseInfoByJobId(Integer jobId) {
		List<TCostaccountJobBaseinfo> infos = jdbcTemplate.query(
				"select * from t_costaccount_job_baseinfo where t_costaccount_job_id = ? ",
				new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountJobBaseinfo>(
						TCostaccountJobBaseinfo.class));
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
					"update t_costaccount_job set state = ?, update_time = ?, exec_time_start = ? where id = ? ",
					state, currentData, currentData, jobId);
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
		List<TCostaccountJob> items = jdbcTemplate.query(
				"select * from t_costaccount_job where id = ? ",
				new Object[] { jobId },
				new BeanPropertyRowMapper<TCostaccountJob>(
						TCostaccountJob.class));
		return items.size() > 0 ? items.get(0) : null;
	}

	/**
	 * 获取某次任务的原始数据
	 *
	 * @param jobId
	 * @return
	 */
	public List<CADItem> getSrcData(Integer jobId) {
		return jdbcTemplate.query(
				" SELECT dd.dept_special_code, dd.dept_type_code, src.* FROM t_costaccount_src src LEFT JOIN "
						+ " (SELECT dept.*,job.id jobid FROM t_dept dept LEFT JOIN t_costaccount_job job "
						+ " ON job.t_hos_id = dept.t_hospital_id WHERE job.id = ?) dd "
						+ " ON src.t_job_id = dd.jobid AND src.dept_code = dd.dept_code WHERE src.t_job_id = ? ",
				new Object[] { jobId, jobId },
				new BeanPropertyRowMapper<CADItem>(CADItem.class));
	}

}
