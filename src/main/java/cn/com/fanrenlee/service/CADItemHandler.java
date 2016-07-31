/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.fanrenlee.model.common.DeptTypeInfos;
import cn.com.fanrenlee.model.costaccount.CADItem;
import cn.com.fanrenlee.model.costaccount.CostItem;
import cn.com.fanrenlee.model.tables.TCostaccountJobBaseinfo;

/**
 * 成本核算分摊处理工具类
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月26日
 */
public class CADItemHandler {

	/**
	 * 科室code分隔符
	 */
	public static final String CODE_SEP = ",";

	/**
	 * 原始业务数据
	 */
	private List<CADItem> cadItems;

	/**
	 * 基础数据
	 */
	private TCostaccountJobBaseinfo baseInfo;

	/**
	 * 科室直接成本
	 */
	private Map<String, CostItem> costDirectMap = new HashMap<String, CostItem>();

	/**
	 * 科室全成本
	 */
	private Map<String, Float> costAllMap = new HashMap<String, Float>();

	/**
	 * 一级分摊
	 */
	private Map<String, CostItem> costLevel1 = new HashMap<String, CostItem>();
	/**
	 * 二级分摊
	 */
	private Map<String, CostItem> costLevel2 = new HashMap<String, CostItem>();
	/**
	 * 三级分摊
	 */
	private Map<String, CostItem> costLevel3 = new HashMap<String, CostItem>();

	/**
	 * 科室分摊
	 */
	private Map<String, CostItem> costItemFentan = new HashMap<String, CostItem>();

	/**
	 * 科室code name转换map
	 */
	private Map<String, String> deptCodeNameMap = new HashMap<String, String>();

	/**
	 * 某科室类型人员总数
	 */
	private Map<String, Integer> deptTypePeopleCount = new HashMap<String, Integer>();

	public CADItemHandler(List<CADItem> cadItems, TCostaccountJobBaseinfo baseInfo) {
		this.setCadItems(cadItems);
		this.setBaseInfo(baseInfo);

		deptTypePeopleCount.put("XZHQ", 0);
		deptTypePeopleCount.put("YF", 0);
		deptTypePeopleCount.put("YJ", 0);
		deptTypePeopleCount.put("LC", 0);

		for (CADItem item : cadItems) {
			getDeptCodeNameMap().put(item.getDeptCode(), item.getDeptName());

			String deptType = item.getDeptTypeCode();
			deptTypePeopleCount.put(deptType, deptTypePeopleCount.get(deptType) + item.getPeopleCount());

			CostItem newItem = new CostItem();
			newItem.setCostSharePeople(item.getCostPeople());
			newItem.setCostShareassetAmortize(item.getCostPeople());
			newItem.setCostShareoldDeviceCommon(item.getCostOldDeviceCommon());
			newItem.setCostShareoldDeviceSpecial(item.getCostOldDeviceSpecial());
			newItem.setCostShareoldHouse(item.getCostOldHouse());
			newItem.setCostShareOther(item.getCostOther());
			newItem.setCostSharevcFunds(item.getCostVcFunds());

			costItemFentan.put(item.getDeptCode(), newItem);

		}
	}

	/**
	 * 处理数据
	 */
	public void handle() {
		// 计算直接成本、行政后勤科室全成本
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 直接成本
			float costDirect = cadItem.getCostAssetAmortize() + cadItem.getCostOldDeviceCommon()
					+ cadItem.getCostOldDeviceSpecial() + cadItem.getCostOldHouse() + cadItem.getCostOther()
					+ cadItem.getCostPeople() + cadItem.getCostVcFunds();
			CostItem costItem = new CostItem(costDirect, cadItem.getCostPeople(), cadItem.getCostOldDeviceCommon(),
					cadItem.getCostOldDeviceSpecial(), cadItem.getCostOldHouse(), cadItem.getCostAssetAmortize(),
					cadItem.getCostVcFunds(), cadItem.getCostOther());
			getCostDirectMap().put(deptCode, costItem);
			// 行政后勤科室
			if (DeptTypeInfos.TYPECODE_XZHQ.equals(cadItem.getDeptTypeCode())) {
				getCostAllMap().put(deptCode, costDirect);
			}
		}

