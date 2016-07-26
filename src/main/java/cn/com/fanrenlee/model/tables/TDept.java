package cn.com.fanrenlee.model.tables;

import java.util.Date;

public class TDept {
    private Integer id;

    private String deptCode;

    private String deptName;

    private String deptTypeCode;

    private String deptTypeName;

    private String deptSpecialCode;

    private String deptSpecialName;

    private Integer tHospitalId;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode == null ? null : deptCode.trim();
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getDeptTypeCode() {
        return deptTypeCode;
    }

    public void setDeptTypeCode(String deptTypeCode) {
        this.deptTypeCode = deptTypeCode == null ? null : deptTypeCode.trim();
    }

    public String getDeptTypeName() {
        return deptTypeName;
    }

    public void setDeptTypeName(String deptTypeName) {
        this.deptTypeName = deptTypeName == null ? null : deptTypeName.trim();
    }

    public String getDeptSpecialCode() {
        return deptSpecialCode;
    }

    public void setDeptSpecialCode(String deptSpecialCode) {
        this.deptSpecialCode = deptSpecialCode == null ? null : deptSpecialCode.trim();
    }

    public String getDeptSpecialName() {
        return deptSpecialName;
    }

    public void setDeptSpecialName(String deptSpecialName) {
        this.deptSpecialName = deptSpecialName == null ? null : deptSpecialName.trim();
    }

    public Integer gettHospitalId() {
        return tHospitalId;
    }

    public void settHospitalId(Integer tHospitalId) {
        this.tHospitalId = tHospitalId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}