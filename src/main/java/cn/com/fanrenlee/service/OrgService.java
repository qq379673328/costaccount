package cn.com.fanrenlee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.tables.TOrg;
import cn.com.fanrenlee.util.StrUtils;

/**
 * 机构业务类
 */
@Service
public class OrgService extends SimpleServiceImpl {

	/**
	 * 获取详细信息-根据id
	 * 
	 * @param hosId
	 * @return
	 */
	public TOrg getById(Integer id) {
		List<TOrg> items = jdbcTemplate.query("select * from t_org where id = ? ", new Object[] { id },
				new BeanPropertyRowMapper<TOrg>(TOrg.class));
		return items.size() > 0 ? items.get(0) : null;
	}
	
	public Boolean isOrgNameExist(String orgName) {
		List<TOrg> items = jdbcTemplate.query("select * from t_org where org_name = ? ", new Object[] { orgName },
				new BeanPropertyRowMapper<TOrg>(TOrg.class));
		return items.size() > 0 ? true : false;
	}
	

	public Boolean isOrgNameExist(String orgName, Integer id) {
		List<TOrg> items = jdbcTemplate.query("select * from t_org where org_name = ? and id <> ? ", new Object[] { orgName, id },
				new BeanPropertyRowMapper<TOrg>(TOrg.class));
		return items.size() > 0 ? true : false;
	}

	/**
	 * 获取所有
	 */
	public List<TOrg> getAll() {
		return jdbcTemplate.query("select * from t_org ", new Object[] {}, new BeanPropertyRowMapper<TOrg>(TOrg.class));
	}

	/**
	 * 删除信息-根据id
	 */
	public void delById(Integer id) {
		if(isOrgUsed(id)) {
			throw new ServiceException("机构下包含用户，不能删除");
		}
		jdbcTemplate.update("delete from t_org where id = ? ", new Object[] { id });
	}
	
	public Boolean isOrgUsed(Integer id) {
		List<Map<String, Object>> items = jdbcTemplate.queryForList("select * from t_auth_user where org_id = ? ", new Object[] { id });
		return items.size() > 0 ? true : false;
	}

	/**
	 * 新增信息
	 * 
	 * @param
	 * @return
	 */
	public void add(TOrg org) {
		if(isOrgNameExist(org.getOrgName())) {
			throw new ServiceException("机构名已存在");
		}
		jdbcTemplate.update("insert into t_org (org_name) values (?) ",
				new Object[] { org.getOrgName() });
	}

	/**
	 * 修改信息
	 * 
	 * @param
	 * @return
	 */
	public void edit(TOrg org) {
		if(isOrgNameExist(org.getOrgName(), org.getId())) {
			throw new ServiceException("机构名已存在");
		}
		jdbcTemplate.update("update t_org set org_name = ? where id = ? ",
				new Object[] { org.getOrgName(), org.getId() });
	}

	/**
	 * 机构分页查询
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT t.* " + " FROM `t_org` t where 1=1 ");
		// 医院名
		if (!StrUtils.isNull(params.get("orgName"))) {
			sb.append(" and t.org_name like ? ");
			values.add("%" + params.get("orgName") + "%");
		}
		sb.append(" ORDER BY t.org_name ");

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

}
