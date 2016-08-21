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
	 * 分项-人员经费-主治医师
	 */
	private Float costSharePeopleZzys;
	
	/**
	 * 分项-人员经费-副主任医师
	 */
	private Float costSharePeopleFzrys;
	
	/**
	 * 分项-人员经费-主任医师
	 */
	private Float costSharePeopleZrys;
	
	/**
	 * 分项-人员经费-主任技师
	 */
	private Float costSharePeopleJs;
	
	/**
	 * 分项-人员经费-护士
	 */
	private Float costSharePeopleHs;
	
	/**
	 * 分项-人员经费-其他
	 */
	private Float costSharePeopleQt;
	
	
	public Float getCostSharePeopleZzys() {
		return costSharePeopleZzys;
	}

	public void setCostSharePeopleZzys(Float costSharePeopleZzys) {
		this.costSharePeopleZzys = costSharePeopleZzys;
	}

	public Float getCostSharePeopleFzrys() {
		return costSharePeopleFzrys;
	}

	public void setCostSharePeopleFzrys(Float costSharePeopleFzrys) {
		this.costSharePeopleFzrys = costSharePeopleFzrys;
	}

	public Float getCostSharePeopleZrys() {
		return costSharePeopleZrys;
	}

	public void setCostSharePeopleZrys(Float costSharePeopleZrys) {
		this.costSharePeopleZrys = costSharePeopleZrys;
	}

	public Float getCostSharePeopleJs() {
		return costSharePeopleJs;
	}

	public void setCostSharePeopleJs(Float costSharePeopleJs) {
		this.costSharePeopleJs = costSharePeopleJs;
	}

	public Float getCostSharePeopleHs() {
		return costSharePeopleHs;
	}

	public void setCostSharePeopleHs(Float costSharePeopleHs) {
		this.costSharePeopleHs = costSharePeopleHs;
	}

	public Float getCostSharePeopleQt() {
		return costSharePeopleQt;
	}

	public void setCostSharePeopleQt(Float costSharePeopleQt) {
		this.costSharePeopleQt = costSharePeopleQt;
	}

	/**
	 * 分项-房屋、通用设备折旧费
	 */
	private Float costShareOldHouseDeviceCommon;
	/**
	 * 分项-专用设备折旧费
	 */
	private Float costShareOldDeviceSpecial;
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
			Float costShareOldHouseDeviceCommon, Float costShareOldDeviceSpecial,
			Float costShareassetAmortize,
			Float costSharevcFunds, Float costShareOther) {
		super();
		this.costShare = costShare;
		this.costSharePeople = costSharePeople;
		this.costShareOldHouseDeviceCommon = costShareOldHouseDeviceCommon;
		this.costShareOldDeviceSpecial = costShareOldDeviceSpecial;
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

	public Float getCostShareOldHouseDeviceCommon() {
		return costShareOldHouseDeviceCommon;
	}

	public void setCostShareOldHouseDeviceCommon(Float costShareOldHouseDeviceCommon) {
		this.costShareOldHouseDeviceCommon = costShareOldHouseDeviceCommon;
	}

	public Float getCostShareOldDeviceSpecial() {
		return costShareOldDeviceSpecial;
	}

	public void setCostShareOldDeviceSpecial(Float costShareOldDeviceSpecial) {
		this.costShareOldDeviceSpecial = costShareOldDeviceSpecial;
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
