package cn.com.fanrenlee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.tables.THospital;
import cn.com.fanrenlee.util.StrUtils;

/**
 * 医院业务类
 * 
 * @author lizhiyong
 *
 */
@Service
public class HosService extends SimpleServiceImpl {

	/**
	 * 获取医院信息-根据id
	 * 
	 * @param hosId
	 * @return
	 */
	public THospital getById(Integer hosId) {
		List<THospital> items = jdbcTemplate.query("select * from t_hospital where id = ? ", new Object[] { hosId },
				new BeanPropertyRowMapper<THospital>(THospital.class));
		return items.size() > 0 ? items.get(0) : null;
	}

	/**
	 * 删除医院信息-根据id
	 * 
	 * @param hosId
	 * @return
	 */
	public void delById(Integer hosId) {
		jdbcTemplate.update("delete from t_hospital where id = ? ", new Object[] { hosId });
	}

	/**
	 * 新增医院信息
	 * 
	 * @param
	 * @return
	 */
	public void add(THospital hos) {
		jdbcTemplate.update("insert into t_hospital (hos_name) values (?) ", new Object[] { hos.getHosName() });
	}

	/**
	 * 修改医院信息
	 * 
	 * @param
	 * @return
	 */
	public void edit(THospital hos) {
		jdbcTemplate.update("update t_hospital set hos_name = ? where id = ? ",
				new Object[] { hos.getHosName(), hos.getId() });
	}

	/**
	 * 医院分页查询
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT t.* " + " FROM `t_hospital` t where 1=1 ");
		// 医院名
		if (!StrUtils.isNull(params.get("hosame"))) {
			sb.append(" and t.hos_name = ? ");
			values.add(params.get("hos_name"));
		}

		sb.append(" ORDER BY t.create_time DESC ");

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

}
