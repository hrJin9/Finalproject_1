package com.spring.chae0.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
 
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class CalendarDAO implements InterCalendarDAO {

	@Resource
	private SqlSessionTemplate sqlsession;


	// 사내 캘린더에 캘린더 소분류 명 존재 여부 알아오기
	@Override
	public int existComCalendar(String com_smcatgoname) {
		int m = sqlsession.selectOne("schedule.existComCalendar", com_smcatgoname);
		return m;
	}
	
	// 사내 캘린더에 캘린더 소분류 추가하기
	@Override
	public int addComCalendar(Map<String, String> paraMap) throws Throwable {
		int n = sqlsession.insert("schedule.addComCalendar", paraMap);
		return n;
	}

	
	// 내 캘린더에 캘린더 소분류 명 존재 여부 알아오기
	@Override
	public int existMyCalendar(Map<String, String> paraMap) {
		int m = sqlsession.selectOne("schedule.existMyCalendar", paraMap);
		return m;
	}

	// 내 캘린더에 캘린더 소분류 추가하기
	@Override
	public int addMyCalendar(Map<String, String> paraMap) throws Throwable {
		int n = sqlsession.insert("schedule.addMyCalendar", paraMap);
		return n;
	}

	
	// 사내 캘린더에서 사내캘린더 소분류  보여주기 
	@Override  
	public List<Calendar_smallVO> showCompanyCalendar() {
		List<Calendar_smallVO> calendar_small_category_VO_CompanyList = sqlsession.selectList("schedule.showCompanyCalendar");  
		return calendar_small_category_VO_CompanyList;
	}
 
	
	// 내 캘린더에서 내캘린더 소분류  보여주기
	@Override
	public List<Calendar_smallVO> showMyCalendar(String fk_userid) {
		List<Calendar_smallVO> calendar_small_category_VO_MyList = sqlsession.selectList("schedule.showMyCalendar", fk_userid);  
		return calendar_small_category_VO_MyList;
	}

	
	
}
