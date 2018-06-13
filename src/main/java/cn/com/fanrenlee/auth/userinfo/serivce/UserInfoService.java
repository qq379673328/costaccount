package cn.com.fanrenlee.auth.userinfo.serivce;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.fanrenlee.auth.BaseDao;
import cn.com.fanrenlee.auth.CommonUserService;
import cn.com.fanrenlee.auth.MD5Util;
import cn.com.fanrenlee.auth.dao.ge.TAuthUserMapper;
import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.service.ServiceException;

/**
 * @author 郑俊鹏
 * @date 2015年7月20日
 */
@Service
public class UserInfoService {

	public static final String NAMESPACE_BASE = "cn.com.sinosoft.common.user.";

	@Resource
	BaseDao baseDao;
	@Resource
	CommonUserService commonUserService;

	/**
	 * 获取个人信息
	 *
	 * @return
	 */
	public TAuthUser getUserInfo() {
		String userId = commonUserService.getRequestUserId();
		return getUserMapper().selectByPrimaryKey(userId);
	}

	/**
	 * 修改个人密码
	 *
	 * @param params
	 * @return
	 */
	@Transactional
	public void alterPwd(Map<String, String> params) {
		TAuthUser user = getUserInfo();
		String password = user.getPassWord();
		String oldpassword = params.get("oldpassword");
		String newpassword = params.get("newpassword");
		String confirmpassword = params.get("confirmpassword");
		oldpassword = MD5Util.digestMD5(oldpassword);
		if (!password.equals(oldpassword)) {
			throw new ServiceException("原始密码错误");
		} else if (!newpassword.equals(confirmpassword)) {
			throw new ServiceException("两次输入的新密码不一致");
		} else {
			user.setPassWord(MD5Util.digestMD5(newpassword));
			editUser(user);
		}
	}

	public void editUser(TAuthUser user) {
		getUserMapper().updateByPrimaryKeySelective(user);
	}

	/**
	 * 获取mapper
	 *
	 * @return mapper
	 */
	private TAuthUserMapper getUserMapper() {
		return baseDao.getMapper(TAuthUserMapper.class);
	}
}
