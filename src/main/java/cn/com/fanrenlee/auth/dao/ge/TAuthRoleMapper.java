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

import cn.com.fanrenlee.auth.entity.ge.TAuthRole;
import cn.com.fanrenlee.auth.entity.ge.TAuthRoleExample;

public interface TAuthRoleMapper {
	@SelectProvider(type = TAuthRoleSqlProvider.class, method = "countByExample")
	long countByExample(TAuthRoleExample example);

	@DeleteProvider(type = TAuthRoleSqlProvider.class, method = "deleteByExample")
	int deleteByExample(TAuthRoleExample example);

	@Delete({ "delete from t_auth_role", "where ID = #{id,jdbcType=VARCHAR}" })
	int deleteByPrimaryKey(String id);

	@Insert({ "insert into t_auth_role (CREATE_USER, CREATE_TIME, ", "UPDATE_USER, UPDATE_TIME, ",
			"ROLE_NAME, ROLE_DESC, ", "APP_ID)",
			"values (#{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
			"#{updateUser,jdbcType=VARCHAR}, #{updateTime,jdbcType=TIMESTAMP}, ",
			"#{roleName,jdbcType=VARCHAR}, #{roleDesc,jdbcType=VARCHAR}, ", "#{appId,jdbcType=VARCHAR})" })
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insert(TAuthRole record);

	@InsertProvider(type = TAuthRoleSqlProvider.class, method = "insertSelective")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insertSelective(TAuthRole record);

	@SelectProvider(type = TAuthRoleSqlProvider.class, method = "selectByExample")
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "UPDATE_USER", property = "updateUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "UPDATE_TIME", property = "updateTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "ROLE_NAME", property = "roleName", jdbcType = JdbcType.VARCHAR),
			@Result(column = "ROLE_DESC", property = "roleDesc", jdbcType = JdbcType.VARCHAR),
			@Result(column = "APP_ID", property = "appId", jdbcType = JdbcType.VARCHAR) })
	List<TAuthRole> selectByExample(TAuthRoleExample example);

	@Select({ "select", "ID, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, ROLE_NAME, ROLE_DESC, ", "APP_ID",
			"from t_auth_role", "where ID = #{id,jdbcType=VARCHAR}" })
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "UPDATE_USER", property = "updateUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "UPDATE_TIME", property = "updateTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "ROLE_NAME", property = "roleName", jdbcType = JdbcType.VARCHAR),
			@Result(column = "ROLE_DESC", property = "roleDesc", jdbcType = JdbcType.VARCHAR),
			@Result(column = "APP_ID", property = "appId", jdbcType = JdbcType.VARCHAR) })
	TAuthRole selectByPrimaryKey(String id);

	@UpdateProvider(type = TAuthRoleSqlProvider.class, method = "updateByExampleSelective")
	int updateByExampleSelective(@Param("record") TAuthRole record, @Param("example") TAuthRoleExample example);

	@UpdateProvider(type = TAuthRoleSqlProvider.class, method = "updateByExample")
	int updateByExample(@Param("record") TAuthRole record, @Param("example") TAuthRoleExample example);

	@UpdateProvider(type = TAuthRoleSqlProvider.class, method = "updateByPrimaryKeySelective")
	int updateByPrimaryKeySelective(TAuthRole record);

	@Update({ "update t_auth_role", "set CREATE_USER = #{createUser,jdbcType=VARCHAR},",
			"CREATE_TIME = #{createTime,jdbcType=TIMESTAMP},", "UPDATE_USER = #{updateUser,jdbcType=VARCHAR},",
			"UPDATE_TIME = #{updateTime,jdbcType=TIMESTAMP},", "ROLE_NAME = #{roleName,jdbcType=VARCHAR},",
			"ROLE_DESC = #{roleDesc,jdbcType=VARCHAR},", "APP_ID = #{appId,jdbcType=VARCHAR}",
			"where ID = #{id,jdbcType=VARCHAR}" })
	int updateByPrimaryKey(TAuthRole record);
}