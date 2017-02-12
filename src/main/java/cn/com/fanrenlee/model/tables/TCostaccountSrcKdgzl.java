package cn.com.fanrenlee.model.tables;

/**
 * 原始数据-开单工作量
 * @author Lizy
 *
 */
public class TCostaccountSrcKdgzl {

	private Integer id;
	private Integer tJobId;
	private String deptCodeBase;
	private String deptNameBase;
	private String deptCodeYj;
	private String deptNameYj;
	private Double kdgzl;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer gettJobId() {
		return tJobId;
	}
	public void settJobId(Integer tJobId) {
		this.tJobId = tJobId;
	}
	public String getDeptCodeBase() {
		return deptCodeBase;
	}
	public void setDeptCodeBase(String deptCodeBase) {
		this.deptCodeBase = deptCodeBase;
	}
	public String getDeptNameBase() {
		return deptNameBase;
	}
	public void setDeptNameBase(String deptNameBase) {
		this.deptNameBase = deptNameBase;
	}
	public String getDeptCodeYj() {
		return deptCodeYj;
	}
	public void setDeptCodeYj(String deptCodeYj) {
		this.deptCodeYj = deptCodeYj;
	}
	public String getDeptNameYj() {
		return deptNameYj;
	}
	public void setDeptNameYj(String deptNameYj) {
		this.deptNameYj = deptNameYj;
	}
	public Double getKdgzl() {
		return kdgzl == null ? 0 : kdgzl;
	}
	public void setKdgzl(Double kdgzl) {
		this.kdgzl = kdgzl;
	}
	
}
