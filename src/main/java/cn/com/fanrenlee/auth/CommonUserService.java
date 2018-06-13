package cn.com.fanrenlee.auth;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.model.common.LoginUserInfo;
import cn.com.fanrenlee.service.ServiceException;

/**
 * 公共、通用用户服务
 */
@Service
public class CommonUserService {

	public static final String NAMESPACE_BASE_DEFAULT = "cn.com.sinosoft.common.user.";

	@Resource
	BaseDao baseDao;

	/**
	 * session中存储用户信息
	 */
	public static final String SESSION_NAME_USERINFO = "loginUserInfo";

	/**
	 * 用户状态-锁定
	 */
	public static final String USER_STATE_LOCKED = "0";

	/**
	 * 用户状态-未锁定
	 */
	public static final String USER_STATE_UNLOCKED = "1";

	/**
	 * 用户默认密码
	 */
	public static final String USER_PWD_DEFAULT = "00000000";

	@Autowired
	HttpServletRequest request;

	/**
	 * 获取请求用户信息-从session中获取
	 *
	 * @return 用户信息
	 */
	public Object getRequestUserObj() {
		try {
			request.getSession();
		} catch (Exception e) {
			return null;
		}
		// 先从session中取
		Object userInfo = request.getSession().getAttribute(SESSION_NAME_USERINFO);
		return userInfo;
	}

	/**
	 * 获取请求用户信息-从session中获取
	 *
	 * @return 用户信息
	 */
	public LoginUserInfo getRequestUser() {
		try {
			request.getSession();
		} catch (Exception e) {
			return null;
		}
		// 先从session中取
		LoginUserInfo userInfo = (LoginUserInfo) request.getSession().getAttribute(SESSION_NAME_USERINFO);
		return userInfo;
	}

	/**
	 * 获取请求用户id
	 *
	 * @return 用户id
	 */
	public String getRequestUserId() {
		Object obj = getRequestUserObj();
		if (obj == null)
			return null;
		if (obj instanceof LoginUserInfo) {
			LoginUserInfo userInfo = (LoginUserInfo) obj;
			return userInfo.getId();
		}
		return null;
	}

	/**
	 * 验证用户名和密码
	 *
	 * @param userName
	 *            用户名
	 * @param passWord
	 *            密码
	 * @return 是否正确
	 */
	public boolean validUser(String userName, String passWord) throws AuthenticationServiceException {
		if (userName == null || passWord == null) {
			throw new ServiceException("用户名、密码不能为空");
		}
		TAuthUser user = geTAuthUser(userName, passWord);
		if (user == null) {
			throw new ServiceException("用户名或密码错误");
		}
		return true;
	}

	/**
	 * 获取用户列表
	 *
	 * @param params
	 * @return
	 */
	public List<TAuthUser> geTAuthUserList(Map<String, Object> params) {
		List<TAuthUser> users = baseDao.selectList(NAMESPACE_BASE_DEFAULT + "user-list", params);
		return users;
	}

	/**
	 * 获取用户-根据用户名和用户密码
	 *
	 * @param userName
	 *            用户名
	 * @param passWord
	 *            密码
	 * @return 用户基础信息
	 */
	public TAuthUser geTAuthUser(String userName, String passWord) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", userName);
		params.put("passWord", MD5Util.digestMD5(passWord));
		List<TAuthUser> users = geTAuthUserList(params);
		return users.size() > 0 ? users.get(0) : null;
	}

	/**
	 * 获取用户-根据用户名
	 *
	 * @param userName
	 *            用户名
	 * @return 用户
	 */
	public TAuthUser geTAuthUserByUserName(String userName) {
		if (StringUtils.isEmpty(userName)) {
			return null;
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userName", userName);
		List<TAuthUser> users = geTAuthUserList(params);
		return users.size() > 0 ? users.get(0) : null;
	}

	/**
	 * 获取用户-根据用户ID
	 *
	 * @param userName
	 *            用户名
	 * @return 用户
	 */
	public TAuthUser geTAuthUserByUserId(String userId) {
		if (userId == null) {
			return null;
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		List<TAuthUser> users = geTAuthUserList(params);
		return users.size() > 0 ? users.get(0) : null;
	}

}
