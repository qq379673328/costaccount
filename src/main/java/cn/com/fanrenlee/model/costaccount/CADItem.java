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
	private Float costPeople;
	
	/**
	 * 费用-人员经费-主治医师
	 */
	private Float costPeopleZzys;
	
	/**
	 * 费用-人员经费-副主任医师
	 */
	private Float costPeopleFzzys;
	
	/**
	 * 费用-人员经费-主任医师
	 */
	private Float costPeopleZrys;

	
	/**
	 * 费用-人员经费-技师
	 */
	private Float costPeopleJs;

	
	/**
	 * 费用-人员经费-护士
	 */
	private Float costPeopleHs;

	
	/**
	 * 费用-人员经费-其它
	 */
	private Float costPeopleQt;

	public Float getCostPeopleZzys() {
		return costPeopleZzys;
	}

	public void setCostPeopleZzys(Float costPeopleZzys) {
		this.costPeopleZzys = costPeopleZzys;
	}

	public Float getCostPeopleFzzys() {
		return costPeopleFzzys;
	}

	public void setCostPeopleFzzys(Float costPeopleFzzys) {
		this.costPeopleFzzys = costPeopleFzzys;
	}

	public Float getCostPeopleZrys() {
		return costPeopleZrys;
	}

	public void setCostPeopleZrys(Float costPeopleZrys) {
		this.costPeopleZrys = costPeopleZrys;
	}

	public Float getCostPeopleJs() {
		return costPeopleJs;
	}

	public void setCostPeopleJs(Float costPeopleJs) {
		this.costPeopleJs = costPeopleJs;
	}

	public Float getCostPeopleHs() {
		return costPeopleHs;
	}

	public void setCostPeopleHs(Float costPeopleHs) {
		this.costPeopleHs = costPeopleHs;
	}

	public Float getCostPeopleQt() {
		return costPeopleQt;
	}

	public void setCostPeopleQt(Float costPeopleQt) {
		this.costPeopleQt = costPeopleQt;
	}

	public void setCostPeople(Float costPeople) {
		this.costPeople = costPeople;
	}

	public void setCostOldHouseDeviceCommon(Float costOldHouseDeviceCommon) {
		this.costOldHouseDeviceCommon = costOldHouseDeviceCommon;
	}

	public void setCostOldDeviceSpecial(Float costOldDeviceSpecial) {
		this.costOldDeviceSpecial = costOldDeviceSpecial;
	}

	public void setCostAssetAmortize(Float costAssetAmortize) {
		this.costAssetAmortize = costAssetAmortize;
	}

	public void setCostVcFunds(Float costVcFunds) {
		this.costVcFunds = costVcFunds;
	}

	public void setCostOther(Float costOther) {
		this.costOther = costOther;
	}

	/**
	 * 费用-房屋、通用设备折旧费
	 */
	private Float costOldHouseDeviceCommon;

	/**
	 * 费用-专用设备折旧费
	 */
	private Float costOldDeviceSpecial;

	/**
	 * 费用-无形资产摊销费
	 */
	private Float costAssetAmortize;

	/**
	 * 费用-计提医疗风险基金
	 */
	private Float costVcFunds;

	/**
	 * 费用-其它
	 */
	private Float costOther;

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

	public float getCostOldDeviceSpecial() {
		return costOldDeviceSpecial;
	}

	public void setCostOldDeviceSpecial(float costOldDeviceSpecial) {
		this.costOldDeviceSpecial = costOldDeviceSpecial;
	}

	public float getCostAssetAmortize() {
		return costAssetAmortize;
	}

	public void setCostAssetAmortize(float costAssetAmortize) {
		this.costAssetAmortize = costAssetAmortize;
	}

	public float getCostVcFunds() {
		return costVcFunds;
	}

	public void setCostVcFunds(float costVcFunds) {
		this.costVcFunds = costVcFunds;
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

	public Float getWorkCountInhos() {
		return workCountInhos;
	}

	public void setWorkCountInhos(Float workCountInhos) {
		this.workCountInhos = workCountInhos;
	}

	public Float getWorkCountMz() {
		return workCountMz;
	}

	public void setWorkCountMz(Float workCountMz) {
		this.workCountMz = workCountMz;
	}

	public float getCostOldHouseDeviceCommon() {
		return costOldHouseDeviceCommon;
	}

	public void setCostOldHouseDeviceCommon(float costOldHouseDeviceCommon) {
		this.costOldHouseDeviceCommon = costOldHouseDeviceCommon;
	}

	public Float getWorkCountKdgzl() {
		return workCountKdgzl;
	}

	public void setWorkCountKdgzl(Float workCountKdgzl) {
		this.workCountKdgzl = workCountKdgzl;
	}

	public Float getWorkCountXdgzl() {
		return workCountXdgzl;
	}

	public void setWorkCountXdgzl(Float workCountXdgzl) {
		this.workCountXdgzl = workCountXdgzl;
	}

	public Float getWorkCountKdsr() {
		return workCountKdsr;
	}

	public void setWorkCountKdsr(Float workCountKdsr) {
		this.workCountKdsr = workCountKdsr;
	}

	public Float getWorkCountZxsr() {
		return workCountZxsr;
	}

	public void setWorkCountZxsr(Float workCountZxsr) {
		this.workCountZxsr = workCountZxsr;
	}

	/**
	 * 科室人员数
	 */
	private Integer peopleCount;
	
	/**
	 * 科室开单工作量
	 */
	private Float workCountKdgzl;
	
	/**
	 * 科室消毒工作量
	 */
	private Float workCountXdgzl;
	
	/**
	 * 科室住院人数
	 */
	private Float workCountInhos;
	
	/**
	 * 科室门诊量
	 */
	private Float workCountMz;
	
	/**
	 * 工作量-开单收入
	 */
	private Float workCountKdsr;
	
	/**
	 * 工作量-执行收入
	 */
	private Float workCountZxsr;
	
	/**
	 * 获取工作量
	 * @return
	 */
	public Float getWorkCount(){
		//挂号处、门诊收费处
		if(isDeptSpecialOutpatientCashier() || isDeptSpecialRegister()){
			return this.workCountZxsr;
		//住院科室
		}else if(isDeptSpecialInhos()){
			return this.workCountInhos;
		//医技科室
		}else if(isDeptTypeYJ()){
			return this.workCountXdgzl;
		}else{
			return this.workCountZxsr;
		}
	}
	
}
