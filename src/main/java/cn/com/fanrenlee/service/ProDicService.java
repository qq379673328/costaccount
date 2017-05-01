package cn.com.fanrenlee.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.tables.TProDic;
import cn.com.fanrenlee.util.StrUtils;

/**
 * 项目字典业务类
 * 
 * @author lizhiyong
 *
 */
@Service
public class ProDicService extends SimpleServiceImpl {

	/**
	 * 获取信息-根据id
	 * 
	 * @param hosId
	 * @return
	 */
	public TProDic getById(Integer id) {
		List<TProDic> items = jdbcTemplate.query("select * from t_pro_dic where id = ? ", new Object[] { id },
				new BeanPropertyRowMapper<TProDic>(TProDic.class));
		return items.size() > 0 ? items.get(0) : null;
	}

	/**
	 * 删除信息-根据id
	 * 
	 * @param id
	 * @return
	 */
	public void delById(Integer id) {
		jdbcTemplate.update("delete from t_pro_dic where id = ? ", new Object[] { id });
	}

	/**
	 * 新增信息
	 * 
	 * @param
	 * @return
	 */
	public void add(TProDic dic) {
		jdbcTemplate
			.update("insert into t_pro_dic ("
				+ " pro_code, pro_name, cost_time, "
				+ " pc_ys, pc_hs, pc_js, pc_yaoshi, pc_o, "
				+ " t_hospital_id, wsclf, ylfxjj) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?) ",
				new Object[] { dic.getProCode(), dic.getProName(), dic.getCostTime(),
						dic.getPcYs(), dic.getPcHs(),
						dic.getPcJs(), dic.getPcYaoshi(), dic.getPcO(),
						dic.gettHospitalId(), dic.getWsclf(),
						dic.getYlfxjj() });
	}

	/**
	 * 修改信息
	 * 
	 * @param
	 * @return
	 */
	public void edit(TProDic dic) {
		jdbcTemplate
			.update("update t_pro_dic set "
					+ " pro_code = ? ,pro_name = ?, cost_time = ?, "
					+ " pc_ys = ?, pc_hs = ?, pc_js = ?, "
					+ " pc_o = ?, wsclf= ?, "
					+ " ylfxjj = ? where id = ? ",
				new Object[] { dic.getProCode(), dic.getProName(), dic.getCostTime(),
					dic.getPcYs(), dic.getPcHs(), dic.getPcJs(),
					dic.getPcO(), dic.getWsclf(),
					 dic.getYlfxjj(), dic.getId() });
	}

	public List<TProDic> getProDics(Integer hosId){
		return jdbcTemplate.query(" SELECT * from t_pro_dic where t_hospital_id = ? ", new Object[] { hosId },
				new BeanPropertyRowMapper<TProDic>(TProDic.class));
	}
	
	/**
	 * 字典分页查询
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * from t_pro_dic where 1=1 ");
		// 项目名称
		if (!StrUtils.isNull(params.get("proName"))) {
			sb.append(" and pro_name like ? ");
			values.add("%" + params.get("proName") + "%");
		}
		// 项目编码
		if (!StrUtils.isNull(params.get("proCode"))) {
			sb.append(" and pro_code = ? ");
			values.add(params.get("proCode"));
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
