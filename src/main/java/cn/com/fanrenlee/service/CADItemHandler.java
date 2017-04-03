/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.fanrenlee.model.costaccount.CADItem;
import cn.com.fanrenlee.model.costaccount.CostAccountBaseInfo;
import cn.com.fanrenlee.model.costaccount.CostItem;
import cn.com.fanrenlee.model.pro.Cncbl;
import cn.com.fanrenlee.model.pro.ProCost;
import cn.com.fanrenlee.model.tables.TCostaccountFentan;
import cn.com.fanrenlee.model.tables.TCostaccountJob;
import cn.com.fanrenlee.model.tables.TCostaccountSrcKdgzl;
import cn.com.fanrenlee.model.tables.TProDic;

/**
 * 成本核算分摊处理工具类
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月26日
 */
public class CADItemHandler {

	/**
	 * 有效劳动时间
	 */
	private static final Double VALID_TIME = 99600d;

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

	/**
	 * 对医技科室开单工作量
	 */
	private Map<String, Double> kdgzlMap = new HashMap<String, Double>();
	/**
	 * 医技科室全年工作量-总-key:医技科室编码,value:全年工作量
	 */
	private Map<String, Double> kdgzlAllMap = new HashMap<String, Double>();

	/**
	 * 项目字典信息-map
	 */
	private Map<String, TProDic> proDicsMap = new HashMap<String, TProDic>();
	/**
	 * 项目字典信息-list
	 */
	private List<TProDic> proDicsList = new ArrayList<TProDic>();

	private TCostaccountJob job;

