package cn.com.fanrenlee.auth.usermgr.serivce;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.fanrenlee.auth.BaseDao;
import cn.com.fanrenlee.auth.CommonUserService;
import cn.com.fanrenlee.auth.MD5Util;
import cn.com.fanrenlee.auth.dao.AuthMapper;
import cn.com.fanrenlee.auth.dao.ge.TAuthUrMapper;
import cn.com.fanrenlee.auth.dao.ge.TAuthUserMapper;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.entity.ge.TAuthUrExample;
import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.entity.ge.TAuthUserExample;
import cn.com.fanrenlee.service.ServiceException;
import cn.com.fanrenlee.util.StrUtils;

/**
 * @ClassName: UserMgrService
 * @Description: 用户管理
 * @author WHN
 * @date 2016年6月6日 上午11:49:24
 */

@Service
public class UserMgrService {

	public static final String NAMESPACE_BASE = "cn.com.sinosoft.common.user.";

	@Resource
	BaseDao baseDao;
	@Resource
	CommonUserService commonUserService;

	/**
	 * 获取列表
	 *
	 * @param searchParams
	 *            查询参数
	 * @param pageParam
	 *            分页参数
	 * @return 列表
	 */
	public PagingResult<List<TAuthUser>> getList(Map<String, String> searchParams, PageParam pageParam) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("params", searchParams);
		PagingResult<List<TAuthUser>> result = baseDao.selectPage(NAMESPACE_BASE + "list", params, pageParam);
		return result;
	}

	/**
	 * 获取详情
	 * 
	 * @param id
	 * @return
	 */
	public TAuthUser get(String id) {
		return getUserMapper().selectByPrimaryKey(id);
	}
	
	/**
	 * 获取详情
	 * 
	 * @param id
	 * @return
	 */
	public TAuthUser getByLoginName(String loginName) {
		TAuthUserExample ex = new TAuthUserExample();
		ex.createCriteria().andLoginNameEqualTo(loginName);
		List<TAuthUser> users = getUserMapper().selectByExample(ex);
		return users.size() > 0 ? users.get(0) : null;
	}

	/**
	 * 登录名是否存在
	 *
	 * @param loginName
	 * @return
	 */
	private boolean isLoginNameExist(String loginName) {
		TAuthUserExample ex = new TAuthUserExample();
		ex.createCriteria().andLoginNameEqualTo(loginName);
		List<TAuthUser> users = getUserMapper().selectByExample(ex);
		return users.size() > 0 ? true : false;
	}

	/**
	 * 编辑用户信息
	 *
	 * @param role
	 * @return
	 */
	@Transactional
	public void editUser(TAuthUser user) {
		if (StrUtils.isNull(user.getId())) {// 新增
			user.setPassWord(CommonUserService.USER_PWD_DEFAULT);
			if (isLoginNameExist(user.getLoginName())) {
				throw new ServiceException("账号已存在");
			}
			user.setCreateUser(commonUserService.getRequestUserId());
			user.setCreateTime(new Date());
			user.setPassWord(MD5Util.digestMD5(user.getPassWord()));
			user.setId(UUID.randomUUID().toString());
			user.setIsUsed("1");// 状态
			getAuthMapper().insertUser(user);
		} else {// 更新
			TAuthUser srcUser = get(user.getId());
			user.setLoginName(srcUser.getLoginName());// 登录名不可修改
			user.setPassWord(srcUser.getPassWord());// 密码不可直接修改
			user.setIsUsed(srcUser.getIsUsed());// 状态不可直接修改
			user.setUpdateTime(new Date());
			user.setUpdateUser(commonUserService.getRequestUserId());
			getUserMapper().updateByPrimaryKeySelective(user);
		}
	}

	/**
	 * 删除用户
	 *
	 * @param ids
	 * @return
	 */
	@Transactional
	public void delUser(String id) {

		// 删除用户
		getUserMapper().deleteByPrimaryKey(id);

		// 删除用户与角色关联
		delUserRolesById(id);
	}

	/**
	 * 删除用户与角色关联信息
	 *
	 * @param userId
	 */
	@Transactional
	public void delUserRolesById(String userId) {
		TAuthUrExample ex = new TAuthUrExample();
		ex.createCriteria().andUserIdEqualTo(userId);
		getUrMapper().deleteByExample(ex);
	}

	/**
	 * 禁用用户
	 *
	 * @param id
	 * @return
	 */
	@Transactional
	public void disableUser(String id) {
		TAuthUser user = new TAuthUser();
		user.setId(id);
		user.setIsUsed("0");
		getUserMapper().updateByPrimaryKeySelective(user);
	}

	/**
	 * 启用用户
	 *
	 * @param ids
	 * @return
	 */
	@Transactional
	public void enableUser(String id) {
		TAuthUser user = new TAuthUser();
		user.setId(id);
		user.setIsUsed("1");
		getUserMapper().updateByPrimaryKeySelective(user);
	}

	/**
	 * 重置用户密码
	 *
	 * @param id
	 * @return 重置之后密码
	 */
	@Transactional
	public String resetPwd(String id) {
		String pwdDefault = CommonUserService.USER_PWD_DEFAULT;
		TAuthUser user = new TAuthUser();
		user.setId(id);
		user.setPassWord(MD5Util.digestMD5(pwdDefault));
		getUserMapper().updateByPrimaryKeySelective(user);
		return pwdDefault;
	}

	/**
	 * 批量分配：为用户分配角色
	 *
	 * @param userId
	 * @param roleIds
	 * @return
	 */
	@Transactional
	public void setRole(String userId, String roleIds) {
		setUserRoles(userId, roleIds == null ? new String[] {} : roleIds.split("&"));
	}

	/**
	 * 为用户分配角色
	 *
	 * @param userId
	 *            用户id
	 * @param ids
	 *            角色ids
	 */
	@Transactional
	public void setUserRoles(String userId, String[] ids) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("ids", ids);
		// 删除用户角色
		delUserRolesById(userId);
		if (ids.length > 0) {
			// 重新分配权限
			baseDao.update(NAMESPACE_BASE + "user-role-set", params);
		}

	}

	/**
	 * 获取mapper
	 *
	 * @return mapper
	 */
	private TAuthUserMapper getUserMapper() {
		return baseDao.getMapper(TAuthUserMapper.class);
	}

	private TAuthUrMapper getUrMapper() {
		return baseDao.getMapper(TAuthUrMapper.class);
	}

	private AuthMapper getAuthMapper() {
		return baseDao.getMapper(AuthMapper.class);
	}

}
