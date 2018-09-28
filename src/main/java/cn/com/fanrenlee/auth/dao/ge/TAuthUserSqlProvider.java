package cn.com.fanrenlee.auth.dao.ge;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import cn.com.fanrenlee.auth.entity.ge.TAuthUser;
import cn.com.fanrenlee.auth.entity.ge.TAuthUserExample;
import cn.com.fanrenlee.auth.entity.ge.TAuthUserExample.Criteria;
import cn.com.fanrenlee.auth.entity.ge.TAuthUserExample.Criterion;

public class TAuthUserSqlProvider {

	public String countByExample(TAuthUserExample example) {
		SQL sql = new SQL();
		sql.SELECT("count(*)").FROM("t_auth_user");
		applyWhere(sql, example, false);
		return sql.toString();
	}

	public String deleteByExample(TAuthUserExample example) {
		SQL sql = new SQL();
		sql.DELETE_FROM("t_auth_user");
		applyWhere(sql, example, false);
		return sql.toString();
	}

	public String insertSelective(TAuthUser record) {
		SQL sql = new SQL();
		sql.INSERT_INTO("t_auth_user");

		if (record.getCreateUser() != null) {
			sql.VALUES("CREATE_USER", "#{createUser,jdbcType=VARCHAR}");
		}

		if (record.getCreateTime() != null) {
			sql.VALUES("CREATE_TIME", "#{createTime,jdbcType=TIMESTAMP}");
		}

		if (record.getUpdateUser() != null) {
			sql.VALUES("UPDATE_USER", "#{updateUser,jdbcType=VARCHAR}");
		}

		if (record.getUpdateTime() != null) {
			sql.VALUES("UPDATE_TIME", "#{updateTime,jdbcType=TIMESTAMP}");
		}

		if (record.getLoginName() != null) {
			sql.VALUES("LOGIN_NAME", "#{loginName,jdbcType=VARCHAR}");
		}

		if (record.getName() != null) {
			sql.VALUES("`NAME`", "#{name,jdbcType=VARCHAR}");
		}

		if (record.getPassWord() != null) {
			sql.VALUES("PASS_WORD", "#{passWord,jdbcType=VARCHAR}");
		}

		if (record.getUserType() != null) {
			sql.VALUES("USER_TYPE", "#{userType,jdbcType=CHAR}");
		}

		if (record.getUserLevel() != null) {
			sql.VALUES("USER_LEVEL", "#{userLevel,jdbcType=CHAR}");
		}

		if (record.getOrgCode() != null) {
			sql.VALUES("ORG_CODE", "#{orgCode,jdbcType=VARCHAR}");
		}

		if (record.getZoneCode() != null) {
			sql.VALUES("ZONE_CODE", "#{zoneCode,jdbcType=VARCHAR}");
		}

		if (record.getIsUsed() != null) {
			sql.VALUES("IS_USED", "#{isUsed,jdbcType=CHAR}");
		}

		if (record.getEmail() != null) {
			sql.VALUES("EMAIL", "#{email,jdbcType=VARCHAR}");
		}

		if (record.getSex() != null) {
			sql.VALUES("SEX", "#{sex,jdbcType=CHAR}");
		}

		if (record.getPhone() != null) {
			sql.VALUES("PHONE", "#{phone,jdbcType=VARCHAR}");
		}

		return sql.toString();
	}

	public String selectByExample(TAuthUserExample example) {
		SQL sql = new SQL();
		if (example != null && example.isDistinct()) {
			sql.SELECT_DISTINCT("ID");
		} else {
			sql.SELECT("ID");
		}
		sql.SELECT("CREATE_USER");
		sql.SELECT("CREATE_TIME");
		sql.SELECT("UPDATE_USER");
		sql.SELECT("UPDATE_TIME");
		sql.SELECT("LOGIN_NAME");
		sql.SELECT("`NAME`");
		sql.SELECT("PASS_WORD");
		sql.SELECT("USER_TYPE");
		sql.SELECT("USER_LEVEL");
		sql.SELECT("ORG_CODE");
		sql.SELECT("ZONE_CODE");
		sql.SELECT("IS_USED");
		sql.SELECT("EMAIL");
		sql.SELECT("SEX");
		sql.SELECT("PHONE");
		sql.SELECT("ORG_id");
		sql.FROM("t_auth_user");
		applyWhere(sql, example, false);

		if (example != null && example.getOrderByClause() != null) {
			sql.ORDER_BY(example.getOrderByClause());
		}

		return sql.toString();
	}

