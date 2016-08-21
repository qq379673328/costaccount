/**
 * Copyright www.sinosoft.com.cn
 */
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
import cn.com.fanrenlee.service.ProService;

/**
 * 项目理论成本
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@RestController
@RequestMapping("pro")
public class ProController {

	@Autowired
	ProService proService;

	/**
	 * 上传原始业务数据
	 *
	 * @param file
	 *            附件
	 * @param job
	 *            任务信息
	 * @return 任务id
	 */
	@RequestMapping(value = "uploadSrcData", method = RequestMethod.POST)
	public @ResponseBody ApiResult<String> uploadSrcData(
			@RequestParam(value = "file", required = false) MultipartFile file, Integer jobId) {
		try {
			proService.saveSrcDate(file.getInputStream(), jobId);
			return new ApiResult<String>("数据上传成功");
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			message = message == null || message.isEmpty() ? "操作失败，服务器异常" : message;
			return new ApiResult<String>(ResultCode.FAILURE.getCode(), message);
		}
	}

	/**
	 * 执行pro任务
	 *
	 * @param jobId
	 *            任务id
	 * @return
	 */
	@RequestMapping(value = "execPro/{proId}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<String> execJob(@PathVariable Integer proId) {
		try{
			proService.execPro(proId);
			return new ApiResult<String>("数据已计算完成");
		}catch(Exception e){
			e.printStackTrace();
			String message = e.getMessage();
			message = message == null || message.isEmpty() ? "操作失败，服务器异常" : message;
			return new ApiResult<String>(ResultCode.FAILURE.getCode(), message);
		}
	}

	/**
	 * 获取原始数据列表
	 *
	 */
	@RequestMapping(value = "getSrcDataList", method = RequestMethod.POST)
	public @ResponseBody PagingResult getSrcDataList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return proService.getSrcDataList(params, pageParams);
	}

	/**
	 * 获取计算数据列表
	 *
	 */
	@RequestMapping(value = "getResultList", method = RequestMethod.POST)
	public @ResponseBody PagingResult getFentanList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return proService.getResultList(params, pageParams);
	}

}
