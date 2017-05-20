package cn.com.fanrenlee.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import cn.com.fanrenlee.model.common.PageParam;
import cn.com.fanrenlee.model.common.PagingResult;
import cn.com.fanrenlee.model.common.PagingSrcSql;
import cn.com.fanrenlee.model.tables.TProDic;
import cn.com.fanrenlee.util.StrUtils;
import cn.com.fanrenlee.util.doc.ExcelUtil;

/**
 * 项目字典业务类
 * 
 * @author lizhiyong
 *
 */
@Service
public class ProDicService extends SimpleServiceImpl {

	/**
	 * 获取信息-根据id
	 * 
	 * @param hosId
	 * @return
	 */
	public TProDic getById(Integer id) {
		List<TProDic> items = jdbcTemplate.query("select * from t_pro_dic where id = ? ", new Object[] { id },
				new BeanPropertyRowMapper<TProDic>(TProDic.class));
		return items.size() > 0 ? items.get(0) : null;
	}

	/**
	 * 删除信息-根据id
	 * 
	 * @param id
	 * @return
	 */
	public void delById(Integer id) {
		jdbcTemplate.update("delete from t_pro_dic where id = ? ", new Object[] { id });
	}
	
	/**
	 * 删除信息-根据医院id
	 * 
	 * @param hosId
	 * @return
	 */
	public void delByHosId(Integer hosId) {
		jdbcTemplate.update("delete from t_pro_dic where t_hospital_id = ? ", new Object[] { hosId });
	}

	/**
	 * 新增信息
	 * 
	 * @param
	 * @return
	 */
	public void add(TProDic dic) {
		jdbcTemplate
			.update("insert into t_pro_dic ("
				+ " pro_code, pro_name, cost_time, "
				+ " pc_ys, pc_hs, pc_js, pc_o, "
				+ " t_hospital_id, wsclf, ylfxjj) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?) ",
				new Object[] { dic.getProCode(), dic.getProName(), dic.getCostTime(),
						dic.getPcYs(), dic.getPcHs(),
						dic.getPcJs(), dic.getPcO(),
						dic.gettHospitalId(), dic.getWsclf(),
						dic.getYlfxjj() });
	}

	/**
	 * 修改信息
	 * 
	 * @param
	 * @return
	 */
	public void edit(TProDic dic) {
		jdbcTemplate
			.update("update t_pro_dic set "
					+ " pro_code = ? ,pro_name = ?, cost_time = ?, "
					+ " pc_ys = ?, pc_hs = ?, pc_js = ?, "
					+ " pc_o = ?, wsclf= ?, "
					+ " ylfxjj = ? where id = ? ",
				new Object[] { dic.getProCode(), dic.getProName(), dic.getCostTime(),
					dic.getPcYs(), dic.getPcHs(), dic.getPcJs(),
					dic.getPcO(), dic.getWsclf(),
					 dic.getYlfxjj(), dic.getId() });
	}

	public List<TProDic> getProDics(Integer hosId){
		return jdbcTemplate.query(" SELECT * from t_pro_dic where t_hospital_id = ? ", new Object[] { hosId },
				new BeanPropertyRowMapper<TProDic>(TProDic.class));
	}
	
	/**
	 * 字典分页查询
	 * 
	 * @param params
	 * @param pageParams
	 * @return
	 */
	public PagingResult getList(Map<String, String> params, PageParam pageParams) {

		PagingSrcSql srcSql = new PagingSrcSql();
		List<Object> values = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer(" SELECT * from t_pro_dic where 1=1 ");
		// 项目名称
		if (!StrUtils.isNull(params.get("proName"))) {
			sb.append(" and pro_name like ? ");
			values.add("%" + params.get("proName") + "%");
		}
		// 项目编码
		if (!StrUtils.isNull(params.get("proCode"))) {
			sb.append(" and pro_code = ? ");
			values.add(params.get("proCode"));
		}
		// 医院id
		if (!StrUtils.isNull(params.get("hosId"))) {
			sb.append(" and t_hospital_id = ? ");
			values.add(params.get("hosId"));
		}

		srcSql.setSrcSql(sb.toString());
		srcSql.setValues(values.toArray());

		return pagingSearch(params, pageParams, srcSql);
	}

