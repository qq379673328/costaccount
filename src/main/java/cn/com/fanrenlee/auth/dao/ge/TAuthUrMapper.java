package cn.com.fanrenlee.auth.dao.ge;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import cn.com.fanrenlee.auth.entity.ge.TAuthUr;
import cn.com.fanrenlee.auth.entity.ge.TAuthUrExample;

public interface TAuthUrMapper {
	@SelectProvider(type = TAuthUrSqlProvider.class, method = "countByExample")
	long countByExample(TAuthUrExample example);

	@DeleteProvider(type = TAuthUrSqlProvider.class, method = "deleteByExample")
	int deleteByExample(TAuthUrExample example);

	@Delete({ "delete from t_auth_ur", "where ID = #{id,jdbcType=VARCHAR}" })
	int deleteByPrimaryKey(String id);

	@Insert({ "insert into t_auth_ur (CREATE_USER, CREATE_TIME, ", "USER_ID, ROLE_ID)",
			"values (#{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
			"#{userId,jdbcType=VARCHAR}, #{roleId,jdbcType=VARCHAR})" })
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insert(TAuthUr record);

	@InsertProvider(type = TAuthUrSqlProvider.class, method = "insertSelective")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insertSelective(TAuthUr record);

	@SelectProvider(type = TAuthUrSqlProvider.class, method = "selectByExample")
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "USER_ID", property = "userId", jdbcType = JdbcType.VARCHAR),
			@Result(column = "ROLE_ID", property = "roleId", jdbcType = JdbcType.VARCHAR) })
	List<TAuthUr> selectByExample(TAuthUrExample example);

	@Select({ "select", "ID, CREATE_USER, CREATE_TIME, USER_ID, ROLE_ID", "from t_auth_ur",
			"where ID = #{id,jdbcType=VARCHAR}" })
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "USER_ID", property = "userId", jdbcType = JdbcType.VARCHAR),
			@Result(column = "ROLE_ID", property = "roleId", jdbcType = JdbcType.VARCHAR) })
	TAuthUr selectByPrimaryKey(String id);

	@UpdateProvider(type = TAuthUrSqlProvider.class, method = "updateByExampleSelective")
	int updateByExampleSelective(@Param("record") TAuthUr record, @Param("example") TAuthUrExample example);

	@UpdateProvider(type = TAuthUrSqlProvider.class, method = "updateByExample")
	int updateByExample(@Param("record") TAuthUr record, @Param("example") TAuthUrExample example);

	@UpdateProvider(type = TAuthUrSqlProvider.class, method = "updateByPrimaryKeySelective")
	int updateByPrimaryKeySelective(TAuthUr record);

	@Update({ "update t_auth_ur", "set CREATE_USER = #{createUser,jdbcType=VARCHAR},",
			"CREATE_TIME = #{createTime,jdbcType=TIMESTAMP},", "USER_ID = #{userId,jdbcType=VARCHAR},",
			"ROLE_ID = #{roleId,jdbcType=VARCHAR}", "where ID = #{id,jdbcType=VARCHAR}" })
	int updateByPrimaryKey(TAuthUr record);
}