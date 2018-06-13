package cn.com.fanrenlee.auth.domain.common;

import org.apache.ibatis.session.RowBounds;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

/**
 * mybatis分页插件扩展处理.
 */
public class TbfPageBounds extends PageBounds {

	private static final long serialVersionUID = 1L;

	public TbfPageBounds(RowBounds rowBounds) {
		if (rowBounds instanceof TbfPageBounds) {
			TbfPageBounds pageBounds = (TbfPageBounds) rowBounds;
			this.page = pageBounds.page;
			this.limit = pageBounds.limit;
			this.orders = pageBounds.orders;
			this.containsTotalCount = pageBounds.containsTotalCount;
			this.asyncTotalCount = pageBounds.asyncTotalCount;
		} else {
			if (rowBounds.getLimit() == 0) {
				this.page = 0;
			} else {
				this.page = (rowBounds.getOffset() / rowBounds.getLimit()) + 1;
			}
			this.limit = rowBounds.getLimit();
		}

	}

}
