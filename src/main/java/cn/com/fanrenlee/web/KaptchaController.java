package cn.com.fanrenlee.web;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;

/**
 * 验证码
 */
@RestController
public class KaptchaController {

	/**
	 * 验证码
	 *
	 * @param request
	 * @param response
	 * @return 验证码
	 */
	@RequestMapping("/pub/kaptcha")
	public void kaptcha(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");

		// 验证码配置
		DefaultKaptcha captchaProducer = new DefaultKaptcha();
		Properties properties = new Properties();
		properties.setProperty("kaptcha.border", "no");// 是否有border
		properties.setProperty("kaptcha.textproducer.font.color", "blue");// 颜色
		properties.setProperty("kaptcha.image.width", "125");// 宽度
		properties.setProperty("kaptcha.image.height", "45");// 高度
		properties.setProperty("kaptcha.textproducer.font.size", "45");// 字体大小
		properties.setProperty("kaptcha.session.key", "code");// session key
		properties.setProperty("kaptcha.textproducer.char.length", "4");// 长度
		properties.setProperty("kaptcha.textproducer.char.string", "0123456789");// 内容：全为数字
		properties.setProperty("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");// 字体
		properties.setProperty("kaptcha.noise.impl", "com.google.code.kaptcha.impl.NoNoise");// 无干扰线
		Config config = new Config(properties);
		captchaProducer.setConfig(config);
		String capText = captchaProducer.createText();
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		try {
			BufferedImage bi = captchaProducer.createImage(capText);
			ServletOutputStream out;
			out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
			try {
				out.flush();
			} finally {
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
