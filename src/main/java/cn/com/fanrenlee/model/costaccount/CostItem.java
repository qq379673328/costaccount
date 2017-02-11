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
	private Double costShare;
	/**
	 * 分项-人员经费
	 */
	private Double costSharePeople;
	
	/**
	 * 分项-人员经费-主治医师
	 */
	private Double costSharePeopleZzys;
	
	/**
	 * 分项-人员经费-副主任医师
	 */
	private Double costSharePeopleFzrys;
	
	/**
	 * 分项-人员经费-主任医师
	 */
	private Double costSharePeopleZrys;
	
	/**
	 * 分项-人员经费-主任技师
	 */
	private Double costSharePeopleJs;
	
	/**
	 * 分项-人员经费-护士
	 */
	private Double costSharePeopleHs;
	
	/**
	 * 分项-人员经费-其他
	 */
	private Double costSharePeopleQt;
	
	
	public Double getCostSharePeopleZzys() {
		return costSharePeopleZzys;
	}

	public void setCostSharePeopleZzys(Double costSharePeopleZzys) {
		this.costSharePeopleZzys = costSharePeopleZzys;
	}

	public Double getCostSharePeopleFzrys() {
		return costSharePeopleFzrys;
	}

	public void setCostSharePeopleFzrys(Double costSharePeopleFzrys) {
		this.costSharePeopleFzrys = costSharePeopleFzrys;
	}

	public Double getCostSharePeopleZrys() {
		return costSharePeopleZrys;
	}

	public void setCostSharePeopleZrys(Double costSharePeopleZrys) {
		this.costSharePeopleZrys = costSharePeopleZrys;
	}

	public Double getCostSharePeopleJs() {
		return costSharePeopleJs;
	}

	public void setCostSharePeopleJs(Double costSharePeopleJs) {
		this.costSharePeopleJs = costSharePeopleJs;
	}

	public Double getCostSharePeopleHs() {
		return costSharePeopleHs;
	}

	public void setCostSharePeopleHs(Double costSharePeopleHs) {
		this.costSharePeopleHs = costSharePeopleHs;
	}

	public Double getCostSharePeopleQt() {
		return costSharePeopleQt;
	}

	public void setCostSharePeopleQt(Double costSharePeopleQt) {
		this.costSharePeopleQt = costSharePeopleQt;
	}

	/**
	 * 分项-房屋、通用设备折旧费
	 */
	private Double costShareOldHouseDeviceCommon;
	/**
	 * 分项-专用设备折旧费
	 */
	private Double costShareOldDeviceSpecial;
	
	/**
	 * 分项-卫生材料
	 */
	private Double costShareWscl;
	
	/**
	 * 分项-无形资产摊销费
	 */
	private Double costShareassetAmortize;
	/**
	 * 分项-计提医疗风险基金
	 */
	private Double costSharevcFunds;
	/**
	 * 分项-其它
	 */
	private Double costShareOther;
	
	public CostItem(){
		
	}

	public CostItem(Double costShare, Double costSharePeople, Double costShareWscl,
			Double costShareOldHouseDeviceCommon, Double costShareOldDeviceSpecial,
			Double costShareassetAmortize,
			Double costSharevcFunds, Double costShareOther) {
		super();
		this.costShare = costShare;
		this.costSharePeople = costSharePeople;
		this.costShareWscl = costShareWscl;
		this.costShareOldHouseDeviceCommon = costShareOldHouseDeviceCommon;
		this.costShareOldDeviceSpecial = costShareOldDeviceSpecial;
		this.costShareassetAmortize = costShareassetAmortize;
		this.costSharevcFunds = costSharevcFunds;
		this.costShareOther = costShareOther;
	}

	public Double getCostShare() {
		return costShare;
	}

	public void setCostShare(Double costShare) {
		this.costShare = costShare;
	}

	public Double getCostSharePeople() {
		return costSharePeople;
	}

	public void setCostSharePeople(Double costSharePeople) {
		this.costSharePeople = costSharePeople;
	}

	public Double getCostShareOldHouseDeviceCommon() {
		return costShareOldHouseDeviceCommon;
	}

	public void setCostShareOldHouseDeviceCommon(Double costShareOldHouseDeviceCommon) {
		this.costShareOldHouseDeviceCommon = costShareOldHouseDeviceCommon;
	}

	public Double getCostShareOldDeviceSpecial() {
		return costShareOldDeviceSpecial;
	}

	public void setCostShareOldDeviceSpecial(Double costShareOldDeviceSpecial) {
		this.costShareOldDeviceSpecial = costShareOldDeviceSpecial;
	}

	public Double getCostShareassetAmortize() {
		return costShareassetAmortize;
	}

	public void setCostShareassetAmortize(Double costShareassetAmortize) {
		this.costShareassetAmortize = costShareassetAmortize;
	}

	public Double getCostSharevcFunds() {
		return costSharevcFunds;
	}

	public void setCostSharevcFunds(Double costSharevcFunds) {
		this.costSharevcFunds = costSharevcFunds;
	}

	public Double getCostShareOther() {
		return costShareOther;
	}

	public void setCostShareOther(Double costShareOther) {
		this.costShareOther = costShareOther;
	}

	public Double getCostShareWscl() {
		return costShareWscl;
	}

	public void setCostShareWscl(Double costShareWscl) {
		this.costShareWscl = costShareWscl;
	}

}