	/**
	 * 
	 * @param cadItems
	 * @param srcDataKdgzl
	 * @param proDics
	 */
	public CADItemHandler(List<CADItem> cadItems, List<TCostaccountSrcKdgzl> srcDataKdgzl, List<TProDic> proDics,
			TCostaccountJob job) {

		this.cadItems = cadItems;
		this.job = job;

		// 处理项目字典信息
		if (proDics != null) {
			proDicsList = proDics;
			for (TProDic proDic : proDics) {
				proDicsMap.put(proDic.getProCode(), proDic);
			}
		}

		// 开单工作量
		if (srcDataKdgzl != null) {
			for (TCostaccountSrcKdgzl kdgzlItem : srcDataKdgzl) {
				String yjDeptCode = kdgzlItem.getDeptCodeYj();
				Double kdgzl = kdgzlItem.getKdgzl();

				// 下划线相连
				kdgzlMap.put(kdgzlItem.getDeptCodeBase() + "_" + yjDeptCode, kdgzl);

				// 全年工作量
				if (kdgzlAllMap.get(yjDeptCode) == null) {
					kdgzlAllMap.put(yjDeptCode, kdgzl);
				} else {
					kdgzlAllMap.put(yjDeptCode, kdgzlAllMap.get(yjDeptCode) + kdgzl);
				}

			}
		}

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
	 * 相除
	 * 
	 * @param a
	 * @param b
	 * @return
	 */
	private Double div(Double a, double b) {
		return a == 0 || b == 0 ? 0 : a / b;
	}

	// 理论成本相关处理结果
	// 1、科室级-直接成本产能成本率
	private Map<String, Cncbl> deptZjcbCncbl = new HashMap<String, Cncbl>();
	// 2、科室级-分摊的医辅科室成本产能成本率
	private Map<String, Cncbl> deptFtyfCncbl = new HashMap<String, Cncbl>();
	// 3、科室级-分摊的行政后勤科室成本产能成本率
	private Map<String, Cncbl> deptFtxzhqCncbl = new HashMap<String, Cncbl>();
	// 4、科室级-业务成本产能成本率
	private Map<String, Cncbl> deptYwcbCncbl = new HashMap<String, Cncbl>();
	// 5、科室级-全成本产能成本率
	private Map<String, Cncbl> deptQcbCncbl = new HashMap<String, Cncbl>();
	// 6、院级-直接成本产能成本率
	private Cncbl hosZjcbCncbl = new Cncbl();
	// 7、院级-分摊的医辅科室成本产能成本率
	private Cncbl hosFtyfCncbl = new Cncbl();
	// 8、院级-分摊的行政后勤科室成本产能成本率
	private Cncbl hosFtxzhqCncbl = new Cncbl();
	// 9、院级-业务成本产能成本率
	private Cncbl hosYwcbCncbl = new Cncbl();
	// 10、院级-全成本产能成本率
	private Cncbl hosQcbCncbl = new Cncbl();

	// 理论成本-结果验证
	// 1、科室级-项目理论成本（直接成本）
	// 2、科室级-项目理论成本（业务成本）
	// 3、科室级-项目理论成本（全成本）
	private List<ProCost> deptProCosts = new ArrayList<ProCost>();

	// 4、院级-项目理论成本（直接成本）
	// 5、院级-项目理论成本（业务成本）
	// 6、院级-项目理论成本（全成本）
	private List<ProCost> hosCncblCosts = new ArrayList<ProCost>();

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

		// 1、科室级-直接成本产能成本率
		for (CADItem cadItem : cadItems) {
			// 临床或者医技科室
			if (cadItem.isDeptTypeLC() || cadItem.isDeptTypeYJ()) {
				String deptCode = cadItem.getDeptCode();
				Cncbl cncbl = new Cncbl();
				cncbl.settJobId(job.getId());
				cncbl.setLevel(1);
				cncbl.setType(1);
				cncbl.setDeptCode(deptCode);
				cncbl.setDeptName(cadItem.getDeptName());

				// 医生
				cncbl.setYsCncbl(div(
						cadItem.getCostPeopleZzys() + cadItem.getCostPeopleZrys() + cadItem.getCostPeopleFzzys(),
						(cadItem.getPeopleCountZzys() + cadItem.getPeopleCountZrys() + cadItem.getPeopleCountFzrys())
								* VALID_TIME));
				// 护士
				cncbl.setHsCncbl(div(cadItem.getCostPeopleHs(), (cadItem.getPeopleCountHs() * VALID_TIME)));
				// 技师
				cncbl.setJsCncbl(div(cadItem.getCostPeopleJs(), (cadItem.getPeopleCountJs() * VALID_TIME)));
				// 其他人员
				cncbl.setOpCncbl(div(cadItem.getCostPeopleQt(), (cadItem.getPeopleCountQt() * VALID_TIME)));

				// 房屋、通用设备
				cncbl.setHouseCncbl(
						div(cadItem.getCostOldHouseDeviceCommon(), (cadItem.getPeopleCount() * VALID_TIME)));
				// 专用设备
				cncbl.setSpeCncbl(div(cadItem.getCostOldDeviceSpecial(), VALID_TIME));
				// 无形资产
				cncbl.setAssetCncbl(div(cadItem.getCostAssetAmortize(), (cadItem.getPeopleCount() * VALID_TIME)));
				// 其他费用
				cncbl.setOcCncbl(div(cadItem.getCostOther(), (cadItem.getPeopleCount() * VALID_TIME)));

				if(isComputeCncbl(cadItem)){
					deptZjcbCncbl.put(deptCode, cncbl);
				}
			}
		}

		// 计算一级分摊以及医辅全成本-分摊行政后勤
		// 3、科室级-分摊的行政后勤科室成本产能成本率
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

				ft.setFxL1PeopleZzys(mul(base, xzhqTemp.getCostPeopleQt()) * div(cadItem.getPeopleCountZzys() + 0.00, deptPeopleCount));
				ft.setFxL1PeopleFzrys(mul(base, xzhqTemp.getCostPeopleQt()) * div(cadItem.getPeopleCountFzrys() + 0.00, deptPeopleCount));
				ft.setFxL1PeopleZrys(mul(base, xzhqTemp.getCostPeopleQt()) * div(cadItem.getPeopleCountZrys() + 0.00, deptPeopleCount));
				ft.setFxL1PeopleHs(mul(base, xzhqTemp.getCostPeopleQt()) * div(cadItem.getPeopleCountHs() + 0.00, deptPeopleCount));
				ft.setFxL1PeopleJs(mul(base, xzhqTemp.getCostPeopleQt()) * div(cadItem.getPeopleCountJs() + 0.00, deptPeopleCount));
				ft.setFxL1PeopleQt(mul(base, xzhqTemp.getCostPeopleQt()) * div(cadItem.getPeopleCountQt() + 0.00, deptPeopleCount));
				
				/*
				ft.setFxL1PeopleZzys(mul(base, xzhqTemp.getCostPeopleZzys()));
				ft.setFxL1PeopleFzrys(mul(base, xzhqTemp.getCostPeopleFzzys()));
				ft.setFxL1PeopleZrys(mul(base, xzhqTemp.getCostPeopleZrys()));
				ft.setFxL1PeopleHs(mul(base, xzhqTemp.getCostPeopleHs()));
				ft.setFxL1PeopleJs(mul(base, xzhqTemp.getCostPeopleJs()));
				ft.setFxL1PeopleQt(mul(base, xzhqTemp.getCostPeopleQt()));
				*/
				
			}

			// 分摊对象
			TCostaccountFentan ttf = getFentanMulLev().get(deptCode);
			Cncbl cncbl = new Cncbl();
			cncbl.setDeptCode(deptCode);
			cncbl.setDeptName(cadItem.getDeptName());

			// 医生
			cncbl.setYsCncbl(div(ttf.getFxL1PeopleFzrys() + ttf.getFxL1PeopleZrys() + ttf.getFxL1PeopleZzys(),
					(cadItem.getPeopleCountZzys() + cadItem.getPeopleCountZrys() + cadItem.getPeopleCountFzrys())
							* VALID_TIME));
			// 护士
			cncbl.setHsCncbl(div(ttf.getFxL1PeopleHs(), (cadItem.getPeopleCountHs() * VALID_TIME)));
			// 技师
			cncbl.setJsCncbl(div(ttf.getFxL1PeopleJs(), (cadItem.getPeopleCountJs() * VALID_TIME)));
			// 其他人员
			cncbl.setOpCncbl(div(ttf.getFxL1PeopleQt(), (cadItem.getPeopleCountQt() * VALID_TIME)));

