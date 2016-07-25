/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cn.com.fanrenlee.model.common.ApiResult;
import cn.com.fanrenlee.service.CostAccountFentanService;

/**
 * 成本核算分摊
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@RestController
public class CostAccountFentanController {
	
	@Autowired
	CostAccountFentanService costAccountFentanService; 

	/**
	 * 上传原始数据
	 *
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 */
	public @ResponseBody ApiResult<String> uploadSrcData(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		
		return new ApiResult<String>("操作成功");
	}

}
