package cn.com.fanrenlee.web;

import java.util.HashMap;
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
import cn.com.fanrenlee.service.JobZoneService;
import cn.com.fanrenlee.service.ProService;

/**
 * jobzone
 */
@Controller
@RequestMapping("jobzone")
public class JobZoneController {

	@Resource
	JobZoneService service;
	@Resource
	ProService proService;

	/**
	 * 获取列表
	 *
	 * @param params
	 * @param page
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public PagingResult<List<Map<String, Object>>> getList(@RequestParam Map<String, Object> searchParams,
			PageParam pageParam) {
		return service.getList(searchParams, pageParam);
	}

	/**
	 * 详情
	 */
	@RequestMapping("detail/{id}")
	@ResponseBody
	public Map<String, Object> getDetail(@PathVariable String id) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("detail", service.getDetail(id));
		ret.put("rels", service.getRelsDetail(id));
		// 区域级-结果
		ret.put("proresultZone", proService.getProResultZone(id));
		// 区域级-产能成本率
		ret.put("proresultCncblZone", proService.getProResultCncblZone(id));
		
		return ret;
	}

	/**
	 * 删除
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping("del/{id}")
	@ResponseBody
	public APIResult<String> delRole(@PathVariable String id) {
		service.del(id);
		return new APIResult<String>(null, "操作成功", true);
	}

	/**
	 * add
	 */
	@RequestMapping("add")
	@ResponseBody
	public APIResult<String> add(String desc, String ids) {
		String[] idsSplit = ids == null ? new String[] {} : ids.split("&");
		service.add(desc, idsSplit);
		return new APIResult<String>(null, "操作成功", true);
	}

}
