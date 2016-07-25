/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.model.costaccount;

/**
 * 成本核算原始数据条目
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
public class CADItem {
	
	/**
	 * 科室信息
	 */
	private DeptInfo deptInfo;
	
	/**
	 * 费用-人员经费
	 */
	private float costPeople;
	
	/**
	 * 费用-通用设备折旧费
	 */
	private float costOldDeviceCommon;
	
	/**
	 * 费用-专用设备折旧费
	 */
	private float costOldDeviceSpecial;
	
	
	/**
	 * 费用-房屋折旧费
	 */
	private float costOldHouse;
	
	/**
	 * 费用-无形资产摊销费
	 */
	private float costAssetAmortize;
	
	
	/**
	 * 费用-计提医疗风险基金
	 */
	private float costVCFunds;
	
	/**
	 * 费用-其它
	 */
	private float costOther;
	
	public float getCostPeople() {
		return costPeople;
	}

	public void setCostPeople(float costPeople) {
		this.costPeople = costPeople;
	}

	public float getCostOldDeviceCommon() {
		return costOldDeviceCommon;
	}

	public void setCostOldDeviceCommon(float costOldDeviceCommon) {
		this.costOldDeviceCommon = costOldDeviceCommon;
	}

	public float getCostOldDeviceSpecial() {
		return costOldDeviceSpecial;
	}

	public void setCostOldDeviceSpecial(float costOldDeviceSpecial) {
		this.costOldDeviceSpecial = costOldDeviceSpecial;
	}

	public float getCostOldHouse() {
		return costOldHouse;
	}

	public void setCostOldHouse(float costOldHouse) {
		this.costOldHouse = costOldHouse;
	}

	public float getCostAssetAmortize() {
		return costAssetAmortize;
	}

	public void setCostAssetAmortize(float costAssetAmortize) {
		this.costAssetAmortize = costAssetAmortize;
	}

	public float getCostVCFunds() {
		return costVCFunds;
	}

	public void setCostVCFunds(float costVCFunds) {
		this.costVCFunds = costVCFunds;
	}

	public float getCostOther() {
		return costOther;
	}

	public void setCostOther(float costOther) {
		this.costOther = costOther;
	}

	public DeptInfo getDeptInfo() {
		return deptInfo;
	}

	public void setDeptInfo(DeptInfo deptInfo) {
		this.deptInfo = deptInfo;
	}
	
}
