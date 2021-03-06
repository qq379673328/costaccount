package cn.com.fanrenlee.auth.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.com.fanrenlee.auth.entity.ge.TAuthRole;
import cn.com.fanrenlee.auth.entity.ge.TAuthUser;

/**
 * 认证mapper
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2017年9月15日
 */
public interface AuthMapper {

	/**
	 * 根据角色id获取权限信息
	 *
	 * @param roleId
	 * @return
	 */
	@Select({ "select mf.*, case when rm.id is null then 0 else 1 end as isown ",
			"from t_auth_menufun mf left join (select * from t_auth_rm where role_id = #{roleId} ) rm ",
			"on rm.mf_id = mf.mf_id order by mf.pmf_id,mf.mf_rank " })
	public List<Map<String, Object>> getPermsByRoleId(String roleId);

	/**
	 * 根据用户id获取角色
	 *
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Select({ "SELECT r.*, CASE WHEN ur.id IS NULL THEN 'false' ELSE 'true' END AS isown ",
			"FROM t_auth_role r LEFT JOIN (SELECT * FROM t_auth_ur WHERE USER_ID = #{userId} ) ur ",
			"ON r.id = ur.role_id" })
	public List<Map<String, Object>> getRolesByUserId(String userId);

	/**
	 * 根据用户名获取权限信息
	 *
	 * @param userName
	 * @param appId
	 * @param isOnlyMenu
	 * @return
	 */
	@Select({ "SELECT DISTINCT m.* from ( ",
			" select r.* from ( (select ur.role_id from ( select u.id from t_auth_user u  ",
			" where u.login_name = ? ) mu left join t_auth_ur ur on ur.user_id = mu.id) union ",
			" (select tor.role_id from (  select org.id org_id from t_auth_user u  ",
			" left join t_auth_org org on u.org_code = org.org_code where u.login_name = #{userName} ",
			" ) mo left join t_auth_or tor on tor.org_id = mo.org_id) ",
			" ) rs left join t_auth_role r on rs.role_id = r.id where rs.role_id is not null ) rr ",
			" ,t_auth_rm rm, t_auth_menufun m WHERE 1=1 ", " <if test='isOnlyMenu != null'> AND IS_USED = '0' </if> ",
			" AND rr.ID = rm.ROLE_ID AND rm.MF_ID = m.MF_ID ORDER BY m.PMF_ID, m.MF_RANK " })
	public List<Map<String, Object>> getUserMF(String userName, boolean isOnlyMenu);

	@Insert({ "insert into t_auth_role (ID, CREATE_USER, CREATE_TIME, ", "UPDATE_USER, UPDATE_TIME, ",
			"ROLE_NAME, ROLE_DESC, ", "APP_ID)",
			"values (#{id,jdbcType=VARCHAR}, #{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
			"#{updateUser,jdbcType=VARCHAR}, #{updateTime,jdbcType=TIMESTAMP}, ",
			"#{roleName,jdbcType=VARCHAR}, #{roleDesc,jdbcType=VARCHAR}, ", "#{appId,jdbcType=VARCHAR})" })
	int insertRole(TAuthRole record);

	@Insert({ "insert into t_auth_user (ID, CREATE_USER, CREATE_TIME, ", "UPDATE_USER, UPDATE_TIME, ",
			"LOGIN_NAME, `NAME`, ", "PASS_WORD, USER_TYPE, ", "USER_LEVEL, ORG_CODE, ", "ZONE_CODE, IS_USED, EMAIL, ",
			"SEX, PHONE, ORG_ID)",
			"values (#{id,jdbcType=VARCHAR}, #{createUser,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
			"#{updateUser,jdbcType=VARCHAR}, #{updateTime,jdbcType=TIMESTAMP}, ",
			"#{loginName,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, ",
			"#{passWord,jdbcType=VARCHAR}, #{userType,jdbcType=CHAR}, ",
			"#{userLevel,jdbcType=CHAR}, #{orgCode,jdbcType=VARCHAR}, ",
			"#{zoneCode,jdbcType=VARCHAR}, #{isUsed,jdbcType=CHAR}, #{email,jdbcType=VARCHAR}, ",
			"#{sex,jdbcType=CHAR}, #{phone,jdbcType=VARCHAR}, #{orgId,jdbcType=INTEGER})" })
	int insertUser(TAuthUser record);

}
