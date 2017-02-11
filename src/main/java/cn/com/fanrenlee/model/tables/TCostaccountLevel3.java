package cn.com.fanrenlee.model.tables;

import java.util.Date;

public class TCostaccountLevel3 {
    private Integer id;

    private String deptCode;

    private String deptName;

    private Double shareLevel3;

    private String deptCodeShare;

    private String deptNameShare;

    private String tHospitalCode;

    private Date creatTime;

    private Double shareItemPeople;

    private Double shareItemOldHouseDeviceCommon;

    private Double shareItemOldDeviceSpecial;

    private Double shareItemAssetAmortize;

    private Double shareItemVcFunds;

    private Double shareItemOther;
    
    private Double shareItemWscl;

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

    public Double getShareLevel3() {
        return shareLevel3;
    }

    public void setShareLevel3(Double shareLevel3) {
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

    public Double getShareItemPeople() {
        return shareItemPeople;
    }

    public void setShareItemPeople(Double shareItemPeople) {
        this.shareItemPeople = shareItemPeople;
    }

    public Double getShareItemOldHouseDeviceCommon() {
        return shareItemOldHouseDeviceCommon;
    }

    public void setShareItemOldHouseDeviceCommon(Double shareItemOldHouseDeviceCommon) {
        this.shareItemOldHouseDeviceCommon = shareItemOldHouseDeviceCommon;
    }

    public Double getShareItemOldDeviceSpecial() {
        return shareItemOldDeviceSpecial;
    }

    public void setShareItemOldDeviceSpecial(Double shareItemOldDeviceSpecial) {
        this.shareItemOldDeviceSpecial = shareItemOldDeviceSpecial;
    }

    public Double getShareItemAssetAmortize() {
        return shareItemAssetAmortize;
    }

    public void setShareItemAssetAmortize(Double shareItemAssetAmortize) {
        this.shareItemAssetAmortize = shareItemAssetAmortize;
    }

    public Double getShareItemVcFunds() {
        return shareItemVcFunds;
    }

    public void setShareItemVcFunds(Double shareItemVcFunds) {
        this.shareItemVcFunds = shareItemVcFunds;
    }

    public Double getShareItemOther() {
        return shareItemOther;
    }

    public void setShareItemOther(Double shareItemOther) {
        this.shareItemOther = shareItemOther;
    }

    public Integer gettJobId() {
        return tJobId;
    }

    public void settJobId(Integer tJobId) {
        this.tJobId = tJobId;
    }

	public Double getShareItemWscl() {
		return shareItemWscl;
	}

	public void setShareItemWscl(Double shareItemWscl) {
		this.shareItemWscl = shareItemWscl;
	}
}