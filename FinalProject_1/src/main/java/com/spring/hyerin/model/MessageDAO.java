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
	public MessageVO getmvo(Map<String, String> paraMap) {
		MessageVO mvo = sqlsession.selectOne("message.getmvo",paraMap);
		return mvo;
	}
	
	// 메시지 수신자 정보 알아오기
	@Override
	public List<MessageSendVO> getmsvoList(String mno) {
		List<MessageSendVO> msvoList = sqlsession.selectList("message.getmsvoList",mno);
		return msvoList;
	}
	
	// 메시지의 파일 정보 알아오기
	@Override
	public List<MessageFileVO> getmfile(String mno) {
		List<MessageFileVO> mfList = sqlsession.selectList("message.getmfile", mno);
		return mfList;
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
	
	// mno 채번해오기
	@Override
	public String getmno() {
		String mno = sqlsession.selectOne("message.getmno");
		return mno;
	}
	
	
	// tbl_message에 메시지 insert하기 
	@Override
	public int addMessage(MessageVO mvo) {
		int n = sqlsession.insert("message.addMessage", mvo);
		return n;
	}
	
	
	// tbl_message_file에 insert
	@Override
	public int addMF(MessageFileVO mfvo) {
		int n = sqlsession.insert("message.addMF", mfvo);
		return n;
	}
	
	// tbl_message_send에 수신자 insert하기
	@Override
	public int addMS(MessageSendVO msvo) {
		int n = sqlsession.insert("message.addMS", msvo);
		return n;
	}
	
	// 관련메시지 3개  알아오기
	@Override
	public Map<String,String> getmgroupList(Map<String, String> paraMap) {
		Map<String, String> mgroupList = sqlsession.selectOne("message.getmgroupList",paraMap);
		return mgroupList;
	}
	
	
	//해당 메시지 읽음처리하기
	@Override
	public int changeMgStatus(MessageSendVO msvo) {
		int n = sqlsession.update("message.changeMgStatus", msvo);
		return n;
	}
	
	// 탭별 메시지 개수 알아오기
	@Override
	public int getMgCnt(Map<String, String> paraMap) {
		int mgCnt = sqlsession.selectOne("message.getMgCnt",paraMap);
		return mgCnt;
	}

	//체크된것 읽음처리하기
	@Override
	public int chxStatus(Map<String, String> paraMap) {
		int n = sqlsession.update("message.chxStatus",paraMap);
		return n;
	}
	
	// 해당 메시지 파일의 정보 가져오기
	@Override
	public MessageFileVO getmfvo(MessageFileVO mfvo_y) {
		MessageFileVO mfvo = sqlsession.selectOne("message.getmfvo",mfvo_y);
		return mfvo;
	}
	
	// 로그인유저의 메시지리스트 불러오기
	@Override
	public List<MessageVO> getMsmvoList(Map<String, String> paraMap) {
		List<MessageVO> msmvoList = sqlsession.selectList("message.getMsmvoList", paraMap);
		return msmvoList;
	}
	
	// 메시지리스트의 총페이지수 알아오기
	@Override
	public int getMsmgtotal(Map<String, String> paraMap) {
		int msmgtotal = sqlsession.selectOne("message.getMsmgtotal", paraMap);
		return msmgtotal;
	}
	
	// 탭별 메시지 개수 알아오기
	@Override
	public int getMsMgCnt(Map<String, String> paraMap) {
		int msmgcnt = sqlsession.selectOne("message.getMsMgCnt", paraMap);
		return msmgcnt;
	}
	
	//보낸 메시지 => 체크된 것 condition에 따라 상태 update해주기
	@Override
	public int sendchxStatus(Map<String, String> paraMap) {
		int n = sqlsession.update("message.sendchxStatus",paraMap);
		return n;
	}

	
	
	
}
