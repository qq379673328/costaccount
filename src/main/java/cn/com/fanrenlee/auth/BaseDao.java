package cn.com.fanrenlee.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * 基础dao
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年8月12日
 */
@Component("baseDao")
public class BaseDao extends BaseDaoAbst {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	protected SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	CommonUserService commonUserService;;

	@Override
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	@Override
	public CommonUserService getCommonUserService() {
		return commonUserService;
	}

}
