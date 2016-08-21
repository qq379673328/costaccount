/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.web;

import java.util.HashMap;
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
import cn.com.fanrenlee.model.tables.TCostaccountJob;
import cn.com.fanrenlee.model.tables.TCostaccountJobBaseinfo;
import cn.com.fanrenlee.service.CostAccountFentanService;

/**
 * 成本核算分摊
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@RestController
@RequestMapping("costaccount")
public class CostAccountFentanController {

	@Autowired
	CostAccountFentanService costAccountFentanService;

	/**
	 * 新增任务-将原始数据中的业务数据存入数据库，并创建对应的任务
	 *
	 * @param file
	 *            附件
	 * @param job
	 *            任务信息
	 * @return 任务id
	 */
	@RequestMapping(value = "uploadSrcData", method = RequestMethod.POST)
	public @ResponseBody ApiResult<Integer> uploadSrcData(
			@RequestParam(value = "file", required = false) MultipartFile file, TCostaccountJob job,
			TCostaccountJobBaseinfo baseInfo) {
		try {
			Integer jobId = costAccountFentanService.saveSrcDate(file.getInputStream(), job, baseInfo);
			return new ApiResult<Integer>(jobId);
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			message = message == null || message.isEmpty() ? "操作失败，服务器异常" : message;
			return new ApiResult<Integer>(ResultCode.FAILURE.getCode(), message);
		}
	}

	/**
	 * 删除job任务
	 * 
	 * @param jobId
	 *            任务id
	 */
	@RequestMapping(value = "delJob/{jobId}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<String> delJob(@PathVariable Integer jobId) {
		costAccountFentanService.deleteJobById(jobId);
		return new ApiResult<String>("任务删除成功");
	}

	/**
	 * 执行job任务
	 *
	 * @param file
	 *            附件
	 * @param job
	 *            任务信息
	 * @return 任务id
	 */
	@RequestMapping(value = "execJob/{jobId}", method = RequestMethod.POST)
	public @ResponseBody ApiResult<String> execJob(@PathVariable Integer jobId) {
		try{
			costAccountFentanService.execJob(jobId);
			return new ApiResult<String>("任务已执行完成");
		}catch(Exception e){
			e.printStackTrace();
			String message = e.getMessage();
			message = message == null || message.isEmpty() ? "操作失败，服务器异常" : message;
			return new ApiResult<String>(ResultCode.FAILURE.getCode(), message);
		}
	}

	/**
	 * 获取任务列表
	 *
	 */
	@RequestMapping(value = "getJobList", method = RequestMethod.POST)
	public @ResponseBody PagingResult getJobList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return costAccountFentanService.getJobList(params, pageParams);
	}

	/**
	 * 获取任务详情-任务信息
	 *
	 */
	@RequestMapping(value = "jobDetail/{jobId}", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getJobDetail(@PathVariable("jobId") String jobId) {
		Map<String, Object> item = costAccountFentanService.getJobDetail(jobId);
		return item == null ? new HashMap<String, Object>() : item;
	}
	
	/**
	 * 获取分摊基本信息
	 *
	 */
	@RequestMapping(value = "fentanBase/{jobId}", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> fentanBase(@PathVariable("jobId") String jobId) {
		Map<String, Object> item = costAccountFentanService.fentanBase(jobId);
		return item == null ? new HashMap<String, Object>() : item;
	}
	
	/**
	 * 获取原始数据列表
	 *
	 */
	@RequestMapping(value = "getSrcDataList", method = RequestMethod.POST)
	public @ResponseBody PagingResult getSrcDataList(@RequestParam Map<String, String> params, PageParam pageParams) {
		return costAccountFentanService.getSrcDataList(params, pageParams);
	}

	/**
	 * 获取分摊数据列表
	 *
	 */
	@RequestMapping(value = "getFentanList", method = RequestMethod.POST)
	public @ResponseBody PagingResult getFentanList(@RequestParam Map<String, String> params, PageParam pageParams,
			Integer level) {
		return costAccountFentanService.getFentanList(params, pageParams, level);
	}

}
