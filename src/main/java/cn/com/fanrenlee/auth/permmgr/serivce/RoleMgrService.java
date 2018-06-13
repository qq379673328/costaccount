package cn.com.fanrenlee.auth.permmgr.serivce;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.fanrenlee.auth.BaseDao;
import cn.com.fanrenlee.auth.CommonUserService;
import cn.com.fanrenlee.auth.dao.AuthMapper;
import cn.com.fanrenlee.auth.dao.ge.TAuthRmMapper;
import cn.com.fanrenlee.auth.dao.ge.TAuthRoleMapper;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.entity.ge.TAuthRmExample;
import cn.com.fanrenlee.auth.entity.ge.TAuthRole;
import cn.com.fanrenlee.auth.entity.ge.TAuthRoleExample;
import cn.com.fanrenlee.service.ServiceException;
import cn.com.fanrenlee.util.StrUtils;

/**
 * 角色管理
 */
@Service
public class RoleMgrService {

	public static final String NAMESPACE_BASE = "cn.com.sinosoft.common.user.";

	@Resource
	BaseDao dao;
	@Resource
	CommonUserService commonUserService;
	@Resource
	JdbcTemplate template;

	/**
	 * 获取角色列表
	 *
	 * @param params
	 * @param page
	 * @return
	 */
	public PagingResult<List<Map<String, Object>>> getList(Map<String, String> searchParams, PageParam pageParam) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("params", searchParams);
		PagingResult<List<Map<String, Object>>> result = dao.selectPage(NAMESPACE_BASE + "role-list", params,
				pageParam);
		return result;
	}

	/**
	 * 角色名是否存在
	 *
	 * @param roleName
	 * @return
	 */
	private boolean isRoleNameExist(String roleName) {
		TAuthRoleExample ex = new TAuthRoleExample();
		ex.createCriteria().andRoleNameEqualTo(roleName);
		List<TAuthRole> roles = getRoleMapper().selectByExample(ex);
		return roles.size() > 0 ? true : false;
	}

	/**
	 * 编辑角色信息
	 *
	 * @param role
	 * @return
	 */
	@Transactional
	public void editRole(TAuthRole role) {
		if (StrUtils.isNull(role.getId())) {// 新增
			if (isRoleNameExist(role.getRoleName())) {
				throw new ServiceException("角色名已存在");
			}
			role.setCreateUser(commonUserService.getRequestUserId());
			role.setCreateTime(new Date());
			role.setId(UUID.randomUUID().toString());
			getAuthMapper().insertRole(role);
		} else {// 更新
			role.setUpdateUser(commonUserService.getRequestUserId());
			role.setUpdateTime(new Date());
			getRoleMapper().updateByPrimaryKeySelective(role);
		}
	}

	/**
	 * 删除角色
	 *
	 * @param id
	 * @return
	 */
	@Transactional
	public void delRole(String id) {
		// 删除用户跟角色的关系
		template.update("delete from t_auth_ur where role_id = ? ", id);
		// 删除角色跟菜单功能点关系
		template.update("delete from t_auth_rm where role_id = ? ", id);
		// 删除角色
		getRoleMapper().deleteByPrimaryKey(id);
	}

	/**
	 * 获取用户所有具有权限的菜单功能点
	 *
	 * @param userId
	 * @param appId
	 * @return
	 */
	public List<Map<String, Object>> getUserMF(String userName, boolean isOnlyMenu) {
		return getAuthMapper().getUserMF(userName, isOnlyMenu);
	}

	/**
	 * 为角色分配权限-获取权限树-包括所有权限
	 *
	 * @param roleId
	 * @return
	 */
	public Object getPermsAll(String roleId) {
		List<Map<String, Object>> perms = getAuthMapper().getPermsByRoleId(roleId);
		return renderMenusAndFuns(perms);
	}

	/**
	 * Comment:将菜单以及功能点融合成一棵树
	 *
	 * @param allMenus
	 *            菜单列表
	 * @param allFuns
	 *            功能点列表
	 * @return
	 */
	public List<Map<String, Object>> renderMenusAndFuns(List<Map<String, Object>> allMenus) {
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		// 获取0级菜单
		List<Map<String, Object>> firstlevelMenus = getFirstlevelMenus(allMenus);
		for (Map<String, Object> menu : firstlevelMenus) {// 循环所有初级菜单
			ret.add(handleOneMenu(menu, allMenus));
		}
		return ret;
	}

	/**
	 * Comment:获取初级菜单
	 *
	 * @param allMenus
	 * @return
	 */
	private List<Map<String, Object>> getFirstlevelMenus(List<Map<String, Object>> allMenus) {
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> menu : allMenus) {
			if (StrUtils.isNull(menu.get("PMF_ID")) && "0".equals(menu.get("MF_LEVEL"))) {
				ret.add(menu);
			}
		}
		return ret;
	}

	/**
	 *
	 * Comment:递归处理某一个菜单<br/>
	 *
	 * @param menu
	 * @param allFuns
	 * @return
	 */
	private Map<String, Object> handleOneMenu(Map<String, Object> menu, List<Map<String, Object>> allMenus) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("id", menu.get("MF_ID"));
		ret.put("text", menu.get("MF_NAME"));
		ret.put("url", menu.get("MF_LINK"));
		Map<String, Object> attributes = new HashMap<String, Object>();
		attributes.put("type", menu.get("MF_TYPE"));
		ret.put("attributes", attributes);
		// 组装
		List<Map<String, Object>> childrenMenus = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> item : allMenus) {
			if (!menu.get("MF_ID").equals(menu.get("PMF_ID")) && // 防止死循环
					menu.get("MF_ID").equals(item.get("PMF_ID"))) {
				Map<String, Object> newItem = handleOneMenu(item, allMenus);
				childrenMenus.add(newItem);
			}
		}
		if (menu.get("isown") != null && menu.get("isown").toString().equals("true") && childrenMenus.size() == 0) {
			ret.put("checked", true);
		}
		if (childrenMenus.size() > 0) {
			ret.put("state", "closed");
			ret.put("children", childrenMenus);
		}
		return ret;
	}

	/**
	 * 根据角色id删除权限信息
	 *
	 * @param roleId
	 */
	private void delPermByRoleId(String roleId) {
		TAuthRmExample ex = new TAuthRmExample();
		ex.createCriteria().andRoleIdEqualTo(roleId);
		getRmMapper().deleteByExample(ex);
	}

	/**
	 * 为角色分配权限
	 *
	 * @param roleId
	 * @param ids
	 * @return
	 */
	@Transactional
	public void setPerms(String roleId, String[] ids) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roleId", roleId);
		params.put("ids", ids);
		// 删除用户角色
		delPermByRoleId(roleId);
		// 重新分配权限
		dao.update(NAMESPACE_BASE + "mf-role-set", params);

	}

	private TAuthRoleMapper getRoleMapper() {
		return dao.getMapper(TAuthRoleMapper.class);
	}

	private TAuthRmMapper getRmMapper() {
		return dao.getMapper(TAuthRmMapper.class);
	}

	private AuthMapper getAuthMapper() {
		return dao.getMapper(AuthMapper.class);
	}

	/**
	 * 根据用户id获取角色信息
	 *
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> getRolesByUserId(String userId) {
		return getAuthMapper().getRolesByUserId(userId);
	}

	/**
	 * 获取详情
	 * 
	 * @param id
	 * @return
	 */
	public TAuthRole get(String id) {
		return getRoleMapper().selectByPrimaryKey(id);
	}

}
