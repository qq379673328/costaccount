package cn.com.fanrenlee.auth;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.com.fanrenlee.auth.dic.DicTransUtil;
import cn.com.fanrenlee.auth.domain.common.PageParam;
import cn.com.fanrenlee.auth.domain.common.PagingResult;
import cn.com.fanrenlee.auth.domain.common.TbfPageBounds;
import cn.com.fanrenlee.auth.model.common.LoginUserInfo;

/**
 * 抽象基础dao类-请不要直接注入此类
 */
public abstract class BaseDaoAbst {

	/**
	 * mybatis sql xml文件中用户信息key
	 */
	public static final String PARAMS_KEY_USERINFO = "USERINFO";

	public abstract SqlSessionTemplate getSqlSessionTemplate();

	public abstract CommonUserService getCommonUserService();

	/**
	 * 处理传入的查询参数、放入请求用户信息（仅处理map类型参数）
	 *
	 * @param params
	 *            参数
	 */
	@SuppressWarnings("unchecked")
	private Object handleParams(Object params) {
		if (params == null) {
			params = new HashMap<String, Object>();
		}
		if (params instanceof Map) {
			Map<String, Object> paramsMap = (Map<String, Object>) params;
			// 已存在-跳过
			if (paramsMap.get(PARAMS_KEY_USERINFO) != null) {
				return params;
			}
			CommonUserService commonUserService = getCommonUserService();
			if (commonUserService != null) {
				Map<String, Object> infos = new HashMap<String, Object>();
				Object userObj = commonUserService.getRequestUserObj();
				if (userObj == null)
					return params;

				if (userObj instanceof LoginUserInfo) {
					LoginUserInfo userInfo = (LoginUserInfo) userObj;
					// 用户id
					infos.put("userId", userInfo.getId());
					// 登录名
					infos.put("loginName", userInfo.getUserName());
					// 用户其他信息
					infos.put("user", userInfo.getUser());
				}

				paramsMap.put(PARAMS_KEY_USERINFO, infos);
			}
		}
		return params;
	}

	/**
	 * 查询列表数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 列表数据
	 */
	public <T> List<T> selectList(String statement, Object params) {
		List<T> items = getSqlSessionTemplate().selectList(statement, handleParams(params));
		handleResult(items);
		return items == null ? new ArrayList<T>() : items;
	}

	/**
	 * 查询列表数据
	 *
	 * @param statement
	 *            唯一标识
	 * @return 列表数据
	 */
	public <T> List<T> selectList(String statement) {
		return selectList(statement, null);
	}

	/**
	 * 查询单个数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 单个数据
	 */
	public int selectCount(String statement, Object params) {
		List<Integer> items = selectList(statement, params);
		return items.size() > 0 ? items.get(0) : 0;
	}

	/**
	 * 查询单个数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 单个数据
	 */
	public <T> T selectOne(String statement, Object params) {
		T item = getSqlSessionTemplate().selectOne(statement, handleParams(params));
		handleResult(item);
		return item;
	}

	/**
	 * 查询单个数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 单个数据
	 */
	public <T> T selectOne(String statement) {
		return selectOne(statement, null);
	}

	/**
	 * 处理结果集-字典转码
	 *
	 * @param items
	 *            数据列表
	 */
	private <T> void handleResult(List<T> items) {
		if (items == null) {
			return;
		}
		for (T item : items) {
			handleResult(item);
		}
	}

	/**
	 * 处理结果-字典转码
	 *
	 * @param item
	 *            数据对象
	 */
	private <T> void handleResult(T item) {
		if (item == null) {
			return;
		}
		// 忽略map类型
		if (item instanceof Map || item instanceof HashMap) {
			return;
		}
		DicTransUtil.transDicPropertiesByAnno(item, item.getClass());
	}

	/**
	 * 插入数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 影响条数
	 */
	public int insert(String statement, Object params) {
		return getSqlSessionTemplate().insert(statement, handleParams(params));
	}

	/**
	 * 更新数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 影响条数
	 */
	public int update(String statement, Object params) {
		return getSqlSessionTemplate().update(statement, handleParams(params));
	}

	/**
	 * 删除数据
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @return 影响条数
	 */
	public int delete(String statement, Object params) {
		return getSqlSessionTemplate().delete(statement, handleParams(params));
	}

	/**
	 * 分页查询-使用mybatis实现.
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @param pageParams
	 *            分页参数
	 * @return 分页查询结果
	 */
	@SuppressWarnings("unchecked")
	public <T> PagingResult<T> selectPage(String statement, Object params, PageParam pageParams) {
		TbfPageBounds pageBounds = new TbfPageBounds(
				new RowBounds((pageParams.getPage() - 1) * pageParams.getRows(), pageParams.getRows()));
		PagingResult<T> result = new PagingResult<T>();

		// 查询带total数据
		if (pageParams.isQueryTotal()) {

			// 若为特殊查询，对象包含子对象，则total查询为单独查询sql：原始statement后加-total
			String totalStatement = statement + "-total";
			if (getSqlSessionTemplate().getConfiguration().hasStatement(totalStatement)) {
				pageBounds.setContainsTotalCount(false);
				// total
				result.setTotal(selectCount(totalStatement, params));

				// 数据列表
				List<T> pageCountItem = selectPage(statement, params, pageBounds);
				result.setRows(pageCountItem);
			} else {// 普通分页查询
				pageBounds.setContainsTotalCount(true);
				// 数据列表+total
				PageList<T> pageCountItem = (PageList<T>) selectPage(statement, params, pageBounds);
				result.setTotal(pageCountItem.getPaginator().getTotalCount());
				result.setRows(pageCountItem);
			}

		} else {// 不查询total
			result.setTotal(pageParams.getTotal());
			pageBounds.setContainsTotalCount(false);
			// 数据列表
			List<T> items = selectPage(statement, params, pageBounds);
			result.setRows(items);
		}

		return result;
	}

	/**
	 * 使用mybatis分页查询列表数据-分页.
	 *
	 * @param statement
	 *            唯一标识
	 * @param params
	 *            参数
	 * @param pageBounds
	 *            分页参数
	 * @return 列表数据
	 */
	public <T> List<T> selectPage(String statement, Object params, PageBounds pageBounds) {
		List<T> items = getSqlSessionTemplate().selectList(statement, handleParams(params), pageBounds);
		handleResult(items);
		return items;
	};

	/**
	 * 获取 mybatis mapper
	 *
	 * @param type
	 * @return
	 */
	public <T> T getMapper(Class<T> type) {
		return getSqlSessionTemplate().getMapper(type);
	}

}