	/**
	 * 导入项目字典
	 * @param inputStream
	 * @param hosId
	 */
	public void uploadData(InputStream inputStream, final Integer hosId) {
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
		
		// 获取3个sheet页数据
		final List<TProDic> proDics1 = getFirstSheetDataSrcData(srcData, hosId);
		final List<TProDic> proDics2 = getSecondSheetDataSrcData(srcData, hosId);
		final List<TProDic> proDics3 = getThirdSheetDataSrcData(srcData, hosId);
		
		// 融合3个列表数据
		final List<TProDic> allProDics = createProDics(proDics1, proDics2, proDics3);
		
		// 删除旧数据
		delByHosId(hosId);
		
		// 批量保存
		String sqlSave = "insert into t_pro_dic ("
				+ " t_hospital_id, pro_code, pro_name, cost_time, "
				+ " pc_ys, pc_hs, pc_js, pc_o, "
				+ " wsclf, ylfxjj) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.batchUpdate(sqlSave, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				TProDic item = allProDics.get(i);

				// + " t_hospital_id, pro_code, pro_name, cost_time, "
				ps.setObject(1, hosId);
				ps.setObject(2, handleDeptCode(item.getProCode()));
				ps.setObject(3, item.getProName());
				ps.setObject(4, item.getCostTime());

				// + " pc_ys, pc_hs, pc_js, pc_o, "
				ps.setObject(5, item.getPcYs());
				ps.setObject(6, item.getPcHs());
				ps.setObject(7, item.getPcJs());
				ps.setObject(8, item.getPcO());
				
				// + " wsclf, ylfxjj
				ps.setObject(9, item.getWsclf());
				ps.setObject(10, item.getYlfxjj());

			}

			// 处理科室编码，防止出现.0
			private String handleDeptCode(String deptCode) {
				if (deptCode != null && deptCode.endsWith(".0")) {
					return deptCode.substring(0, deptCode.length() - 2);
				}
				return deptCode;
			}

