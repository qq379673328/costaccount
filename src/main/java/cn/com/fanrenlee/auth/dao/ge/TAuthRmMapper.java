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

import cn.com.fanrenlee.auth.entity.ge.TAuthRm;
import cn.com.fanrenlee.auth.entity.ge.TAuthRmExample;

public interface TAuthRmMapper {
	@SelectProvider(type = TAuthRmSqlProvider.class, method = "countByExample")
	long countByExample(TAuthRmExample example);

	@DeleteProvider(type = TAuthRmSqlProvider.class, method = "deleteByExample")
	int deleteByExample(TAuthRmExample example);

	@Delete({ "delete from t_auth_rm", "where ID = #{id,jdbcType=VARCHAR}" })
	int deleteByPrimaryKey(String id);

	@Insert({ "insert into t_auth_rm (CREATE_USER, CREATE_TIME, ", "ROLE_ID, MF_ID)",
			"values (#{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
			"#{roleId,jdbcType=VARCHAR}, #{mfId,jdbcType=VARCHAR})" })
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insert(TAuthRm record);

	@InsertProvider(type = TAuthRmSqlProvider.class, method = "insertSelective")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = String.class)
	int insertSelective(TAuthRm record);

	@SelectProvider(type = TAuthRmSqlProvider.class, method = "selectByExample")
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "ROLE_ID", property = "roleId", jdbcType = JdbcType.VARCHAR),
			@Result(column = "MF_ID", property = "mfId", jdbcType = JdbcType.VARCHAR) })
	List<TAuthRm> selectByExample(TAuthRmExample example);

	@Select({ "select", "ID, CREATE_USER, CREATE_TIME, ROLE_ID, MF_ID", "from t_auth_rm",
			"where ID = #{id,jdbcType=VARCHAR}" })
	@Results({ @Result(column = "ID", property = "id", jdbcType = JdbcType.VARCHAR, id = true),
			@Result(column = "CREATE_USER", property = "createUser", jdbcType = JdbcType.VARCHAR),
			@Result(column = "CREATE_TIME", property = "createTime", jdbcType = JdbcType.TIMESTAMP),
			@Result(column = "ROLE_ID", property = "roleId", jdbcType = JdbcType.VARCHAR),
			@Result(column = "MF_ID", property = "mfId", jdbcType = JdbcType.VARCHAR) })
	TAuthRm selectByPrimaryKey(String id);

	@UpdateProvider(type = TAuthRmSqlProvider.class, method = "updateByExampleSelective")
	int updateByExampleSelective(@Param("record") TAuthRm record, @Param("example") TAuthRmExample example);

	@UpdateProvider(type = TAuthRmSqlProvider.class, method = "updateByExample")
	int updateByExample(@Param("record") TAuthRm record, @Param("example") TAuthRmExample example);

	@UpdateProvider(type = TAuthRmSqlProvider.class, method = "updateByPrimaryKeySelective")
	int updateByPrimaryKeySelective(TAuthRm record);

	@Update({ "update t_auth_rm", "set CREATE_USER = #{createUser,jdbcType=VARCHAR},",
			"CREATE_TIME = #{createTime,jdbcType=TIMESTAMP},", "ROLE_ID = #{roleId,jdbcType=VARCHAR},",
			"MF_ID = #{mfId,jdbcType=VARCHAR}", "where ID = #{id,jdbcType=VARCHAR}" })
	int updateByPrimaryKey(TAuthRm record);
}