package cn.com.fanrenlee.model.tables;

/**
 * 原始数据-科室对照
 * 
 * @author Lizy
 *
 */
public class TCostaccountSrcDept {

	private Integer id;
	private String bzDeptCode;
	private String bzDeptName;
	private String deptCode;
	private String deptName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBzDeptCode() {
		return bzDeptCode;
	}

	public void setBzDeptCode(String bzDeptCode) {
		this.bzDeptCode = bzDeptCode;
	}

	public String getBzDeptName() {
		return bzDeptName;
	}

	public void setBzDeptName(String bzDeptName) {
		this.bzDeptName = bzDeptName;
	}

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

}
