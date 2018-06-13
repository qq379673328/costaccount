package cn.com.fanrenlee.auth.domain.common;

/**
 * 请求结果状态码：<br>
 * 200-成功<br>
 * 500-失败<br>
 * 403-无权访问<br>
 * 401-未登录<br>
 */
public enum ResultCode {

	/**
	 * 请求结果状态码
	 */

	/**
	 * 请求成功
	 */
	SUCCESS("200", "成功"),

	/**
	 * 请求失败
	 */
	FAILURE("500", "失败"),

	/**
	 * 未授权
	 */
	UNAUTHORIZED("403", "无权访问"),

	/**
	 * 未认证
	 */
	UNAUTHENTICATION("401", "未登录");

	/**
	 * 编码
	 */
	private String code;

	/**
	 * 描述
	 */
	private String desc;

	private ResultCode(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	/**
	 * 获取编码.
	 *
	 * @return 编码值
	 */
	public String getCode() {
		return this.code;
	}

	/**
	 * 获取描述.
	 *
	 * @return 描述内容
	 */
	public String getDesc() {
		return this.desc;
	}

}
