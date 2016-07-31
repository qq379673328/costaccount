/**
 * 
 *
 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date 2014-10-23
 */
package cn.com.fanrenlee.model.common;

import java.util.List;
import java.util.Map;

/**
 *
 * @author	<a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date	2014-10-23
 */
public class PagingResult {
	
	/**
	 * 总数目
	 */
	int total;
	/**
	 * 列表内容
	 */
	List<Map<String, Object>> rows;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Map<String, Object>> getRows() {
		return rows;
	}
	public void setRows(List<Map<String, Object>> rows) {
		this.rows = rows;
	}

}
