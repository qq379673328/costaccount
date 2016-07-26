/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Controller
public class CommonController {
	
	/**
	 * 首页
	 *
	 * @return
	 */
	@RequestMapping(value = {"/", "index"})
	String index(){
		return "index";
	}

}
