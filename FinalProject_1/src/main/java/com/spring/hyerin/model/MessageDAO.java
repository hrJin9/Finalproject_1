package com.spring.hyerin.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO implements InterMessageDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<Map<String,String>> getmvoList(Map<String, String> paraMap) {
		List<Map<String,String>> mvoList = sqlsession.selectList("message.getmvoList", paraMap);
		return mvoList;
	}

	// 메시지리스트의 총페이지수 알아오기
	@Override
	public int getmgtotal(Map<String, String> paraMap) {
		int mgtotal = sqlsession.selectOne("message.getmgtotal", paraMap);
		return mgtotal;
	}
	
	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	@Override
	public MessageVO getmvo(String mno) {
		MessageVO mvo = sqlsession.selectOne("message.getmvo",mno);
		return mvo;
	}
	
	// 메시지 수신자 정보 알아오기
	@Override
	public List<MessageSendVO> getmsvoList(String mno) {
		List<MessageSendVO> msvoList = sqlsession.selectList("message.getmsvoList",mno);
		return msvoList;
	}
	
	// 메시지 보낸시간 알아오기
	@Override
	public String getmstime(String mno) {
		String ms_sendtime = sqlsession.selectOne("message.getmstime",mno);
		return ms_sendtime;
	}
	
	
	// 부서 정보 구해오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = sqlsession.selectList("message.getdept");
		return deptList;
	}
	
	//부서, 팀 이름 알아오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = sqlsession.selectList("message.getdt");
		return dtList;
	}
	
	//구성원 목록을 읽어오기
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> empList = sqlsession.selectList("message.getEmpList",paraMap);
		return empList;
	}
	
	
}
