/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.tables.TProDic;

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

	/*
	 * 获取字典数据
	 */
	public List<TProDic> getDics(Integer hospitalId) {
		return jdbcTemplate.query(" SELECT * from t_pro_dic where t_hospital_id = ?", new Object[] { hospitalId },
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
	 * 获取理论成本处理结果
	 */
	public List<Map<String, Object>> getProResult(Integer jobId) {
		return jdbcTemplate.queryForList(" SELECT * from t_pro_result where t_job_id = ?", new Object[] { jobId });
	}
	
	/**
	 * 获取理论成本处理结果-产能成本率
	 */
	public List<Map<String, Object>> getProResultCncbl(Integer jobId) {
		return jdbcTemplate.queryForList(" SELECT * from t_pro_result_cncbl where t_job_id = ? order by dept_code,type", new Object[] { jobId });
	}


}
