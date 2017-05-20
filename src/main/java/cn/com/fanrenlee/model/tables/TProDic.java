package cn.com.fanrenlee.model.tables;

public class TProDic {
	private Integer id;

	private String proCode;

	private String proName;

	private Integer costTime;

	private Double pcYs;
	private Double pcHs;
	private Double pcJs;
	private Double pcO;
	private Integer tHospitalId;
	private Double wsclf;
	private Double ylfxjj;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Double getPcJs() {
		return pcJs == null ? 0 : pcJs;
	}

	public void setPcJs(Double pcJs) {
		this.pcJs = pcJs;
	}

	public Double getPcO() {
		return pcO == null ? 0 : pcO;
	}

	public void setPcO(Double pcO) {
		this.pcO = pcO;
	}

	public Integer gettHospitalId() {
		return tHospitalId;
	}

	public void settHospitalId(Integer tHospitalId) {
		this.tHospitalId = tHospitalId;
	}

	public Double getWsclf() {
		return wsclf;
	}

	public void setWsclf(Double wsclf) {
		this.wsclf = wsclf;
	}

	public Double getYlfxjj() {
		return ylfxjj;
	}

	public void setYlfxjj(Double ylfxjj) {
		this.ylfxjj = ylfxjj;
	}

	public Integer getCostTime() {
		return costTime == null ? 0 : costTime;
	}

	public void setCostTime(Integer costTime) {
		this.costTime = costTime;
	}

}