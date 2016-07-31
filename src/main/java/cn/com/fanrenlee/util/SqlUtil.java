/**
 * 
 *
 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date 2014-11-3
 */
package cn.com.fanrenlee.util;

/**
 * 处理sql工具类，可扩展
 *
 * @author	<a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date	2014-11-3
 */
public class SqlUtil {

	/**
	 * 字符串转日期
	 *
	 * 
	 * @param fieldName 字段名
	 * @param fieldType 字段类型 0|1 0:代表字段,1:代表字符串
	 * @param dateType 0|1<br/>
	 * 	0：年-月-日,<br/>
	 * 	1:年-月-日 时：分：秒<br/>
	 * 如：传入 name,0,0。返回 to_date(name, 'yyyy-MM-dd') ") <br/>
	 * 传入name,1,1。返回 to_date('name', 'yyyy-MM-dd HH:mm:ss')
	 * @return
	 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
	 */
	public static String toDate(String fieldName, int fieldType, int dateType){
		String ret = null;
		if(fieldType == 0){
			ret = " str_to_date('" + fieldName + "','" + getSqlDateFormatStr(dateType) + "') ";
		}else if(fieldType == 1){
			ret = " str_to_date('" + fieldName + "','" + getSqlDateFormatStr(dateType) + "') ";
		}
		return ret;
	}
	
	/**
	 * 字符串转日期
	 *
	 * 
	 * @param fieldName 字段名
	 * @param fieldType 字段类型 0|1 0:代表字段,1:代表字符串
	 * @param dateType 0|1<br/>
	 * 	0：年-月-日,<br/>
	 * 	1:年-月-日 时：分：秒<br/>
	 * 如：传入 name,0,0。返回 to_char(name, 'yyyy-MM-dd') ") <br/>
	 * 传入name,1,1。返回 to_char('name', 'yyyy-MM-dd HH:mm:ss')
	 * @return
	 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
	 */
	public static String toChar(String fieldName, int fieldType, int dateType){
		String ret = null;
		if(fieldType == 0){
			ret = " date_format(" + fieldName + ",'" + getSqlDateFormatStr(dateType) + "') ";
		}else if(fieldType == 1){
			ret = " date_format('" + fieldName + "','" + getSqlDateFormatStr(dateType) + "') ";
		}
		return ret;
		
	}
	
	/**
	 * 获取格式化日期方式
	 *
	 * 
	 * @param type
	 * @return
	 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
	 */
	private static String getSqlDateFormatStr(int type){
		String ret = null;
		switch(type){
			case 0://年月日
				ret = "%Y-%m-%d";
				break;
			case 1://年月日-时分秒
				ret = "%Y-%m-%d %H:%i:%S";
				break;
			default:
				ret = "%Y-%m-%d";
		}
		return ret;
	}
	
}
