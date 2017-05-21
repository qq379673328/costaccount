/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.web;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.fanrenlee.util.excel.Table2Excel;

/**
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Controller
public class CommonController {
	
	/**
	 * 首页
	 */
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	/**
	 * 导出简单excel
	 * @param response
	 * @param tableJson
	 * @param title
	 */
	@RequestMapping("exportSimpleTable")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response){
		try {
			String tableJson = request.getParameter("tableJson");
			response.setContentType("octets/stream;charset=GBK");
			response.addHeader("Content-Disposition", "attachment;filename=export.xls");
			OutputStream ouputStream = response.getOutputStream();
			new Table2Excel().transJson2Excel(tableJson, ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
