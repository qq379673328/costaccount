/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.math.BigDecimal;
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
		baseInfo.setTotalCostInhos(0d);
		baseInfo.setTotalCostKdsr(0d);
		baseInfo.setTotalCostMz(0d);
		baseInfo.setTotalCostXdgzl(0d);
		baseInfo.setTotalCostZyzxsr(0d);
		baseInfo.setTotalCostMzzxsr(0d);

		for (CADItem item : cadItems) {
			
			// 为科室特殊类型赋值
			item.setDeptSpecialCode(item.getDeptSpecialCode());
			
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
			newItem.setCostShareWscl(item.getCostWscl());
			newItem.setCostShareOldHouseDeviceCommon(item.getCostOldHouseDeviceCommon());
			newItem.setCostShareWscl(item.getCostWscl());
			newItem.setCostShareOldDeviceSpecial(item.getCostOldDeviceSpecial());
			newItem.setCostShareOther(item.getCostOther());
			newItem.setCostSharevcFunds(item.getCostVcFunds());
			costItemFentan.put(item.getDeptCode(), newItem);

			// 计算基础整体数据
			baseInfo.setTotalCostInhos(baseInfo.getTotalCostInhos() + item.getWorkCountInhos());
			baseInfo.setTotalCostKdsr(baseInfo.getTotalCostKdsr() + item.getWorkCountKdsr());
			baseInfo.setTotalCostXdgzl(baseInfo.getTotalCostXdgzl() + item.getWorkCountXdgzl());
			baseInfo.setTotalCostMz((baseInfo.getTotalCostMz() + item.getWorkCountMz()));
			baseInfo.setTotalCostMzzxsr(baseInfo.getTotalCostMzzxsr() + item.getWorkCountMzzxsr());
			baseInfo.setTotalCostZyzxsr(baseInfo.getTotalCostZyzxsr() + item.getWorkCountZyzxsr());

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
	 * Double运算过滤null
	 * 
	 * @param f
	 * @return
	 */
	private Double safeDouble(Double f) {
		return f == null ? 0d : f;
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
	 * Double 相加
	 * 
	 * @param items
	 * @return
	 */
	private Double add(Double... items) {
		BigDecimal ret = new BigDecimal(0);
		for (Double item : items) {
			ret = ret.add(new BigDecimal(item == null ? 0 : item));
		}
		return toDouble(ret);
	}

	private Double toDouble(BigDecimal item) {
		if (item == null)
			return 0d;
		return item.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 相乘
	 * 
	 * @param itemA
	 * @param itemB
	 * @return
	 */
	private Double mul(BigDecimal itemA, Double itemB) {
		return itemA.multiply(new BigDecimal(itemB)).doubleValue();
	}

	/**
	 * 处理数据
	 */
	public void handle() {
		// 计算所有直接成本以及行政后勤科室全成本
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 直接成本
			Double costDirect = add(cadItem.getCostWscl(), cadItem.getCostAssetAmortize(),
					cadItem.getCostOldHouseDeviceCommon(), cadItem.getCostOldDeviceSpecial(), cadItem.getCostOther(),
					cadItem.getCostPeople(), cadItem.getCostVcFunds());
			// 直接成本
			getFentanMulLev().get(deptCode).setCountDirect(costDirect);
			// 全成本-直接成本部分
			getFentanMulLev().get(deptCode).setCountAll(costDirect);

		}

		// 计算一级分摊以及医辅全成本

		// 所有行政后勤科室各个类型总成本数据
		CADItem xzhqTemp = new CADItem();
		for (CADItem cadItemIn : cadItems) {
			// 非行政后勤科室过滤
			if (!cadItemIn.isDeptTypeXZHQ()) {
				continue;
			}
			xzhqTemp.setCostAssetAmortize(add(xzhqTemp.getCostAssetAmortize(), cadItemIn.getCostAssetAmortize()));
			xzhqTemp.setCostOldDeviceSpecial(
					add(xzhqTemp.getCostOldDeviceSpecial(), cadItemIn.getCostOldDeviceSpecial()));
			xzhqTemp.setCostOldHouseDeviceCommon(
					add(xzhqTemp.getCostOldHouseDeviceCommon(), cadItemIn.getCostOldHouseDeviceCommon()));
			xzhqTemp.setCostOther(add(xzhqTemp.getCostOther(), cadItemIn.getCostOther()));
			xzhqTemp.setCostVcFunds(add(xzhqTemp.getCostVcFunds(), cadItemIn.getCostVcFunds()));
			xzhqTemp.setCostWscl(add(xzhqTemp.getCostWscl(), cadItemIn.getCostWscl()));

			xzhqTemp.setCostPeople(add(xzhqTemp.getCostPeople(), cadItemIn.getCostPeople()));
			xzhqTemp.setCostPeopleFzzys(add(xzhqTemp.getCostPeopleFzzys(), cadItemIn.getCostPeopleFzzys()));
			xzhqTemp.setCostPeopleHs(add(xzhqTemp.getCostPeopleHs(), cadItemIn.getCostPeopleHs()));
			xzhqTemp.setCostPeopleJs(add(xzhqTemp.getCostPeopleJs(), cadItemIn.getCostPeopleJs()));
			xzhqTemp.setCostPeopleQt(add(xzhqTemp.getCostPeopleQt(), cadItemIn.getCostPeopleQt()));
			xzhqTemp.setCostPeopleZrys(add(xzhqTemp.getCostPeopleZrys(), cadItemIn.getCostPeopleZrys()));
			xzhqTemp.setCostPeopleZzys(add(xzhqTemp.getCostPeopleZzys(), cadItemIn.getCostPeopleZzys()));

		}

		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 非行政后勤科室
			if (!cadItem.isDeptTypeXZHQ()) {

				// 一级分摊：该科室人员数 /（全院人数 - 所有行政后勤科室人员数） × 所有行政后勤科室全成本
				Integer deptPeopleCount = cadItem.getPeopleCount();// 该科室人员数
				Integer allPeople = getAllPeopleCount();// 全院人数
				Integer xzhqPeopleCount = deptTypePeopleCount.get("XZHQ");
				// 所有行政后勤科室全成本
				Double allCostXzhq = add(xzhqTemp.getCostAssetAmortize(), xzhqTemp.getCostOldDeviceSpecial(),
						xzhqTemp.getCostOldHouseDeviceCommon(), xzhqTemp.getCostOther(), xzhqTemp.getCostVcFunds(),
						xzhqTemp.getCostWscl() + xzhqTemp.getCostPeople());
				// 基础数据
				BigDecimal base = new BigDecimal(deptPeopleCount).divide(new BigDecimal(allPeople - xzhqPeopleCount),
						10, BigDecimal.ROUND_HALF_DOWN);

				TCostaccountFentan ft = getFentanMulLev().get(deptCode);
				// 分摊表-一级分摊赋值
				ft.setFxL1(base.multiply(new BigDecimal(allCostXzhq)).doubleValue());
				// 分项成本赋值
				ft.setFxL1People(mul(base, xzhqTemp.getCostPeople()));
				ft.setFxL1Wscl(mul(base, xzhqTemp.getCostWscl()));
				ft.setFxL1DeviceCommon(mul(base, xzhqTemp.getCostOldHouseDeviceCommon()));
				ft.setFxL1DeviceSpe(mul(base, xzhqTemp.getCostOldDeviceSpecial()));
				ft.setFxL1Asset(mul(base, xzhqTemp.getCostAssetAmortize()));
				ft.setFxL1Vc(mul(base, xzhqTemp.getCostVcFunds()));
				ft.setFxL1Other(mul(base, xzhqTemp.getCostOther()));

				ft.setFxL1PeopleZzys(mul(base, xzhqTemp.getCostPeopleZzys()));
				ft.setFxL1PeopleFzrys(mul(base, xzhqTemp.getCostPeopleFzzys()));
				ft.setFxL1PeopleZrys(mul(base, xzhqTemp.getCostPeopleZrys()));
				ft.setFxL1PeopleHs(mul(base, xzhqTemp.getCostPeopleHs()));
				ft.setFxL1PeopleJs(mul(base, xzhqTemp.getCostPeopleJs()));
				ft.setFxL1PeopleQt(mul(base, xzhqTemp.getCostPeopleQt()));

			}
		}

		// 计算二级分摊-临床科室、医技科室分摊的医辅科室成本
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 医技科室和临床科室
			if (cadItem.isDeptTypeYJ() || cadItem.isDeptTypeLC()) {
				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非医辅科室过滤
					if (!cadItemIn.isDeptTypeYF()) {
						continue;
					}

					// 二级分摊
					// 1、某临床科室中的门诊科室分摊的供应室成本 = 该门诊科室消毒工作量 /
					// 全院消毒工作总量 *（供应室直接成本 + 供应室分摊的行政后勤科室成本）
					// 2、某临床科室中的门诊科室分摊的挂号收费处成本 = 该门诊科室门诊执行收入 /
					// 全院门诊总收入 *（挂号收费处直接成本 + 挂号收费处分摊的行政后勤科室成本）
					// 3、某临床科室中的住院科室分摊的供应室成本 = 该住院科室消毒工作量 /
					// 全院消毒工作总量 *（供应室直接成本 + 供应室分摊的行政后勤科室成本）
					// 4、某临床科室中的住院科室分摊的住院收费处成本 = 该住院科室住院人数 /
					// 全院住院总人数 *（住院收费处直接成本 + 住院收费处分摊的行政后勤科室成本）
					// 5、某临床科室中的住院科室分摊的病案室成本 = 该住院科室住院人数 /
					// 全院住院总人数 *（病案室直接成本 + 病案室分摊的行政后勤科室成本）
					// 6、某医技科室分摊的供应室成本 = 该医技科室消毒工作量 /
					// 全院消毒工作总量 *（供应室直接成本 + 供应室分摊的行政后勤科室成本）
					// 7、某医技科室分摊的挂号收费处成本 = 该医技科室门诊执行收入 /
					// 全院门诊总收入 *（挂号收费处直接成本 + 挂号收费处分摊的行政后勤科室成本）
					
					// 分摊对象
					TCostaccountFentan ttf = getFentanMulLev().get(deptCode);
					TCostaccountFentan fentan = getFentanMulLev().get(deptCodeIn);

					// 不同类型的不同算法
					Double base = getLevel2BaseCount(cadItem, cadItemIn);
					if (base == null)// 未知算法-忽略
						continue;

					ttf.setFxL2(safeDouble(ttf.getFxL2()) + base * (cadItemIn.getDirectCount() + fentan.getFxL1()));

					ttf.setFxL2Asset(safeDouble(ttf.getFxL2Asset())
							+ base * (cadItemIn.getCostAssetAmortize() + fentan.getFxL1Asset()));
					ttf.setFxL2DeviceCommon(safeDouble(ttf.getFxL2DeviceCommon())
							+ base * (cadItemIn.getCostOldHouseDeviceCommon() + fentan.getFxL1DeviceCommon()));

					ttf.setFxL2DeviceSpe(safeDouble(ttf.getFxL2DeviceSpe())
							+ base * (cadItemIn.getCostOldDeviceSpecial() + fentan.getFxL1DeviceSpe()));
					ttf.setFxL2Other(
							safeDouble(ttf.getFxL3Other()) + base * (cadItemIn.getCostOther() + fentan.getFxL1Other()));
					ttf.setFxL2Vc(
							safeDouble(ttf.getFxL2Vc()) + base * (cadItemIn.getCostVcFunds() + fentan.getFxL1Vc()));
					ttf.setFxL2Wscl(
							safeDouble(ttf.getFxL2Wscl()) + base * (cadItemIn.getCostWscl() + fentan.getFxL1Wscl()));

					ttf.setFxL2People(safeDouble(ttf.getFxL2People())
							+ base * (cadItemIn.getCostPeople() + fentan.getFxL1People()));
					ttf.setFxL2PeopleFzrys(safeDouble(ttf.getFxL2PeopleFzrys())
							+ base * (cadItemIn.getCostPeopleFzzys() + fentan.getFxL1PeopleFzrys()));
					ttf.setFxL2PeopleHs(safeDouble(ttf.getFxL2PeopleHs())
							+ base * (cadItemIn.getCostPeopleHs() + fentan.getFxL1PeopleHs()));
					ttf.setFxL2PeopleJs(safeDouble(ttf.getFxL2PeopleJs())
							+ base * (cadItemIn.getCostPeopleJs() + fentan.getFxL1PeopleJs()));
					ttf.setFxL2PeopleQt(safeDouble(ttf.getFxL2PeopleQt())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt()));
					ttf.setFxL2PeopleZrys(safeDouble(ttf.getFxL2PeopleZrys())
							+ base * (cadItemIn.getCostPeopleZrys() + fentan.getFxL1PeopleZrys()));
					ttf.setFxL2PeopleZzys(safeDouble(ttf.getFxL2PeopleZzys())
							+ base * (cadItemIn.getCostPeopleZzys() + fentan.getFxL1PeopleZzys()));

				}

			}
		}

		// 计算三级分摊以及临床全成本
		for (CADItem cadItem : cadItems) {
			// 临床科室
			if (cadItem.isDeptTypeLC()) {
				String deptCode = cadItem.getDeptCode();

				for (CADItem cadItemIn : cadItems) {
					String deptCodeIn = cadItemIn.getDeptCode();
					// 非医技科室过滤
					if (!cadItemIn.isDeptTypeYJ()) {
						continue;
					}
					// 三级分摊
					// 某临床科室分摊的某医技科室成本 =
					// 该临床科室对该医技科室的开单工作量 / 该医技科室全年工作量 *
					// （该医技科室直接成本 + 该医技科室分摊的医辅科室成本 + 该医技科室分摊的行政后勤科室成本）
					Double kdgzl = getKdgzl(cadItem.getDeptCode(), cadItemIn.getDeptCode());// 开单工作量
					Double totalCount = cadItemIn.getWorkCountTotal();// 医技科室全年工作量
					TCostaccountFentan fentan = getFentanMulLev().get(deptCodeIn);

					Double base = kdgzl / totalCount;
					
					// 分摊对象
					TCostaccountFentan ttf = getFentanMulLev().get(deptCode);

					ttf.setFxL3(safeDouble(ttf.getFxL3())
							+ base * (cadItemIn.getDirectCount() + fentan.getFxL1() + fentan.getFxL2()));

					ttf.setFxL3Asset(safeDouble(ttf.getFxL3Asset()) + base
							* (cadItemIn.getCostAssetAmortize() + fentan.getFxL1Asset() + fentan.getFxL2Asset()));
					ttf.setFxL3DeviceCommon(
							safeDouble(ttf.getFxL3DeviceCommon()) + base * (cadItemIn.getCostOldHouseDeviceCommon()
									+ fentan.getFxL1DeviceCommon() + fentan.getFxL2DeviceCommon()));
					ttf.setFxL3DeviceSpe(
							safeDouble(ttf.getFxL3DeviceSpe()) + base * (cadItemIn.getCostOldDeviceSpecial()
									+ fentan.getFxL1DeviceSpe() + fentan.getFxL2DeviceSpe()));
					ttf.setFxL3Other(safeDouble(ttf.getFxL3Other())
							+ base * (cadItemIn.getCostOther() + fentan.getFxL1Other() + fentan.getFxL2Other()));
					ttf.setFxL3Vc(safeDouble(ttf.getFxL3Vc())
							+ base * (cadItemIn.getCostVcFunds() + fentan.getFxL1Vc() + fentan.getFxL2Vc()));
					ttf.setFxL3Wscl(safeDouble(ttf.getFxL3Wscl())
							+ base * (cadItemIn.getCostWscl() + fentan.getFxL1Wscl() + fentan.getFxL2Wscl()));

					ttf.setFxL3People(safeDouble(ttf.getFxL3People())
							+ base * (cadItemIn.getCostPeople() + fentan.getFxL1People() + fentan.getFxL2People()));
					ttf.setFxL3PeopleFzrys(safeDouble(ttf.getFxL3PeopleFzrys()) + base * (cadItemIn.getCostPeopleFzzys()
							+ fentan.getFxL1PeopleFzrys() + fentan.getFxL2PeopleFzrys()));
					ttf.setFxL3PeopleHs(safeDouble(ttf.getFxL3PeopleHs()) + base
							* (cadItemIn.getCostPeopleHs() + fentan.getFxL1PeopleHs() + fentan.getFxL2PeopleHs()));
					ttf.setFxL3PeopleJs(safeDouble(ttf.getFxL3PeopleJs()) + base
							* (cadItemIn.getCostPeopleJs() + fentan.getFxL1PeopleJs() + fentan.getFxL2PeopleJs()));
					ttf.setFxL3PeopleQt(safeDouble(ttf.getFxL3PeopleQt()) + base
							* (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt() + fentan.getFxL2PeopleQt()));
					ttf.setFxL3PeopleZrys(safeDouble(ttf.getFxL3PeopleZrys()) + base * (cadItemIn.getCostPeopleZrys()
							+ fentan.getFxL1PeopleZrys() + fentan.getFxL2PeopleZrys()));
					ttf.setFxL3PeopleZzys(safeDouble(ttf.getFxL3PeopleZzys()) + base * (cadItemIn.getCostPeopleZzys()
							+ fentan.getFxL1PeopleZzys() + fentan.getFxL2PeopleZzys()));

				}

			}
		}

	}

	// 二级分摊：该临床科室对该医技科室的开单工作量
	private Double getKdgzl(String deptCodeLc, String deptCodeYj) {
		// TODO 待实现
		return 0d;
	}

	// 处理二级分摊
	private Double getLevel2BaseCount(CADItem cadItem, CADItem cadItemIn) {
		// 二级分摊
		Double ret = null;
		if (cadItem.isDeptSpecialOutpatient() && cadItemIn.isDeptSpecialSupply()) {// 1
			ret = baseInfo.getTotalCostXdgzl() == 0 ? 0 : cadItem.getWorkCountXdgzl() / baseInfo.getTotalCostXdgzl();
		} else if (cadItem.isDeptSpecialOutpatient() && cadItemIn.isDeptSpecialRegister()) {// 2
			ret = baseInfo.getTotalCostMzzxsr() == 0 ? 0 : cadItem.getWorkCountMzzxsr() / baseInfo.getTotalCostMzzxsr();
		} else if (cadItem.isDeptSpecialInhos() && cadItemIn.isDeptSpecialSupply()) {// 3
			ret = baseInfo.getTotalCostXdgzl() == 0 ? 0 : cadItem.getWorkCountXdgzl() / baseInfo.getTotalCostXdgzl();
		} else if (cadItem.isDeptSpecialInhos() && cadItemIn.isDeptSpecialInhosCashier()) {// 4
			ret = baseInfo.getTotalCostInhos() == 0 ? 0 : cadItem.getWorkCountInhos() / baseInfo.getTotalCostInhos();
		} else if (cadItem.isDeptSpecialInhos() && cadItemIn.isDeptSpecialMedicalRecord()) {// 5
			ret = baseInfo.getTotalCostInhos() == 0 ? 0 : cadItem.getWorkCountInhos() / baseInfo.getTotalCostInhos();
		} else if (cadItem.isDeptTypeYJ() && cadItemIn.isDeptSpecialSupply()) {// 6
			ret = baseInfo.getTotalCostXdgzl() == 0 ? 0 : cadItem.getWorkCountXdgzl() / baseInfo.getTotalCostXdgzl();
		} else if (cadItem.isDeptTypeYJ() && cadItemIn.isDeptSpecialRegister()) {// 7
			ret = baseInfo.getTotalCostMzzxsr() == 0 ? 0 : cadItem.getWorkCountMzzxsr() / baseInfo.getTotalCostMzzxsr();
		}
		return ret;
	}

	/**
	 * 全院总人数
	 */
	private Integer getAllPeopleCount() {
		return this.getBaseInfo().getTotalPeople();
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
