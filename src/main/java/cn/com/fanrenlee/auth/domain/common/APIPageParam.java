package cn.com.fanrenlee.auth.domain.common;

/**
 * API分页参数-移动应用列表使用-不包含总条目数
 */
public class APIPageParam {

	/**
	 * 最大每页数据条数
	 */
	public static Integer MAX_LIMIT = 100;

	/**
	 * 起始数据条数-默认0
	 */
	Integer offset;

	Integer limit;

	public APIPageParam() {
		this.offset = 0;
		this.limit = 10;
	}

	public APIPageParam(Integer offset, Integer limit) {
		super();
		this.offset = offset;
		if (limit != null && limit > MAX_LIMIT) {
			limit = MAX_LIMIT;
		}
		this.limit = limit;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		if (limit != null && limit > MAX_LIMIT) {
			limit = MAX_LIMIT;
		}
		this.limit = limit;
	}

}
