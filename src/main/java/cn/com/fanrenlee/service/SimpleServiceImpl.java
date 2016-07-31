/**
 * 
 *
 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date 2014-10-23
 */
package cn.com.fanrenlee.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSql;
import cn.com.fanrenlee.model.common.PagingSrcSql;

/**
 *
 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date 2014-10-23
 */
@Service
public class SimpleServiceImpl {

	@Autowired
	JdbcTemplate jdbcTemplate;

	/**
	 * 分页查询-使用此方法请实现getPagingSrcSql方法
	 * 
	 * @param params
	 * @return
	 */
	public PagingResult pagingSearch(Map<String, String> params, PageParam pageParams, PagingSrcSql srcSql) {
		PagingResult result = new PagingResult();
		PagingSql pagingSql = generatePagingSql(srcSql.getSrcSql(), pageParams);
		pagingSql.setTypes(srcSql.getTypes());
		pagingSql.setValues(srcSql.getValues());
		if (pageParams.getTotalPage() == 0) {// 未查询总数
			int totalPage = queryCountBySql(pagingSql.getCountSql(), pagingSql.getValues());
			pageParams.setTotalPage(totalPage);
		}
		result.setTotal(pageParams.getTotalPage());
		result.setRows(jdbcTemplate.queryForList(pagingSql.getListSql(), pagingSql.getValues()));
		return result;
	}

	public int queryCountBySql(String countSql, Object[] values) {
		return jdbcTemplate.queryForObject(countSql, values, Integer.class);
	}

	public PagingResult pagingSearch(PageParam pageParams, PagingSrcSql srcSql) {
		return pagingSearch(null, pageParams, srcSql);
	}

	/**
	 * 生成分页sql
	 *
	 * 
	 * @param sql
	 * @param pageParams
	 * @return
	 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
	 */
	public PagingSql generatePagingSql(String sql, PageParam pageParams) {
		PagingSql ps = new PagingSql();
		String countSql = "SELECT COUNT(1) FROM (" + sql + ") page_a";
		String listSql = renderPagingToSql(sql, pageParams);
		ps.setCountSql(countSql);
		ps.setListSql(listSql);
		return ps;
	}

	/**
	 * 根据方言处理分页sql
	 *
	 * 
	 * @param sql
	 * @param pageParams
	 * @return
	 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
	 */
	private String renderPagingToSql(String sql, PageParam pageParams) {
		if (pageParams.getPage() < 1) {
			pageParams.setPage(1);
		}
		if (pageParams.getRows() < 0) {
			pageParams.setRows(0);
		}
		StringBuffer sb = new StringBuffer();
		sb.append(sql + " LIMIT " + (pageParams.getPage() - 1) * pageParams.getRows() + "," + pageParams.getRows());
		return sb.toString();
	}

}
