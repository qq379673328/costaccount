/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@RestController
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
