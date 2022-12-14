package com.spring.admin_member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

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
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.AES256;
import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.TeamVO;
import com.spring.hyerin.service.InterMemberService;

@Controller
public class Admin_memberController {
	
	@Autowired
	private InterMemberService service; 
	
	@Autowired
	private AES256 aes;

	@RequestMapping(value = "/admin_memberList.up")
	public ModelAndView admin_memberList(HttpServletRequest request, ModelAndView mav) throws Throwable{
		
		String dropCondition = request.getParameter("dc");
		String dropVal = request.getParameter("dv");
		
		String searchCondition = request.getParameter("sc");
		String searchVal = request.getParameter("sv");
		
		String s_sizePerPage = request.getParameter("sp");
		String s_cur = request.getParameter("cur");
		
		if(s_sizePerPage == null || !("20".equals(s_sizePerPage) || "40".equals(s_sizePerPage) || "80".equals(s_sizePerPage) ))
			s_sizePerPage = "20";
		if(s_cur == null)
			s_cur = "1";
		
		int sizePerPage = Integer.parseInt(s_sizePerPage);
		int cur = Integer.parseInt(s_cur);
		
		//????????? ??????
		if(dropCondition == null || "".equals(dropCondition)) dropCondition = "";
		if(dropVal == null || "".equals(dropVal)) dropVal = "";
		
		if(searchCondition == null || "".equals(searchCondition)) searchCondition = "";
		
		if(searchVal == null || "".equals(searchVal) || searchVal.trim().isEmpty()) searchVal = "";
		if(searchVal != null) searchVal = searchVal.trim();
		
		if("email".equals(searchCondition) || "mobile".equals(searchCondition)) searchVal = aes.encrypt(searchVal);
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchVal", searchVal);
		paraMap.put("dropCondition", dropCondition);
		paraMap.put("dropVal", dropVal);
		paraMap.put("sizePerPage", s_sizePerPage);
		
		// ????????? ???????????? ??? ????????????
		int totalCount = service.getEmpTotal(paraMap);
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
		
		// ?????????????????? ????????????
		List<EmployeeVO> evoList = service.getEmpList(paraMap);
		
		for(EmployeeVO evo : evoList) {
			try {
			evo.setEmail(aes.decrypt(evo.getEmail()));
			} catch(NullPointerException e) { }
			try {
				evo.setMobile(aes.decrypt(evo.getMobile()));
			} catch(NullPointerException e) { }
		}
		if("email".equals(searchCondition) || "mobile".equals(searchCondition)) searchVal = aes.decrypt(searchVal);
		
		//???????????? ?????????
		int blockSize = 10;
		int loop = 1;
		int pageNo = ((cur - 1) / blockSize) * blockSize + 1;
		
		
		String pageBarHTML = "<nav><ul class='pagination mg-pagebar'>";
		String url = "admin_memberList.up";
		
		// [?????????][??????] ?????????
		if(pageNo != 1) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur=1'><span aria-hidden='true'>&laquo;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+(pageNo-1)+"'><span aria-hidden='true'>&lt;</span></a></li>";
		}
		while( !(loop > blockSize || pageNo > totalPage) ) {
			if(pageNo == cur) {
				pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
			}
			else {
				pageBarHTML += "<li class='page-item'><a class='page-link' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop++;
			pageNo++;
		}//end of while
		// [??????][?????????] ?????????
		if(pageNo <= totalPage) {
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='??????' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+pageNo+"'><span aria-hidden='true'>&gt;</span></a></li>";
			pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='?????????' href='"+url+"?sc="+searchCondition+"&sv="+searchVal+"&dc="+dropCondition+"&dv="+dropVal+"&sp="+sizePerPage+"&cur="+totalPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
		}
		
		pageBarHTML += "</ul></nav>";
		
		String gobackURL = MyUtil.getCurrentURL(request);
		
		// ???????????? ????????????
		List<DepartmentsVO> dvoList = service.getdeptname();
		
		// ???????????? ????????????
		List<String> pList = service.getposition();
		
		// ???????????? ????????????
		List<String> jtList = service.getjointype();
		
		
		// ????????????, ????????? ???????????? ??????
		if (!"".equals(searchCondition) && !"".equals(searchVal) || !"".equals(dropVal)) {
			
			//?????????, ???????????? ?????? ?????? ????????????
			if("email".equals(searchCondition)||"mobile".equals(searchCondition)) {
				paraMap.put("searchVal", aes.decrypt(paraMap.get("searchVal")));
			}
			
			mav.addObject("paraMap", paraMap);
		}
		
		
		
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageBar", pageBarHTML);
		mav.addObject("gobackURL", gobackURL.replaceAll("&", " "));
		mav.addObject("evoList",evoList);
		mav.addObject("dvoList",dvoList);
		mav.addObject("pList",pList);
		mav.addObject("jtList",jtList);
		
		mav.setViewName("admin/admin_memberList.tiles");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/goDeleteEmp.up")
	public String goDeleteEmp(HttpServletRequest request) {
		String[] empnoArr = request.getParameterValues("empnoArr");
		
		Map<String,String[]> paraMap = new HashMap<String, String[]>();
		paraMap.put("empnoArr",empnoArr);
		
		// ?????? ???????????? status??? 0?????? ????????????
		int n = service.goDeleteEmp(paraMap); 
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		
		return jsonobj.toString();
	}
	
	
	
	
	@RequestMapping(value = "/admin_memberAdd.up")
	public ModelAndView admin_memberAdd_hr(HttpServletRequest request, ModelAndView mav) {
		
		
		// ???????????? ????????????
		List<DepartmentsVO> dvoList = service.getdeptname();
		
		// ???????????? ????????????
		List<String> pList = service.getposition();
		
		// ???????????? ????????????
		List<String> jtList = service.getjointype();
		
		mav.addObject("dvoList",dvoList);
		mav.addObject("jtList",jtList);
		
		mav.setViewName("admin/admin_memberAdd_hr.tiles");
		return mav;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/getTeams.up")
	public String getTeams(HttpServletRequest request) {
		String deptno = request.getParameter("deptno");
		
		JSONArray jsonarr = new JSONArray();
		
		if(!"add".equals(deptno) && !"".equals(deptno)) {
			// ?????? ????????? ??? ????????????
			List<TeamVO> tvoList = service.getTeams(deptno);
			
			for(TeamVO tvo: tvoList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("team_no", tvo.getTeam_no());
				jsonobj.put("team_name", tvo.getTeam_name());
				jsonarr.put(jsonobj);
			}//end of for
			
		}//end of if
		
		return jsonarr.toString();
	}
	
	
	@RequestMapping(value = "/memAddEnd.up", method = {RequestMethod.POST})
	public ModelAndView memAddEnd(HttpServletRequest request, ModelAndView mav, EmployeeVO evo) throws Throwable {
		
		//???????????? ?????????????????? ???????????????
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 16; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		evo.setPasswd(aes.encrypt(temp.toString()));
		evo.setEmail(aes.encrypt(evo.getEmail()));
		evo.setMobile(aes.encrypt(evo.getMobile()));
		
		// ???????????? ?????? (fk_department_no??? fk_team_no??? add?????? ?????? insert?????? ??? ???????????? insert) 
		Map<String,String> resultMap = service.addEmployee(evo);
		
		String message = "";
		String loc = "";
		if("1".equals(resultMap.get("l"))) {
			// ????????????(?????????), ???????????? ????????????
			//mav.addObject("employee_no", resultMap.get("employee_no"));
			//mav.addObject("password",temp.toString());
			message = "?????? ????????? ???????????? " + resultMap.get("employee_no") + "??????, ????????????????????? " + temp.toString() + "?????????.";
			loc = request.getContextPath()+"/admin_memberList.up";
			
			//mav.setViewName("admin/admin_memberList.tiles");
		} else {
			message = "???????????? ??????????????? ?????????????????????.";
			loc = "javascript:history.back()";
		}
		
		mav.addObject("message",message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		return mav;
	} 
	
	
	
	@RequestMapping(value = "/admin_memberUpdate.up")
	public ModelAndView admin_memberUpdate(HttpServletRequest request, ModelAndView mav) throws Throwable {
		
		String empno = request.getParameter("empno");
		
		//?????? ????????? ?????? ????????????
		EmployeeVO evo = service.getempvo(empno);
		
		// ???????????? ????????????
		List<DepartmentsVO> dvoList = service.getdeptname();
		
		// ???????????? ????????????
		List<String> pList = service.getposition();
		
		// ???????????? ????????????
		List<String> jtList = service.getjointype();
		
		evo.setEmail(aes.decrypt(evo.getEmail()));
		evo.setMobile(aes.decrypt(evo.getMobile()));
		
		mav.addObject("evo", evo);
		mav.addObject("dvoList", dvoList);
		mav.addObject("pList", pList);
		mav.addObject("jtList", jtList);
		mav.setViewName("admin/admin_memberUpdate.tiles");
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/memUpdateEnd.up", method = {RequestMethod.POST})
	public ModelAndView memUpdateEnd(HttpServletRequest request, ModelAndView mav, EmployeeVO evo) throws Throwable {
		
		
		evo.setEmail(aes.encrypt(evo.getEmail()));
		evo.setMobile(aes.encrypt(evo.getMobile()));
		
		 //???????????? ?????? (fk_department_no??? fk_team_no??? add?????? ?????? insert?????? ??? ???????????? update) 
		int n = service.updateEmployee(evo);
		
		String message = "";
		String loc = "";
		if(n == 1) {
			loc = request.getContextPath()+"/admin_memberList.up";
		} else {
			message = "???????????? ??????????????? ?????????????????????.";
			loc = "javascript:history.back()";
		}
		mav.addObject("message",message);
		mav.addObject("loc",loc);
		
		mav.setViewName("msg");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/updateMyInfo.up")
	public String getTeams(HttpServletRequest request, EmployeeVO evo) throws Throwable {
		
		
//		System.out.println("Postcode : " + evo.getPostcode());
//		System.out.println("Address : " + evo.getAddress());
//		System.out.println("Detail_address : " + evo.getDetail_address());
//		System.out.println("Extra_address : " + evo.getExtra_address());
//		System.out.println("Bank : " + evo.getBank());
//		System.out.println("Accountnumber : " + evo.getAccountnumber());
		
		evo.setEmail(aes.encrypt(evo.getEmail()));
		evo.setMobile(aes.encrypt(evo.getMobile()));
		
		// ?????? ????????? ????????? ???????????????
		int n = service.updateMyInfo(evo);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("n", n);
		
		return jsonobj.toString();
	}
	
	
	@RequestMapping(value = "/getExcelEmp.up", method = { RequestMethod.POST })
	public String getExcelEmp(HttpServletRequest request, Model model) throws Throwable {
		//String[] empnoArr = request.getParameterValues("empnoArr"); 
		
		String str_empnoArr = request.getParameter("str_empnoArr");
		
		
		List<EmployeeVO> empList;
		if("".equals(str_empnoArr)) {
			//?????? ????????? ????????? ????????????
			empList = service.empListAll();
			
		} else {
			String[] empnoArr = str_empnoArr.split("\\,");
			
			Map<String, String[]> paraMap = new HashMap<String, String[]>();
			paraMap.put("empnoArr", empnoArr);
			
			// ?????? ???????????? ?????? ????????????
			empList = service.empList(paraMap);
		}
		
		
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		// ????????????
		SXSSFSheet sheet = workbook.createSheet("???????????????");
		
		// ??????????????? ??????
		sheet.setColumnWidth(0, 2000);
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(2, 2000);
		sheet.setColumnWidth(3, 4000);
		sheet.setColumnWidth(4, 3000);
		sheet.setColumnWidth(5, 2000);
		sheet.setColumnWidth(6, 4000);
		sheet.setColumnWidth(7, 4000);
		sheet.setColumnWidth(8, 1500);
		sheet.setColumnWidth(9, 3000);
		
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
		for (int i = 0; i < 10; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle);
			cell.setCellValue("?????? ????????????");
		} // end of for-------------------------
		
		// ??? ????????????
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 9));
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
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);

		// ?????? ?????? ???????????? ??? ??? ??????
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("?????????");
		headerCell.setCellStyle(headerStyle);
		
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("??????");
		headerCell.setCellStyle(headerStyle);
		
		headerCell = headerRow.createCell(9);
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
			bodyCell.setCellValue(empvo.getEmploymenttype());
			bodyCell.setCellStyle(moneyStyle); // ????????? ??????, ??????

			bodyCell = bodyRow.createCell(6);
			bodyCell.setCellValue(aes.decrypt(empvo.getEmail()));

			bodyCell = bodyRow.createCell(7);
			bodyCell.setCellValue(aes.decrypt(empvo.getMobile()));
			
			int salary = 0;
			try {
				salary = Integer.parseInt(empvo.getSalary());
			} catch(Exception e) {
			}
			
			bodyCell = bodyRow.createCell(8);
			bodyCell.setCellValue(salary);
			
			bodyCell = bodyRow.createCell(9);
			bodyCell.setCellValue(empvo.getHire_date());
			
		}//end of for
		
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "???????????????");
		
		return "excelDownloadView";
	}
	
	
	
}
