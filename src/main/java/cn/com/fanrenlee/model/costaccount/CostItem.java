/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.model.costaccount;

/**
 * 分摊成本
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月26日
 */
public class CostItem {

	/**
	 * 直接成本
	 */
	private Float costShare;
	/**
	 * 分项-人员经费
	 */
	private Float costSharePeople;
	/**
	 * 分项-通用设备折旧费
	 */
	private Float costShareoldDeviceCommon;
	/**
	 * 分项-专用设备折旧费
	 */
	private Float costShareoldDeviceSpecial;
	/**
	 * 分项-房屋折旧费
	 */
	private Float costShareoldHouse;
	/**
	 * 分项-无形资产摊销费
	 */
	private Float costShareassetAmortize;
	/**
	 * 分项-计提医疗风险基金
	 */
	private Float costSharevcFunds;
	/**
	 * 分项-其它
	 */
	private Float costShareOther;
	
	public CostItem(){
		
	}

	public CostItem(Float costShare, Float costSharePeople,
			Float costShareoldDeviceCommon, Float costShareoldDeviceSpecial,
			Float costShareoldHouse, Float costShareassetAmortize,
			Float costSharevcFunds, Float costShareOther) {
		super();
		this.costShare = costShare;
		this.costSharePeople = costSharePeople;
		this.costShareoldDeviceCommon = costShareoldDeviceCommon;
		this.costShareoldDeviceSpecial = costShareoldDeviceSpecial;
		this.costShareoldHouse = costShareoldHouse;
		this.costShareassetAmortize = costShareassetAmortize;
		this.costSharevcFunds = costSharevcFunds;
		this.costShareOther = costShareOther;
	}

	public Float getCostShare() {
		return costShare;
	}

	public void setCostShare(Float costShare) {
		this.costShare = costShare;
	}

	public Float getCostSharePeople() {
		return costSharePeople;
	}

	public void setCostSharePeople(Float costSharePeople) {
		this.costSharePeople = costSharePeople;
	}

	public Float getCostShareoldDeviceCommon() {
		return costShareoldDeviceCommon;
	}

	public void setCostShareoldDeviceCommon(Float costShareoldDeviceCommon) {
		this.costShareoldDeviceCommon = costShareoldDeviceCommon;
	}

	public Float getCostShareoldDeviceSpecial() {
		return costShareoldDeviceSpecial;
	}

	public void setCostShareoldDeviceSpecial(Float costShareoldDeviceSpecial) {
		this.costShareoldDeviceSpecial = costShareoldDeviceSpecial;
	}

	public Float getCostShareoldHouse() {
		return costShareoldHouse;
	}

	public void setCostShareoldHouse(Float costShareoldHouse) {
		this.costShareoldHouse = costShareoldHouse;
	}

	public Float getCostShareassetAmortize() {
		return costShareassetAmortize;
	}

	public void setCostShareassetAmortize(Float costShareassetAmortize) {
		this.costShareassetAmortize = costShareassetAmortize;
	}

	public Float getCostSharevcFunds() {
		return costSharevcFunds;
	}

	public void setCostSharevcFunds(Float costSharevcFunds) {
		this.costSharevcFunds = costSharevcFunds;
	}

	public Float getCostShareOther() {
		return costShareOther;
	}

	public void setCostShareOther(Float costShareOther) {
		this.costShareOther = costShareOther;
	}

}
