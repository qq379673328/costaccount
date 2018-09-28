package cn.com.fanrenlee.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.fanrenlee.auth.BaseDao;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.usermgr.serivce.UserMgrService;

/**
 * 区域级任务
 */
@Service
public class JobZoneService extends SimpleServiceImpl{

	public static final String NAMESPACE_BASE = "cn.com.sinosoft.jobzone.";

	@Resource
	BaseDao dao;
	@Resource
	JdbcTemplate template;
	@Resource
	UserMgrService userMgrService;

	/**
	 * 获取列表
	 *
	 * @param params
	 * @param page
	 * @return
	 */
	public PagingResult<List<Map<String, Object>>> getList(Map<String, Object> searchParams, PageParam pageParam) {
		Map<String, Object> params = new HashMap<String, Object>();
		String loginUser = getLoginUser();
		Integer orgId = userMgrService.getByLoginName(loginUser).getOrgId();
		searchParams.put("orgId", orgId);
		params.put("params", searchParams);
		PagingResult<List<Map<String, Object>>> result = dao.selectPage(NAMESPACE_BASE + "list", params, pageParam);
		return result;
	}

	/**
	 * 描述是否存在
	 *
	 * @param desc
	 * @return
	 */
	private boolean isDescExist(String desc) {
		Integer count = template.queryForObject("select count(1) from t_job_zone where `desc` = ? ",
				new Object[] { desc }, Integer.class);
		return count > 0 ? true : false;
	}
	
	/**
	 * 详情
	 * @param id
	 * @return
	 */
	public Map<String, Object> getDetail(String id){
		List<Map<String, Object>> items =  template.queryForList("select * from t_job_zone where id = ?", id);
		return items.size() > 0 ? items.get(0) : null;
	}
	
	/**
	 * 删除
	 *
	 * @param id
	 * @return
	 */
	@Transactional
	public void del(String id) {
		// 删除关系
		template.update("delete from t_job_zone_reljob where jobzone_id = ? ", id);
		// 删除
		template.update("delete from t_job_zone where id = ? ", id);
	}

	/**
	 * 添加
	 *
	 * @return
	 */
	@Transactional
	public void add(final String desc, String[] ids) {

		if (desc == null || desc.trim().equals("")) {
			throw new ServiceException("描述不能为空");
		}

		if (isDescExist(desc)) {
			throw new ServiceException("描述【" + desc + "】已存在");
		}

		final String sql = " insert into t_job_zone (  `desc`, create_user  )  VALUES ( ?, ? ) ";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// 设置返回的主键字段名
				PreparedStatement ps = con.prepareStatement(sql, new String[] { "desc", "create_user" });
				ps.setString(1, desc);
				ps.setString(2, getLoginUser());
				return ps;
			}
		}, keyHolder);

		int newId = keyHolder.getKey().intValue();

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", newId);
		params.put("ids", ids);
		// 关联关系
		dao.update(NAMESPACE_BASE + "set-rel", params);

	}

	/**
	 * rels
	 * @return
	 */
	public List<Map<String, Object>> getRels(String zoneJobId) {
		return template.queryForList("select * from t_job_zone_reljob where jobzone_id = ? ", zoneJobId);
	}
	
	/**
	 * rels
	 * @return
	 */
	public List<Map<String, Object>> getRelsDetail(String zoneJobId) {
		return template.queryForList(
				"select * from t_costaccount_job where id in ( select ccjob_id from t_job_zone_reljob m where m.jobzone_id = ? ) ", zoneJobId);
	}

}
