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
	private Double nd;

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
		return wsclf == null ? 0 : wsclf;
	}

	public void setWsclf(Double wsclf) {
		this.wsclf = wsclf;
	}

	public Double getYlfxjj() {
		return ylfxjj == null ? 0 : ylfxjj;
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

	/**
	 * 是否有医生参与
	 * 
	 * @return
	 */
	public boolean isDoctorIn() {
		return this.pcYs == null || this.pcYs == 0 ? false : true;
	}

	/**
	 * 是否只有护士参与
	 * 
	 * @return
	 */
	public boolean isOnlyHsIn() {
		return (this.pcYs == null || this.pcYs == 0) && (this.pcJs == null || this.pcJs == 0)
				&& (this.pcO == null || this.pcO == 0) && (this.pcHs != null && this.pcHs > 0) ? true : false;
	}

	/**
	 * 是否只有技师参与
	 * 
	 * @return
	 */
	public boolean isOnlyJsIn() {
		return (this.pcYs == null || this.pcYs == 0) && (this.pcHs == null || this.pcHs == 0)
				&& (this.pcO == null || this.pcO == 0) && (this.pcJs != null && this.pcJs > 0) ? true : false;
	}

	/**
	 * 是否只有药师参与
	 * 
	 * @return
	 */
	public boolean isOnlyYsIn() {
		return (this.pcYs == null || this.pcYs == 0) && (this.pcJs == null || this.pcJs == 0)
				&& (this.pcHs == null || this.pcHs == 0) && (this.pcO != null && this.pcO > 0) ? true : false;
	}
	
	/**
	 * 总消耗人数
	 * @return
	 */
	public Double getTotalPerson() {
		return this.pcYs + this.pcHs + this.pcJs + this.pcO;
	}

	public Double getNd() {
		return nd == null ? 0 : nd;
	}

	public void setNd(Double nd) {
		this.nd = nd;
	}

}