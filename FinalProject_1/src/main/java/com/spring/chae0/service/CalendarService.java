package com.spring.chae0.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chae0.model.Calendar_smallVO;
import com.spring.chae0.model.InterCalendarDAO;


@Service
public class CalendarService implements InterCalendarService {

	@Autowired
	private InterCalendarDAO dao;

	
	// 사내 캘린더에 캘린더 소분류 추가하기
		@Override
		public int addComCalendar(Map<String, String> paraMap) throws Throwable {
			
			int n=0;
			String com_smcatgoname = paraMap.get("com_smcatgoname");
			
			// 사내 캘린더에 캘린더 소분류 명 존재 여부 알아오기
			int m = dao.existComCalendar(com_smcatgoname);
			
			if(m==0) {
				n = dao.addComCalendar(paraMap);
			}
			
			return n;
		}

		
		// 내 캘린더에 캘린더 소분류 추가하기
		@Override
		public int addMyCalendar(Map<String, String> paraMap) throws Throwable {
			
			int n=0;
			
			// 내 캘린더에 캘린더 소분류 명 존재 여부 알아오기
			int m = dao.existMyCalendar(paraMap);
			
			if(m==0) {
				n = dao.addMyCalendar(paraMap);
			}
			
			return n;
		}
 

		// 사내 캘린더에서 사내캘린더 소분류  보여주기 
		@Override
		public List<Calendar_smallVO> showCompanyCalendar() {
			List<Calendar_smallVO> calendar_small_category_VO_CompanyList = dao.showCompanyCalendar(); 
			return calendar_small_category_VO_CompanyList;
		}


		// 내 캘린더에서 내캘린더 소분류  보여주기
		@Override
		public List<Calendar_smallVO> showMyCalendar(String fk_userid) {
			List<Calendar_smallVO> calendar_small_category_VO_MyList = dao.showMyCalendar(fk_userid); 
			return calendar_small_category_VO_MyList;
		}
	
}
