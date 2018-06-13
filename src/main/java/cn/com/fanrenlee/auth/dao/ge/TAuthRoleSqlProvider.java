package cn.com.fanrenlee.auth.dao.ge;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import cn.com.fanrenlee.auth.entity.ge.TAuthRole;
import cn.com.fanrenlee.auth.entity.ge.TAuthRoleExample;
import cn.com.fanrenlee.auth.entity.ge.TAuthRoleExample.Criteria;
import cn.com.fanrenlee.auth.entity.ge.TAuthRoleExample.Criterion;

public class TAuthRoleSqlProvider {

	public String countByExample(TAuthRoleExample example) {
		SQL sql = new SQL();
		sql.SELECT("count(*)").FROM("t_auth_role");
		applyWhere(sql, example, false);
		return sql.toString();
	}

	public String deleteByExample(TAuthRoleExample example) {
		SQL sql = new SQL();
		sql.DELETE_FROM("t_auth_role");
		applyWhere(sql, example, false);
		return sql.toString();
	}

	public String insertSelective(TAuthRole record) {
		SQL sql = new SQL();
		sql.INSERT_INTO("t_auth_role");

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

		if (record.getRoleName() != null) {
			sql.VALUES("ROLE_NAME", "#{roleName,jdbcType=VARCHAR}");
		}

		if (record.getRoleDesc() != null) {
			sql.VALUES("ROLE_DESC", "#{roleDesc,jdbcType=VARCHAR}");
		}

		if (record.getAppId() != null) {
			sql.VALUES("APP_ID", "#{appId,jdbcType=VARCHAR}");
		}

		return sql.toString();
	}

	public String selectByExample(TAuthRoleExample example) {
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
		sql.SELECT("ROLE_NAME");
		sql.SELECT("ROLE_DESC");
		sql.SELECT("APP_ID");
		sql.FROM("t_auth_role");
		applyWhere(sql, example, false);

		if (example != null && example.getOrderByClause() != null) {
			sql.ORDER_BY(example.getOrderByClause());
		}

		return sql.toString();
	}

	public String updateByExampleSelective(Map<String, Object> parameter) {
		TAuthRole record = (TAuthRole) parameter.get("record");
		TAuthRoleExample example = (TAuthRoleExample) parameter.get("example");

		SQL sql = new SQL();
		sql.UPDATE("t_auth_role");

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

		if (record.getRoleName() != null) {
			sql.SET("ROLE_NAME = #{record.roleName,jdbcType=VARCHAR}");
		}

		if (record.getRoleDesc() != null) {
			sql.SET("ROLE_DESC = #{record.roleDesc,jdbcType=VARCHAR}");
		}

		if (record.getAppId() != null) {
			sql.SET("APP_ID = #{record.appId,jdbcType=VARCHAR}");
		}

		applyWhere(sql, example, true);
		return sql.toString();
	}

	public String updateByExample(Map<String, Object> parameter) {
		SQL sql = new SQL();
		sql.UPDATE("t_auth_role");

		sql.SET("ID = #{record.id,jdbcType=VARCHAR}");
		sql.SET("CREATE_USER = #{record.createUser,jdbcType=VARCHAR}");
		sql.SET("CREATE_TIME = #{record.createTime,jdbcType=TIMESTAMP}");
		sql.SET("UPDATE_USER = #{record.updateUser,jdbcType=VARCHAR}");
		sql.SET("UPDATE_TIME = #{record.updateTime,jdbcType=TIMESTAMP}");
		sql.SET("ROLE_NAME = #{record.roleName,jdbcType=VARCHAR}");
		sql.SET("ROLE_DESC = #{record.roleDesc,jdbcType=VARCHAR}");
		sql.SET("APP_ID = #{record.appId,jdbcType=VARCHAR}");

		TAuthRoleExample example = (TAuthRoleExample) parameter.get("example");
		applyWhere(sql, example, true);
		return sql.toString();
	}

	public String updateByPrimaryKeySelective(TAuthRole record) {
		SQL sql = new SQL();
		sql.UPDATE("t_auth_role");

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

		if (record.getRoleName() != null) {
			sql.SET("ROLE_NAME = #{roleName,jdbcType=VARCHAR}");
		}

		if (record.getRoleDesc() != null) {
			sql.SET("ROLE_DESC = #{roleDesc,jdbcType=VARCHAR}");
		}

		if (record.getAppId() != null) {
			sql.SET("APP_ID = #{appId,jdbcType=VARCHAR}");
		}

		sql.WHERE("ID = #{id,jdbcType=VARCHAR}");

		return sql.toString();
	}

	protected void applyWhere(SQL sql, TAuthRoleExample example, boolean includeExamplePhrase) {
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