/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.fanrenlee.model.costaccount.CADItem;
import cn.com.fanrenlee.model.costaccount.CostAccountBaseInfo;
import cn.com.fanrenlee.model.costaccount.CostItem;
import cn.com.fanrenlee.model.tables.TCostaccountFentan;

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
	 * 基础信息数据
	 */
	private CostAccountBaseInfo baseInfo = new CostAccountBaseInfo();

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
	 * 科室分摊原始数据、会在处理过程中重新计算
	 */
	private Map<String, CostItem> costItemFentan = new HashMap<String, CostItem>();

	/**
	 * 多级分摊数据、t_costaccount_fentan
	 */
	private Map<String, TCostaccountFentan> fentanMulLev = new HashMap<String, TCostaccountFentan>();

	/**
	 * 科室code name转换map
	 */
	private Map<String, String> deptCodeNameMap = new HashMap<String, String>();

	/**
	 * 各科室类型人员总数
	 */
	private Map<String, Integer> deptTypePeopleCount = new HashMap<String, Integer>();

	public CADItemHandler(List<CADItem> cadItems) {
		this.cadItems = cadItems;

		// 各类型科室总人数
		deptTypePeopleCount.put("XZHQ", 0);
		deptTypePeopleCount.put("YF", 0);
		deptTypePeopleCount.put("YJ", 0);
		deptTypePeopleCount.put("LC", 0);

		// 基础信息初始化
		baseInfo.setTotalCostKdgzl(0f);
		baseInfo.setTotalCostKdsr(0f);
		baseInfo.setTotalCostMzl(0f);
		baseInfo.setTotalCostXdgzl(0f);
		baseInfo.setTotalCostZxsr(0f);
		baseInfo.setTotalCostZyrs(0f);
		baseInfo.setTotalPeople(0);

		for (CADItem item : cadItems) {
			String deptType = item.getDeptTypeCode();
			String deptCode = item.getDeptCode();
			String deptName = item.getDeptName();

			// 初始化科室编码名称对象
			getDeptCodeNameMap().put(item.getDeptCode(), item.getDeptName());

			// 计算不同科室类型总人数
			deptTypePeopleCount.put(deptType, deptTypePeopleCount.get(deptType) + safeInteger(item.getPeopleCount()));

			// 初始化分摊中间对象
			CostItem newItem = new CostItem();
			newItem.setCostSharePeople(item.getCostPeople());
			
			newItem.setCostSharePeopleZzys(item.getCostPeopleZzys());
			newItem.setCostSharePeopleFzrys(item.getCostPeopleFzzys());
			newItem.setCostSharePeopleZrys(item.getCostPeopleZrys());
			newItem.setCostSharePeopleJs(item.getCostPeopleJs());
			newItem.setCostSharePeopleHs(item.getCostPeopleHs());
			newItem.setCostSharePeopleQt(item.getCostPeopleQt());
			
			newItem.setCostShareassetAmortize(item.getCostPeople());
			newItem.setCostShareOldHouseDeviceCommon(item.getCostOldHouseDeviceCommon());
			newItem.setCostShareOldDeviceSpecial(item.getCostOldDeviceSpecial());
			newItem.setCostShareOther(item.getCostOther());
			newItem.setCostSharevcFunds(item.getCostVcFunds());
			costItemFentan.put(item.getDeptCode(), newItem);

			// 计算基础整体数据
			baseInfo.setTotalCostKdgzl(safeFloat(baseInfo.getTotalCostKdgzl()) + safeFloat(item.getWorkCountKdgzl()));
			baseInfo.setTotalCostKdsr(safeFloat(baseInfo.getTotalCostKdsr()) + safeFloat(item.getWorkCountKdsr()));
			baseInfo.setTotalCostMzl(safeFloat(baseInfo.getTotalCostMzl()) + safeFloat(item.getWorkCountMz()));
			baseInfo.setTotalCostXdgzl(safeFloat(baseInfo.getTotalCostXdgzl()) + safeFloat(item.getWorkCountXdgzl()));
			baseInfo.setTotalCostZxsr(safeFloat(baseInfo.getTotalCostZxsr()) + safeFloat(item.getWorkCountZxsr()));
			baseInfo.setTotalCostZyrs(safeFloat(baseInfo.getTotalCostZyrs()) + safeFloat(item.getWorkCountInhos()));

			// 初始化多级分摊对象
			TCostaccountFentan fentan = new TCostaccountFentan();
			fentan.setDeptCode(deptCode);
			fentan.setDeptName(deptName);
			getFentanMulLev().put(deptCode, fentan);
		}

		// 计算总人数
		baseInfo.setTotalPeople(deptTypePeopleCount.get("XZHQ") + deptTypePeopleCount.get("YF")
				+ deptTypePeopleCount.get("YJ") + deptTypePeopleCount.get("LC"));

	}

	/**
	 * float运算过滤null
	 * 
	 * @param f
	 * @return
	 */
	private Float safeFloat(Float f) {
		return f == null ? 0f : f;
	}

	/**
	 * int运算过滤null
	 * 
	 * @param f
	 * @return
	 */
	private Integer safeInteger(Integer i) {
		return i == null ? 0 : i;
	}

	/**
	 * 处理数据
	 */
	public void handle() {
		// 计算所有直接成本以及行政后勤科室全成本
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 直接成本
			float costDirect = cadItem.getCostAssetAmortize() + cadItem.getCostOldHouseDeviceCommon()
					+ cadItem.getCostOldDeviceSpecial() + cadItem.getCostOther() + cadItem.getCostPeople()
					+ cadItem.getCostVcFunds();
			// 直接成本
			getFentanMulLev().get(deptCode).setCountDirect(costDirect);
			// 全成本-直接成本部分
			getFentanMulLev().get(deptCode).setCountAll(costDirect);

		}

		// 计算一级分摊以及医辅全成本
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 非行政后勤科室
			if (!cadItem.isDeptTypeXZHQ()) {
				// 临时成本
				float levelTemp = 0f;
				float levelTempPeople = 0f;
				float levelTempDeviceCommon = 0f;
				float levelTempDeviceSpe = 0f;
				float levelTempAssert = 0f;
				float levelTempVc = 0f;
				float levelTempOther = 0f;
				
				float levelTempPeopleZzys = 0f;
				float levelTempPeopleFzzys = 0f;
				float levelTempPeopleZrys = 0f;
				float levelTempPeopleJs = 0f;
				float levelTempPeopleHs = 0f;
				float levelTempPeopleQt = 0f;
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非行政后勤科室过滤
					if (!cadItemIn.isDeptTypeXZHQ()) {
						continue;
					}
					// 该医辅科室人员数 /（全院人数 - 所有行政后勤科室人员数） × 该行政后勤科室全成本
					Float baseCount = Float.valueOf(cadItem.getPeopleCount())
							/ (getAllPeopleCount() - deptTypePeopleCount.get("XZHQ"));

					Float baseCountDirect = Float.valueOf(cadItem.getPeopleCount())
							/ (getAllPeopleCount() - deptTypePeopleCount.get("XZHQ"));

					// 一级分摊
					Float level1 = baseCount * getFentanMulLev().get(deptCodeIn).getCountAll();

					float levelPeople = baseCountDirect * cadItemIn.getCostPeople();
					float levelDeviceCommon = baseCountDirect * cadItemIn.getCostOldHouseDeviceCommon();
					float levelDeviceSpe = baseCountDirect * cadItemIn.getCostOldDeviceSpecial();
					float levelAssert = baseCountDirect * cadItemIn.getCostAssetAmortize();
					float levelVc = baseCountDirect * cadItemIn.getCostVcFunds();
					float levelOther = baseCountDirect * cadItemIn.getCostOther();

					float levelPeopleZzys = baseCountDirect * cadItemIn.getCostPeopleZzys();
					float levelPeopleFzzys = baseCountDirect * cadItemIn.getCostPeopleFzzys();
					float levelPeopleZrys = baseCountDirect * cadItemIn.getCostPeopleZrys();
					float levelPeopleJs = baseCountDirect * cadItemIn.getCostPeopleJs();
					float levelPeopleHs = baseCountDirect * cadItemIn.getCostPeopleHs();
					float levelPeopleQt = baseCountDirect * cadItemIn.getCostPeopleQt();
					
					CostItem costItem = new CostItem(level1, levelPeople, levelDeviceCommon, levelDeviceSpe,
							levelAssert, levelVc, levelOther);
					
					getCostLevel1().put(deptCode + CODE_SEP + deptCodeIn, costItem);

					// 重新计算分摊后成本
					CostItem tempCostItem = costItemFentan.get(deptCode);
					tempCostItem.setCostSharePeople(tempCostItem.getCostSharePeople() + costItem.getCostSharePeople());
					tempCostItem.setCostShareOldHouseDeviceCommon(tempCostItem.getCostShareOldHouseDeviceCommon()
							+ costItem.getCostShareOldHouseDeviceCommon());
					tempCostItem.setCostShareOldDeviceSpecial(
							tempCostItem.getCostShareOldDeviceSpecial() + costItem.getCostShareOldDeviceSpecial());
					tempCostItem.setCostShareassetAmortize(
							tempCostItem.getCostShareassetAmortize() + costItem.getCostShareassetAmortize());
					tempCostItem
							.setCostSharevcFunds(tempCostItem.getCostSharevcFunds() + costItem.getCostSharevcFunds());
					tempCostItem.setCostShareOther(tempCostItem.getCostShareOther() + costItem.getCostShareOther());

					// 全成本计算以及其他
					levelTemp += level1;
					levelTempPeople += levelPeople;
					levelTempDeviceCommon += levelDeviceCommon;
					levelTempDeviceSpe += levelDeviceSpe;
					levelTempAssert += levelAssert;
					levelTempVc += levelVc;
					levelTempOther += levelOther;
					
					levelTempPeopleZzys += levelPeopleZzys;
					levelTempPeopleFzzys += levelPeopleFzzys;
					levelTempPeopleZrys += levelPeopleZrys;
					levelTempPeopleJs += levelPeopleJs;
					levelTempPeopleHs += levelPeopleHs;
					levelTempPeopleQt += levelPeopleQt;

				}

				TCostaccountFentan ft = getFentanMulLev().get(deptCode);
				// 全成本重新计算
				ft.setCountAll(ft.getCountAll() + levelTemp);
				// 分摊表-一级分摊赋值
				ft.setFxL1(levelTemp);
				//分项成本赋值
				ft.setFxL1People(levelTempPeople);
				ft.setFxL1DeviceCommon(levelTempDeviceCommon);
				ft.setFxL1DeviceSpe(levelTempDeviceSpe);
				ft.setFxL1Asset(levelTempAssert);
				ft.setFxL1Vc(levelTempVc);
				ft.setFxL1Other(levelTempOther);
				
				ft.setFxL1PeopleZzys(levelTempPeopleZzys);
				ft.setFxL1PeopleFzrys(levelTempPeopleFzzys);
				ft.setFxL1PeopleZrys(levelTempPeopleZrys);
				ft.setFxL1PeopleHs(levelTempPeopleHs);
				ft.setFxL1PeopleJs(levelTempPeopleJs);
				ft.setFxL1PeopleQt(levelTempPeopleQt);
				
			}
		}

		// 计算二级分摊以及医技全成本
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 医技科室和临床科室
			if (cadItem.isDeptTypeYJ() || cadItem.isDeptTypeLC()) {
				// 临时成本
				float levelTemp = 0f;
				float levelTempPeople = 0f;
				float levelTempDeviceCommon = 0f;
				float levelTempDeviceSpe = 0f;
				float levelTempAssert = 0f;
				float levelTempVc = 0f;
				float levelTempOther = 0f;
				
				float levelTempPeopleZzys = 0f;
				float levelTempPeopleFzzys = 0f;
				float levelTempPeopleZrys = 0f;
				float levelTempPeopleJs = 0f;
				float levelTempPeopleHs = 0f;
				float levelTempPeopleQt = 0f;
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非医辅科室过滤
					if (!cadItemIn.isDeptTypeYF()) {
						continue;
					}
					// 二级分摊
					Float baseCount = getLevel2BaseCount(cadItem, cadItemIn);
					Float level2 = baseCount * getFentanMulLev().get(deptCodeIn).getCountAll();

					CostItem cif = costItemFentan.get(deptCode);
					float levelPeople = baseCount * cif.getCostSharePeople();
					float levelDeviceCommon = baseCount * cif.getCostShareOldHouseDeviceCommon();
					float levelDeviceSpe = baseCount * cif.getCostShareOldDeviceSpecial();
					float levelAssert = baseCount * cif.getCostShareassetAmortize();
					float levelVc = baseCount * cif.getCostSharevcFunds();
					float levelOther = baseCount * cif.getCostShareOther();
					
					float levelPeopleZzys = baseCount * cif.getCostSharePeopleZzys();
					float levelPeopleFzzys = baseCount * cif.getCostSharePeopleFzrys();
					float levelPeopleZrys = baseCount * cif.getCostSharePeopleZrys();
					float levelPeopleJs = baseCount * cif.getCostSharePeopleJs();
					float levelPeopleHs = baseCount * cif.getCostSharePeopleHs();
					float levelPeopleQt = baseCount * cif.getCostSharePeopleQt();

					CostItem costItem = new CostItem(level2, levelPeople, levelDeviceCommon, levelDeviceSpe,
							levelAssert, levelVc, levelOther);

					getCostLevel2().put(deptCode + CODE_SEP + deptCodeIn, costItem);

					// 重新计算分摊后成本
					CostItem tempCostItem = costItemFentan.get(deptCode);
					tempCostItem.setCostSharePeople(tempCostItem.getCostSharePeople() + costItem.getCostSharePeople());
					tempCostItem.setCostShareOldHouseDeviceCommon(tempCostItem.getCostShareOldHouseDeviceCommon()
							+ costItem.getCostShareOldHouseDeviceCommon());
					tempCostItem.setCostShareOldDeviceSpecial(
							tempCostItem.getCostShareOldDeviceSpecial() + costItem.getCostShareOldDeviceSpecial());
					tempCostItem.setCostShareassetAmortize(
							tempCostItem.getCostShareassetAmortize() + costItem.getCostShareassetAmortize());
					tempCostItem
							.setCostSharevcFunds(tempCostItem.getCostSharevcFunds() + costItem.getCostSharevcFunds());
					tempCostItem.setCostShareOther(tempCostItem.getCostShareOther() + costItem.getCostShareOther());

					// 全成本计算以及其他
					levelTemp += level2;
					levelTempPeople += levelPeople;
					levelTempDeviceCommon += levelDeviceCommon;
					levelTempDeviceSpe += levelDeviceSpe;
					levelTempAssert += levelAssert;
					levelTempVc += levelVc;
					levelTempOther += levelOther;
					
					levelTempPeopleZzys += levelPeopleZzys;
					levelTempPeopleFzzys += levelPeopleFzzys;
					levelTempPeopleZrys += levelPeopleZrys;
					levelTempPeopleJs += levelPeopleJs;
					levelTempPeopleHs += levelPeopleHs;
					levelTempPeopleQt += levelPeopleQt;
				}

				TCostaccountFentan ttf = getFentanMulLev().get(deptCode);
				// 全成本重新计算
				ttf.setCountAll(ttf.getCountAll() + levelTemp);
				// 分摊表-二级分摊赋值
				ttf.setFxL2(levelTemp);
				//分项成本赋值
				ttf.setFxL2People(levelTempPeople);
				ttf.setFxL2DeviceCommon(levelTempDeviceCommon);
				ttf.setFxL2DeviceSpe(levelTempDeviceSpe);
				ttf.setFxL2Asset(levelTempAssert);
				ttf.setFxL2Vc(levelTempVc);
				ttf.setFxL2Other(levelTempOther);
				
				ttf.setFxL2PeopleZzys(levelTempPeopleZzys);
				ttf.setFxL2PeopleFzrys(levelTempPeopleFzzys);
				ttf.setFxL2PeopleZrys(levelTempPeopleZrys);
				ttf.setFxL2PeopleHs(levelTempPeopleHs);
				ttf.setFxL2PeopleJs(levelTempPeopleJs);
				ttf.setFxL2PeopleQt(levelTempPeopleQt);

			}
		}

		// 计算三级分摊以及临床全成本
		for (CADItem cadItem : cadItems) {
			// 临床科室
			if (cadItem.isDeptTypeLC()) {
				String deptCode = cadItem.getDeptCode();
				// 临时成本
				float levelTemp = 0f;
				float levelTempPeople = 0f;
				float levelTempDeviceCommon = 0f;
				float levelTempDeviceSpe = 0f;
				float levelTempAssert = 0f;
				float levelTempVc = 0f;
				float levelTempOther = 0f;
				
				float levelTempPeopleZzys = 0f;
				float levelTempPeopleFzzys = 0f;
				float levelTempPeopleZrys = 0f;
				float levelTempPeopleJs = 0f;
				float levelTempPeopleHs = 0f;
				float levelTempPeopleQt = 0f;
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非医技科室过滤
					if (!cadItemIn.isDeptTypeYJ()) {
						continue;
					}
					// 三级分摊
					// 该临床科室开单工作量 / 该医技科室全年工作量 × 该医技科室全成本
					Float baseCount = safeFloat(cadItem.getWorkCountKdgzl()) / safeFloat(cadItemIn.getWorkCount());
					Float level3 = baseCount * getFentanMulLev().get(deptCodeIn).getCountAll();
					
					CostItem cif = costItemFentan.get(deptCode);
					float levelPeople = baseCount * cif.getCostSharePeople();
					float levelDeviceCommon = baseCount * cif.getCostShareOldHouseDeviceCommon();
					float levelDeviceSpe = baseCount * cif.getCostShareOldDeviceSpecial();
					float levelAssert = baseCount * cif.getCostShareassetAmortize();
					float levelVc = baseCount * cif.getCostSharevcFunds();
					float levelOther = baseCount * cif.getCostShareOther();
					
					float levelPeopleZzys = baseCount * cif.getCostSharePeopleZzys();
					float levelPeopleFzzys = baseCount * cif.getCostSharePeopleFzrys();
					float levelPeopleZrys = baseCount * cif.getCostSharePeopleZrys();
					float levelPeopleJs = baseCount * cif.getCostSharePeopleJs();
					float levelPeopleHs = baseCount * cif.getCostSharePeopleHs();
					float levelPeopleQt = baseCount * cif.getCostSharePeopleQt();


					CostItem costItem = new CostItem(level3, levelPeople, levelDeviceCommon, levelDeviceSpe,
							levelAssert, levelVc, levelOther);

					getCostLevel3().put(deptCode + CODE_SEP + deptCodeIn, costItem);

					// 全成本计算以及其他
					levelTemp += level3;
					levelTempPeople += levelPeople;
					levelTempDeviceCommon += levelDeviceCommon;
					levelTempDeviceSpe += levelDeviceSpe;
					levelTempAssert += levelAssert;
					levelTempVc += levelVc;
					levelTempOther += levelOther;

					levelTempPeopleZzys += levelPeopleZzys;
					levelTempPeopleFzzys += levelPeopleFzzys;
					levelTempPeopleZrys += levelPeopleZrys;
					levelTempPeopleJs += levelPeopleJs;
					levelTempPeopleHs += levelPeopleHs;
					levelTempPeopleQt += levelPeopleQt;
				}

				TCostaccountFentan ttf = getFentanMulLev().get(deptCode);
				// 全成本重新计算
				ttf.setCountAll(ttf.getCountAll() + levelTemp);
				// 分摊表-三级分摊赋值
				ttf.setFxL3(levelTemp);
				//分项成本赋值
				ttf.setFxL3People(levelTempPeople);
				ttf.setFxL3DeviceCommon(levelTempDeviceCommon);
				ttf.setFxL3DeviceSpe(levelTempDeviceSpe);
				ttf.setFxL3Asset(levelTempAssert);
				ttf.setFxL3Vc(levelTempVc);
				ttf.setFxL3Other(levelTempOther);

				ttf.setFxL3PeopleZzys(levelTempPeopleZzys);
				ttf.setFxL3PeopleFzrys(levelTempPeopleFzzys);
				ttf.setFxL3PeopleZrys(levelTempPeopleZrys);
				ttf.setFxL3PeopleHs(levelTempPeopleHs);
				ttf.setFxL3PeopleJs(levelTempPeopleJs);
				ttf.setFxL3PeopleQt(levelTempPeopleQt);

			}
		}

	}

	// 处理二级分摊
	private Float getLevel2BaseCount(CADItem cadItem, CADItem cadItemIn) {
		// 二级分摊
		Float level2 = 0f;

		// 1、针对所有“挂号、门诊收费处”分摊：分摊比例为（门诊执行收入/全院门诊总收入）
		if (cadItemIn.isDeptSpecialRegister() || cadItemIn.isDeptSpecialOutpatientCashier()) {
			level2 = cadItem.getWorkCountZxsr() / getTotalWorkOutpatient();
			// 2、针对所有“供应室”全成本分摊 = 该医技科室消毒工作量 / 全院消毒工作总量 × 供应室全成本
		} else if (cadItemIn.isDeptSpecialSupply()) {
			level2 = cadItem.getWorkCountXdgzl() / getTotalWorkDisinfected();
			// 针对所有病案室成本分摊 = 该住院科室住院人数 / 全院住院总人数 × 病案室全成本
		} else if (cadItemIn.isDeptSpecialMedicalRecord()) {
			level2 = cadItem.getWorkCountInhos() / getTotalInhos();
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
		return this.getBaseInfo().getTotalCost();
	}

	/**
	 * 全院消毒总工作量
	 */
	private Float getTotalWorkDisinfected() {
		return this.getBaseInfo().getTotalCostXdgzl();
	}

	/**
	 * 全院住院总人数
	 */
	private Float getTotalInhos() {
		return this.getBaseInfo().getTotalCostZyrs();
	}

	/**
	 * 全院门诊总收入=执行收入总和
	 */
	private Float getTotalWorkOutpatient() {
		return this.getBaseInfo().getTotalCostZxsr();
	}

	public List<CADItem> getCadItems() {
		return cadItems;
	}

	public CostAccountBaseInfo getBaseInfo() {
		return baseInfo;
	}

	public Map<String, CostItem> getCostLevel1() {
		return costLevel1;
	}

	public Map<String, CostItem> getCostLevel2() {
		return costLevel2;
	}

	public Map<String, CostItem> getCostLevel3() {
		return costLevel3;
	}

	public Map<String, String> getDeptCodeNameMap() {
		return deptCodeNameMap;
	}

	public Map<String, TCostaccountFentan> getFentanMulLev() {
		return fentanMulLev;
	}

}
