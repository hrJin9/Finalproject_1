package com.spring.admin_attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.service.InterAttendanceService;
import com.spring.hyerin.service.InterMemberService;

@Controller
public class Admin_attendanceController {
	
	@Autowired
	private InterAttendanceService service;
	
	@Autowired
	private InterMemberService memservice; 
	
	
	@RequestMapping(value = "/admin_attendanceList_holding.up")
	public ModelAndView admin_attendanceList_holding(HttpServletRequest request, ModelAndView mav) {
		
		String dropCondition = request.getParameter("dc");
		String dropVal = request.getParameter("dv");
		
		String searchVal = request.getParameter("sv");
		
		String s_sizePerPage = request.getParameter("sp");
		String s_cur = request.getParameter("cur");
		
		String year = request.getParameter("year");
		
		if(s_sizePerPage == null || !("20".equals(s_sizePerPage) || "40".equals(s_sizePerPage) || "80".equals(s_sizePerPage) ))
			s_sizePerPage = "20";
		if(s_cur == null)
			s_cur = "1";
		
		int sizePerPage = Integer.parseInt(s_sizePerPage);
		int cur = Integer.parseInt(s_cur);
		
		//????????? ??????
		if(dropCondition == null || "".equals(dropCondition)) dropCondition = "";
		if(dropVal == null || "".equals(dropVal)) dropVal = "";
		if("department_name".equals(dropCondition) && "".equals(dropVal)); //
		
		
		if(searchVal != null) searchVal = searchVal.trim();
		try {
			if(searchVal.isEmpty()) searchVal = "";
		} catch(NullPointerException e) {
			searchVal = "";
		}
		
		if(year == null) {
			Date today = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy");
			year = date.format(today);
		}
		

		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchVal", searchVal);
		paraMap.put("dropCondition", dropCondition);
		paraMap.put("dropVal", dropVal);
		paraMap.put("sizePerPage", s_sizePerPage);
		paraMap.put("year",year);
		
		// ??? ????????? ???(??????) ????????????
		int totalCount = service.getAdTotal(paraMap);	
		int totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		//????????? ??????
		try {
			if(cur < 1 || cur > totalPage)
				cur = 1;
		} catch(NumberFormatException e) {
			cur = 1;
		}
		
		int startRno = ((cur - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		// ????????? ?????????(??????) ????????????
		List<EmployeeVO> evoList = service.getAdList(paraMap);
		
		//???????????? ?????????
		int blockSize = 10;
		int loop = 1;
		int pageNo = ((cur - 1) / blockSize) * blockSize + 1;
		
		String pageBarHTML = "<nav><ul class='pagination mg-pagebar'>";
		String url = "admin_attendanceList_holding.up";
		
		// [?????????][??????] ?????????
		if(pageNo != 1) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?year="+year+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur=1'><span aria-hidden='true'>&laquo;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?year="+year+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
		}
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo == cur) {
				pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
			}
			else {
				pageBarHTML += "<li class='page-item'><a class='page-link' href='"+url+"?year="+year+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop++;
			pageNo++;
		}//end of while
		// [??????][?????????] ?????????
		if(pageNo <= totalPage) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?year="+year+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='?????????' href='"+url+"?year="+year+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		
		pageBarHTML += "</ul></nav>";
		
		
		// ???????????? ????????????
		List<DepartmentsVO> dvoList = memservice.getdeptname();
		
		// ???????????? ????????????
		List<String> pList = memservice.getposition();
		
		
		// ????????????, ????????? ???????????? ??????
		mav.addObject("paraMap", paraMap);
		mav.addObject("pageBar", pageBarHTML);
		mav.addObject("evoList",evoList);
		mav.addObject("dvoList",dvoList);
		mav.addObject("pList",pList);
		
		mav.setViewName("admin/admin_attendanceList_holding.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_attendanceList_usage.up")
	public ModelAndView admin_attendanceList_usage(HttpServletRequest request, ModelAndView mav) {
		
		String dropCondition = request.getParameter("dc");
		String dropVal = request.getParameter("dv");
		String searchCondition = request.getParameter("sc");
		String searchVal = request.getParameter("sv");
		
		String s_sizePerPage = request.getParameter("sp");
		
		String s_cur = request.getParameter("cur");
		String year = request.getParameter("year");
		
		if(s_sizePerPage == null || !("20".equals(s_sizePerPage) || "40".equals(s_sizePerPage) || "80".equals(s_sizePerPage) ))
			s_sizePerPage = "20";
		if(s_cur == null)
			s_cur = "1";
		
		int sizePerPage = Integer.parseInt(s_sizePerPage);
		int cur = Integer.parseInt(s_cur);
		
		//????????? ??????
		if(dropCondition == null || "".equals(dropCondition)) dropCondition = "";
		if(dropVal == null || "".equals(dropVal)) { dropVal = "";}
		if("department_name".equals(dropCondition) && "".equals(dropVal)); //
		
		
		if(searchVal != null) searchVal = searchVal.trim();
		try {
			if(searchVal.isEmpty()) searchVal = "";
		} catch(NullPointerException e) {
			searchVal = "";
		}
		
		
		if(year == null) {
			Date today = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy");
			year = date.format(today);
		}
		
		String startdate = "";
		String enddate = "";
		
		//?????? ???????????????
		if("period".equals(searchCondition) && !"".equals(searchVal)) {
			String[] datearr = searchVal.split(" ~ ");
			startdate = datearr[0];
			try {
				enddate = datearr[1];
			} catch(ArrayIndexOutOfBoundsException e) {
				enddate = startdate;
			}
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("sc", searchCondition);
		paraMap.put("sv", searchVal);
		paraMap.put("dc", dropCondition);
		paraMap.put("dv", dropVal);
		paraMap.put("sp", s_sizePerPage);
		paraMap.put("year",year);
		paraMap.put("startdate", startdate);
		paraMap.put("enddate", enddate);
		
		// ???????????? ????????????
		List<DepartmentsVO> dvoList = memservice.getdeptname();
		
		// ???????????? ????????????
		List<String> pList = memservice.getposition();
		
		
		// ?????? ???????????? ?????? ????????????
		int totalCount = service.getTotalAdUseList(paraMap);
		int totalPage = (int) Math.ceil((double) totalCount / sizePerPage);
		
		//????????? ??????
		try {
			if(cur < 1 || cur > totalPage)
				cur = 1;
		} catch(NumberFormatException e) {
			cur = 1;
		}
		
		int startRno = ((cur - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		
		// ?????????????????? ???????????? ????????????
		List<Map<String,String>> empList = service.getAdUseList(paraMap);
		
		//???????????? ?????????
		int blockSize = 10;
		int loop = 1;
		int pageNo = ((cur - 1) / blockSize) * blockSize + 1;
		
		String pageBarHTML = "<nav><ul class='pagination mg-pagebar'>";
		String url = "admin_attendanceList_usage.up";
		
		// [?????????][??????] ?????????
		if(pageNo != 1) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?year="+year+"&sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur=1'><span aria-hidden='true'>&laquo;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?year="+year+"&sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
		}
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo == cur) {
				pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
			}
			else {
				pageBarHTML += "<li class='page-item'><a class='page-link' href='"+url+"?year="+year+"&sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop++;
			pageNo++;
		}//end of while
		// [??????][?????????] ?????????
		if(pageNo <= totalPage) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?year="+year+"&sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='?????????' href='"+url+"?year="+year+"&sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		
		pageBarHTML += "</ul></nav>";
		
		
		mav.addObject("pageBar",pageBarHTML);
		mav.addObject("empList",empList);
		mav.addObject("paraMap",paraMap);
		mav.addObject("dvoList",dvoList);
		mav.addObject("pList",pList);
		mav.setViewName("admin/admin_attendanceList_usage.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/getExcelAd.up", method = { RequestMethod.POST })
	public String getExcelAd(@RequestParam Map<String,String> paraMap, HttpServletRequest request, Model model) throws Throwable {
		
		// ???????????? ????????????
		List<EmployeeVO> empList = service.getAdUseListAll(paraMap);
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		// ????????????
		SXSSFSheet sheet = workbook.createSheet("?????? ????????????");
		
		// ??????????????? ??????
		sheet.setColumnWidth(0, 2000);
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(2, 2000);
		sheet.setColumnWidth(3, 4000);
		sheet.setColumnWidth(4, 3000);
		sheet.setColumnWidth(5, 1500);
		sheet.setColumnWidth(6, 1500);
		sheet.setColumnWidth(7, 1500);
		
		// ?????? ????????? ???????????? ??????
		int rowLocation = 0;
		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		mergeRowStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex()); // IndexedColors.DARK_BLUE.getIndex()
		mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex()); // IndexedColors.LIGHT_YELLOW.getIndex()
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		// CellStyle ????????? ??????, ??????
		CellStyle moneyStyle = workbook.createCellStyle();
		moneyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
		
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; ?????? ??????.
		mergeRowFont.setFontName("????????????");
		mergeRowFont.setFontHeight((short) 500);
		mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
		mergeRowFont.setBold(true);
		
		mergeRowStyle.setFont(mergeRowFont);
		
		headerStyle.setBorderTop(BorderStyle.THICK);
		headerStyle.setBorderBottom(BorderStyle.THICK);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		
		// ????????? ??? ?????????
		Row mergeRow = sheet.createRow(rowLocation);
		
		// ????????? ?????? "???????????? ????????????" ??? ?????? ????????? ?????? ???????????? ??????
		for (int i = 0; i < 8; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle);
			cell.setCellValue("?????? ?????? ????????????");
		} // end of for-------------------------
		
		// ??? ????????????
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 7));
		// ?????? ???, ??? ???, ?????? ???, ??? ???
		
		// ?????? ??? ??????
		Row headerRow = sheet.createRow(++rowLocation);
		
		// ?????? ?????? ????????? ??? ??? ??????
		Cell headerCell = headerRow.createCell(0); // ???????????? ?????? ????????? 0 ?????? ????????????.
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);
		
		// ?????? ?????? ????????? ??? ??? ??????
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);
		
		// ?????? ?????? ????????? ??? ??? ??????
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ????????? ??? ??? ??????
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("??????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);
		
		Row bodyRow = null;
		Cell bodyCell = null;
		
		for (int i = 0; i < empList.size(); i++) {
			EmployeeVO empvo = empList.get(i);
			// ?????????
			bodyRow = sheet.createRow(i + (rowLocation + 1));
			
			
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(empvo.getEmployee_no());

			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(empvo.getName_kr());

			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(empvo.getFk_department_no());

			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(empvo.getDepartment_name());

			bodyCell = bodyRow.createCell(4);
			bodyCell.setCellValue(empvo.getPosition());

			bodyCell = bodyRow.createCell(5);
			bodyCell.setCellValue(Integer.parseInt(empvo.getUseCnt()) + Integer.parseInt(empvo.getDayoff_cnt()));

			bodyCell = bodyRow.createCell(6);
			bodyCell.setCellValue(empvo.getUseCnt());

			bodyCell = bodyRow.createCell(7);
			bodyCell.setCellValue(empvo.getDayoff_cnt());
			
		}//end of for
		
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "?????? ????????????");
		
		return "excelDownloadView";
		
	}
	
	
	
	@RequestMapping(value = "/getExcelAdUse.up", method = { RequestMethod.POST })
	public String getExcelAdUse(@RequestParam Map<String,String> paraMap, HttpServletRequest request, Model model) throws Throwable {
		
		// ???????????? ????????????
		List<Map<String,String>> empList = service.getExcelAdUseListAll(paraMap);
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		// ????????????
		SXSSFSheet sheet = workbook.createSheet("?????? ????????????");
		
		// ??????????????? ??????
		sheet.setColumnWidth(0, 2000);
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(2, 2000);
		sheet.setColumnWidth(3, 4000);
		sheet.setColumnWidth(4, 3000);
		sheet.setColumnWidth(5, 1500);
		sheet.setColumnWidth(6, 4000);
		sheet.setColumnWidth(7, 2000);
		sheet.setColumnWidth(8, 1500);
		
		// ?????? ????????? ???????????? ??????
		int rowLocation = 0;
		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		mergeRowStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex()); // IndexedColors.DARK_BLUE.getIndex()
		mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex()); // IndexedColors.LIGHT_YELLOW.getIndex()
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		// CellStyle ????????? ??????, ??????
		CellStyle moneyStyle = workbook.createCellStyle();
		moneyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
		
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; ?????? ??????.
		mergeRowFont.setFontName("????????????");
		mergeRowFont.setFontHeight((short) 500);
		mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
		mergeRowFont.setBold(true);
		
		mergeRowStyle.setFont(mergeRowFont);
		
		headerStyle.setBorderTop(BorderStyle.THICK);
		headerStyle.setBorderBottom(BorderStyle.THICK);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		
		// ????????? ??? ?????????
		Row mergeRow = sheet.createRow(rowLocation);
		
		// ????????? ?????? "???????????? ????????????" ??? ?????? ????????? ?????? ???????????? ??????
		for (int i = 0; i < 9; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle);
			cell.setCellValue("?????? ?????? ????????????");
		} // end of for-------------------------
		
		// ??? ????????????
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 8));
		// ?????? ???, ??? ???, ?????? ???, ??? ???
		
		// ?????? ??? ??????
		Row headerRow = sheet.createRow(++rowLocation);
		
		// ?????? ?????? ????????? ??? ??? ??????
		Cell headerCell = headerRow.createCell(0); // ???????????? ?????? ????????? 0 ?????? ????????????.
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);
		
		// ?????? ?????? ????????? ??? ??? ??????
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);
		
		// ?????? ?????? ????????? ??? ??? ??????
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ????????? ??? ??? ??????
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("??????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("??????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("???????????????");
		headerCell.setCellStyle(headerStyle);
		
		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(headerStyle);
		
		Row bodyRow = null;
		Cell bodyCell = null;
		
		for (int i = 0; i < empList.size(); i++) {
			Map<String,String> map = empList.get(i);
			
			// ?????????
			bodyRow = sheet.createRow(i + (rowLocation + 1));
			
			
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(map.get("employee_no"));

			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(map.get("name_kr"));

			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(map.get("fk_department_no"));

			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(map.get("department_name"));

			bodyCell = bodyRow.createCell(4);
			bodyCell.setCellValue(map.get("position"));

			bodyCell = bodyRow.createCell(5);
			bodyCell.setCellValue(map.get("ap_type"));

			bodyCell = bodyRow.createCell(6);
			bodyCell.setCellValue(map.get("startdate") + " ~ " + map.get("enddate"));

			bodyCell = bodyRow.createCell(7);
			bodyCell.setCellValue(map.get("writeday"));
			
			bodyCell = bodyRow.createCell(8);
			
			String yn = "";
			if("0".equals(map.get("final_signyn")))
				yn = "??????";
			else
				yn = "??????";
			bodyCell.setCellValue(yn);
			
		}//end of for
		
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "?????? ????????????");
		
		return "excelDownloadView";
		
	}
	
}
