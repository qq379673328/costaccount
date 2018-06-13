package cn.com.fanrenlee.auth.usermgr.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fanrenlee.auth.CommonUserService;
import cn.com.fanrenlee.auth.domain.common.APIResult;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.usermgr.serivce.UserMgrService;

/**
 * 用户管理
 */
@Controller
@RequestMapping("api/mgr/auth/usermgr")
public class UserMgrController {

	@Resource
	UserMgrService userMgrService;
	@Resource
	CommonUserService commonUserService;

	/**
	 * 列表
	 *
	 * @param searchParams
	 *            查询参数
	 * @param pageParam
	 *            分页参数
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public PagingResult<List<TAuthUser>> getList(@RequestParam Map<String, String> searchParams, PageParam pageParam) {
		return userMgrService.getList(searchParams, pageParam);
	}

	/**
	 * 详情
	 */
	@RequestMapping("detail/{id}")
	@ResponseBody
	public TAuthUser getDetail(@PathVariable String id) {
		TAuthUser user = userMgrService.get(id);
		user.setPassWord(null);
		return user;
	}

	/**
	 * 新增用户信息
	 *
	 * @param user
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public APIResult<String> addUser(TAuthUser user) {
		userMgrService.editUser(user);
		return new APIResult<String>(CommonUserService.USER_PWD_DEFAULT, "操作成功", true);
	}

	/**
	 * 编辑用户信息
	 *
	 * @param user
	 * @return
	 */
	@RequestMapping("edit")
	@ResponseBody
	public APIResult<String> editUser(TAuthUser user) {
		userMgrService.editUser(user);
		return new APIResult<String>(null, "操作成功", true);
	}

	/**
	 * 删除用户
	 *
	 *
	 * @param ids
	 * @return
	 *
	 */
	@PostMapping("del")
	@ResponseBody
	public APIResult<String> delUser(String id) {
		userMgrService.delUser(id);
		return new APIResult<String>(null, "删除成功", true);
	}

	/**
	 * 禁用用户
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping("disable")
	@ResponseBody
	public APIResult<String> disableUser(String id) {
		userMgrService.disableUser(id);
		return new APIResult<String>(null, "禁用成功", true);
	}

	/**
	 * 启用用户
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping("enable")
	@ResponseBody
	public APIResult<String> enableUser(String id) {
		userMgrService.enableUser(id);
		return new APIResult<String>(null, "启用成功", true);
	}

	/**
	 * 重置用户密码
	 *
	 * @param userId
	 * @return
	 */
	@RequestMapping("resetPwd")
	@ResponseBody
	public APIResult<String> resetPwd(String ids) {
		String pwd = userMgrService.resetPwd(ids);
		return new APIResult<String>(null, "密码重置为 " + pwd, true);
	}

	/**
	 * 为用户分配角色
	 *
	 * @param userId
	 * @param ids
	 * @return
	 */
	@PostMapping("setRole")
	@ResponseBody
	public APIResult<String> setRole(String userId, String roleIds) {
		userMgrService.setRole(userId, roleIds);
		return new APIResult<String>(null, "角色分配成功", true);
	}

	/**
	 * 获取登录用户权限
	 *
	 * @return
	 */
	@RequestMapping("getMyPermissions")
	@ResponseBody
	public Object getMyPermissions() {
		return commonUserService.getRequestUser().getMfListVO();
	}

}
