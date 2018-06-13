package cn.com.fanrenlee.auth.domain.common;

/**
 * 分页查询原始sql
 */
public class PagingSrcSql {

	/**
	 * 原始sql
	 */
	String srcSql;
	/**
	 * 绑定参数
	 */
	Object[] values;

	public Object[] getValues() {
		return values;
	}

	public void setValues(Object[] values) {
		this.values = values;
	}

	public String getSrcSql() {
		return srcSql;
	}

	public void setSrcSql(String srcSql) {
		this.srcSql = srcSql;
	}

}