			// 房屋、通用设备
			cncbl.setHouseCncbl(div(ttf.getFxL1DeviceCommon(), (cadItem.getPeopleCount() * VALID_TIME)));
			// 专用设备
			cncbl.setSpeCncbl(div(ttf.getFxL1DeviceSpe(), VALID_TIME));
			// 无形资产
			cncbl.setAssetCncbl(div(ttf.getFxL1Asset(), (cadItem.getPeopleCount() * VALID_TIME)));
			// 其他费用
			cncbl.setOcCncbl(div(ttf.getFxL1Other(), (cadItem.getPeopleCount() * VALID_TIME)));

			if(isComputeCncbl(cadItem)){
				deptFtxzhqCncbl.put(deptCode, cncbl);
			}
		}

		// 计算二级分摊-临床科室、医技科室分摊的医辅科室成本
		// 2、科室级-分摊的医辅科室成本产能成本率
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
					// 8、某门诊科室护士分摊的供应室和挂号收费处人员经费成本 = 
					// （公式1 + 公式2）*（该科室护士人数 / 该科室人员数） 
					// 9、某住院科室护士分摊的供应室、住院收费处和病案室人员经费成本 = 
					// （公式3 + 公式4 + 公式5）*（该科室护士人数 / 该科室人员数） 
					// 10、某医技科室护士分摊的供应室和挂号收费处人员经费成本 = 
					// （公式6 + 公式7）*（该科室护士人数 / 该科室人员数）

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
							safeDouble(ttf.getFxL2Other()) + base * (cadItemIn.getCostOther() + fentan.getFxL1Other()));
					ttf.setFxL2Vc(
							safeDouble(ttf.getFxL2Vc()) + base * (cadItemIn.getCostVcFunds() + fentan.getFxL1Vc()));
					ttf.setFxL2Wscl(
							safeDouble(ttf.getFxL2Wscl()) + base * (cadItemIn.getCostWscl() + fentan.getFxL1Wscl()));

					ttf.setFxL2People(safeDouble(ttf.getFxL2People())
							+ base * (cadItemIn.getCostPeople() + fentan.getFxL1People()));
					
					ttf.setFxL2PeopleFzrys(safeDouble(ttf.getFxL2PeopleFzrys())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt())
							* (div(cadItem.getPeopleCountFzrys() + 0.00, cadItem.getPeopleCount())));
					ttf.setFxL2PeopleHs(safeDouble(ttf.getFxL2PeopleHs())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt())
							* (div(cadItem.getPeopleCountHs() + 0.00, cadItem.getPeopleCount())));
					ttf.setFxL2PeopleJs(safeDouble(ttf.getFxL2PeopleJs())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt())
							* (div(cadItem.getPeopleCountJs() + 0.00, cadItem.getPeopleCount())));
					ttf.setFxL2PeopleQt(safeDouble(ttf.getFxL2PeopleQt())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt())
							* (div(cadItem.getPeopleCountQt() + 0.00, cadItem.getPeopleCount())));
					ttf.setFxL2PeopleZrys(safeDouble(ttf.getFxL2PeopleZrys())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt())
							* (div(cadItem.getPeopleCountZrys() + 0.00, cadItem.getPeopleCount())));
					ttf.setFxL2PeopleZzys(safeDouble(ttf.getFxL2PeopleZzys())
							+ base * (cadItemIn.getCostPeopleQt() + fentan.getFxL1PeopleQt())
							* (div(cadItem.getPeopleCountZzys() + 0.00, cadItem.getPeopleCount())));

				}

			}

			// 分摊对象
			TCostaccountFentan ttf = getFentanMulLev().get(deptCode);
			Cncbl cncbl = new Cncbl();
			cncbl.setDeptCode(deptCode);
			cncbl.setDeptName(cadItem.getDeptName());

			// 医生
			cncbl.setYsCncbl(div(ttf.getFxL2PeopleFzrys() + ttf.getFxL2PeopleZrys() + ttf.getFxL2PeopleZzys(),
					(cadItem.getPeopleCountZzys() + cadItem.getPeopleCountZrys() + cadItem.getPeopleCountFzrys())
							* VALID_TIME));
			// 护士
			cncbl.setHsCncbl(div(ttf.getFxL2PeopleHs(), (cadItem.getPeopleCountHs() * VALID_TIME)));
			// 技师
			cncbl.setJsCncbl(div(ttf.getFxL2PeopleJs(), (cadItem.getPeopleCountJs() * VALID_TIME)));
			// 其他人员
			cncbl.setOpCncbl(div(ttf.getFxL2PeopleQt(), (cadItem.getPeopleCountQt() * VALID_TIME)));

			// 房屋、通用设备
			cncbl.setHouseCncbl(div(ttf.getFxL2DeviceCommon(), (cadItem.getPeopleCount() * VALID_TIME)));
			// 专用设备
			cncbl.setSpeCncbl(div(ttf.getFxL2DeviceSpe(), VALID_TIME));
			// 无形资产
			cncbl.setAssetCncbl(div(ttf.getFxL2Asset(), (cadItem.getPeopleCount() * VALID_TIME)));
			// 其他费用
			cncbl.setOcCncbl(div(ttf.getFxL2Other(), (cadItem.getPeopleCount() * VALID_TIME)));

			if(isComputeCncbl(cadItem)){
				deptFtyfCncbl.put(deptCode, cncbl);
			}

		}

		// 计算三级分摊以及临床全成本-分摊医技
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
					Double totalCount = kdgzlAllMap.get(cadItemIn.getDeptCode());// 医技科室全年工作量（开单）
					totalCount = totalCount == null ? 0 : totalCount;

					TCostaccountFentan fentan = getFentanMulLev().get(deptCodeIn);

					Double base = totalCount == 0 ? 0 : kdgzl / totalCount;

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

		// 4、科室级-业务成本产能成本率
		// 5、科室级-全成本产能成本率
		for (CADItem cadItem : cadItems) {
			// 临床或者医技科室
			if (cadItem.isDeptTypeLC() || cadItem.isDeptTypeYJ()) {
				String deptCode = cadItem.getDeptCode();

				Cncbl zcbjCncblDept = deptZjcbCncbl.get(deptCode);
				Cncbl ftyfCncblDept = deptFtyfCncbl.get(deptCode);
				Cncbl ftxzhqCncblDept = deptFtxzhqCncbl.get(deptCode);

				// 业务成本
				Cncbl ywcbCncblY = new Cncbl();
				ywcbCncblY.settJobId(job.getId());
				ywcbCncblY.setLevel(1);
				ywcbCncblY.setType(2);
				ywcbCncblY.setDeptCode(deptCode);
				ywcbCncblY.setDeptName(cadItem.getDeptName());
				// 医生
				ywcbCncblY.setYsCncbl(zcbjCncblDept.getYsCncbl() + ftyfCncblDept.getYsCncbl());
				// 护士
				ywcbCncblY.setHsCncbl(zcbjCncblDept.getHsCncbl() + ftyfCncblDept.getHsCncbl());
				// 技师
				ywcbCncblY.setJsCncbl(zcbjCncblDept.getJsCncbl() + ftyfCncblDept.getJsCncbl());
				// 其他人员
				ywcbCncblY.setOpCncbl(zcbjCncblDept.getOpCncbl() + ftyfCncblDept.getOpCncbl());

				// 房屋、通用设备
				ywcbCncblY.setHouseCncbl(zcbjCncblDept.getHouseCncbl() + ftyfCncblDept.getHouseCncbl());
				// 专用设备
				ywcbCncblY.setSpeCncbl(zcbjCncblDept.getSpeCncbl() + ftyfCncblDept.getSpeCncbl());
				// 无形资产
				ywcbCncblY.setAssetCncbl(zcbjCncblDept.getAssetCncbl() + ftyfCncblDept.getAssetCncbl());
				// 其他费用
				ywcbCncblY.setOcCncbl(zcbjCncblDept.getOcCncbl() + ftyfCncblDept.getOcCncbl());

				if(isComputeCncbl(cadItem)){
					deptYwcbCncbl.put(deptCode, ywcbCncblY);
				}

				// 全成本
				Cncbl qcbCncblY = new Cncbl();
				qcbCncblY.settJobId(job.getId());
				qcbCncblY.setLevel(1);
				qcbCncblY.setType(3);
				qcbCncblY.setDeptCode(deptCode);
				qcbCncblY.setDeptName(cadItem.getDeptName());
				// 医生
				qcbCncblY.setYsCncbl(
						zcbjCncblDept.getYsCncbl() + ftyfCncblDept.getYsCncbl() + ftxzhqCncblDept.getYsCncbl());
				// 护士
				qcbCncblY.setHsCncbl(
						zcbjCncblDept.getHsCncbl() + ftyfCncblDept.getHsCncbl() + ftxzhqCncblDept.getHsCncbl());
				// 技师
				qcbCncblY.setJsCncbl(
						zcbjCncblDept.getJsCncbl() + ftyfCncblDept.getJsCncbl() + ftxzhqCncblDept.getJsCncbl());
				// 其他人员
				qcbCncblY.setOpCncbl(
						zcbjCncblDept.getOpCncbl() + ftyfCncblDept.getOpCncbl() + ftxzhqCncblDept.getOpCncbl());
				// 房屋、通用设备
				qcbCncblY.setHouseCncbl(zcbjCncblDept.getHouseCncbl() + ftyfCncblDept.getHouseCncbl()
						+ ftxzhqCncblDept.getHouseCncbl());
				// 专用设备
				qcbCncblY.setSpeCncbl(
						zcbjCncblDept.getSpeCncbl() + ftyfCncblDept.getSpeCncbl() + ftxzhqCncblDept.getSpeCncbl());
				// 无形资产
				qcbCncblY.setAssetCncbl(zcbjCncblDept.getAssetCncbl() + ftyfCncblDept.getAssetCncbl()
						+ ftxzhqCncblDept.getAssetCncbl());
				// 其他费用
				qcbCncblY.setOcCncbl(
						zcbjCncblDept.getOcCncbl() + ftyfCncblDept.getOcCncbl() + ftxzhqCncblDept.getOcCncbl());

				if(isComputeCncbl(cadItem)){
					deptQcbCncbl.put(deptCode, qcbCncblY);
				}

			}

		}

		// 6、院级-直接成本产能成本率
		hosZjcbCncbl = handleHosCncbl(deptZjcbCncbl);
		hosZjcbCncbl.settJobId(job.getId());
		hosZjcbCncbl.setLevel(2);
		hosZjcbCncbl.setType(1);
		// 7、院级-分摊的医辅科室成本产能成本率
		hosFtyfCncbl = handleHosCncbl(deptFtyfCncbl);
		// 8、院级-分摊的行政后勤科室成本产能成本率
		hosFtxzhqCncbl = handleHosCncbl(deptFtxzhqCncbl);

		// 9、院级-业务成本产能成本率
		// 医生
		hosYwcbCncbl.setYsCncbl(hosZjcbCncbl.getYsCncbl() + hosFtyfCncbl.getYsCncbl());
		// 护士
		hosYwcbCncbl.setHsCncbl(hosZjcbCncbl.getHsCncbl() + hosFtyfCncbl.getHsCncbl());
		// 技师
		hosYwcbCncbl.setJsCncbl(hosZjcbCncbl.getJsCncbl() + hosFtyfCncbl.getJsCncbl());
		// 其他人员
		hosYwcbCncbl.setOpCncbl(hosZjcbCncbl.getOpCncbl() + hosFtyfCncbl.getOpCncbl());
		// 房屋、通用设备
		hosYwcbCncbl.setHouseCncbl(hosZjcbCncbl.getHouseCncbl() + hosFtyfCncbl.getHouseCncbl());
		// 专用设备
		hosYwcbCncbl.setSpeCncbl(hosZjcbCncbl.getSpeCncbl() + hosFtyfCncbl.getSpeCncbl());
		// 无形资产
		hosYwcbCncbl.setAssetCncbl(hosZjcbCncbl.getAssetCncbl() + hosFtyfCncbl.getAssetCncbl());
		// 其他费用
		hosYwcbCncbl.setOcCncbl(hosZjcbCncbl.getOcCncbl() + hosFtyfCncbl.getOcCncbl());
		hosYwcbCncbl.settJobId(job.getId());
		hosYwcbCncbl.setLevel(2);
		hosYwcbCncbl.setType(2);

		// 10、院级-全成本产能成本率
		// 医生
		hosQcbCncbl.setYsCncbl(hosZjcbCncbl.getYsCncbl() + hosFtyfCncbl.getYsCncbl() + hosFtxzhqCncbl.getYsCncbl());
		// 护士
		hosQcbCncbl.setHsCncbl(hosZjcbCncbl.getHsCncbl() + hosFtyfCncbl.getHsCncbl() + hosFtxzhqCncbl.getHsCncbl());
		// 技师
		hosQcbCncbl.setJsCncbl(hosZjcbCncbl.getJsCncbl() + hosFtyfCncbl.getJsCncbl() + hosFtxzhqCncbl.getJsCncbl());
		// 其他人员
		hosQcbCncbl.setOpCncbl(hosZjcbCncbl.getOpCncbl() + hosFtyfCncbl.getOpCncbl() + hosFtxzhqCncbl.getOpCncbl());
		// 房屋、通用设备
		hosQcbCncbl.setHouseCncbl(
				hosZjcbCncbl.getHouseCncbl() + hosFtyfCncbl.getHouseCncbl() + hosFtxzhqCncbl.getHouseCncbl());
		// 专用设备
		hosQcbCncbl.setSpeCncbl(hosZjcbCncbl.getSpeCncbl() + hosFtyfCncbl.getSpeCncbl() + hosFtxzhqCncbl.getSpeCncbl());
		// 无形资产
		hosQcbCncbl.setAssetCncbl(
				hosZjcbCncbl.getAssetCncbl() + hosFtyfCncbl.getAssetCncbl() + hosFtxzhqCncbl.getAssetCncbl());
		// 其他费用
		hosQcbCncbl.setOcCncbl(hosZjcbCncbl.getOcCncbl() + hosFtyfCncbl.getOcCncbl() + hosFtxzhqCncbl.getOcCncbl());
		hosQcbCncbl.settJobId(job.getId());
		hosQcbCncbl.setLevel(2);
		hosQcbCncbl.setType(3);

		// 项目理论成本结果
		// 1、科室级-项目理论成本（直接成本）
		// 2、科室级-项目理论成本（业务成本）
		// 3、科室级-项目理论成本（全成本）
		for (CADItem cadItem : cadItems) {
			String deptCode = cadItem.getDeptCode();
			// 临床或者医技科室
			if (cadItem.isDeptTypeLC() || cadItem.isDeptTypeYJ()) {
				for (TProDic proDic : proDicsList) {
					ProCost proCost = new ProCost();
					proCost.settJobId(job.getId());
					proCost.setLevel(1);
					proCost.setDeptCode(deptCode);
					proCost.setDeptName(cadItem.getDeptName());
					proCost.setProCode(proDic.getProCode());
					proCost.setProName(proDic.getProName());
					proCost.setCostWsclf(proDic.getWsclf());
					proCost.setCostYlfxjj(proDic.getYlfxjj());

					// 项目消耗
					Double proCostTemp = proDic.getCostTime()
							* (proDic.getPcYs() + proDic.getPcHs() + proDic.getPcJs() + proDic.getPcO());

					// 直接成本
					Cncbl zjcbCncbl = deptZjcbCncbl.get(deptCode);
					proCost.setCostPeopleDirect(proCostTemp * (zjcbCncbl.getYsCncbl() + zjcbCncbl.getHsCncbl()
							+ zjcbCncbl.getJsCncbl() + zjcbCncbl.getOpCncbl()));
					proCost.setCostHouseDirect(proCostTemp * zjcbCncbl.getHouseCncbl());
					proCost.setCostSpeDirect(proCostTemp * zjcbCncbl.getSpeCncbl());
					proCost.setCostAssetDirect(proCostTemp * zjcbCncbl.getAssetCncbl());
					proCost.setCostOtherDirect(proCostTemp * zjcbCncbl.getOcCncbl());

					// 间接成本-业务成本
					Cncbl ftyfCncbl = deptFtyfCncbl.get(deptCode);
					proCost.setCostPeopleMidYw(proCostTemp * (ftyfCncbl.getYsCncbl() + ftyfCncbl.getHsCncbl()
							+ ftyfCncbl.getJsCncbl() + ftyfCncbl.getOpCncbl()));
					proCost.setCostHouseMidYw(proCostTemp * ftyfCncbl.getHouseCncbl());
					proCost.setCostSpeMidYw(proCostTemp * ftyfCncbl.getSpeCncbl());
					proCost.setCostAssetMidYw(proCostTemp * ftyfCncbl.getAssetCncbl());
					proCost.setCostOtherMidYw(proCostTemp * ftyfCncbl.getOcCncbl());

					// 间接成本-全成本
					Cncbl ftxzhqCncbl = deptFtxzhqCncbl.get(deptCode);
					proCost.setCostPeopleMidAll(proCostTemp * (ftyfCncbl.getYsCncbl() + ftyfCncbl.getHsCncbl()
							+ ftyfCncbl.getJsCncbl() + ftyfCncbl.getOpCncbl() + ftxzhqCncbl.getYsCncbl()
							+ ftxzhqCncbl.getHsCncbl() + ftxzhqCncbl.getJsCncbl() + ftxzhqCncbl.getOpCncbl()));
					proCost.setCostHouseMidAll(proCostTemp * (ftyfCncbl.getHouseCncbl() + ftxzhqCncbl.getHouseCncbl()));
					proCost.setCostSpeMidAll(proCostTemp * (ftyfCncbl.getSpeCncbl() + ftxzhqCncbl.getSpeCncbl()));
					proCost.setCostAssetMidAll(proCostTemp * (ftyfCncbl.getAssetCncbl() + ftxzhqCncbl.getAssetCncbl()));
					proCost.setCostOtherMidAll(proCostTemp * (ftyfCncbl.getOcCncbl() + ftxzhqCncbl.getOcCncbl()));

					deptProCosts.add(proCost);

				}

			}
		}

		// 4、院级-项目理论成本（直接成本）
		// 5、院级-项目理论成本（业务成本）
		// 6、院级-项目理论成本（全成本）
		for (TProDic proDic : proDicsList) {
			ProCost hosCncblCost = new ProCost();
			hosCncblCost.settJobId(job.getId());
			hosCncblCost.setLevel(2);
			hosCncblCost.setProCode(proDic.getProCode());
			hosCncblCost.setProName(proDic.getProName());
			hosCncblCost.setCostWsclf(proDic.getWsclf());
			hosCncblCost.setCostYlfxjj(proDic.getYlfxjj());

			// 项目消耗
			Double proCostTemp = proDic.getCostTime()
					* (proDic.getPcYs() + proDic.getPcHs() + proDic.getPcJs() + proDic.getPcO());

			// 直接成本
			hosCncblCost.setCostPeopleDirect(proCostTemp * (hosZjcbCncbl.getYsCncbl() + hosZjcbCncbl.getHsCncbl()
					+ hosZjcbCncbl.getJsCncbl() + hosZjcbCncbl.getOpCncbl()));
			hosCncblCost.setCostHouseDirect(proCostTemp * hosZjcbCncbl.getHouseCncbl());
			hosCncblCost.setCostSpeDirect(proCostTemp * hosZjcbCncbl.getSpeCncbl());
			hosCncblCost.setCostAssetDirect(proCostTemp * hosZjcbCncbl.getAssetCncbl());
			hosCncblCost.setCostOtherDirect(proCostTemp * hosZjcbCncbl.getOcCncbl());

			// 间接成本-业务成本

			hosCncblCost.setCostPeopleMidYw(proCostTemp * (hosFtyfCncbl.getYsCncbl() + hosFtyfCncbl.getHsCncbl()
					+ hosFtyfCncbl.getJsCncbl() + hosFtyfCncbl.getOpCncbl()));
			hosCncblCost.setCostHouseMidYw(proCostTemp * hosFtyfCncbl.getHouseCncbl());
			hosCncblCost.setCostSpeMidYw(proCostTemp * hosFtyfCncbl.getSpeCncbl());
			hosCncblCost.setCostAssetMidYw(proCostTemp * hosFtyfCncbl.getAssetCncbl());
			hosCncblCost.setCostOtherMidYw(proCostTemp * hosFtyfCncbl.getOcCncbl());

			// 间接成本-全成本
			hosCncblCost.setCostPeopleMidAll(proCostTemp * (hosFtyfCncbl.getYsCncbl() + hosFtyfCncbl.getHsCncbl()
					+ hosFtyfCncbl.getJsCncbl() + hosFtyfCncbl.getOpCncbl() + hosFtxzhqCncbl.getYsCncbl()
					+ hosFtxzhqCncbl.getHsCncbl() + hosFtxzhqCncbl.getJsCncbl() + hosFtxzhqCncbl.getOpCncbl()));
			hosCncblCost
					.setCostHouseMidAll(proCostTemp * (hosFtyfCncbl.getHouseCncbl() + hosFtxzhqCncbl.getHouseCncbl()));
			hosCncblCost.setCostSpeMidAll(proCostTemp * (hosFtyfCncbl.getSpeCncbl() + hosFtxzhqCncbl.getSpeCncbl()));
			hosCncblCost
					.setCostAssetMidAll(proCostTemp * (hosFtyfCncbl.getAssetCncbl() + hosFtxzhqCncbl.getAssetCncbl()));
			hosCncblCost.setCostOtherMidAll(proCostTemp * (hosFtyfCncbl.getOcCncbl() + hosFtxzhqCncbl.getOcCncbl()));

			hosCncblCosts.add(hosCncblCost);
		}

	}

	private Cncbl handleHosCncbl(Map<String, Cncbl> cncbls) {
		Cncbl ret = new Cncbl();
		// 产能成本率不为0的科室数目
		int not0Ys = 0;
		int not0Hs = 0;
		int not0Js = 0;
		int not0Op = 0;
		int not0House = 0;
		int not0Spe = 0;
		int not0Asset = 0;
		int not0Oc = 0;
		// 各个科室产能成本率之和
		Double deptAllYs = 0d;
		Double deptAllHs = 0d;
		Double deptAllJs = 0d;
		Double deptAllOp = 0d;
		Double deptAllHouse = 0d;
		Double deptAllSpe = 0d;
		Double deptAllAsset = 0d;
		Double deptAllOc = 0d;

		for (String key : cncbls.keySet()) {
			Cncbl cncbl = cncbls.get(key);
			deptAllYs += cncbl.getYsCncbl();
			deptAllHs += cncbl.getHsCncbl();
			deptAllJs += cncbl.getJsCncbl();
			deptAllOp += cncbl.getOpCncbl();
			deptAllHouse += cncbl.getHouseCncbl();
			deptAllSpe += cncbl.getSpeCncbl();
			deptAllAsset += cncbl.getAssetCncbl();
			deptAllOc += cncbl.getOcCncbl();

			not0Ys += cncbl.getYsCncbl() == 0 ? 0 : 1;
			not0Hs += cncbl.getHsCncbl() == 0 ? 0 : 1;
			not0Js += cncbl.getJsCncbl() == 0 ? 0 : 1;
			not0Op += cncbl.getOpCncbl() == 0 ? 0 : 1;
			not0House += cncbl.getHouseCncbl() == 0 ? 0 : 1;
			not0Spe += cncbl.getSpeCncbl() == 0 ? 0 : 1;
			not0Asset += cncbl.getAssetCncbl() == 0 ? 0 : 1;
			not0Oc += cncbl.getOcCncbl() == 0 ? 0 : 1;

		}
		ret.setYsCncbl(div(deptAllYs, not0Ys));
		ret.setHsCncbl(div(deptAllHs, not0Hs));
		ret.setJsCncbl(div(deptAllJs, not0Js));
		ret.setOpCncbl(div(deptAllOp, not0Op));
		ret.setHouseCncbl(div(deptAllHouse, not0House));
		ret.setSpeCncbl(div(deptAllSpe, not0Spe));
		ret.setAssetCncbl(div(deptAllAsset, not0Asset));
		ret.setOcCncbl(div(deptAllOc, not0Oc));
		return ret;
	}

	// 二级分摊：该临床科室对该医技科室的开单工作量
	private Double getKdgzl(String deptCodeLc, String deptCodeYj) {
		Double kdgzl = kdgzlMap.get(deptCodeLc + "_" + deptCodeYj);
		return kdgzl == null ? 0d : kdgzl;
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
	 * 是否计算产能成本率
	 * @param item
	 * @return
	 */
	private Boolean isComputeCncbl(CADItem item){
		if(item == null) return false;
		if(item.isDeptTypeYJ() 
				|| item.isDeptSpecialOutpatient()
				|| item.isDeptSpecialInhos()){
			return true;
		}
		return false;
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

	public Map<String, Integer> getDeptTypePeopleCount() {
		return deptTypePeopleCount;
	}

	public void setDeptTypePeopleCount(Map<String, Integer> deptTypePeopleCount) {
		this.deptTypePeopleCount = deptTypePeopleCount;
	}

	public Map<String, Cncbl> getDeptZjcbCncbl() {
		return deptZjcbCncbl;
	}

	public void setDeptZjcbCncbl(Map<String, Cncbl> deptZjcbCncbl) {
		this.deptZjcbCncbl = deptZjcbCncbl;
	}

	public Map<String, Cncbl> getDeptFtyfCncbl() {
		return deptFtyfCncbl;
	}

	public void setDeptFtyfCncbl(Map<String, Cncbl> deptFtyfCncbl) {
		this.deptFtyfCncbl = deptFtyfCncbl;
	}

	public Map<String, Cncbl> getDeptFtxzhqCncbl() {
		return deptFtxzhqCncbl;
	}

	public void setDeptFtxzhqCncbl(Map<String, Cncbl> deptFtxzhqCncbl) {
		this.deptFtxzhqCncbl = deptFtxzhqCncbl;
	}

	public Map<String, Cncbl> getDeptYwcbCncbl() {
		return deptYwcbCncbl;
	}

	public void setDeptYwcbCncbl(Map<String, Cncbl> deptYwcbCncbl) {
		this.deptYwcbCncbl = deptYwcbCncbl;
	}

	public Map<String, Cncbl> getDeptQcbCncbl() {
		return deptQcbCncbl;
	}

	public void setDeptQcbCncbl(Map<String, Cncbl> deptQcbCncbl) {
		this.deptQcbCncbl = deptQcbCncbl;
	}

	public Cncbl getHosZjcbCncbl() {
		return hosZjcbCncbl;
	}

	public void setHosZjcbCncbl(Cncbl hosZjcbCncbl) {
		this.hosZjcbCncbl = hosZjcbCncbl;
	}

	public Cncbl getHosFtyfCncbl() {
		return hosFtyfCncbl;
	}

	public void setHosFtyfCncbl(Cncbl hosFtyfCncbl) {
		this.hosFtyfCncbl = hosFtyfCncbl;
	}

	public Cncbl getHosFtxzhqCncbl() {
		return hosFtxzhqCncbl;
	}

	public void setHosFtxzhqCncbl(Cncbl hosFtxzhqCncbl) {
		this.hosFtxzhqCncbl = hosFtxzhqCncbl;
	}

	public Cncbl getHosYwcbCncbl() {
		return hosYwcbCncbl;
	}

	public void setHosYwcbCncbl(Cncbl hosYwcbCncbl) {
		this.hosYwcbCncbl = hosYwcbCncbl;
	}

	public Cncbl getHosQcbCncbl() {
		return hosQcbCncbl;
	}

	public void setHosQcbCncbl(Cncbl hosQcbCncbl) {
		this.hosQcbCncbl = hosQcbCncbl;
	}

	public List<ProCost> getDeptProCosts() {
		return deptProCosts;
	}

	public void setDeptProCosts(List<ProCost> deptProCosts) {
		this.deptProCosts = deptProCosts;
	}

	public List<ProCost> getHosCncblCosts() {
		return hosCncblCosts;
	}

	public void setHosCncblCosts(List<ProCost> hosCncblCosts) {
		this.hosCncblCosts = hosCncblCosts;
	}

	public void setDeptCodeNameMap(Map<String, String> deptCodeNameMap) {
		this.deptCodeNameMap = deptCodeNameMap;
	}

}
