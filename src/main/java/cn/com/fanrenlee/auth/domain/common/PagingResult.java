package cn.com.fanrenlee.auth.domain.common;

import java.util.List;

/**
 * 分页查询结果
 */
public class PagingResult<T> {

	/**
	 * 总数目
	 */
	int total;

	/**
	 * 列表内容
	 */
	List<T> rows;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