	public String updateByExampleSelective(Map<String, Object> parameter) {
		TAuthUser record = (TAuthUser) parameter.get("record");
		TAuthUserExample example = (TAuthUserExample) parameter.get("example");

		SQL sql = new SQL();
		sql.UPDATE("t_auth_user");

		if (record.getId() != null) {
			sql.SET("ID = #{record.id,jdbcType=VARCHAR}");
		}

		if (record.getCreateUser() != null) {
			sql.SET("CREATE_USER = #{record.createUser,jdbcType=VARCHAR}");
		}

		if (record.getCreateTime() != null) {
			sql.SET("CREATE_TIME = #{record.createTime,jdbcType=TIMESTAMP}");
		}

		if (record.getUpdateUser() != null) {
			sql.SET("UPDATE_USER = #{record.updateUser,jdbcType=VARCHAR}");
		}

		if (record.getUpdateTime() != null) {
			sql.SET("UPDATE_TIME = #{record.updateTime,jdbcType=TIMESTAMP}");
		}

		if (record.getLoginName() != null) {
			sql.SET("LOGIN_NAME = #{record.loginName,jdbcType=VARCHAR}");
		}

		if (record.getName() != null) {
			sql.SET("`NAME` = #{record.name,jdbcType=VARCHAR}");
		}

		if (record.getPassWord() != null) {
			sql.SET("PASS_WORD = #{record.passWord,jdbcType=VARCHAR}");
		}

		if (record.getUserType() != null) {
			sql.SET("USER_TYPE = #{record.userType,jdbcType=CHAR}");
		}

		if (record.getUserLevel() != null) {
			sql.SET("USER_LEVEL = #{record.userLevel,jdbcType=CHAR}");
		}

		if (record.getOrgCode() != null) {
			sql.SET("ORG_CODE = #{record.orgCode,jdbcType=VARCHAR}");
		}

		if (record.getZoneCode() != null) {
			sql.SET("ZONE_CODE = #{record.zoneCode,jdbcType=VARCHAR}");
		}

		if (record.getIsUsed() != null) {
			sql.SET("IS_USED = #{record.isUsed,jdbcType=CHAR}");
		}

		if (record.getEmail() != null) {
			sql.SET("EMAIL = #{record.email,jdbcType=VARCHAR}");
		}

		if (record.getSex() != null) {
			sql.SET("SEX = #{record.sex,jdbcType=CHAR}");
		}

		if (record.getPhone() != null) {
			sql.SET("PHONE = #{record.phone,jdbcType=VARCHAR}");
		}

		applyWhere(sql, example, true);
		return sql.toString();
	}

	public String updateByExample(Map<String, Object> parameter) {
		SQL sql = new SQL();
		sql.UPDATE("t_auth_user");

		sql.SET("ID = #{record.id,jdbcType=VARCHAR}");
		sql.SET("CREATE_USER = #{record.createUser,jdbcType=VARCHAR}");
		sql.SET("CREATE_TIME = #{record.createTime,jdbcType=TIMESTAMP}");
		sql.SET("UPDATE_USER = #{record.updateUser,jdbcType=VARCHAR}");
		sql.SET("UPDATE_TIME = #{record.updateTime,jdbcType=TIMESTAMP}");
		sql.SET("LOGIN_NAME = #{record.loginName,jdbcType=VARCHAR}");
		sql.SET("`NAME` = #{record.name,jdbcType=VARCHAR}");
		sql.SET("PASS_WORD = #{record.passWord,jdbcType=VARCHAR}");
		sql.SET("USER_TYPE = #{record.userType,jdbcType=CHAR}");
		sql.SET("USER_LEVEL = #{record.userLevel,jdbcType=CHAR}");
		sql.SET("ORG_CODE = #{record.orgCode,jdbcType=VARCHAR}");
		sql.SET("ZONE_CODE = #{record.zoneCode,jdbcType=VARCHAR}");
		sql.SET("IS_USED = #{record.isUsed,jdbcType=CHAR}");
		sql.SET("EMAIL = #{record.email,jdbcType=VARCHAR}");
		sql.SET("SEX = #{record.sex,jdbcType=CHAR}");
		sql.SET("PHONE = #{record.phone,jdbcType=VARCHAR}");

		TAuthUserExample example = (TAuthUserExample) parameter.get("example");
		applyWhere(sql, example, true);
		return sql.toString();
	}

