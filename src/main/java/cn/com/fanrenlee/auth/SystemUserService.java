package cn.com.fanrenlee.auth;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.fanrenlee.auth.dao.ge.TAuthUserMapper;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.entity.ge.TAuthMenufun;
import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.model.common.LoginUserInfo;
import cn.com.fanrenlee.auth.model.system.user.MfAssign;
import cn.com.fanrenlee.auth.model.system.user.UserAdd;
import cn.com.fanrenlee.auth.model.system.user.UserDetail;
import cn.com.fanrenlee.auth.model.system.user.UserEdit;
import cn.com.fanrenlee.auth.model.system.user.UserList;
import cn.com.fanrenlee.auth.model.system.user.UserSearch;
import cn.com.fanrenlee.service.ServiceException;

/**
 * 用户管理服务
 */
@Service
public class SystemUserService {

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
	 * @return
	 */
	public PagingResult<UserList> getList(UserSearch searchParams, PageParam pageParam) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("params", searchParams);
		PagingResult<UserList> result = baseDao.selectPage(NAMESPACE_BASE + "list", params, pageParam);
		return result;
	}

	/**
	 * 添加
	 *
	 * @param item
	 *            信息
	 * @return id
	 */
	@Transactional
	public UserDetail add(UserAdd item) {
		// 验证用户名
		if (isUserNameExist(item.getUserName())) {
			throw new ServiceException("用户名【" + item.getUserName() + "】已存在");
		}

		// 密码加密
		item.setPassword(MD5Util.digestMD5(item.getPassword()));

		TAuthUser newItem = new TAuthUser();
		try {
			PropertyUtils.copyProperties(newItem, item);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		newItem.setCreateUser(commonUserService.getRequestUserId());
		getMapper().insertSelective(newItem);

		return get(newItem.getId());
	}

	public UserDetail get(String id) {
		TAuthUser userSrc = getMapper().selectByPrimaryKey(id);
		UserDetail user = new UserDetail();
		user.setId(userSrc.getId());
		user.setUserName(userSrc.getLoginName());
		return user;
	}

	/**
	 * 更新
	 *
	 * @param item
	 *            信息
	 * @return
	 */
	@Transactional
	public int update(UserEdit item) {
		TAuthUser newItem = new TAuthUser();
		newItem.setId(item.getId());
		newItem.setName(item.getName());
		newItem.setUpdateUser(commonUserService.getRequestUserId());
		newItem.setUpdateTime(new Date());

		return getMapper().updateByPrimaryKeySelective(newItem);
	}

	/**
	 * 删除
	 *
	 * @param ids
	 *            id列表（以,隔开）
	 * @return 记录条数
	 */
	@Transactional
	public int del(Integer[] ids) {
		if (ids == null || ids.length == 0)
			return 0;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", ids);
		return baseDao.delete(NAMESPACE_BASE + "del", params);
	}

	/**
	 * 启用
	 *
	 * @param ids
	 *            id列表（以,隔开）
	 * @return 记录条数
	 */
	@Transactional
	public int enable(Integer[] ids) {
		return changeState(ids, CommonUserService.USER_STATE_UNLOCKED);
	}

	/**
	 * 禁用
	 *
	 * @param ids
	 *            id列表（以,隔开）
	 * @return 记录条数
	 */
	@Transactional
	public int disable(Integer[] ids) {
		return changeState(ids, CommonUserService.USER_STATE_LOCKED);
	}

	/**
	 * 修改用户状态
	 */
	@Transactional
	private int changeState(Integer[] ids, String state) {
		if (ids == null || ids.length == 0)
			return 0;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("state", state);
		params.put("ids", ids);
		return baseDao.delete(NAMESPACE_BASE + "change-state", params);
	}

	/**
	 * 获取mapper
	 *
	 * @return
	 */
	private TAuthUserMapper getMapper() {
		return baseDao.getMapper(TAuthUserMapper.class);
	}

	/**
	 * 用户名是否存在
	 *
	 * @param userName
	 * @return
	 */
	public boolean isUserNameExist(String userName) {
		TAuthUser user = commonUserService.geTAuthUserByUserName(userName);
		return user == null ? false : true;
	}

	/**
	 * 修改用户密码
	 *
	 * @param userName
	 *            用户名
	 * @param pwd
	 *            密码-未加密
	 */
	@Transactional
	public void changeUserPwd(String userName, String pwd) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", userName);
		params.put("pwd", MD5Util.digestMD5(pwd));
		baseDao.update(NAMESPACE_BASE + "change-pwd", params);
	}

	/**
	 * 重置用户密码
	 *
	 * @param userName
	 */
	@Transactional
	public String resetUserPwd(String userName) {
		String defaultPwd = CommonUserService.USER_PWD_DEFAULT;
		changeUserPwd(userName, defaultPwd);
		return defaultPwd;
	}

	/**
	 * 获取指定用户权限
	 *
	 * @param userId
	 *            用户id
	 * @param type
	 *            1-菜单，2-功能点，null-不限
	 * @return 菜单功能点列表
	 */
	public List<TAuthMenufun> getUserMf(String userId, String type) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("type", type);
		List<TAuthMenufun> items = null;
		if("1".equals(userId)) {// admin
			items = baseDao.selectList(NAMESPACE_BASE + "mf-list-user-all", params);
		}else {
			items = baseDao.selectList(NAMESPACE_BASE + "mf-list-user", params);
		}
		return items;
	}

	/**
	 * 获取指定用户权限-用于用户权限分配
	 *
	 * @param userId
	 * @return
	 */
	public List<MfAssign> getUserAssignMf(String userId) {
		List<MfAssign> ret = new ArrayList<MfAssign>();
		// 用户自己的权限
		List<TAuthMenufun> selfMf = getUserMf(commonUserService.getRequestUserId(), null);
		// 目标用户的权限
		List<TAuthMenufun> targetMf = getUserMf(userId, null);
		// 融合权限
		for (TAuthMenufun self : selfMf) {
			MfAssign mfAssign = new MfAssign();
			try {
				PropertyUtils.copyProperties(mfAssign, self);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
			for (TAuthMenufun target : targetMf) {
				if (self.getId().equals(target.getId())) {
					mfAssign.setIsHave(true);
					continue;
				}
			}
			if (mfAssign.getIsHave() == null) {
				mfAssign.setIsHave(false);
			}
			ret.add(mfAssign);

		}
		return ret;
	}

	/**
	 * 为用户分配权限
	 *
	 * @param userId
	 *            用户id
	 * @param ids
	 *            权限ids
	 */
	@Transactional
	public void setUserAssignMf(Integer userId, Integer[] ids) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("ids", ids);
		// 删除用户权限
		delUserAssignMf(userId);
		// 重新分配权限
		baseDao.update(NAMESPACE_BASE + "mf-user-set", params);

	}

	/**
	 * 删除用户权限
	 *
	 * @param userId
	 */
	@Transactional
	private void delUserAssignMf(Integer userId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		baseDao.delete(NAMESPACE_BASE + "mf-user-del", params);
	}

	/**
	 * 修改用户自己密码
	 *
	 * @param userName
	 * @param srcPwd
	 * @param newPwd
	 */
	@Transactional
	public boolean changeSelfPwd(String srcPwd, String newPwd) {
		LoginUserInfo user = commonUserService.getRequestUser();
		if (user != null) {
			String userName = user.getUserName();
			TAuthUser u = commonUserService.geTAuthUser(userName, srcPwd);
			if (u == null) {
				return false;
			}
			changeUserPwd(userName, newPwd);
			return true;
		} else {
			return false;
		}
	}

}
