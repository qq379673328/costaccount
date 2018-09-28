package cn.com.fanrenlee.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cn.com.fanrenlee.model.common.ApiResult;
import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.tables.TOrg;
import cn.com.fanrenlee.service.OrgService;

/**
 * 机构控制器
 */
@RestController
@RequestMapping("org")
public class OrgController {

	@Autowired
	OrgService orgService;

	/**
	 * 获取信息
	 * 
	 * @param orgId
	 * @return
	 */
	@RequestMapping(value = "getById/{id}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<TOrg> getHosById(@PathVariable Integer id) {
		return new ApiResult<TOrg>(orgService.getById(id));
	}
	
	/**
	 * 获取信息
	 * 
	 * @param orgId
	 * @return
	 */
	@RequestMapping(value = "getAll", method = RequestMethod.POST)
	public @ResponseBody ApiResult<List<TOrg>> getAll() {
		return new ApiResult<List<TOrg>>(orgService.getAll());
	}

	/**
	 * 获取列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody PagingResult getList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return orgService.getList(params, pageParams);
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "delById", method = RequestMethod.POST)
	public @ResponseBody Object delById(Integer id) {
		orgService.delById(id);
		return new ApiResult<String>();
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public @ResponseBody Object add(TOrg org) {
		orgService.add(org);
		return new ApiResult<String>();
	}

	/**
	 * 编辑
	 * 
	 * @return
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public @ResponseBody Object edit(TOrg org) {
		orgService.edit(org);
		return new ApiResult<String>();
	}

}
