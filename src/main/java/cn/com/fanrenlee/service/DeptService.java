package cn.com.fanrenlee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.tables.TDept;
import cn.com.fanrenlee.util.StrUtils;

/**
 * 科室业务类
 * 
 * @author lizhiyong
 *
 */
@Service
public class DeptService extends SimpleServiceImpl {

	/**
	 * 获取科室信息-根据id
	 * 
	 * @param hosId
	 * @return
	 */
	public TDept getById(Integer id) {
		List<TDept> items = jdbcTemplate.query("select * from t_dept where id = ? ", new Object[] { id },
				new BeanPropertyRowMapper<TDept>(TDept.class));
		return items.size() > 0 ? items.get(0) : null;
	}

	/**
	 * 删除科室信息-根据id
	 * 
	 * @param id
	 * @return
	 */
	public void delById(Integer id) {
		jdbcTemplate.update("delete from t_dept where id = ? ", new Object[] { id });
	}

	/**
	 * 新增科室信息
	 * 
	 * @param
	 * @return
	 */
	public void add(TDept dept) {
		jdbcTemplate
				.update("insert into t_dept (dept_code, dept_name, dept_type_code, dept_type_name, dept_special_code, dept_special_name, t_hospital_id) values (?, ?, ?, ?, ?, ?, ?) ",
						new Object[] { dept.getDeptCode(), dept.getDeptName(), dept.getDeptTypeCode(),
								dept.getDeptTypeName(), dept.getDeptSpecialCode(), dept.getDeptSpecialName(),
								dept.gettHospitalId() });
	}

	/**
	 * 修改科室信息
	 * 
	 * @param
	 * @return
	 */
	public void edit(TDept dept) {
		jdbcTemplate
				.update("update t_dept set dept_code = ? ,dept_name = ?, dept_type_code = ?, dept_type_name = ?, dept_special_code = ?, dept_special_name = ? where id = ? ",
						new Object[] { dept.getDeptCode(), dept.getDeptName(), dept.getDeptTypeCode(),
								dept.getDeptTypeName(), dept.getDeptSpecialCode(), dept.getDeptSpecialName(),
								dept.getId() });
	}

	/**
	 * 科室分页查询
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * from t_dept where 1=1 ");
		// 科室名
		if (!StrUtils.isNull(params.get("deptName"))) {
			sb.append(" and dept_name like ? ");
			values.add("%" + params.get("deptName") + "%");
		}
		// 科室编码
		if (!StrUtils.isNull(params.get("deptCode"))) {
			sb.append(" and dept_code = ? ");
			values.add(params.get("deptCode"));
		}
		// 医院id
		if (!StrUtils.isNull(params.get("hosId"))) {
			sb.append(" and t_hospital_id = ? ");
			values.add(params.get("hosId"));
		}

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

}
