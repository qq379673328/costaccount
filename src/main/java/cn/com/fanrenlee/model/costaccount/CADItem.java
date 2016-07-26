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
	private float costPeople;

	/**
	 * 费用-通用设备折旧费
	 */
	private float costOldDeviceCommon;

	/**
	 * 费用-专用设备折旧费
	 */
	private float costOldDeviceSpecial;

	/**
	 * 费用-房屋折旧费
	 */
	private float costOldHouse;

	/**
	 * 费用-无形资产摊销费
	 */
	private float costAssetAmortize;

	/**
	 * 费用-计提医疗风险基金
	 */
	private float costVCFunds;

	/**
	 * 费用-其它
	 */
	private float costOther;

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
	 * 是否挂号处科室
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
		if(DeptTypeInfos.TYPECODE_LC.equals(deptTypeCode)){
			this.isDeptTypeLC = true;
		}else if(DeptTypeInfos.TYPECODE_XZHQ.equals(deptTypeCode)){
			this.isDeptTypeXZHQ = true;
		}else if(DeptTypeInfos.TYPECODE_YF.equals(deptTypeCode)){
			this.isDeptTypeYF = true;
		}else if(DeptTypeInfos.TYPECODE_YJ.equals(deptTypeCode)){
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
		
		if(DeptTypeInfos.TYPESPE_CASHIER.equals(deptTypeCode)){
			this.isDeptSpecialInhosCashier = true;
		}else if(DeptTypeInfos.TYPESPE_INHOS.equals(deptTypeCode)){
			this.isDeptSpecialInhos = true;
		}else if(DeptTypeInfos.TYPESPE_MEDICALRECORD.equals(deptTypeCode)){
			this.isDeptSpecialMedicalRecord = true;
		}else if(DeptTypeInfos.TYPESPE_OUTPATIENT.equals(deptTypeCode)){
			this.isDeptSpecialOutpatient = true;
		}else if(DeptTypeInfos.TYPESPE_OUTPATIENTCASHIER.equals(deptTypeCode)){
			this.isDeptSpecialOutpatientCashier = true;
		}else if(DeptTypeInfos.TYPESPE_REGISTER.equals(deptTypeCode)){
			this.isDeptSpecialRegister = true;
		}else if(DeptTypeInfos.TYPESPE_SUPPLY.equals(deptTypeCode)){
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

	public void setDeptSpecialOutpatientCashier(
			boolean isDeptSpecialOutpatientCashier) {
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

	public void setDeptSpecialMedicalRecord(
			boolean isDeptSpecialMedicalRecord) {
		this.isDeptSpecialMedicalRecord = isDeptSpecialMedicalRecord;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public float getCostPeople() {
		return costPeople;
	}

	public void setCostPeople(float costPeople) {
		this.costPeople = costPeople;
	}

	public float getCostOldDeviceCommon() {
		return costOldDeviceCommon;
	}

	public void setCostOldDeviceCommon(float costOldDeviceCommon) {
		this.costOldDeviceCommon = costOldDeviceCommon;
	}

	public float getCostOldDeviceSpecial() {
		return costOldDeviceSpecial;
	}

	public void setCostOldDeviceSpecial(float costOldDeviceSpecial) {
		this.costOldDeviceSpecial = costOldDeviceSpecial;
	}

	public float getCostOldHouse() {
		return costOldHouse;
	}

	public void setCostOldHouse(float costOldHouse) {
		this.costOldHouse = costOldHouse;
	}

	public float getCostAssetAmortize() {
		return costAssetAmortize;
	}

	public void setCostAssetAmortize(float costAssetAmortize) {
		this.costAssetAmortize = costAssetAmortize;
	}

	public float getCostVCFunds() {
		return costVCFunds;
	}

	public void setCostVCFunds(float costVCFunds) {
		this.costVCFunds = costVCFunds;
	}

	public float getCostOther() {
		return costOther;
	}

	public void setCostOther(float costOther) {
		this.costOther = costOther;
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

	public Float getWorkCountKD() {
		return workCountKD;
	}

	public void setWorkCountKD(Float workCountKD) {
		this.workCountKD = workCountKD;
	}

	public Float getWorkCountXD() {
		return workCountXD;
	}

	public void setWorkCountXD(Float workCountXD) {
		this.workCountXD = workCountXD;
	}

	public Float getWorkCountMZ() {
		return workCountMZ;
	}

	public void setWorkCountMZ(Float workCountMZ) {
		this.workCountMZ = workCountMZ;
	}

	public Float getWorkCountInhos() {
		return workCountInhos;
	}

	public void setWorkCountInhos(Float workCountInhos) {
		this.workCountInhos = workCountInhos;
	}

	/**
	 * 科室人员数
	 */
	private Integer peopleCount;
	
	/**
	 * 科室工作量
	 */
	private Float workCount;
	
	/**
	 * 科室开单工作量
	 */
	private Float workCountKD;
	
	/**
	 * 科室消毒工作量
	 */
	private Float workCountXD;
	
	/**
	 * 科室住院人数
	 */
	private Float workCountInhos;
	
	/**
	 * 科室门诊量
	 */
	private Float workCountMZ;
	
}
