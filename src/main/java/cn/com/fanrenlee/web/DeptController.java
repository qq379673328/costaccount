package cn.com.fanrenlee.web;

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
import cn.com.fanrenlee.model.tables.TDept;
import cn.com.fanrenlee.service.DeptService;

/**
 * 科室控制器
 * 
 * @author lizhiyong
 *
 */
@RestController
@RequestMapping("dept")
public class DeptController {

	@Autowired
	DeptService deptService;

	/**
	 * 获取科室信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getById/{id}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<TDept> getHosById(@PathVariable Integer id) {
		return new ApiResult<TDept>(deptService.getById(id));
	}

	/**
	 * 获取科室列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody PagingResult getList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return deptService.getList(params, pageParams);
	}

	/**
	 * 删除科室
	 * 
	 * @return
	 */
	@RequestMapping(value = "delById", method = RequestMethod.POST)
	public @ResponseBody Object delById(Integer deptId) {
		deptService.delById(deptId);
		return new ApiResult<String>();
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public @ResponseBody Object add(TDept dept) {
		deptService.add(dept);
		return new ApiResult<String>();
	}

	/**
	 * 编辑
	 * 
	 * @return
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public @ResponseBody Object edit(TDept dept) {
		deptService.edit(dept);
		return new ApiResult<String>();
	}

}
