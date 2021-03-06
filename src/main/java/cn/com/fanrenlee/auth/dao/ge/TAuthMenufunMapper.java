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

import cn.com.fanrenlee.auth.entity.ge.TAuthMenufun;
import cn.com.fanrenlee.auth.entity.ge.TAuthMenufunExample;

public interface TAuthMenufunMapper {
    @SelectProvider(type=TAuthMenufunSqlProvider.class, method="countByExample")
    long countByExample(TAuthMenufunExample example);

    @DeleteProvider(type=TAuthMenufunSqlProvider.class, method="deleteByExample")
    int deleteByExample(TAuthMenufunExample example);

    @Delete({
        "delete from t_auth_menufun",
        "where ID = #{id,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String id);

    @Insert({
        "insert into t_auth_menufun (CREATE_USER, CREATE_TIME, ",
        "UPDATE_USER, UPDATE_TIME, ",
        "APP_ID, MF_ID, PMF_ID, ",
        "MF_NAME, MF_LINK, ",
        "MF_TYPE, MF_DESC, MF_RANK, ",
        "MF_LEVEL)",
        "values (#{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
        "#{updateUser,jdbcType=VARCHAR}, #{updateTime,jdbcType=TIMESTAMP}, ",
        "#{appId,jdbcType=VARCHAR}, #{mfId,jdbcType=VARCHAR}, #{pmfId,jdbcType=VARCHAR}, ",
        "#{mfName,jdbcType=VARCHAR}, #{mfLink,jdbcType=VARCHAR}, ",
        "#{mfType,jdbcType=CHAR}, #{mfDesc,jdbcType=VARCHAR}, #{mfRank,jdbcType=CHAR}, ",
        "#{mfLevel,jdbcType=CHAR})"
    })
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="id", before=false, resultType=String.class)
    int insert(TAuthMenufun record);

    @InsertProvider(type=TAuthMenufunSqlProvider.class, method="insertSelective")
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="id", before=false, resultType=String.class)
    int insertSelective(TAuthMenufun record);

    @SelectProvider(type=TAuthMenufunSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="ID", property="id", jdbcType=JdbcType.VARCHAR, id=true),
        @Result(column="CREATE_USER", property="createUser", jdbcType=JdbcType.VARCHAR),
        @Result(column="CREATE_TIME", property="createTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="UPDATE_USER", property="updateUser", jdbcType=JdbcType.VARCHAR),
        @Result(column="UPDATE_TIME", property="updateTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="APP_ID", property="appId", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_ID", property="mfId", jdbcType=JdbcType.VARCHAR),
        @Result(column="PMF_ID", property="pmfId", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_NAME", property="mfName", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_LINK", property="mfLink", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_TYPE", property="mfType", jdbcType=JdbcType.CHAR),
        @Result(column="MF_DESC", property="mfDesc", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_RANK", property="mfRank", jdbcType=JdbcType.CHAR),
        @Result(column="MF_LEVEL", property="mfLevel", jdbcType=JdbcType.CHAR)
    })
    List<TAuthMenufun> selectByExample(TAuthMenufunExample example);

    @Select({
        "select",
        "ID, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, APP_ID, MF_ID, PMF_ID, ",
        "MF_NAME, MF_LINK, MF_TYPE, MF_DESC, MF_RANK, MF_LEVEL",
        "from t_auth_menufun",
        "where ID = #{id,jdbcType=VARCHAR}"
    })
    @Results({
        @Result(column="ID", property="id", jdbcType=JdbcType.VARCHAR, id=true),
        @Result(column="CREATE_USER", property="createUser", jdbcType=JdbcType.VARCHAR),
        @Result(column="CREATE_TIME", property="createTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="UPDATE_USER", property="updateUser", jdbcType=JdbcType.VARCHAR),
        @Result(column="UPDATE_TIME", property="updateTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="APP_ID", property="appId", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_ID", property="mfId", jdbcType=JdbcType.VARCHAR),
        @Result(column="PMF_ID", property="pmfId", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_NAME", property="mfName", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_LINK", property="mfLink", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_TYPE", property="mfType", jdbcType=JdbcType.CHAR),
        @Result(column="MF_DESC", property="mfDesc", jdbcType=JdbcType.VARCHAR),
        @Result(column="MF_RANK", property="mfRank", jdbcType=JdbcType.CHAR),
        @Result(column="MF_LEVEL", property="mfLevel", jdbcType=JdbcType.CHAR)
    })
    TAuthMenufun selectByPrimaryKey(String id);

    @UpdateProvider(type=TAuthMenufunSqlProvider.class, method="updateByExampleSelective")
    int updateByExampleSelective(@Param("record") TAuthMenufun record, @Param("example") TAuthMenufunExample example);

    @UpdateProvider(type=TAuthMenufunSqlProvider.class, method="updateByExample")
    int updateByExample(@Param("record") TAuthMenufun record, @Param("example") TAuthMenufunExample example);

    @UpdateProvider(type=TAuthMenufunSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(TAuthMenufun record);

    @Update({
        "update t_auth_menufun",
        "set CREATE_USER = #{createUser,jdbcType=VARCHAR},",
          "CREATE_TIME = #{createTime,jdbcType=TIMESTAMP},",
          "UPDATE_USER = #{updateUser,jdbcType=VARCHAR},",
          "UPDATE_TIME = #{updateTime,jdbcType=TIMESTAMP},",
          "APP_ID = #{appId,jdbcType=VARCHAR},",
          "MF_ID = #{mfId,jdbcType=VARCHAR},",
          "PMF_ID = #{pmfId,jdbcType=VARCHAR},",
          "MF_NAME = #{mfName,jdbcType=VARCHAR},",
          "MF_LINK = #{mfLink,jdbcType=VARCHAR},",
          "MF_TYPE = #{mfType,jdbcType=CHAR},",
          "MF_DESC = #{mfDesc,jdbcType=VARCHAR},",
          "MF_RANK = #{mfRank,jdbcType=CHAR},",
          "MF_LEVEL = #{mfLevel,jdbcType=CHAR}",
        "where ID = #{id,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(TAuthMenufun record);
}