/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.web;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cn.com.fanrenlee.model.common.ApiResult;
import cn.com.fanrenlee.model.common.ResultCode;
import cn.com.fanrenlee.model.tables.TCostaccountJob;
import cn.com.fanrenlee.service.CostAccountFentanService;
import cn.com.fanrenlee.service.ServiceException;

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
	 * 上传原始数据-将原始数据中的业务数据存入数据库，并创建对应的任务
	 *
	 * @param file
	 *            附件
	 * @param job
	 *            任务信息
	 * @return 任务id
	 */
	@RequestMapping("uploadSrcData")
	public @ResponseBody ApiResult<Integer> uploadSrcData(
			@RequestParam(value = "file", required = false) MultipartFile file, TCostaccountJob job) {
		try {
			Integer jobId = costAccountFentanService.saveSrcDate(file.getInputStream(), job);
			return new ApiResult<Integer>(jobId);
		} catch (ServiceException e) {
			return new ApiResult<Integer>(ResultCode.FAILURE.getCode(), e.getLocalizedMessage());
		} catch (IOException e) {
			e.printStackTrace();
			return new ApiResult<Integer>(ResultCode.FAILURE.getCode(), "附件读取失败");
		}
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
	@RequestMapping("execJob/{jobId}")
	public @ResponseBody ApiResult<String> execJob(@PathVariable Integer jobId) {
		try {
			costAccountFentanService.execJob(jobId);
		} catch (ServiceException e) {
			return new ApiResult<String>(ResultCode.FAILURE.getCode(), e.getLocalizedMessage());
		}
		return new ApiResult<String>("任务已开始执行，请等待");
	}

}
