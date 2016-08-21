/**
 * Copyright www.sinosoft.com.cn
 */
package cn.com.fanrenlee.util.doc;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel操作工具类
 *
 * @author <a href="mainto:nytclizy@gmail.com">lizhiyong</a>
 * @since 2016年7月25日
 */
public class ExcelUtil {

	/**
	 * 将excel流转换为数据集
	 *
	 * @param inStream
	 * @return
	 * @throws IOException
	 *             excel流读取失败
	 */
	public static List<List<List<String>>> transExcelToData(
			InputStream inStream) throws IOException {
		List<List<List<String>>> sheetList = new ArrayList<List<List<String>>>();
		Workbook wb = null;
		try {
			wb = new XSSFWorkbook(inStream);
		} catch (Exception ex) {
			wb = new HSSFWorkbook(inStream);
		}
		int sheetNums = wb.getNumberOfSheets();
		for (int i = 0; i < sheetNums; i++) {
			List<List<String>> rowList = new ArrayList<List<String>>();
			Sheet sheet = wb.getSheetAt(i);
			Iterator<Row> rowIte = sheet.rowIterator();
			while (rowIte.hasNext()) {
				Row row = rowIte.next();
				int colNums = row.getLastCellNum();
				List<String> colList = new ArrayList<String>();
				for (int j = 0; j < colNums; j++) {
					Cell cell = row.getCell(j);
					if(cell == null){
						colList.add(null);
						continue;
					}
					cell.setCellType(Cell.CELL_TYPE_STRING);
					int cellType = cell.getCellType();
					if(Cell.CELL_TYPE_BLANK == cellType){
						colList.add(null);
					}else if(Cell.CELL_TYPE_NUMERIC == cellType){
						colList.add(String.valueOf(cell.getNumericCellValue()));
					}else if(Cell.CELL_TYPE_STRING == cellType){
						colList.add(cell.getStringCellValue());
					}else{
						colList.add(null);
					}
				}
				rowList.add(colList);
			}
			sheetList.add(rowList);
		}
		if(wb != null){
			wb.close();
		}
		return sheetList;
	}

}
