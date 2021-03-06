package cn.com.fanrenlee.auth.dic;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.util.ResourceUtils;
import org.thymeleaf.util.StringUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 通过注解对属性进行字典转换
 */
public class DicTransUtil {

	private static final String DIC_PATH = "Dics.json";

	/**
	 * 本地字典
	 */
	public static Map<String, DicType> DICS = new HashMap<String, DicType>();

	static {
		ObjectMapper mapper = new ObjectMapper();
		try {
			InputStream in = new DefaultResourceLoader().getResource(ResourceUtils.CLASSPATH_URL_PREFIX + DIC_PATH).getInputStream();
			List<DicType> dicTypes = mapper.readValue(in, new TypeReference<List<DicType>>() {
			});
			for (DicType dicType : dicTypes) {
				DICS.put(dicType.getDicType(), dicType);
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 根据编码获取值
	 *
	 * @param code
	 * @param codeType
	 * @return
	 */
	public static Object getDescByCode(String code, String codeType) {
		if (code == null || codeType == null)
			return null;
		DicType dicType = DICS.get(codeType);
		if (dicType == null)
			return null;
		// 未命中默认值
		String nullValue = dicType.getNullValue();
		nullValue = nullValue == null ? "" : nullValue;
		// 多个字典分隔符
		String sp = dicType.getDupSp();
		sp = sp == null ? "," : sp;
		// 多个字典连接符
		String join = dicType.getDupJoin();
		sp = sp == null ? "," : sp;

		String[] codeSps = code.split(sp);
		List<DicItem> dicItems = dicType.getDicItems();
		String ret = "";
		for (int i = 0; i < codeSps.length; i++) {
			String codeSp = codeSps[i].trim();
			for (DicItem item : dicItems) {
				if (codeSp.equals(item.getCode())) {
					ret += item.getDesc();
					if (i != codeSps.length - 1) {
						ret += join;
					}
				}
			}
		}

		dicType = null;
		return "".equals(ret) ? nullValue : ret;
	}

	/**
	 * 通过注解转换对象的字典属性。<br>
	 * 字典文件为：Dics.json<br>
	 *
	 * @param obj
	 * @param clz
	 * @see DicTrans
	 */
	public static <T> void transDicPropertiesByAnno(T obj, Class<?> clz) {
		if (obj == null)
			return;
		Field[] fields = clz.getDeclaredFields();
		for (Field field : fields) {
			// 字典转换注解
			if (field.isAnnotationPresent(DicTrans.class)) {
				field.setAccessible(true);
				DicTrans dicTrans = field.getAnnotation(DicTrans.class);
				String dicType = dicTrans.value();
				if (dicType == null) {
					continue;
				}
				String srcField = dicTrans.srcField();
				String fieldName = field.getName();
				String sFieldName = null;
				if (fieldName.endsWith("Desc")) {
					sFieldName = fieldName.substring(0, fieldName.length() - 4);
				}
				if (!StringUtils.isEmpty(srcField)) {
					sFieldName = srcField;
				}
				try {
					Field sField = clz.getDeclaredField(sFieldName);
					sField.setAccessible(true);
					Object codeValue = sField.get(obj);
					if (codeValue == null) {
						continue;
					}
					if (codeValue instanceof String) {
						Object codeDesc = getDescByCode((String) codeValue, dicType);
						field.set(obj, codeDesc);
					}
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (NoSuchFieldException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				}
			}
		}

		Class<?> parClz = clz.getSuperclass();
		if (parClz != Object.class) {
			transDicPropertiesByAnno(obj, parClz);
		}
	}

}
