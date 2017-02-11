/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.model.costaccount;

import cn.com.fanrenlee.model.common.DeptTypeInfos;

/**
 * 成本核算原始数据条目
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
public class CADItem {

	/**
	 * 费用-人员经费
	 */
	private Double costPeople;

	/**
	 * 费用-人员经费-主治医师
	 */
	private Double costPeopleZzys;

	/**
	 * 费用-人员经费-副主任医师
	 */
	private Double costPeopleFzzys;

	/**
	 * 费用-人员经费-主任医师
	 */
	private Double costPeopleZrys;

	/**
	 * 费用-人员经费-技师
	 */
	private Double costPeopleJs;

	/**
	 * 费用-人员经费-护士
	 */
	private Double costPeopleHs;

	/**
	 * 费用-人员经费-其它
	 */
	private Double costPeopleQt;

	public Double getCostPeopleZzys() {
		return costPeopleZzys == null ? 0f : costPeopleZzys;
	}

	public void setCostPeopleZzys(Double costPeopleZzys) {
		this.costPeopleZzys = costPeopleZzys;
	}

	public Double getCostPeopleFzzys() {
		return costPeopleFzzys == null ? 0f : costPeopleFzzys;
	}

	public void setCostPeopleFzzys(Double costPeopleFzzys) {
		this.costPeopleFzzys = costPeopleFzzys;
	}

	public Double getCostPeopleZrys() {
		return costPeopleZrys == null ? 0f : costPeopleZrys;
	}

	public void setCostPeopleZrys(Double costPeopleZrys) {
		this.costPeopleZrys = costPeopleZrys;
	}

	public Double getCostPeopleJs() {
		return costPeopleJs == null ? 0f : costPeopleJs;
	}

	public void setCostPeopleJs(Double costPeopleJs) {
		this.costPeopleJs = costPeopleJs;
	}

	public Double getCostPeopleHs() {
		return costPeopleHs == null ? 0f : costPeopleHs;
	}

	public void setCostPeopleHs(Double costPeopleHs) {
		this.costPeopleHs = costPeopleHs;
	}

	public Double getCostPeopleQt() {
		return costPeopleQt == null ? 0f : costPeopleQt;
	}

	public void setCostPeopleQt(Double costPeopleQt) {
		this.costPeopleQt = costPeopleQt;
	}

	public void setCostPeople(Double costPeople) {
		this.costPeople = costPeople;
	}

	public void setCostOldHouseDeviceCommon(Double costOldHouseDeviceCommon) {
		this.costOldHouseDeviceCommon = costOldHouseDeviceCommon;
	}

	public void setCostOldDeviceSpecial(Double costOldDeviceSpecial) {
		this.costOldDeviceSpecial = costOldDeviceSpecial;
	}

	public void setCostAssetAmortize(Double costAssetAmortize) {
		this.costAssetAmortize = costAssetAmortize;
	}

	public void setCostVcFunds(Double costVcFunds) {
		this.costVcFunds = costVcFunds;
	}

	public void setCostOther(Double costOther) {
		this.costOther = costOther;
	}

	/**
	 * 费用-房屋、通用设备折旧费
	 */
	private Double costOldHouseDeviceCommon;

	/**
	 * 卫生材料
	 */
	private Double costWscl;

	/**
	 * 费用-专用设备折旧费
	 */
	private Double costOldDeviceSpecial;

	/**
	 * 费用-无形资产摊销费
	 */
	private Double costAssetAmortize;

	/**
	 * 费用-计提医疗风险基金
	 */
	private Double costVcFunds;

	/**
	 * 费用-其它
	 */
	private Double costOther;

	/**
	 * 科室id
	 */
	private Integer deptId;

	/**
	 * 科室代码
	 */
	private String deptCode;

	/**
	 * 科室名称
	 */
	private String deptName;

	/**
	 * 科室类型码
	 */
	private String deptTypeCode;

	/**
	 * 科室类型名
	 */
	private String deptTypeName;

	/**
	 * 特殊科室码
	 */
	private String deptSpecialCode;

	/**
	 * 特殊科室名
	 */
	private String deptSpecialName;

	/**
	 * 是否行政后勤科室
	 */
	private boolean isDeptTypeXZHQ;

	/**
	 * 是否医辅科室
	 */
	private boolean isDeptTypeYF;

	/**
	 * 是否医技科室
	 */
	private boolean isDeptTypeYJ;

	/**
	 * 是否临床科室
	 */
	private boolean isDeptTypeLC;

	/**
	 * 是否门诊收费处科室
	 */
	private boolean isDeptSpecialOutpatientCashier;

	/**
	 * 是否挂号处收费处科室
	 */
	private boolean isDeptSpecialRegister;

	/**
	 * 是否门诊科室
	 */
	private boolean isDeptSpecialOutpatient;

	/**
	 * 是否供应室科室
	 */
	private boolean isDeptSpecialSupply;

	/**
	 * 是否住院科室
	 */
	private boolean isDeptSpecialInhos;

	/**
	 * 是否住院收费处科室
	 */
	private boolean isDeptSpecialInhosCashier;

	/**
	 * 是否病案室科室
	 */
	private boolean isDeptSpecialMedicalRecord;

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptTypeCode() {
		return deptTypeCode;
	}

	public void setDeptTypeCode(String deptTypeCode) {
		if (DeptTypeInfos.TYPECODE_LC.equals(deptTypeCode)) {
			this.isDeptTypeLC = true;
		} else if (DeptTypeInfos.TYPECODE_XZHQ.equals(deptTypeCode)) {
			this.isDeptTypeXZHQ = true;
		} else if (DeptTypeInfos.TYPECODE_YF.equals(deptTypeCode)) {
			this.isDeptTypeYF = true;
		} else if (DeptTypeInfos.TYPECODE_YJ.equals(deptTypeCode)) {
			this.isDeptTypeYJ = true;
		}
		this.deptTypeCode = deptTypeCode;
	}

	public String getDeptTypeName() {
		return deptTypeName;
	}

	public void setDeptTypeName(String deptTypeName) {
		this.deptTypeName = deptTypeName;
	}

	public String getDeptSpecialCode() {
		return deptSpecialCode;
	}

	public void setDeptSpecialCode(String deptSpecialCode) {

		if (DeptTypeInfos.TYPESPE_CASHIER.equals(deptSpecialCode)) {
			this.isDeptSpecialInhosCashier = true;
		} else if (DeptTypeInfos.TYPESPE_INHOS.equals(deptSpecialCode)) {
			this.isDeptSpecialInhos = true;
		} else if (DeptTypeInfos.TYPESPE_MEDICALRECORD.equals(deptSpecialCode)) {
			this.isDeptSpecialMedicalRecord = true;
		} else if (DeptTypeInfos.TYPESPE_OUTPATIENT.equals(deptSpecialCode)) {
			this.isDeptSpecialOutpatient = true;
		} else if (DeptTypeInfos.TYPESPE_OUTPATIENTCASHIER.equals(deptSpecialCode)) {
			this.isDeptSpecialOutpatientCashier = true;
		} else if (DeptTypeInfos.TYPESPE_REGISTER.equals(deptSpecialCode)) {
			this.isDeptSpecialRegister = true;
		} else if (DeptTypeInfos.TYPESPE_SUPPLY.equals(deptSpecialCode)) {
			this.isDeptSpecialSupply = true;
		}

		this.deptSpecialCode = deptSpecialCode;
	}

	public String getDeptSpecialName() {
		return deptSpecialName;
	}

	public void setDeptSpecialName(String deptSpecialName) {
		this.deptSpecialName = deptSpecialName;
	}

	public boolean isDeptTypeXZHQ() {
		return isDeptTypeXZHQ;
	}

	public void setDeptTypeXZHQ(boolean isDeptTypeXZHQ) {
		this.isDeptTypeXZHQ = isDeptTypeXZHQ;
	}

	public boolean isDeptTypeYF() {
		return isDeptTypeYF;
	}

	public void setDeptTypeYF(boolean isDeptTypeYF) {
		this.isDeptTypeYF = isDeptTypeYF;
	}

	public boolean isDeptTypeYJ() {
		return isDeptTypeYJ;
	}

	public void setDeptTypeYJ(boolean isDeptTypeYJ) {
		this.isDeptTypeYJ = isDeptTypeYJ;
	}

	public boolean isDeptTypeLC() {
		return isDeptTypeLC;
	}

	public void setDeptTypeLC(boolean isDeptTypeLC) {
		this.isDeptTypeLC = isDeptTypeLC;
	}

	public boolean isDeptSpecialOutpatientCashier() {
		return isDeptSpecialOutpatientCashier;
	}

	public void setDeptSpecialOutpatientCashier(boolean isDeptSpecialOutpatientCashier) {
		this.isDeptSpecialOutpatientCashier = isDeptSpecialOutpatientCashier;
	}

	public boolean isDeptSpecialRegister() {
		return isDeptSpecialRegister;
	}

	public void setDeptSpecialRegister(boolean isDeptSpecialRegister) {
		this.isDeptSpecialRegister = isDeptSpecialRegister;
	}

	public boolean isDeptSpecialOutpatient() {
		return isDeptSpecialOutpatient;
	}

	public void setDeptSpecialOutpatient(boolean isDeptSpecialOutpatient) {
		this.isDeptSpecialOutpatient = isDeptSpecialOutpatient;
	}

	public boolean isDeptSpecialSupply() {
		return isDeptSpecialSupply;
	}

	public void setDeptSpecialSupply(boolean isDeptSpecialSupply) {
		this.isDeptSpecialSupply = isDeptSpecialSupply;
	}

	public boolean isDeptSpecialInhos() {
		return isDeptSpecialInhos;
	}

	public void setDeptSpecialInhos(boolean isDeptSpecialInhos) {
		this.isDeptSpecialInhos = isDeptSpecialInhos;
	}

	public boolean isDeptSpecialInhosCashier() {
		return isDeptSpecialInhosCashier;
	}

	public void setDeptSpecialInhosCashier(boolean isDeptSpecialInhosCashier) {
		this.isDeptSpecialInhosCashier = isDeptSpecialInhosCashier;
	}

	public boolean isDeptSpecialMedicalRecord() {
		return isDeptSpecialMedicalRecord;
	}

	public void setDeptSpecialMedicalRecord(boolean isDeptSpecialMedicalRecord) {
		this.isDeptSpecialMedicalRecord = isDeptSpecialMedicalRecord;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Double getCostPeople() {
		return costPeople == null ? 0f : costPeople;
	}

	public Double getCostOldDeviceSpecial() {
		return costOldDeviceSpecial == null ? 0f : costOldDeviceSpecial;
	}

	public Double getCostAssetAmortize() {
		return costAssetAmortize == null ? 0f : costAssetAmortize;
	}

	public Double getCostVcFunds() {
		return costVcFunds == null ? 0f : costVcFunds;
	}

	public Double getCostOther() {
		return costOther == null ? 0f : costOther;
	}

	public Integer getPeopleCount() {
		return peopleCount == null ? 0 : peopleCount;
	}

	public void setPeopleCount(Integer peopleCount) {
		this.peopleCount = peopleCount;
	}

	public Double getWorkCountInhos() {
		return workCountInhos == null ? 0f : workCountInhos;
	}

	public void setWorkCountInhos(Double workCountInhos) {
		this.workCountInhos = workCountInhos;
	}

	public Double getWorkCountMz() {
		return workCountMz == null ? 0f : workCountMz;
	}

	public void setWorkCountMz(Double workCountMz) {
		this.workCountMz = workCountMz;
	}

	public Double getCostOldHouseDeviceCommon() {
		return costOldHouseDeviceCommon == null ? 0f : costOldHouseDeviceCommon;
	}

	public Double getWorkCountKdsr() {
		return workCountKdsr == null ? 0f : workCountKdsr;
	}

	public void setWorkCountKdsr(Double workCountKdsr) {
		this.workCountKdsr = workCountKdsr;
	}

	/**
	 * 科室人员数
	 */
	private Integer peopleCount;

	/**
	 * 工作量-住院执行收入
	 */
	private Double workCountZyzxsr;

	/**
	 * 工作量-门诊执行收入
	 */
	private Double workCountMzzxsr;

	/**
	 * 工作量-住院人数
	 */
	private Double workCountInhos;

	/**
	 * 工作量-门诊人次
	 */
	private Double workCountMz;

	/**
	 * 工作量-开单收入
	 */
	private Double workCountKdsr;

	/**
	 * 工作量-消毒工作量
	 */
	private Double workCountXdgzl;

	/**
	 * 获取总工作量
	 * 
	 * @return
	 */
	public Double getWorkCountTotal() {
		return getWorkCountInhos() + getWorkCountKdsr() + getWorkCountMz() + getWorkCountXdgzl() + getWorkCountMzzxsr()
				+ getWorkCountZyzxsr();
	}

	/**
	 * 获取直接成本
	 * 
	 * @return
	 */
	public Double getDirectCount() {
		return getCostAssetAmortize() + getCostOldDeviceSpecial() + getCostOldHouseDeviceCommon() + getCostOther()
				+ getCostVcFunds() + getCostWscl() + getCostPeople();
	}

	public Double getCostWscl() {
		return costWscl == null ? 0f : costWscl;
	}

	public void setCostWscl(Double costWscl) {
		this.costWscl = costWscl;
	}

	public Double getWorkCountZyzxsr() {
		return workCountZyzxsr == null ? 0f : workCountZyzxsr;
	}

	public void setWorkCountZyzxsr(Double workCountZyzxsr) {
		this.workCountZyzxsr = workCountZyzxsr;
	}

	public Double getWorkCountMzzxsr() {
		return workCountMzzxsr == null ? 0f : workCountMzzxsr;
	}

	public void setWorkCountMzzxsr(Double workCountMzzxsr) {
		this.workCountMzzxsr = workCountMzzxsr;
	}

	public Double getWorkCountXdgzl() {
		return workCountXdgzl == null ? 0f : workCountXdgzl;
	}

	public void setWorkCountXdgzl(Double workCountXdgzl) {
		this.workCountXdgzl = workCountXdgzl;
	}

}
