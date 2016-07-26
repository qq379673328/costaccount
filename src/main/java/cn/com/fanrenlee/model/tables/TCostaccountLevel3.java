package cn.com.fanrenlee.model.tables;

import java.util.Date;

public class TCostaccountLevel3 {
    private Integer id;

    private String deptCode;

    private String deptName;

    private Float shareLevel3;

    private String deptCodeShare;

    private String deptNameShare;

    private String tHospitalCode;

    private Date creatTime;

    private Float shareItemPeople;

    private Float shareItemOldDeviceCommon;

    private Float shareItemOldDeviceSpecial;

    private Float shareItemOldHouse;

    private Float shareItemAssetAmortize;

    private Float shareItemVcFunds;

    private Float shareItemOther;

    private Integer tJobId;

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

    public Float getShareLevel3() {
        return shareLevel3;
    }

    public void setShareLevel3(Float shareLevel3) {
        this.shareLevel3 = shareLevel3;
    }

    public String getDeptCodeShare() {
        return deptCodeShare;
    }

    public void setDeptCodeShare(String deptCodeShare) {
        this.deptCodeShare = deptCodeShare == null ? null : deptCodeShare.trim();
    }

    public String getDeptNameShare() {
        return deptNameShare;
    }

    public void setDeptNameShare(String deptNameShare) {
        this.deptNameShare = deptNameShare == null ? null : deptNameShare.trim();
    }

    public String gettHospitalCode() {
        return tHospitalCode;
    }

    public void settHospitalCode(String tHospitalCode) {
        this.tHospitalCode = tHospitalCode == null ? null : tHospitalCode.trim();
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Float getShareItemPeople() {
        return shareItemPeople;
    }

    public void setShareItemPeople(Float shareItemPeople) {
        this.shareItemPeople = shareItemPeople;
    }

    public Float getShareItemOldDeviceCommon() {
        return shareItemOldDeviceCommon;
    }

    public void setShareItemOldDeviceCommon(Float shareItemOldDeviceCommon) {
        this.shareItemOldDeviceCommon = shareItemOldDeviceCommon;
    }

    public Float getShareItemOldDeviceSpecial() {
        return shareItemOldDeviceSpecial;
    }

    public void setShareItemOldDeviceSpecial(Float shareItemOldDeviceSpecial) {
        this.shareItemOldDeviceSpecial = shareItemOldDeviceSpecial;
    }

    public Float getShareItemOldHouse() {
        return shareItemOldHouse;
    }

    public void setShareItemOldHouse(Float shareItemOldHouse) {
        this.shareItemOldHouse = shareItemOldHouse;
    }

    public Float getShareItemAssetAmortize() {
        return shareItemAssetAmortize;
    }

    public void setShareItemAssetAmortize(Float shareItemAssetAmortize) {
        this.shareItemAssetAmortize = shareItemAssetAmortize;
    }

    public Float getShareItemVcFunds() {
        return shareItemVcFunds;
    }

    public void setShareItemVcFunds(Float shareItemVcFunds) {
        this.shareItemVcFunds = shareItemVcFunds;
    }

    public Float getShareItemOther() {
        return shareItemOther;
    }

    public void setShareItemOther(Float shareItemOther) {
        this.shareItemOther = shareItemOther;
    }

    public Integer gettJobId() {
        return tJobId;
    }

    public void settJobId(Integer tJobId) {
        this.tJobId = tJobId;
    }
}