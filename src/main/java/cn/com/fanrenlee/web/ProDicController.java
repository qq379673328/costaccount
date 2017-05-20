package cn.com.fanrenlee.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cn.com.fanrenlee.model.common.ApiResult;
import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.ResultCode;
import cn.com.fanrenlee.model.tables.TProDic;
import cn.com.fanrenlee.service.ProDicService;

/**
 * 项目字典控制器
 * 
 * @author lizhiyong
 *
 */
@RestController
@RequestMapping("prodic")
public class ProDicController {

	@Autowired
	ProDicService prodicService;

	/**
	 * 获取字典信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getById/{id}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<TProDic> getById(@PathVariable Integer id) {
		return new ApiResult<TProDic>(prodicService.getById(id));
	}

	/**
	 * 获取列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody PagingResult getList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return prodicService.getList(params, pageParams);
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "delById", method = RequestMethod.POST)
	public @ResponseBody Object delById(Integer prodicId) {
		prodicService.delById(prodicId);
		return new ApiResult<String>();
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public @ResponseBody Object add(TProDic dic) {
		prodicService.add(dic);
		return new ApiResult<String>();
	}

	/**
	 * 编辑
	 * 
	 * @return
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public @ResponseBody Object edit(TProDic dic) {
		prodicService.edit(dic);
		return new ApiResult<String>();
	}
	
	/**
	 * 导入项目字典
	 *
	 * @param file
	 *            附件
	 * @param hosId
	 *            医院id
	 * @return
	 */
	@RequestMapping(value = "uploadSrcData", method = RequestMethod.POST)
	public @ResponseBody ApiResult<Object> uploadData(
			@RequestParam(value = "file", required = false) MultipartFile file,
			Integer hosId) {
		try {
			prodicService.uploadData(file.getInputStream(), hosId);
			return new ApiResult<Object>();
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			message = message == null || message.isEmpty() ? "操作失败，服务器异常" : message;
			return new ApiResult<Object>(ResultCode.FAILURE.getCode(), message);
		}
	}

}