	public String updateByPrimaryKeySelective(TAuthUser record) {
		SQL sql = new SQL();
		sql.UPDATE("t_auth_user");

		if (record.getCreateUser() != null) {
			sql.SET("CREATE_USER = #{createUser,jdbcType=VARCHAR}");
		}

		if (record.getCreateTime() != null) {
			sql.SET("CREATE_TIME = #{createTime,jdbcType=TIMESTAMP}");
		}

		if (record.getUpdateUser() != null) {
			sql.SET("UPDATE_USER = #{updateUser,jdbcType=VARCHAR}");
		}

		if (record.getUpdateTime() != null) {
			sql.SET("UPDATE_TIME = #{updateTime,jdbcType=TIMESTAMP}");
		}

		if (record.getLoginName() != null) {
			sql.SET("LOGIN_NAME = #{loginName,jdbcType=VARCHAR}");
		}

		if (record.getName() != null) {
			sql.SET("`NAME` = #{name,jdbcType=VARCHAR}");
		}

		if (record.getPassWord() != null) {
			sql.SET("PASS_WORD = #{passWord,jdbcType=VARCHAR}");
		}

		if (record.getUserType() != null) {
			sql.SET("USER_TYPE = #{userType,jdbcType=CHAR}");
		}

		if (record.getUserLevel() != null) {
			sql.SET("USER_LEVEL = #{userLevel,jdbcType=CHAR}");
		}

		if (record.getOrgCode() != null) {
			sql.SET("ORG_CODE = #{orgCode,jdbcType=VARCHAR}");
		}

		if (record.getZoneCode() != null) {
			sql.SET("ZONE_CODE = #{zoneCode,jdbcType=VARCHAR}");
		}

		if (record.getIsUsed() != null) {
			sql.SET("IS_USED = #{isUsed,jdbcType=CHAR}");
		}

		if (record.getEmail() != null) {
			sql.SET("EMAIL = #{email,jdbcType=VARCHAR}");
		}

		if (record.getSex() != null) {
			sql.SET("SEX = #{sex,jdbcType=CHAR}");
		}

		if (record.getPhone() != null) {
			sql.SET("PHONE = #{phone,jdbcType=VARCHAR}");
		}
		
		if (record.getOrgId() != null) {
			sql.SET("ORG_ID = #{orgId,jdbcType=INTEGER}");
		}

		sql.WHERE("ID = #{id,jdbcType=VARCHAR}");

		return sql.toString();
	}

	protected void applyWhere(SQL sql, TAuthUserExample example, boolean includeExamplePhrase) {
		if (example == null) {
			return;
		}

		String parmPhrase1;
		String parmPhrase1_th;
		String parmPhrase2;
		String parmPhrase2_th;
		String parmPhrase3;
		String parmPhrase3_th;
		if (includeExamplePhrase) {
			parmPhrase1 = "%s #{example.oredCriteria[%d].allCriteria[%d].value}";
			parmPhrase1_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
			parmPhrase2 = "%s #{example.oredCriteria[%d].allCriteria[%d].value} and #{example.oredCriteria[%d].criteria[%d].secondValue}";
			parmPhrase2_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{example.oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
			parmPhrase3 = "#{example.oredCriteria[%d].allCriteria[%d].value[%d]}";
			parmPhrase3_th = "#{example.oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
		} else {
			parmPhrase1 = "%s #{oredCriteria[%d].allCriteria[%d].value}";
			parmPhrase1_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
			parmPhrase2 = "%s #{oredCriteria[%d].allCriteria[%d].value} and #{oredCriteria[%d].criteria[%d].secondValue}";
			parmPhrase2_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
			parmPhrase3 = "#{oredCriteria[%d].allCriteria[%d].value[%d]}";
			parmPhrase3_th = "#{oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
		}

		StringBuilder sb = new StringBuilder();
		List<Criteria> oredCriteria = example.getOredCriteria();
		boolean firstCriteria = true;
		for (int i = 0; i < oredCriteria.size(); i++) {
			Criteria criteria = oredCriteria.get(i);
			if (criteria.isValid()) {
				if (firstCriteria) {
					firstCriteria = false;
				} else {
					sb.append(" or ");
				}

				sb.append('(');
				List<Criterion> criterions = criteria.getAllCriteria();
				boolean firstCriterion = true;
				for (int j = 0; j < criterions.size(); j++) {
					Criterion criterion = criterions.get(j);
					if (firstCriterion) {
						firstCriterion = false;
					} else {
						sb.append(" and ");
					}

					if (criterion.isNoValue()) {
						sb.append(criterion.getCondition());
					} else if (criterion.isSingleValue()) {
						if (criterion.getTypeHandler() == null) {
							sb.append(String.format(parmPhrase1, criterion.getCondition(), i, j));
						} else {
							sb.append(String.format(parmPhrase1_th, criterion.getCondition(), i, j,
									criterion.getTypeHandler()));
						}
					} else if (criterion.isBetweenValue()) {
						if (criterion.getTypeHandler() == null) {
							sb.append(String.format(parmPhrase2, criterion.getCondition(), i, j, i, j));
						} else {
							sb.append(String.format(parmPhrase2_th, criterion.getCondition(), i, j,
									criterion.getTypeHandler(), i, j, criterion.getTypeHandler()));
						}
					} else if (criterion.isListValue()) {
						sb.append(criterion.getCondition());
						sb.append(" (");
						List<?> listItems = (List<?>) criterion.getValue();
						boolean comma = false;
						for (int k = 0; k < listItems.size(); k++) {
							if (comma) {
								sb.append(", ");
							} else {
								comma = true;
							}
							if (criterion.getTypeHandler() == null) {
								sb.append(String.format(parmPhrase3, i, j, k));
							} else {
								sb.append(String.format(parmPhrase3_th, i, j, k, criterion.getTypeHandler()));
							}
						}
						sb.append(')');
					}
				}
				sb.append(')');
			}
		}

		if (sb.length() > 0) {
			sql.WHERE(sb.toString());
		}
	}
}