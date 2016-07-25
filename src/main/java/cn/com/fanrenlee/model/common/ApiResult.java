/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.model.common;

import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;

/**
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
public class ApiResult<T> {
	
	/**
	 * 请求结果状态码
	 * @see ResultCode
	 */
	private String success;
	
	/**
	 * 请求结果消息-提示信息获取错误信息
	 */
	private String msg;
	
	/**
	 * 返回数据内容
	 */
	private T data;
	
	/**
	 * 默认为 <br/>
	 * 	success: ResultCode.SUCCESS.getCode() <br/>
	 * 	msg: ResultCode.SUCCESS.getDesc() <br/>
	 * 	data: null <br/>
	 */
	public ApiResult(){
		this.success = ResultCode.SUCCESS.getCode();
		this.msg = ResultCode.SUCCESS.getDesc();
		this.data = null;
	}
	
	/**
	 * 默认为 <br/>
	 * 	success: ResultCode.SUCCESS.getCode() <br/>
	 * 	msg: ResultCode.SUCCESS.getDesc() <br/>
	 */
	public ApiResult(T obj){
		this.success = ResultCode.SUCCESS.getCode();
		this.msg = ResultCode.SUCCESS.getDesc();
		this.data = obj;
	}

	/**
	 * 构造函数.
	 * 
	 * @param success 结果状态
	 * @param msg 消息
	 * @param data 数据
	 */
	public ApiResult(String success, String msg, T data){
		this.success =success;
		this.msg = msg;
		this.data = data;
	}
	
	/**
	 * 构造函数.
	 * 
	 * @param success 结果状态
	 * @param msg 消息
	 */
	public ApiResult(String success, String msg){
		this.success =success;
		this.msg = msg;
		this.data = null;
	}
	
	/**
	 * 构造函数.
	 * 
	 * @param success 结果状态
	 * @param errors spring验证错误
	 */
	public ApiResult(String success, Errors errors){
		this.success =success;
		this.msg = genMessageByErrors(errors);
	}
	
	/**
	 * 根据错误消息生存信息
	 *
	 * @param errors 错误消息
	 * @return 信息字符串
	 */
	private String genMessageByErrors(Errors errors){
		if(errors == null || !errors.hasErrors()){
			return "";
		}
		StringBuffer message = new StringBuffer();
		for(ObjectError error : errors.getAllErrors()){
			message.append(error.getDefaultMessage());
			message.append("\r");
		}
		return message.toString();
	}

	
	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public void setMsg(Errors errors) {
		this.msg = genMessageByErrors(errors);;
	}

	public Object getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
