/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.fanrenlee.model.pro.ProItem;
import cn.com.fanrenlee.model.tables.TCostaccountFentan;
import cn.com.fanrenlee.model.tables.TProDic;
import cn.com.fanrenlee.model.tables.TProResult;

/**
 * 项目理论成本算法处理工具类
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月26日
 */
public class ProItemHandler {

	/**
	 * 科室code分隔符
	 */
	public static final String CODE_SEP = ",";

	/**
	 * 原始业务数据
	 */
	private List<ProItem> proItems;

	/**
	 * 项目计算结果
	 */
	private List<TProResult> result = new ArrayList<TProResult>();

	/**
	 * 字典数据-map
	 */
	private Map<String, TProDic> dicMap = new HashMap<String, TProDic>();

	/**
	 * 分摊数据-分摊-map
	 */
	private Map<String, TCostaccountFentan> fentanMapFentan = new HashMap<String, TCostaccountFentan>();

	public ProItemHandler(List<ProItem> proItems, List<TProDic> dics, List<TCostaccountFentan> fentanLevel0Datas) {
		this.proItems = proItems;
		// 转换字典数据格式
		for (TProDic dic : dics) {
			dicMap.put(dic.getProCode(), dic);
		}

		// 转换分摊数据-分摊
		for (TCostaccountFentan fentan : fentanLevel0Datas) {
			fentanMapFentan.put(fentan.getDeptCode(), fentan);
		}

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
	 * 处理数据
	 */
	public void handle() {
		// 计算
		for (ProItem item : proItems) {
			// 科室编码
			String deptCode = item.getDeptCode();
			// 科室人员总数
			int deptPeopleTotal = safeInteger(item.getPeopleCountFzrys()) + safeInteger(item.getPeopleCountHs())
					+ safeInteger(item.getPeopleCountJs()) + safeInteger(item.getPeopleCountZrys())
					+ safeInteger(item.getPeopleCountZzys())
			// + item.getPeopleCountQt() //忽略其它人
			;
			// 有效劳动时间
			Double validTime = 126720 * 0.83d;
			// 费用产能
			Double channengCost = deptPeopleTotal * validTime;
			TProDic proDic = dicMap.get(item.getProCode());
			if (proDic == null) {
				throw new RuntimeException("项目字典项【" + item.getProCode() + "】未维护，请维护后再操作");
			}
			// 分摊数据
			TCostaccountFentan fentan = fentanMapFentan.get(deptCode);

			// 计算直接成本
			Double directCost = (
			// 科室医生产能成本率
			(safeDouble(item.getCostPeopleZzys()) + safeDouble(item.getCostPeopleFzzys())
					+ safeDouble(item.getCostPeopleZrys()))
					/ ((safeInteger(item.getPeopleCountZzys()) + safeInteger(item.getPeopleCountFzrys())
							+ safeInteger(item.getPeopleCountZrys())) * validTime)
					+ // 科室护士产能成本率
					safeDouble(item.getCostPeopleHs()) / (safeInteger(item.getPeopleCountHs()) * validTime) + // 科室技师产能成本率
					safeDouble(item.getCostPeopleJs()) / (safeInteger(item.getPeopleCountJs()) * validTime) + // 费用成本率
					safeDouble(item.getCostAssetAmortize()) / channengCost
					+ safeDouble(item.getCostOldDeviceSpecial()) / channengCost
					+ safeDouble(item.getCostOldHouseDeviceCommon()) / channengCost
					+ safeDouble(item.getCostOther()) / channengCost + safeDouble(item.getCostVcFunds()) / channengCost
			// 项目工时
			) * safeDouble(proDic.getCostTime())
					* (safeInteger(proDic.getPeopleCountDoctor()) + safeInteger(proDic.getPeopleCountNurse())
							+ safeInteger(proDic.getPeopleCountTech()))
					// 内涵一次性耗材成本
					+ safeDouble(proDic.getCostOnce())
					// 低值易耗品成本
					+ safeDouble(proDic.getCostLowLevel());

			// 业务成本

			// 全成本
			Double allCost = 0d;
			if (fentan == null) {
				allCost = directCost;
			} else {
				allCost = (
				// 科室医生产能成本率
				(safeDouble(item.getCostPeopleZzys()) + safeDouble(fentan.getFxL1PeopleZzys())
						+ safeDouble(fentan.getFxL2PeopleZzys()) + safeDouble(fentan.getFxL3PeopleZzys())
						+ safeDouble(item.getCostPeopleFzzys()) + safeDouble(fentan.getFxL1PeopleFzrys())
						+ safeDouble(fentan.getFxL2PeopleFzrys()) + safeDouble(fentan.getFxL3PeopleFzrys())
						+ safeDouble(item.getCostPeopleZrys()) + safeDouble(fentan.getFxL1PeopleZrys())
						+ safeDouble(fentan.getFxL2PeopleZrys()) + safeDouble(fentan.getFxL3PeopleZrys()))
						/ ((safeInteger(item.getPeopleCountZzys()) + safeInteger(item.getPeopleCountFzrys())
								+ safeInteger(item.getPeopleCountZrys())) * validTime)
						+ // 科室护士产能成本率
						(safeDouble(item.getCostPeopleHs()) + safeDouble(fentan.getFxL1PeopleHs())
								+ safeDouble(fentan.getFxL2PeopleHs()) + safeDouble(fentan.getFxL3PeopleHs()))
								/ (safeInteger(item.getPeopleCountHs()) * validTime)
						+ // 科室技师产能成本率
						(safeDouble(item.getCostPeopleJs()) + safeDouble(fentan.getFxL1PeopleJs())
								+ safeDouble(fentan.getFxL2PeopleJs()) + safeDouble(fentan.getFxL3PeopleJs()))
								/ (safeInteger(item.getPeopleCountJs()) * validTime)
						+ // 费用成本率
						(safeDouble(item.getCostAssetAmortize()) + safeDouble(fentan.getFxL1Asset())
								+ safeDouble(fentan.getFxL2Asset()) + safeDouble(fentan.getFxL3Asset())) / channengCost
						+ (safeDouble(item.getCostOldDeviceSpecial()) + safeDouble(fentan.getFxL1DeviceSpe())
								+ safeDouble(fentan.getFxL2DeviceSpe()) + safeDouble(fentan.getFxL3DeviceSpe()))
								/ channengCost
						+ (safeDouble(item.getCostOldHouseDeviceCommon()) + safeDouble(fentan.getFxL1DeviceCommon())
								+ safeDouble(fentan.getFxL2DeviceCommon()) + safeDouble(fentan.getFxL3DeviceCommon()))
								/ channengCost
						+ (safeDouble(item.getCostOther()) + safeDouble(fentan.getFxL1Other())
								+ safeDouble(fentan.getFxL2Other()) + safeDouble(fentan.getFxL3Other())) / channengCost
						+ (safeDouble(item.getCostVcFunds()) + safeDouble(fentan.getFxL1Vc())
								+ safeDouble(fentan.getFxL2Vc()) + safeDouble(fentan.getFxL3Vc())) / channengCost
				// 项目工时
				) * safeDouble(proDic.getCostTime())
						* (safeInteger(proDic.getPeopleCountDoctor()) + safeInteger(proDic.getPeopleCountNurse())
								+ safeInteger(proDic.getPeopleCountTech()))
						// 内涵一次性耗材成本
						+ safeDouble(proDic.getCostOnce())
						// 低值易耗品成本
						+ safeDouble(proDic.getCostLowLevel());
			}

			TProResult r = new TProResult();
			r.setProCode(item.getProCode());
			r.setProName(item.getProName());
			r.setDeptCode(item.getDeptCode());
			r.setDeptName(item.getDeptName());
			r.setCostDirect(directCost);
			r.setCostAll(allCost);
			// TODO 暂定全成本
			r.setCostServe(allCost);
			result.add(r);
		}

	}

	/**
	 * 获取最终计算结果
	 * 
	 * @return
	 */
	public List<TProResult> getResultData() {
		return result;
	}

}
