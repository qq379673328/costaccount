package cn.com.fanrenlee.auth.entity.ge;

import java.io.Serializable;
import java.util.Date;

public class TAuthUser implements Serializable {
	private String id;

	private String createUser;

	private Date createTime;

	private String updateUser;

	private Date updateTime;

	private String loginName;

	private String name;

	private String passWord;

	private String userType;

	private String userLevel;

	private String orgCode;

	private String zoneCode;

	private String isUsed;

	private String email;

	private String sex;

	private String phone;
	
	private Integer orgId;

	private static final long serialVersionUID = 1L;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser == null ? null : createUser.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser == null ? null : updateUser.trim();
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName == null ? null : loginName.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord == null ? null : passWord.trim();
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType == null ? null : userType.trim();
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel == null ? null : userLevel.trim();
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode == null ? null : orgCode.trim();
	}

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode == null ? null : zoneCode.trim();
	}

	public String getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed == null ? null : isUsed.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	@Override
	public boolean equals(Object that) {
		if (this == that) {
			return true;
		}
		if (that == null) {
			return false;
		}
		if (getClass() != that.getClass()) {
			return false;
		}
		TAuthUser other = (TAuthUser) that;
		return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
				&& (this.getCreateUser() == null ? other.getCreateUser() == null
						: this.getCreateUser().equals(other.getCreateUser()))
				&& (this.getCreateTime() == null ? other.getCreateTime() == null
						: this.getCreateTime().equals(other.getCreateTime()))
				&& (this.getUpdateUser() == null ? other.getUpdateUser() == null
						: this.getUpdateUser().equals(other.getUpdateUser()))
				&& (this.getUpdateTime() == null ? other.getUpdateTime() == null
						: this.getUpdateTime().equals(other.getUpdateTime()))
				&& (this.getLoginName() == null ? other.getLoginName() == null
						: this.getLoginName().equals(other.getLoginName()))
				&& (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
				&& (this.getPassWord() == null ? other.getPassWord() == null
						: this.getPassWord().equals(other.getPassWord()))
				&& (this.getUserType() == null ? other.getUserType() == null
						: this.getUserType().equals(other.getUserType()))
				&& (this.getUserLevel() == null ? other.getUserLevel() == null
						: this.getUserLevel().equals(other.getUserLevel()))
				&& (this.getOrgCode() == null ? other.getOrgCode() == null
						: this.getOrgCode().equals(other.getOrgCode()))
				&& (this.getZoneCode() == null ? other.getZoneCode() == null
						: this.getZoneCode().equals(other.getZoneCode()))
				&& (this.getIsUsed() == null ? other.getIsUsed() == null : this.getIsUsed().equals(other.getIsUsed()))
				&& (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
				&& (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
				&& (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
		result = prime * result + ((getCreateUser() == null) ? 0 : getCreateUser().hashCode());
		result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
		result = prime * result + ((getUpdateUser() == null) ? 0 : getUpdateUser().hashCode());
		result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
		result = prime * result + ((getLoginName() == null) ? 0 : getLoginName().hashCode());
		result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
		result = prime * result + ((getPassWord() == null) ? 0 : getPassWord().hashCode());
		result = prime * result + ((getUserType() == null) ? 0 : getUserType().hashCode());
		result = prime * result + ((getUserLevel() == null) ? 0 : getUserLevel().hashCode());
		result = prime * result + ((getOrgCode() == null) ? 0 : getOrgCode().hashCode());
		result = prime * result + ((getZoneCode() == null) ? 0 : getZoneCode().hashCode());
		result = prime * result + ((getIsUsed() == null) ? 0 : getIsUsed().hashCode());
		result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
		result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
		result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
		return result;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
}