/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.auth.domain.common;

/**
 * 分页参数
 */
public class PageParam {

	/**
	 * 最大每页数据条数
	 */
	public static Integer MAX_LIMIT = 100;

	/**
	 * 默认是否查询total
	 */
	public static boolean IS_QUERY_TOTAL = true;;

	/**
	 * 所需条数
	 */
	int rows;

	/**
	 * 当前页数
	 */
	private int page;

	/**
	 * 列表总数据量
	 */
	private Integer total;

	/**
	 * 是否查询total-默认：是
	 */
	private Boolean isQueryTotal;

	public PageParam() {
		this.page = 1;
		this.rows = 10;
	}

	public PageParam(int page, int rows) {
		this.page = page;
		if (rows > MAX_LIMIT) {
			rows = MAX_LIMIT;
		}
		this.rows = rows;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		if (rows > MAX_LIMIT) {
			rows = MAX_LIMIT;
		}
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Boolean isQueryTotal() {
		return isQueryTotal == null ? IS_QUERY_TOTAL : isQueryTotal;
	}

	public void setQueryTotal(Boolean isQueryTotal) {
		this.isQueryTotal = isQueryTotal == null ? true : isQueryTotal;
	}

}
