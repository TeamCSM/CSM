package com.csm.market.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.util.FileCopyUtils;

import com.csm.market.domain.SellItemLogVO;

public class Excel {

	public void sellingItemDown(Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) {
		
		// Workbook 생성
		Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
		//Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상

		// *** Sheet-------------------------------------------------
		// Sheet 생성
		Sheet sheet1 = xlsWb.createSheet("판매기록");

		// 컬럼 너비 설정
		sheet1.setColumnWidth(0, 5000);
		sheet1.setColumnWidth(1, 5000);
		sheet1.setColumnWidth(2, 5000);
		sheet1.setColumnWidth(3, 5000);
		sheet1.setColumnWidth(4, 5000);
		sheet1.setColumnWidth(5, 5000);
		sheet1.setColumnWidth(6, 5000);
		// ----------------------------------------------------------

		// *** Style--------------------------------------------------
		// Cell 스타일 생성
		CellStyle cellStyle = xlsWb.createCellStyle();

		// 줄 바꿈
		cellStyle.setWrapText(true);

		// Cell 색깔, 무늬 채우기
		cellStyle.setFillForegroundColor(HSSFColor.LIME.index);
		cellStyle.setFillPattern(CellStyle.BIG_SPOTS);

		Row row = null;
		Cell cell = null;
		//----------------------------------------------------------
		int count = 0;


		// 첫 번째 줄
		row = sheet1.createRow(0);
		cell = row.createCell(count++);
		cell.setCellValue("아이템번호");

		cell = row.createCell(count++);
		cell.setCellValue("이름");

		cell = row.createCell(count++);
		cell.setCellValue("점수(가격)");

		cell = row.createCell(count++);
		cell.setCellValue("수량");

		cell = row.createCell(count++);
		cell.setCellValue("판매자");

		cell = row.createCell(count++);
		cell.setCellValue("구매일");
		
		cell = row.createCell(count++);
		cell.setCellValue("구매자");


		// 첫 번째 줄에 Cell 설정하기-------------
		List<SellItemLogVO> list = (List<SellItemLogVO>) paramMap.get("list");
		count=0;
		int i =1;
		for(SellItemLogVO vo : list) {
			
			row = sheet1.createRow(i++);
			cell = row.createCell(count++);
			cell.setCellValue(vo.getItem_idx());

			cell = row.createCell(count++);
			cell.setCellValue(vo.getItem_name());

			cell = row.createCell(count++);
			cell.setCellValue(vo.getItem_price());
			
			cell = row.createCell(count++);
			cell.setCellValue(vo.getItem_amount());

			cell = row.createCell(count++);
			cell.setCellValue(vo.getItem_sellerId());

			cell = row.createCell(count++);
			String regdate = vo.getLog_regdate().toString();
			cell.setCellValue(regdate);

			cell = row.createCell(count++);
			cell.setCellValue(vo.getUser_id());
			count = 0;
		}
		/*
		cell = row.createCell(0);
		cell.setCellValue("1-1");
		cell.setCellStyle(cellStyle); // 셀 스타일 적용

		cell = row.createCell(1);
		cell.setCellValue("1-2");

		cell = row.createCell(2);
		cell.setCellValue("1-3 abccdefghijklmnopqrstuvwxyz");
		cell.setCellStyle(cellStyle); // 셀 스타일 적용
		//---------------------------------

		// 두 번째 줄
		row = sheet1.createRow(1);

		// 두 번째 줄에 Cell 설정하기-------------
		cell = row.createCell(0);
		cell.setCellValue("2-1");

		cell = row.createCell(1);
		cell.setCellValue("2-2");

		cell = row.createCell(2);
		cell.setCellValue("2-3");
		cell.setCellStyle(cellStyle); // 셀 스타일 적용
		//---------------------------------
		 */
		// excel 파일 저장
		UUID uid = UUID.randomUUID();

		String savedName = "SellList_"+uid.toString();

		try {

			File xlsFile = new File("C:/Users/rlady/Downloads/"+savedName+".xls");
			FileOutputStream fileOut = new FileOutputStream(xlsFile);
			xlsWb.write(fileOut);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}