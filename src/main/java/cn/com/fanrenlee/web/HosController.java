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
import cn.com.fanrenlee.model.tables.THospital;
import cn.com.fanrenlee.service.HosService;

/**
 * 医院控制器
 * 
 * @author lizhiyong
 *
 */
@RestController
@RequestMapping("hos")
public class HosController {

	@Autowired
	HosService hosService;

	/**
	 * 获取医院信息
	 * 
	 * @param hosId
	 * @return
	 */
	@RequestMapping(value = "getById/{hosId}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<THospital> getHosById(@PathVariable Integer hosId) {
		return new ApiResult<THospital>(hosService.getById(hosId));
	}

	/**
	 * 获取医院列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody PagingResult getList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return hosService.getList(params, pageParams);
	}

	/**
	 * 删除医院列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "delById", method = RequestMethod.POST)
	public @ResponseBody Object delById(Integer hosId) {
		hosService.delById(hosId);
		return new ApiResult<String>();
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public @ResponseBody Object add(THospital hos) {
		hosService.add(hos);
		return new ApiResult<String>();
	}

	/**
	 * 编辑
	 * 
	 * @return
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public @ResponseBody Object edit(THospital hos) {
		hosService.edit(hos);
		return new ApiResult<String>();
	}

}
