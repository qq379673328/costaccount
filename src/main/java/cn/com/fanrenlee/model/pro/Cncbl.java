package cn.com.fanrenlee.model.pro;

/**
 * 产能成本率
 * @author Lizy
 *
 */
public class Cncbl {
	
	private Integer id;
	private Integer type;
	private Integer level;
	private Integer tJobId;
	
	private String deptCode;
	private String deptName;
	/**
	 * 产能成本率-医生
	 */
	private Double ysCncbl;
	/**
	 * 产能成本率-主治医师
	 */
	private Double zzysCncbl;
	/**
	 * 产能成本率-护士
	 */
	private Double hsCncbl;
	/**
	 * 产能成本率-技师
	 */
	private Double jsCncbl;
	/**
	 * 产能成本率-其他人员
	 */
	private Double opCncbl;

	/**
	 * 产能成本率-房屋通用设备
	 */
	private Double houseCncbl;
	/**
	 * 产能成本率-专用设备
	 */
	private Double speCncbl;
	/**
	 * 产能成本率-无形资产
	 */
	private Double assetCncbl;
	/**
	 * 产能成本率-其他费用
	 */
	private Double ocCncbl;
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
	public Double getYsCncbl() {
		return ysCncbl == null ? 0 : ysCncbl;
	}
	public void setYsCncbl(Double ysCncbl) {
		this.ysCncbl = ysCncbl;
	}
	public Double getHsCncbl() {
		return hsCncbl == null ? 0 : hsCncbl;
	}
	public void setHsCncbl(Double hsCncbl) {
		this.hsCncbl = hsCncbl;
	}
	public Double getJsCncbl() {
		return jsCncbl == null ? 0 : jsCncbl;
	}
	public void setJsCncbl(Double jsCncbl) {
		this.jsCncbl = jsCncbl;
	}
	public Double getOpCncbl() {
		return opCncbl == null ? 0 : opCncbl;
	}
	public void setOpCncbl(Double opCncbl) {
		this.opCncbl = opCncbl;
	}
	public Double getHouseCncbl() {
		return houseCncbl == null ? 0 : houseCncbl;
	}
	public void setHouseCncbl(Double houseCncbl) {
		this.houseCncbl = houseCncbl;
	}
	public Double getSpeCncbl() {
		return speCncbl == null ? 0 : speCncbl;
	}
	public void setSpeCncbl(Double speCncbl) {
		this.speCncbl = speCncbl;
	}
	public Double getAssetCncbl() {
		return assetCncbl == null ? 0 : assetCncbl;
	}
	public void setAssetCncbl(Double assetCncbl) {
		this.assetCncbl = assetCncbl;
	}
	public Double getOcCncbl() {
		return ocCncbl == null ? 0 : ocCncbl;
	}
	public void setOcCncbl(Double ocCncbl) {
		this.ocCncbl = ocCncbl;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer gettJobId() {
		return tJobId;
	}
	public void settJobId(Integer tJobId) {
		this.tJobId = tJobId;
	}
	public Double getZzysCncbl() {
		return zzysCncbl == null ? 0 : zzysCncbl;
	}
	public void setZzysCncbl(Double zzysCncbl) {
		this.zzysCncbl = zzysCncbl;
	}
	
}
