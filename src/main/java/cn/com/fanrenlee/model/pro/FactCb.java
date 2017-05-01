package cn.com.fanrenlee.model.pro;

/**
 * 实际成本
 * @author Lizy
 *
 */
public class FactCb {
	
	private String deptCode;
	private String deptName;
	private String proName;
	private String proCode;
	private Double pcYs;
	private Double pcHs;
	private Double pcJys;
	private Double pcOther;
	private Double pcPeople;
	private Double cHouse;
	private Double cSpe;
	private Double cAsset;
	private Double cOther;
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
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public Double getPcYs() {
		return pcYs == null ? 0 : pcYs;
	}
	public void setPcYs(Double pcYs) {
		this.pcYs = pcYs;
	}
	public Double getPcHs() {
		return pcHs == null ? 0 : pcHs;
	}
	public void setPcHs(Double pcHs) {
		this.pcHs = pcHs;
	}
	public Double getPcJys() {
		return pcJys == null ? 0 : pcJys;
	}
	public void setPcJys(Double pcJys) {
		this.pcJys = pcJys;
	}
	public Double getPcOther() {
		return pcOther == null ? 0 : pcOther;
	}
	public void setPcOther(Double pcOther) {
		this.pcOther = pcOther;
	}
	public Double getcHouse() {
		return cHouse == null ? 0 : cHouse;
	}
	public void setcHouse(Double cHouse) {
		this.cHouse = cHouse;
	}
	public Double getcSpe() {
		return cSpe == null ? 0 : cSpe;
	}
	public void setcSpe(Double cSpe) {
		this.cSpe = cSpe;
	}
	public Double getcAsset() {
		return cAsset == null ? 0 : cAsset;
	}
	public void setcAsset(Double cAsset) {
		this.cAsset = cAsset;
	}
	public Double getcOther() {
		return cOther == null ? 0 : cOther;
	}
	public void setcOther(Double cOther) {
		this.cOther = cOther;
	}
	public Double getPcPeople() {
		return pcPeople == null ? 0 : pcPeople;
	}
	public void setPcPeople(Double pcPeople) {
		this.pcPeople = pcPeople;
	}

}
