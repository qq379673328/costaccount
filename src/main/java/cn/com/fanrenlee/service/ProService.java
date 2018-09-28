/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.tables.TProDic;

/**
 * 项目处理结果
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Service
public class ProService extends SimpleServiceImpl {

	@Resource
	CostAccountFentanService costAccountFentanService;

	/*
	 * 获取字典数据
	 */
	public List<TProDic> getDics(Integer hospitalId) {
		return jdbcTemplate.query(" SELECT * from t_pro_dic", new Object[] {},
				new BeanPropertyRowMapper<TProDic>(TProDic.class));
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
	 * 获取处理结果
	 */
	public List<Map<String, Object>> getProResult(Integer jobId) {
		return jdbcTemplate.queryForList(" SELECT t.*,d.bz_dept_code,d.bz_dept_name from t_pro_result t left join t_costaccount_src_dept d on t.t_job_id = d.t_job_id and t.dept_code = d.dept_code where t.t_job_id = ?", new Object[] { jobId });
	}

	/**
	 * 获取处理结果-产能成本率
	 */
	public List<Map<String, Object>> getProResultCncbl(Integer jobId) {
		return jdbcTemplate.queryForList(" SELECT t.*,d.bz_dept_code,d.bz_dept_name from t_pro_result_cncbl t left join t_costaccount_src_dept d on t.t_job_id = d.t_job_id and t.dept_code = d.dept_code where t.t_job_id = ? order by dept_code,type",
				new Object[] { jobId });
	}

	/**
	 * 获取处理结果-区域级
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getProResultZone(String zoneJobId) {
		Integer count = jdbcTemplate.queryForObject("select count(1) from t_job_zone_reljob where jobzone_id = ? ",
				new Object[] { zoneJobId }, Integer.class);
		if (count == null || count == 0) {
			return new ArrayList<Map<String, Object>>();
		}
		String sql = " select t.pro_code,t.pro_name,t.type, "
				+ " sum(t.cost_people_direct + t.cost_people_mid_all)/? cost_people,"
				+ " sum(t.cost_house_direct + t.cost_house_mid_all)/? cost_house,"
				+ " sum(t.cost_spe_direct + t.cost_spe_mid_all)/? cost_spe,"
				+ " sum(t.cost_asset_direct + t.cost_asset_mid_all)/? cost_asset,"
				+ " sum(t.cost_other_direct + t.cost_other_mid_all)/? cost_other,"
				+ " sum(t.cost_ylfxjj)/? cost_ylfxjj," + " sum(t.cost_wsclf)/? cost_wsclf"
				+ " from t_pro_result t where t.level = 2 "
				+ " and t.t_job_id in (select m.ccjob_id from t_job_zone_reljob m where m.jobzone_id = ? )"
				+ " group by t.pro_code,t.pro_name,t.type";
		return jdbcTemplate.queryForList(sql,
				new Object[] { count, count, count, count, count, count, count, zoneJobId });
	}

	/**
	 * 获取处理结果-产能成本率-区域级
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getProResultCncblZone(String zoneJobId) {
		Integer count = jdbcTemplate.queryForObject("select count(1) from t_job_zone_reljob where jobzone_id = ? ",
				new Object[] { zoneJobId }, Integer.class);
		if (count == null || count == 0) {
			return new ArrayList<Map<String, Object>>();
		}
		String sql = " select " + " sum(t.zzys_cncbl)/? zzys_cncbl," + " sum(t.ys_cncbl)/? ys_cncbl,"
				+ " sum(t.hs_cncbl)/? hs_cncbl," + " sum(t.js_cncbl)/? js_cncbl," + " sum(t.op_cncbl)/? op_cncbl,"
				+ " sum(t.house_cncbl)/? house_cncbl," + " sum(t.spe_cncbl)/? spe_cncbl,"
				+ " sum(t.asset_cncbl)/? asset_cncbl," + " sum(t.oc_cncbl)/? oc_cncbl"
				+ " from t_pro_result_cncbl t where t.level = 2 and type = 3"
				+ " and t.t_job_id in (select m.ccjob_id from t_job_zone_reljob m where m.jobzone_id = ? )";
		return jdbcTemplate.queryForList(sql, new Object[] { count, count, count, count, count, count,
				count, count, count , zoneJobId});
	}

	/**
	 * 医院数
	 * 
	 * @return
	 */
	public int getHosCount() {
		return jdbcTemplate.queryForObject(" SELECT count(1) from t_hospital", Integer.class);
	}

}
