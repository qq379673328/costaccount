package cn.com.fanrenlee.model.tables;

import java.util.Date;

public class TCostaccountSrc {
    private Integer id;

    private String deptCode;

    private String deptName;

    private Integer deptId;

    private Float costPeople;

    private Float costOldDeviceCommon;

    private Float costOldDeviceSpecial;

    private Float costOldHouse;

    private Float costAssetAmortize;

    private Float costVcFunds;

    private Float costOther;

    private Date createTime;

    private Integer tJobId;

    private Integer peopleCount;

    private Float workCount;

    private Float workCountKd;

    private Float workCountXd;

    private Integer workCountInhos;

    private Float workCountMz;

    private Float countDirect;

    private Float countAll;

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

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Float getCostPeople() {
        return costPeople;
    }

    public void setCostPeople(Float costPeople) {
        this.costPeople = costPeople;
    }

    public Float getCostOldDeviceCommon() {
        return costOldDeviceCommon;
    }

    public void setCostOldDeviceCommon(Float costOldDeviceCommon) {
        this.costOldDeviceCommon = costOldDeviceCommon;
    }

    public Float getCostOldDeviceSpecial() {
        return costOldDeviceSpecial;
    }

    public void setCostOldDeviceSpecial(Float costOldDeviceSpecial) {
        this.costOldDeviceSpecial = costOldDeviceSpecial;
    }

    public Float getCostOldHouse() {
        return costOldHouse;
    }

    public void setCostOldHouse(Float costOldHouse) {
        this.costOldHouse = costOldHouse;
    }

    public Float getCostAssetAmortize() {
        return costAssetAmortize;
    }

    public void setCostAssetAmortize(Float costAssetAmortize) {
        this.costAssetAmortize = costAssetAmortize;
    }

    public Float getCostVcFunds() {
        return costVcFunds;
    }

    public void setCostVcFunds(Float costVcFunds) {
        this.costVcFunds = costVcFunds;
    }

    public Float getCostOther() {
        return costOther;
    }

    public void setCostOther(Float costOther) {
        this.costOther = costOther;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer gettJobId() {
        return tJobId;
    }

    public void settJobId(Integer tJobId) {
        this.tJobId = tJobId;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

    public Float getWorkCount() {
        return workCount;
    }

    public void setWorkCount(Float workCount) {
        this.workCount = workCount;
    }

    public Float getWorkCountKd() {
        return workCountKd;
    }

    public void setWorkCountKd(Float workCountKd) {
        this.workCountKd = workCountKd;
    }

    public Float getWorkCountXd() {
        return workCountXd;
    }

    public void setWorkCountXd(Float workCountXd) {
        this.workCountXd = workCountXd;
    }

    public Integer getWorkCountInhos() {
        return workCountInhos;
    }

    public void setWorkCountInhos(Integer workCountInhos) {
        this.workCountInhos = workCountInhos;
    }

    public Float getWorkCountMz() {
        return workCountMz;
    }

    public void setWorkCountMz(Float workCountMz) {
        this.workCountMz = workCountMz;
    }

    public Float getCountDirect() {
        return countDirect;
    }

    public void setCountDirect(Float countDirect) {
        this.countDirect = countDirect;
    }

    public Float getCountAll() {
        return countAll;
    }

    public void setCountAll(Float countAll) {
        this.countAll = countAll;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}