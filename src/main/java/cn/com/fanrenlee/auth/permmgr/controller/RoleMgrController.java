package cn.com.fanrenlee.auth.permmgr.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.fanrenlee.auth.domain.common.APIResult;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.entity.ge.TAuthRole;
import cn.com.fanrenlee.auth.permmgr.serivce.RoleMgrService;
import cn.com.fanrenlee.util.excel.ExportExcelUtil;

/**
 * 角色管理
 */
@Controller
@RequestMapping("api/mgr/auth/rolemgr")
public class RoleMgrController {

	@Resource
	RoleMgrService roleMgrService;
	@Resource
	ExportExcelUtil exportExcelUtil;

	/**
	 * 获取角色管理列表
	 *
	 * @param params
	 * @param page
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public PagingResult<List<Map<String, Object>>> getList(@RequestParam Map<String, String> searchParams,
			PageParam pageParam) {
		return roleMgrService.getList(searchParams, pageParam);
	}

	/**
	 * 详情
	 */
	@RequestMapping("detail/{id}")
	@ResponseBody
	public TAuthRole getDetail(@PathVariable String id) {
		TAuthRole role = roleMgrService.get(id);
		return role;
	}

	/**
	 * 编辑角色信息
	 *
	 * @param role
	 * @return
	 */
	@RequestMapping("edit")
	@ResponseBody
	public APIResult<String> editRole(TAuthRole role) {
		roleMgrService.editRole(role);
		return new APIResult<String>(null, "操作成功", true);
	}

	/**
	 * 删除角色
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	@ResponseBody
	public APIResult<String> delRole(String ids) {
		roleMgrService.delRole(ids);
		return new APIResult<String>(null, "操作成功", true);
	}

	/**
	 * 为角色分配权限-获取权限树
	 *
	 * @param roleId
	 * @return
	 */
	@RequestMapping("getPermsAll")
	@ResponseBody
	public Object getPermsAll(String roleId) {
		return roleMgrService.getPermsAll(roleId);
	}

	/**
	 * 获取用户角色
	 *
	 * @param roleId
	 * @return
	 */
	@RequestMapping("getRolesByUserId")
	@ResponseBody
	public List<Map<String, Object>> getRolesByUserId(String userId) {
		return roleMgrService.getRolesByUserId(userId);
	}

	/**
	 * 为角色分配权限
	 *
	 * @param roleId
	 * @return
	 */
	@RequestMapping("setPerms")
	@ResponseBody
	public APIResult<String> setPerms(String roleId, String ids) {
		String[] idsSplit = ids == null ? new String[] {} : ids.split("&");
		roleMgrService.setPerms(roleId, idsSplit);
		return new APIResult<String>(null, "操作成功", true);
	}

}
