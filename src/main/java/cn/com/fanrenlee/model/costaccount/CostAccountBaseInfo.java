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
	private Float totalCostKdsr;

	/**
	 * 总工作量-执行收入
	 */
	private Float totalCostZxsr;

	/**
	 * 总工作量-消毒工作量
	 */
	private Float totalCostXdgzl;

	/**
	 * 总工作量-开单工作量
	 */
	private Float totalCostKdgzl;

	/**
	 * 总工作量-住院人数
	 */
	private Float totalCostZyrs;

	/**
	 * 总工作量-门诊量
	 */
	private Float totalCostMzl;

	/**
	 * 总人数
	 */
	private Integer totalPeople;

	public Float getTotalCostKdsr() {
		return totalCostKdsr;
	}

	public void setTotalCostKdsr(Float totalCostKdsr) {
		this.totalCostKdsr = totalCostKdsr;
	}

	public Float getTotalCostZxsr() {
		return totalCostZxsr;
	}

	public void setTotalCostZxsr(Float totalCostZxsr) {
		this.totalCostZxsr = totalCostZxsr;
	}

	public Float getTotalCostXdgzl() {
		return totalCostXdgzl;
	}

	public void setTotalCostXdgzl(Float totalCostXdgzl) {
		this.totalCostXdgzl = totalCostXdgzl;
	}

	public Float getTotalCostKdgzl() {
		return totalCostKdgzl;
	}

	public void setTotalCostKdgzl(Float totalCostKdgzl) {
		this.totalCostKdgzl = totalCostKdgzl;
	}

	public Float getTotalCostZyrs() {
		return totalCostZyrs;
	}

	public void setTotalCostZyrs(Float totalCostZyrs) {
		this.totalCostZyrs = totalCostZyrs;
	}

	public Float getTotalCostMzl() {
		return totalCostMzl;
	}

	public void setTotalCostMzl(Float totalCostMzl) {
		this.totalCostMzl = totalCostMzl;
	}

	public Integer getTotalPeople() {
		return totalPeople;
	}

	public void setTotalPeople(Integer totalPeople) {
		this.totalPeople = totalPeople;
	}

	/*
	 * 获取总工作量
	 */
	public Float getTotalCost() {
		return this.totalCostKdgzl + this.totalCostKdsr + this.totalCostMzl + this.totalCostXdgzl + this.totalCostZxsr
				+ this.totalCostZyrs + this.totalPeople;
	}

}
