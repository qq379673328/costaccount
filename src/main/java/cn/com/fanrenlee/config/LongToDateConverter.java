package cn.com.fanrenlee.config;

import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 字符串日期转换-时间戳
 * 
 * @author lizhiyong
 *
 */
public class LongToDateConverter implements Converter<Long, Date> {

	@Override
	public Date convert(Long source) {
		if (source == null) {
			return null;
		}
		return new Date(source);
	}
}
