package cn.com.fanrenlee.model.pro;

/**
 * 项目成本
 * 
 * @author Lizy
 *
 */
public class ProCost {

	private Integer id;
	private String deptCode;
	private String deptName;
	private String proName;
	private String proCode;
	private Double costPeopleDirect;
	private Double costPeopleMidYw;
	private Double costPeopleMidAll;
	private Double costHouseDirect;
	private Double costHouseMidYw;
	private Double costHouseMidAll;
	private Double costSpeDirect;
	private Double costSpeMidYw;
	private Double costSpeMidAll;
	private Double costAssetDirect;
	private Double costAssetMidYw;
	private Double costAssetMidAll;
	private Double costOtherDirect;
	private Double costOtherMidYw;
	private Double costOtherMidAll;
	private Double costWsclf;
	private Double costYlfxjj;
	private Integer tJobId;
	private Integer level;
	private Integer type;

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

	public Double getCostPeopleDirect() {
		return costPeopleDirect == null ? 0 : costPeopleDirect;
	}

	public void setCostPeopleDirect(Double costPeopleDirect) {
		this.costPeopleDirect = costPeopleDirect;
	}

	public Double getCostHouseDirect() {
		return costHouseDirect == null ? 0 : costHouseDirect;
	}

	public void setCostHouseDirect(Double costHouseDirect) {
		this.costHouseDirect = costHouseDirect;
	}

	public Double getCostSpeDirect() {
		return costSpeDirect == null ? 0 : costSpeDirect;
	}

	public void setCostSpeDirect(Double costSpeDirect) {
		this.costSpeDirect = costSpeDirect;
	}

	public Double getCostAssetDirect() {
		return costAssetDirect == null ? 0 : costAssetDirect;
	}

	public void setCostAssetDirect(Double costAssetDirect) {
		this.costAssetDirect = costAssetDirect;
	}

	public Double getCostOtherDirect() {
		return costOtherDirect == null ? 0 : costOtherDirect;
	}

	public void setCostOtherDirect(Double costOtherDirect) {
		this.costOtherDirect = costOtherDirect;
	}

	public Double getCostWsclf() {
		return costWsclf == null ? 0 : costWsclf;
	}

	public void setCostWsclf(Double costWsclf) {
		this.costWsclf = costWsclf;
	}

	public Double getCostYlfxjj() {
		return costYlfxjj == null ? 0 : costYlfxjj;
	}

	public void setCostYlfxjj(Double costYlfxjj) {
		this.costYlfxjj = costYlfxjj;
	}

	public Double getCostPeopleMidYw() {
		return costPeopleMidYw == null ? 0 : costPeopleMidYw;
	}

	public void setCostPeopleMidYw(Double costPeopleMidYw) {
		this.costPeopleMidYw = costPeopleMidYw;
	}

	public Double getCostPeopleMidAll() {
		return costPeopleMidAll == null ? 0 : costPeopleMidAll;
	}

	public void setCostPeopleMidAll(Double costPeopleMidAll) {
		this.costPeopleMidAll = costPeopleMidAll;
	}

	public Double getCostHouseMidYw() {
		return costHouseMidYw == null ? 0 : costHouseMidYw;
	}

	public void setCostHouseMidYw(Double costHouseMidYw) {
		this.costHouseMidYw = costHouseMidYw;
	}

	public Double getCostHouseMidAll() {
		return costHouseMidAll == null ? 0 : costHouseMidAll;
	}

	public void setCostHouseMidAll(Double costHouseMidAll) {
		this.costHouseMidAll = costHouseMidAll;
	}

	public Double getCostSpeMidYw() {
		return costSpeMidYw == null ? 0 : costSpeMidYw;
	}

	public void setCostSpeMidYw(Double costSpeMidYw) {
		this.costSpeMidYw = costSpeMidYw;
	}

	public Double getCostSpeMidAll() {
		return costSpeMidAll == null ? 0 : costSpeMidAll;
	}

	public void setCostSpeMidAll(Double costSpeMidAll) {
		this.costSpeMidAll = costSpeMidAll;
	}

	public Double getCostAssetMidYw() {
		return costAssetMidYw == null ? 0 : costAssetMidYw;
	}

	public void setCostAssetMidYw(Double costAssetMidYw) {
		this.costAssetMidYw = costAssetMidYw;
	}

	public Double getCostAssetMidAll() {
		return costAssetMidAll == null ? 0 : costAssetMidAll;
	}

	public void setCostAssetMidAll(Double costAssetMidAll) {
		this.costAssetMidAll = costAssetMidAll;
	}

	public Double getCostOtherMidYw() {
		return costOtherMidYw == null ? 0 : costOtherMidYw;
	}

	public void setCostOtherMidYw(Double costOtherMidYw) {
		this.costOtherMidYw = costOtherMidYw;
	}

	public Double getCostOtherMidAll() {
		return costOtherMidAll == null ? 0 : costOtherMidAll;
	}

	public void setCostOtherMidAll(Double costOtherMidAll) {
		this.costOtherMidAll = costOtherMidAll;
	}

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

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
