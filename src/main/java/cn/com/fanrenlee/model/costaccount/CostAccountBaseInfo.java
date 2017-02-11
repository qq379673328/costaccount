package cn.com.fanrenlee.model.costaccount;

/**
 * 分摊计算基础信息
 * 
 * @author lizhiyong
 *
 */
public class CostAccountBaseInfo {

	/**
	 * 总工作量-开单收入
	 */
	private Double totalCostKdsr;

	/**
	 * 总工作量-门诊执行收入
	 */
	private Double totalCostMzzxsr;

	/**
	 * 总工作量-住院执行收入
	 */
	private Double totalCostZyzxsr;

	/**
	 * 总工作量-消毒工作量
	 */
	private Double totalCostXdgzl;

	/**
	 * 总工作量-住院人数
	 */
	private Double totalCostInhos;

	/**
	 * 总工作量-门诊人次
	 */
	private Double totalCostMz;
	
	/**
	 * 总人数
	 */
	private Integer totalPeople;

	public Double getTotalCostKdsr() {
		return totalCostKdsr == null ? 0d : totalCostKdsr;
	}

	public void setTotalCostKdsr(Double totalCostKdsr) {
		this.totalCostKdsr = totalCostKdsr;
	}

	public Double getTotalCostMzzxsr() {
		return totalCostMzzxsr == null ? 0d : totalCostMzzxsr;
	}

	public void setTotalCostMzzxsr(Double totalCostMzzxsr) {
		this.totalCostMzzxsr = totalCostMzzxsr;
	}

	public Double getTotalCostZyzxsr() {
		return totalCostZyzxsr == null ? 0d : totalCostZyzxsr;
	}

	public void setTotalCostZyzxsr(Double totalCostZyzxsr) {
		this.totalCostZyzxsr = totalCostZyzxsr;
	}

	public Double getTotalCostXdgzl() {
		return totalCostXdgzl == null ? 0d : totalCostXdgzl;
	}

	public void setTotalCostXdgzl(Double totalCostXdgzl) {
		this.totalCostXdgzl = totalCostXdgzl;
	}

	public Double getTotalCostInhos() {
		return totalCostInhos == null ? 0d : totalCostInhos;
	}

	public void setTotalCostInhos(Double totalCostInhos) {
		this.totalCostInhos = totalCostInhos;
	}

	public Double getTotalCostMz() {
		return totalCostMz == null ? 0d : totalCostMz;
	}

	public void setTotalCostMz(Double totalCostMz) {
		this.totalCostMz = totalCostMz;
	}

	/*
	 * 获取总工作量
	 */
	public Double getTotalCost() {
		return getTotalCostInhos() + getTotalCostKdsr() + getTotalCostMz() + getTotalCostXdgzl() + getTotalCostMzzxsr()
				+ getTotalCostZyzxsr();
	}

	public Integer getTotalPeople() {
		return totalPeople;
	}

	public void setTotalPeople(Integer totalPeople) {
		this.totalPeople = totalPeople;
	}

}
