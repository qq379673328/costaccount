package cn.com.fanrenlee.auth.userinfo.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.com.fanrenlee.auth.CommonUserService;
import cn.com.fanrenlee.auth.domain.common.APIResult;
import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.userinfo.serivce.UserInfoService;

/**
 * 用户信息控制器
 */
@RestController
@RequestMapping("api/mgr/auth/userinfo")
public class UserInfoController {

	@Resource
	UserInfoService userInfoService;
	@Resource
	CommonUserService commonUserService;

	/**
	 * 获取用户个人信息
	 *
	 * @param
	 * @return
	 */
	@GetMapping("getUserInfo")
	public TAuthUser getUserInfo() {
		return userInfoService.getUserInfo();
	}

	/**
	 * 修改个人信息
	 *
	 * @param user
	 * @return
	 */
	@PostMapping("edit")
	public APIResult<String> editUser(TAuthUser user) {
		user.setId(commonUserService.getRequestUserId());
		userInfoService.editUser(user);
		return new APIResult<String>(null, "修改成功", true);
	}

	/**
	 * 修改个人密码
	 *
	 * @param params
	 * @return
	 */
	@PostMapping("alterPwd")
	public APIResult<String> alterPwd(@RequestParam Map<String, String> params) {
		userInfoService.alterPwd(params);
		return new APIResult<String>(null, "密码修改成功", true);
	}
}