		// 计算一级分摊
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 非行政后勤科室
			if (!cadItem.isDeptTypeXZHQ()) {
				// 科室全成本
				Float allCost = 0f;
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非行政后勤科室过滤
					if (!cadItemIn.isDeptTypeXZHQ()) {
						continue;
					}
					// 该医辅科室人员数 /（全院人数 - 该行政后勤科室人员数） × 该行政后勤科室全成本
					Float baseCount = Float.valueOf(cadItem.getPeopleCount())
							/ (getAllPeopleCount() - cadItemIn.getPeopleCount());

					Float baseCountDirect = Float.valueOf(cadItem.getPeopleCount())
							/ (getAllPeopleCount() - deptTypePeopleCount.get("XZHQ"));

					CostItem costItemSrc = getCostDirectMap().get(deptCodeIn);
					// 一级分摊
					Float level1 = baseCount * getCostAllMap().get(deptCodeIn);
					/*CostItem costItem = new CostItem(level1,
							baseCountDirect * cadItemIn.getCostPeople() + cadItem.getCostPeople(),
							baseCountDirect * cadItemIn.getCostOldDeviceCommon() + cadItem.getCostOldDeviceCommon(),
							baseCountDirect * cadItemIn.getCostOldDeviceSpecial() + cadItem.getCostOldDeviceSpecial(),
							baseCountDirect * cadItemIn.getCostOldHouse() + cadItem.getCostOldHouse(),
							baseCountDirect * cadItemIn.getCostAssetAmortize() + cadItem.getCostAssetAmortize(),
							baseCountDirect * cadItemIn.getCostVcFunds() + cadItem.getCostVcFunds(),
							baseCountDirect * cadItemIn.getCostOther() + cadItem.getCostOther());*/
					CostItem costItem = new CostItem(level1,
							baseCountDirect * cadItemIn.getCostPeople(),
							baseCountDirect * cadItemIn.getCostOldDeviceCommon(),
							baseCountDirect * cadItemIn.getCostOldDeviceSpecial(),
							baseCountDirect * cadItemIn.getCostOldHouse(),
							baseCountDirect * cadItemIn.getCostAssetAmortize(),
							baseCountDirect * cadItemIn.getCostVcFunds(),
							baseCountDirect * cadItemIn.getCostOther());
					
					getCostLevel1().put(deptCode + CODE_SEP + deptCodeIn, costItem);

					//重新计算分摊后成本
					CostItem tempCostItem = costItemFentan.get(deptCode);
					tempCostItem.setCostSharePeople(tempCostItem.getCostSharePeople() + costItem.getCostSharePeople());
					tempCostItem.setCostSharePeople(
							tempCostItem.getCostShareoldDeviceCommon() + costItem.getCostShareoldDeviceCommon());
					tempCostItem.setCostSharePeople(
							tempCostItem.getCostShareoldDeviceSpecial() + costItem.getCostShareoldDeviceSpecial());
					tempCostItem
							.setCostSharePeople(tempCostItem.getCostShareoldHouse() + costItem.getCostShareoldHouse());
					tempCostItem.setCostSharePeople(
							tempCostItem.getCostShareassetAmortize() + costItem.getCostShareassetAmortize());
					tempCostItem
							.setCostSharePeople(tempCostItem.getCostSharevcFunds() + costItem.getCostSharevcFunds());
					tempCostItem.setCostSharePeople(tempCostItem.getCostShareOther() + costItem.getCostShareOther());

					// 医辅科室全成本计算
					allCost += level1;

				}
				// 非行政后勤
				if (!cadItem.isDeptTypeXZHQ()) {
					getCostAllMap().put(deptCode, allCost);
				}
			}
		}

		// 计算二级分摊
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 医技科室和临床科室
			if (cadItem.isDeptTypeYJ() || cadItem.isDeptTypeLC()) {
				// 科室全成本
				Float allCost = getCostAllMap().get(deptCode) == null ? 0f : getCostAllMap().get(deptCode);
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非医辅科室过滤
					if (!cadItemIn.isDeptTypeYF()) {
						continue;
					}
					// 二级分摊
					Float baseCount = getLevel2BaseCount(cadItem, cadItemIn);
					CostItem costItemSrc = getCostDirectMap().get(deptCodeIn);
					// 一级分摊
					Float level2 = baseCount * getCostAllMap().get(deptCodeIn);
					
					/*CostItem level1CostItem = costLevel1.get(deptCode + CODE_SEP + deptCodeIn);
					CostItem costItem = new CostItem(level2,
					cadItem.getCostPeople() + level1CostItem.getCostSharePeople()
							+ baseCount * costItemFentan.get(deptCode).getCostSharePeople(),
					cadItem.getCostOldDeviceCommon() + level1CostItem.getCostShareoldDeviceCommon()
							+ baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceCommon(),
					cadItem.getCostOldDeviceSpecial() + level1CostItem.getCostShareoldDeviceSpecial()
							+ baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceSpecial(),
					cadItem.getCostOldHouse() + level1CostItem.getCostShareoldHouse()
							+ baseCount * costItemFentan.get(deptCode).getCostShareoldHouse(),
					cadItem.getCostAssetAmortize() + level1CostItem.getCostShareassetAmortize()
							+ baseCount * costItemFentan.get(deptCode).getCostShareassetAmortize(),
					cadItem.getCostVcFunds() + level1CostItem.getCostSharevcFunds()
							+ baseCount * costItemFentan.get(deptCode).getCostSharevcFunds(),
					cadItem.getCostOther() + level1CostItem.getCostShareOther()
							+ baseCount * costItemFentan.get(deptCode).getCostShareOther());*/
					
					CostItem costItem = new CostItem(level2,
							baseCount * costItemFentan.get(deptCode).getCostSharePeople(),
							baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceCommon(),
							baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceSpecial(),
							baseCount * costItemFentan.get(deptCode).getCostShareoldHouse(),
							baseCount * costItemFentan.get(deptCode).getCostShareassetAmortize(),
							baseCount * costItemFentan.get(deptCode).getCostSharevcFunds(),
							baseCount * costItemFentan.get(deptCode).getCostShareOther());
					

					getCostLevel2().put(deptCode + CODE_SEP + deptCodeIn, costItem);

					//重新计算分摊后成本
					CostItem tempCostItem = costItemFentan.get(deptCode);
					tempCostItem.setCostSharePeople(tempCostItem.getCostSharePeople() + costItem.getCostSharePeople());
					tempCostItem.setCostSharePeople(
							tempCostItem.getCostShareoldDeviceCommon() + costItem.getCostShareoldDeviceCommon());
					tempCostItem.setCostSharePeople(
							tempCostItem.getCostShareoldDeviceSpecial() + costItem.getCostShareoldDeviceSpecial());
					tempCostItem
							.setCostSharePeople(tempCostItem.getCostShareoldHouse() + costItem.getCostShareoldHouse());
					tempCostItem.setCostSharePeople(
							tempCostItem.getCostShareassetAmortize() + costItem.getCostShareassetAmortize());
					tempCostItem
							.setCostSharePeople(tempCostItem.getCostSharevcFunds() + costItem.getCostSharevcFunds());
					tempCostItem.setCostSharePeople(tempCostItem.getCostShareOther() + costItem.getCostShareOther());
					
					// 科室全成本计算
					allCost += level2;
				}
				if (cadItem.isDeptTypeYJ() || cadItem.isDeptTypeLC()) {
					getCostAllMap().put(deptCode, allCost);
				}
			}
		}

		// 计算三级分摊
		for (CADItem cadItem : cadItems) {
			// 临床科室
			if (cadItem.isDeptTypeLC()) {
				String deptCode = cadItem.getDeptCode();
				// 科室全成本
				Float allCost = getCostAllMap().get(deptCode) == null ? 0f : getCostAllMap().get(deptCode);
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非医技科室过滤
					if (!cadItemIn.isDeptTypeYJ()) {
						continue;
					}
					// 三级分摊
					Float baseCount = cadItem.getWorkCountKd() / cadItemIn.getWorkCount();

					CostItem costItemSrc = getCostDirectMap().get(deptCodeIn);
					Float level3 = baseCount * getCostAllMap().get(deptCodeIn);

					/*CostItem level1CostItem = costLevel1.get(deptCode + CODE_SEP + deptCodeIn);
					CostItem level2CostItem = costLevel2.get(deptCode + CODE_SEP + deptCodeIn);
					CostItem costItem = new CostItem(level3,
							cadItem.getCostPeople() + level1CostItem.getCostSharePeople()
									+ level2CostItem.getCostSharePeople()
									+ baseCount * costItemFentan.get(deptCode).getCostSharePeople(),
							cadItem.getCostOldDeviceCommon() + level1CostItem.getCostShareoldDeviceCommon()
									+ level2CostItem.getCostShareoldDeviceCommon()
									+ baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceCommon(),
							cadItem.getCostOldDeviceSpecial() + level1CostItem.getCostShareoldDeviceSpecial()
									+ level2CostItem.getCostShareoldDeviceSpecial()
									+ baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceSpecial(),
							cadItem.getCostOldHouse() + level1CostItem.getCostShareoldHouse()
									+ level2CostItem.getCostShareoldHouse()
									+ baseCount * costItemFentan.get(deptCode).getCostShareoldHouse(),
							cadItem.getCostAssetAmortize() + level1CostItem.getCostShareassetAmortize()
									+ level2CostItem.getCostShareassetAmortize()
									+ baseCount * costItemFentan.get(deptCode).getCostShareassetAmortize(),
							cadItem.getCostVcFunds() + level1CostItem.getCostSharevcFunds()
									+ level2CostItem.getCostSharevcFunds()
									+ baseCount * costItemFentan.get(deptCode).getCostSharevcFunds(),
							cadItem.getCostOther() + level1CostItem.getCostShareOther()
									+ level2CostItem.getCostShareOther()
									+ baseCount * costItemFentan.get(deptCode).getCostShareOther());*/
					
					CostItem costItem = new CostItem(level3,
									baseCount * costItemFentan.get(deptCode).getCostSharePeople(),
									baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceCommon(),
									baseCount * costItemFentan.get(deptCode).getCostShareoldDeviceSpecial(),
									baseCount * costItemFentan.get(deptCode).getCostShareoldHouse(),
									baseCount * costItemFentan.get(deptCode).getCostShareassetAmortize(),
									baseCount * costItemFentan.get(deptCode).getCostSharevcFunds(),
									baseCount * costItemFentan.get(deptCode).getCostShareOther());

					getCostLevel3().put(deptCode + CODE_SEP + deptCodeIn, costItem);

					// 科室全成本计算
					allCost += level3;
				}
				if (cadItem.isDeptTypeLC()) {
					getCostAllMap().put(deptCode, allCost);
				}
			}
		}

	}

	// 处理二级分摊
	private Float getLevel2BaseCount(CADItem cadItem, CADItem cadItemIn) {
		// 二级分摊
		Float level2 = 0f;
		// 某医技科室分摊的供应室全成本 = 该医技科室消毒工作量 / 全院消毒工作总量 × 供应室全成本
		if (cadItem.isDeptTypeYJ() && cadItemIn.isDeptSpecialSupply()) {
			level2 = cadItem.getWorkCountXd() / getTotalWorkDisinfected();
			// 某临床科室中门诊科室分摊的门诊收费处全成本 = 该门诊科室门诊量 / 全院门诊总量 × 门诊收费处全成本
			// 某临床科室中门诊科室分摊的挂号处全成本 = 该门诊科室门诊量 / 全院门诊总量 × 挂号处全成本
		} else if (cadItem.isDeptTypeLC() && cadItem.isDeptSpecialOutpatient()
				&& (cadItemIn.isDeptSpecialOutpatientCashier() || cadItemIn.isDeptSpecialRegister())) {
			level2 = cadItem.getWorkCountMz() / getTotalWorkOutpatient();
			// 某临床科室中住院科室分摊的住院收费处全成本 = 该住院科室住院人数 / 全院住院总人数 × 住院收费处全成本
			// 某临床科室中住院科室分摊的病案室成本 = 该住院科室住院人数 / 全院住院总人数 × 病案室全成本
		} else if (cadItem.isDeptTypeLC() && cadItem.isDeptSpecialInhos()
				&& (cadItemIn.isDeptSpecialInhosCashier() || cadItemIn.isDeptSpecialMedicalRecord())) {
			level2 = cadItem.getWorkCountInhos() / getTotalInhos();
			// 某临床科室分摊的供应室成本 = 该临床科室消毒工作量 / 全院消毒工作总量 × 供应室全成本
		} else if (cadItem.isDeptTypeLC() && cadItem.isDeptSpecialSupply()) {
			level2 = cadItem.getWorkCountXd() / getTotalWorkDisinfected();
		} else {// 默认
			level2 = cadItem.getWorkCount() / getTotalWork();
		}
		return level2;
	}

	/**
	 * 全院总人数
	 */
	private Integer getAllPeopleCount() {
		return this.getBaseInfo().getTotalPeople();
	}

	/**
	 * 全院总工作量
	 */
	private Float getTotalWork() {
		return this.getBaseInfo().getTotalWork();
	}

	/**
	 * 全院消毒总工作量
	 */
	private Float getTotalWorkDisinfected() {
		return this.getBaseInfo().getTotalWorkDisinfected();
	}

	/**
	 * 全院住院总人数
	 */
	private Integer getTotalInhos() {
		return this.getBaseInfo().getTotalInhos();
	}

	/**
	 * 全院门诊总工作量
	 */
	private Float getTotalWorkOutpatient() {
		return this.getBaseInfo().getTotalWorkOutpatient();
	}

	public List<CADItem> getCadItems() {
		return cadItems;
	}

	public void setCadItems(List<CADItem> cadItems) {
		this.cadItems = cadItems;
	}

	public TCostaccountJobBaseinfo getBaseInfo() {
		return baseInfo;
	}

	public void setBaseInfo(TCostaccountJobBaseinfo baseInfo) {
		this.baseInfo = baseInfo;
	}

	public Map<String, CostItem> getCostDirectMap() {
		return costDirectMap;
	}

	public void setCostDirectMap(Map<String, CostItem> costDirectMap) {
		this.costDirectMap = costDirectMap;
	}

	public Map<String, Float> getCostAllMap() {
		return costAllMap;
	}

	public void setCostAllMap(Map<String, Float> costAllMap) {
		this.costAllMap = costAllMap;
	}

	public Map<String, CostItem> getCostLevel1() {
		return costLevel1;
	}

	public void setCostLevel1(Map<String, CostItem> costLevel1) {
		this.costLevel1 = costLevel1;
	}

	public Map<String, CostItem> getCostLevel2() {
		return costLevel2;
	}

	public void setCostLevel2(Map<String, CostItem> costLevel2) {
		this.costLevel2 = costLevel2;
	}

	public Map<String, CostItem> getCostLevel3() {
		return costLevel3;
	}

	public void setCostLevel3(Map<String, CostItem> costLevel3) {
		this.costLevel3 = costLevel3;
	}

	public Map<String, String> getDeptCodeNameMap() {
		return deptCodeNameMap;
	}

	public void setDeptCodeNameMap(Map<String, String> deptCodeNameMap) {
		this.deptCodeNameMap = deptCodeNameMap;
	}

}
