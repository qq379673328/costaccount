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
	
	public ProItemHandler(List<ProItem> proItems, List<TProDic> dics,
			List<TCostaccountFentan> fentanLevel0Datas) {
		this.proItems = proItems;
		//转换字典数据格式
		for(TProDic dic : dics){
			dicMap.put(dic.getProCode(), dic);
		}
		
		//转换分摊数据-分摊
		for(TCostaccountFentan fentan : fentanLevel0Datas){
			fentanMapFentan.put(fentan.getDeptCode(), fentan);
		}
		
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
		// 计算
		for (ProItem item : proItems) {
			// 科室编码
			String deptCode = item.getDeptCode();
			// 科室人员总数
			int deptPeopleTotal = safeInteger(item.getPeopleCountFzrys()) + safeInteger(item.getPeopleCountHs())
				+ safeInteger(item.getPeopleCountJs())
				+ safeInteger(item.getPeopleCountZrys())
				+ safeInteger(item.getPeopleCountZzys())
				//+ item.getPeopleCountQt() //忽略其它人
				;
			//有效劳动时间
			float validTime = 126720 * 0.83f;
			//费用产能
			float channengCost = deptPeopleTotal * validTime;
			TProDic proDic = dicMap.get(item.getProCode());
			if(proDic == null){
				throw new RuntimeException("项目字典项【"+item.getProCode()+"】未维护，请维护后再操作");
			}
			//分摊数据
			TCostaccountFentan fentan = fentanMapFentan.get(deptCode);
			
			//计算直接成本
			float directCost = (
				//科室医生产能成本率
				(safeFloat(item.getCostPeopleZzys()) + safeFloat(item.getCostPeopleFzzys()) + safeFloat(item.getCostPeopleZrys()))
				/((safeInteger(item.getPeopleCountZzys()) + safeInteger(item.getPeopleCountFzrys()) + safeInteger(item.getPeopleCountZrys()))  * validTime)
				+ //科室护士产能成本率
				safeFloat(item.getCostPeopleHs())/(safeInteger(item.getPeopleCountHs()) * validTime)
				+ //科室技师产能成本率
				safeFloat(item.getCostPeopleJs())/(safeInteger(item.getPeopleCountJs()) * validTime)
				+ //费用成本率
					safeFloat(item.getCostAssetAmortize())/channengCost
					+ safeFloat(item.getCostOldDeviceSpecial())/channengCost
					+ safeFloat(item.getCostOldHouseDeviceCommon())/channengCost
					+ safeFloat(item.getCostOther())/channengCost
					+ safeFloat(item.getCostVcFunds())/channengCost
				//项目工时
				) * safeFloat(proDic.getCostTime()) * 
					(safeInteger(proDic.getPeopleCountDoctor()) + safeInteger(proDic.getPeopleCountNurse()) + safeInteger(proDic.getPeopleCountTech()))
				//内涵一次性耗材成本
				+ safeFloat(proDic.getCostOnce())
				// 低值易耗品成本
				+ safeFloat(proDic.getCostLowLevel())
				;
			
			// 业务成本
			
			// 全成本
			float allCost = 0;
			if(fentan == null){
				allCost = directCost;
			}else{
				allCost = (
					//科室医生产能成本率
					(safeFloat(item.getCostPeopleZzys()) + safeFloat(fentan.getFxL1PeopleZzys()) + safeFloat(fentan.getFxL2PeopleZzys()) + safeFloat(fentan.getFxL3PeopleZzys())
						+ safeFloat(item.getCostPeopleFzzys()) + safeFloat(fentan.getFxL1PeopleFzrys()) + safeFloat(fentan.getFxL2PeopleFzrys()) + safeFloat(fentan.getFxL3PeopleFzrys())
						+ safeFloat(item.getCostPeopleZrys()) + safeFloat(fentan.getFxL1PeopleZrys()) + safeFloat(fentan.getFxL2PeopleZrys()) + safeFloat(fentan.getFxL3PeopleZrys()))
					/((safeInteger(item.getPeopleCountZzys()) + safeInteger(item.getPeopleCountFzrys()) + safeInteger(item.getPeopleCountZrys()))  * validTime)
					+ //科室护士产能成本率
					(safeFloat(item.getCostPeopleHs()) + safeFloat(fentan.getFxL1PeopleHs()) + safeFloat(fentan.getFxL2PeopleHs()) + safeFloat(fentan.getFxL3PeopleHs()))/(safeInteger(item.getPeopleCountHs())  * validTime)
					+ //科室技师产能成本率
					(safeFloat(item.getCostPeopleJs()) + safeFloat(fentan.getFxL1PeopleJs()) + safeFloat(fentan.getFxL2PeopleJs()) + safeFloat(fentan.getFxL3PeopleJs()))/(safeInteger(item.getPeopleCountJs()) * validTime)
					+ //费用成本率
						(safeFloat(item.getCostAssetAmortize()) + safeFloat(fentan.getFxL1Asset()) + safeFloat(fentan.getFxL2Asset()) + safeFloat(fentan.getFxL3Asset()))/channengCost
						+ (safeFloat(item.getCostOldDeviceSpecial()) + safeFloat(fentan.getFxL1DeviceSpe()) + safeFloat(fentan.getFxL2DeviceSpe()) + safeFloat(fentan.getFxL3DeviceSpe()))/channengCost
						+ (safeFloat(item.getCostOldHouseDeviceCommon()) + safeFloat(fentan.getFxL1DeviceCommon()) + safeFloat(fentan.getFxL2DeviceCommon()) + safeFloat(fentan.getFxL3DeviceCommon()))/channengCost
						+ (safeFloat(item.getCostOther()) + safeFloat(fentan.getFxL1Other()) + safeFloat(fentan.getFxL2Other()) + safeFloat(fentan.getFxL3Other()))/channengCost
						+ (safeFloat(item.getCostVcFunds()) + safeFloat(fentan.getFxL1Vc()) + safeFloat(fentan.getFxL2Vc()) + safeFloat(fentan.getFxL3Vc()))/channengCost
					//项目工时
					) * safeFloat(proDic.getCostTime()) * (safeInteger(proDic.getPeopleCountDoctor()) + safeInteger(proDic.getPeopleCountNurse()) + safeInteger(proDic.getPeopleCountTech()))
					//内涵一次性耗材成本
					+ safeFloat(proDic.getCostOnce())
					// 低值易耗品成本
					+ safeFloat(proDic.getCostLowLevel())
					;
			}
			
			TProResult r = new TProResult();
			r.setProCode(item.getProCode());
			r.setProName(item.getProName());
			r.setDeptCode(item.getDeptCode());
			r.setDeptName(item.getDeptName());
			r.setCostDirect(directCost);
			r.setCostAll(allCost);
			//TODO 暂定全成本
			r.setCostServe(allCost);
			result.add(r);
		}

	}

	/**
	 * 获取最终计算结果
	 * @return
	 */
	public List<TProResult> getResultData() {
		return result;
	}

}
