/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.costaccount.CADItem;
import cn.com.fanrenlee.model.costaccount.DeptInfo;
import cn.com.fanrenlee.util.doc.ExcelUtil;

/**
 * 成本核算分摊算法
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
@Service
public class CostAccountFentanService {

	/**
	 * 处理原始数据excel
	 * 
	 * @throws ServiceException
	 */
	public void handleSrcData(InputStream inputStream) throws ServiceException {
		List<List<List<String>>> srcData = null;
		try {
			srcData = ExcelUtil.transExcelToData(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
			throw new ServiceException("excel解析失败");
		}
		if (srcData == null) {
			throw new ServiceException("excel解析失败");
		}
		
		//原始业务数据
		List<CADItem> cadItems = getCadItemsFromSrcData(srcData);

	}

	/**
	 * 从原始excel数据中获取业务数据
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<CADItem> getCadItemsFromSrcData(
			List<List<List<String>>> srcData) throws ServiceException {
		if (srcData == null || srcData.get(0).size() == 0) {
			return null;
		}
		List<CADItem> cadItems = new ArrayList<CADItem>();
		List<List<String>> sheetDataItem = srcData.get(0);
		if (sheetDataItem.size() <= 1) {
			throw new ServiceException("第一页数据不符合规范，至少应有2行数据");
		}
		for (int i = 0; i < sheetDataItem.size(); i++) {
			// 忽略标题行
			if (i == 0)
				continue;
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize <= 2) {
				throw new ServiceException("基础数据行至少应有两列数据(行" + (i + 1) + ")");
			}
			for (int j = 0; j < rowDataitemSize; j++) {
				CADItem cadItem = new CADItem();
				String cellData = rowDataItem.get(j);
				DeptInfo deptInfo = new DeptInfo();
				if (j == 0) {// 第1列-科室代码
					deptInfo.setDeptCode(cellData);
				} else if (j == 1) {// 第2列-科室名称
					deptInfo.setDeptName(cellData);
				} else if (j == 2) {// 第3列-人员经费
					cadItem.setCostPeople(Float.valueOf(cellData));
				} else if (j == 3) {// 第4列-通用设备折旧费
					cadItem.setCostOldDeviceCommon(Float.valueOf(cellData));
				} else if (j == 4) {// 第5列-专用设备折旧费
					cadItem.setCostOldDeviceSpecial(Float.valueOf(cellData));
				} else if (j == 5) {// 第6列-房屋折旧费
					cadItem.setCostOldHouse(Float.valueOf(cellData));
				} else if (j == 6) {// 第7列-无形资产摊销费
					cadItem.setCostAssetAmortize(Float.valueOf(cellData));
				} else if (j == 7) {// 第8列-计提医疗风险基金
					cadItem.setCostVCFunds(Float.valueOf(cellData));
				} else if (j == 8) {// 第9列-其他费用
					cadItem.setCostOther(Float.valueOf(cellData));
				}
				cadItem.setDeptInfo(deptInfo);
				cadItems.add(cadItem);
			}
		}
		return cadItems;
	}
	
	/**
	 * 获取科室的配置信息
	 */
	private void getDeptInfos(){
		
	}
	
	/**
	 * 根据科室码设置科室的其他信息
	 *
	 * @param deptCode
	 * @param deptInfo
	 */
	private void setDeptInfoByDeptCode(String deptCode, DeptInfo deptInfo){
		
	}

}
