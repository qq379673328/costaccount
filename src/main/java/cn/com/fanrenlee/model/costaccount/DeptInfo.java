/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.model.costaccount;

/**
 * 科室信息
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
public class DeptInfo {
	
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
	private boolean isDeptSpecialRegister ;

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

	public void setDeptSpecialMedicalRecord(boolean isDeptSpecialMedicalRecord) {
		this.isDeptSpecialMedicalRecord = isDeptSpecialMedicalRecord;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

}