			@Override
			public int getBatchSize() {
				return allProDics.size();
			}

		});
		
	}
	
	/**
	 * 融合3个sheet页的内容
	 * @param proDics1
	 * @param proDics2
	 * @param proDics3
	 * @return
	 */
	private List<TProDic> createProDics(List<TProDic> proDics1, List<TProDic> proDics2, List<TProDic> proDics3) {
		Map<String, TProDic> temp = new HashMap<String, TProDic>();
		if(proDics1 != null){
			for(TProDic item : proDics1){
				String proCode = item.getProCode();
				temp.put(proCode, item);
			}
		}
		
		if(proDics2 != null){
			for(TProDic item : proDics2){
				String proCode = item.getProCode();
				if(temp.get(proCode) == null){
					temp.put(proCode, item);
				}else{
					TProDic oldItem = temp.get(proCode);
					oldItem.setWsclf(item.getWsclf());
				}
			}
		}
		
		if(proDics3 != null){
			for(TProDic item : proDics3){
				String proCode = item.getProCode();
				if(temp.get(proCode) == null){
					temp.put(proCode, item);
				}else{
					TProDic oldItem = temp.get(proCode);
					oldItem.setYlfxjj(item.getYlfxjj());
				}
			}
		}
		
		List<TProDic> newList = new ArrayList<TProDic>();
		for(String key : temp.keySet()){
			newList.add(temp.get(key));
		}
		return newList;
	}

	/**
	 * 从原始excel数据中获取数据-第一页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TProDic> getFirstSheetDataSrcData(List<List<List<String>>> srcData,
			Integer hosId) throws ServiceException {
		if (srcData == null || srcData.size() <= 0) {
			return null;
		}
		List<TProDic> srcItems = new ArrayList<TProDic>();
		List<List<String>> sheetDataItem = srcData.get(0);
		if (sheetDataItem.size() <= 1) {
			throw new ServiceException("第一页数据【项目字典】不符合规范，至少应有2行表头数据");
		}

		// 处理业务数据-从第三行开始
		for (int i = 2; i < sheetDataItem.size(); i++) {
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 7) {
				throw new ServiceException("第一页数据行至少应有7列数据(行" + (i + 1) + ")");
			}
			TProDic srcItem = new TProDic();
			srcItem.settHospitalId(hosId);
			srcItem.setProCode(rowDataItem.get(0));
			srcItem.setProName(rowDataItem.get(1));
			srcItem.setPcYs(getDouble(rowDataItem.get(2)));
			srcItem.setPcHs(getDouble(rowDataItem.get(3)));
			srcItem.setPcJs(getDouble(rowDataItem.get(4)));
			srcItem.setPcO(getDouble(rowDataItem.get(5)));
			srcItem.setCostTime(getInteger(rowDataItem.get(6)));
			
			srcItems.add(srcItem);
		}
		return srcItems;
	}
	
	/**
	 * 从原始excel数据中获取数据-第2页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TProDic> getSecondSheetDataSrcData(List<List<List<String>>> srcData,
			Integer hosId) throws ServiceException {
		if (srcData == null || srcData.size() <= 1) {
			return null;
		}
		List<TProDic> srcItems = new ArrayList<TProDic>();
		List<List<String>> sheetDataItem = srcData.get(1);
		if (sheetDataItem.size() <= 0) {
			throw new ServiceException("第二页数据【项目卫生材料费】不符合规范，至少应有1行表头数据");
		}

		// 处理业务数据-从第二行开始
		for (int i = 1; i < sheetDataItem.size(); i++) {
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 3) {
				throw new ServiceException("第二页数据行至少应有3列数据(行" + (i + 1) + ")");
			}
			TProDic srcItem = new TProDic();
			srcItem.settHospitalId(hosId);
			srcItem.setProCode(rowDataItem.get(0));
			srcItem.setProName(rowDataItem.get(1));
			srcItem.setWsclf(getDouble(rowDataItem.get(2)));
			
			srcItems.add(srcItem);
		}
		return srcItems;
	}
	
	/**
	 * 从原始excel数据中获取数据-第3页
	 *
	 * @param srcData
	 * @return
	 * @throws ServiceException
	 */
	private List<TProDic> getThirdSheetDataSrcData(List<List<List<String>>> srcData,
			Integer hosId) throws ServiceException {
		if (srcData == null || srcData.size() <= 2) {
			return null;
		}
		List<TProDic> srcItems = new ArrayList<TProDic>();
		List<List<String>> sheetDataItem = srcData.get(2);
		if (sheetDataItem.size() <= 0) {
			throw new ServiceException("第三页数据【项目医疗风险基金】不符合规范，至少应有1行表头数据");
		}

		// 处理业务数据-从第二行开始
		for (int i = 1; i < sheetDataItem.size(); i++) {
			List<String> rowDataItem = sheetDataItem.get(i);
			int rowDataitemSize = rowDataItem.size();
			if (rowDataitemSize < 3) {
				throw new ServiceException("第三页数据行至少应有3列数据(行" + (i + 1) + ")");
			}
			TProDic srcItem = new TProDic();
			srcItem.settHospitalId(hosId);
			srcItem.setProCode(rowDataItem.get(0));
			srcItem.setProName(rowDataItem.get(1));
			srcItem.setYlfxjj(getDouble(rowDataItem.get(2)));
			
			srcItems.add(srcItem);
		}
		return srcItems;
	}
	
	private Double getDouble(String text) {
		return text == null || text.equals("") ? null : Double.valueOf(text);
	}
	
	private Integer getInteger(String text) {
		return text == null || text.equals("") ? null : Integer.valueOf(String.valueOf(Math.round(getDouble(text))));
	}

}
