package cn.com.fanrenlee.model.tables;

/**
 * 原始数据-科室项目年例数
 * @author Lizy
 *
 */
public class TCostaccountSrcNls {
	
	private Integer id;
	private String deptCode;
	private String deptName;
	private String proCode;
	private String proName;
	private Integer nls;
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
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public Integer getNls() {
		return nls == null ? 0 : nls;
	}
	public void setNls(Integer nls) {
		this.nls = nls;
	}
	

}
