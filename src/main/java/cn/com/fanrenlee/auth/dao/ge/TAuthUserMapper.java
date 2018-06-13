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

import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.entity.ge.TAuthUserExample;

public interface TAuthUserMapper {
	@SelectProvider(type = TAuthUserSqlProvider.class, method = "countByExample")
	long countByExample(TAuthUserExample example);

	@DeleteProvider(type = TAuthUserSqlProvider.class, method = "deleteByExample")
	int deleteByExample(TAuthUserExample example);

	@Delete({ "delete from t_auth_user", "where ID = #{id,jdbcType=VARCHAR}" })
	int deleteByPrimaryKey(String id);

	@Insert({ "insert into t_auth_user (CREATE_USER, CREATE_TIME, ", "UPDATE_USER, UPDATE_TIME, ",
			"LOGIN_NAME, `NAME`, ", "PASS_WORD, USER_TYPE, ", "USER_LEVEL, ORG_CODE, ", "ZONE_CODE, IS_USED, EMAIL, ",
			"SEX, PHONE)", "values (#{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
			"#{updateUser,jdbcType=VARCHAR}, #{updateTime,jdbcType=TIMESTAMP}, ",
			"#{loginName,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, ",
			"#{passWord,jdbcType=VARCHAR}, #{userType,jdbcType=CHAR}, ",
			"#{userLevel,jdbcType=CHAR}, #{orgCode,jdbcType=VARCHAR}, ",
			"#{zoneCode,jdbcType=VARCHAR}, #{isUsed,jdbcType=CHAR}, #{email,jdbcType=VARCHAR}, ",
			"#{sex,jdbcType=CHAR}, #{phone,jdbcType=VARCHAR})" })
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insert(TAuthUser record);

	@InsertProvider(type = TAuthUserSqlProvider.class, method = "insertSelective")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insertSelective(TAuthUser record);

	@SelectProvider(type = TAuthUserSqlProvider.class, method = "selectByExample")
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "UPDATE_USER", property = "updateUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "UPDATE_TIME", property = "updateTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "LOGIN_NAME", property = "loginName", jdbcType = JdbcType.VARCHAR),
			@Result(column = "NAME", property = "name", jdbcType = JdbcType.VARCHAR),
			@Result(column = "PASS_WORD", property = "passWord", jdbcType = JdbcType.VARCHAR),
			@Result(column = "USER_TYPE", property = "userType", jdbcType = JdbcType.CHAR),
			@Result(column = "USER_LEVEL", property = "userLevel", jdbcType = JdbcType.CHAR),
			@Result(column = "ORG_CODE", property = "orgCode", jdbcType = JdbcType.VARCHAR),
			@Result(column = "ZONE_CODE", property = "zoneCode", jdbcType = JdbcType.VARCHAR),
			@Result(column = "IS_USED", property = "isUsed", jdbcType = JdbcType.CHAR),
			@Result(column = "EMAIL", property = "email", jdbcType = JdbcType.VARCHAR),
			@Result(column = "SEX", property = "sex", jdbcType = JdbcType.CHAR),
			@Result(column = "PHONE", property = "phone", jdbcType = JdbcType.VARCHAR) })
	List<TAuthUser> selectByExample(TAuthUserExample example);

	@Select({ "select", "ID, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, LOGIN_NAME, `NAME`, ",
			"PASS_WORD, USER_TYPE, USER_LEVEL, ORG_CODE, ZONE_CODE, IS_USED, EMAIL, SEX, ", "PHONE", "from t_auth_user",
			"where ID = #{id,jdbcType=VARCHAR}" })
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "UPDATE_USER", property = "updateUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "UPDATE_TIME", property = "updateTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "LOGIN_NAME", property = "loginName", jdbcType = JdbcType.VARCHAR),
			@Result(column = "NAME", property = "name", jdbcType = JdbcType.VARCHAR),
			@Result(column = "PASS_WORD", property = "passWord", jdbcType = JdbcType.VARCHAR),
			@Result(column = "USER_TYPE", property = "userType", jdbcType = JdbcType.CHAR),
			@Result(column = "USER_LEVEL", property = "userLevel", jdbcType = JdbcType.CHAR),
			@Result(column = "ORG_CODE", property = "orgCode", jdbcType = JdbcType.VARCHAR),
			@Result(column = "ZONE_CODE", property = "zoneCode", jdbcType = JdbcType.VARCHAR),
			@Result(column = "IS_USED", property = "isUsed", jdbcType = JdbcType.CHAR),
			@Result(column = "EMAIL", property = "email", jdbcType = JdbcType.VARCHAR),
			@Result(column = "SEX", property = "sex", jdbcType = JdbcType.CHAR),
			@Result(column = "PHONE", property = "phone", jdbcType = JdbcType.VARCHAR) })
	TAuthUser selectByPrimaryKey(String id);

	@UpdateProvider(type = TAuthUserSqlProvider.class, method = "updateByExampleSelective")
	int updateByExampleSelective(@Param("record") TAuthUser record, @Param("example") TAuthUserExample example);

	@UpdateProvider(type = TAuthUserSqlProvider.class, method = "updateByExample")
	int updateByExample(@Param("record") TAuthUser record, @Param("example") TAuthUserExample example);

	@UpdateProvider(type = TAuthUserSqlProvider.class, method = "updateByPrimaryKeySelective")
	int updateByPrimaryKeySelective(TAuthUser record);

	@Update({ "update t_auth_user", "set CREATE_USER = #{createUser,jdbcType=VARCHAR},",
			"CREATE_TIME = #{createTime,jdbcType=TIMESTAMP},", "UPDATE_USER = #{updateUser,jdbcType=VARCHAR},",
			"UPDATE_TIME = #{updateTime,jdbcType=TIMESTAMP},", "LOGIN_NAME = #{loginName,jdbcType=VARCHAR},",
			"`NAME` = #{name,jdbcType=VARCHAR},", "PASS_WORD = #{passWord,jdbcType=VARCHAR},",
			"USER_TYPE = #{userType,jdbcType=CHAR},", "USER_LEVEL = #{userLevel,jdbcType=CHAR},",
			"ORG_CODE = #{orgCode,jdbcType=VARCHAR},", "ZONE_CODE = #{zoneCode,jdbcType=VARCHAR},",
			"IS_USED = #{isUsed,jdbcType=CHAR},", "EMAIL = #{email,jdbcType=VARCHAR},", "SEX = #{sex,jdbcType=CHAR},",
			"PHONE = #{phone,jdbcType=VARCHAR}", "where ID = #{id,jdbcType=VARCHAR}" })
	int updateByPrimaryKey(TAuthUser record);
}