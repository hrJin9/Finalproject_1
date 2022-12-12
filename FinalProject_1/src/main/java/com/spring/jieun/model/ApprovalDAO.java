package com.spring.jieun.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class ApprovalDAO implements InterApprovalDAO{

	@Resource
	private SqlSessionTemplate sqlsession;

    // 내가 작성한 결재문서 총 건수(totalCount)
	@Override
	public int getMyApprovalTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("approval.getMyApprovalTotalCount", paraMap);
		return n;
	}

    // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	@Override
	public List<ApprovalVO> approvalListSearchWithPaging(Map<String, String> paraMap) {
		List<ApprovalVO> approvalList = sqlsession.selectList("approval.approvalListSearchWithPaging", paraMap); 
		return approvalList;
	}
	//	북마크 추가 업데이트
	@Override
	public int updateaddbookmark(Map<String, String> paraMap) {
		int n = sqlsession.update("approval.updateaddbookmark",paraMap);
		return n;
	}

	//	북마크 삭제 업데이트
	@Override
	public int updatedeletebookmark(Map<String, String> paraMap) {
		int n = sqlsession.update("approval.updatedeletebookmark",paraMap);
		return n;
	}

	// 로그인한 사원 연차갯수 알아오기
	@Override
	public int seldayoffcnt(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("approval.seldayoffcnt",paraMap);
		return n;
	}

	
	// 하나의 결재문서에 대한 정보 가져오기
	@Override
	public List<ApprovalVO> getapprovalOneInfo(Map<String, String> paraMap) {
		List<ApprovalVO> appvo= sqlsession.selectOne("approval.getapprovalOneInfo",paraMap);
		return appvo;
	}

	// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다.
	@Override
	public ApprovalVO getdayoffInfo(String ano) {
		ApprovalVO appvo= sqlsession.selectOne("approval.getdayoffInfo",ano);
		return appvo;
	}
	@Override
	public ApprovalVO getworkdocvoInfo(String ano) {
		ApprovalVO appvo= sqlsession.selectOne("approval.getworkdocvoInfo",ano);
		return appvo;
	}
	@Override
	public ApprovalVO getapprovalInfo(String ano) {
		ApprovalVO appvo= sqlsession.selectOne("approval.getapprovalInfo",ano);
		return appvo;
	}

	// 한문서에 대해 결재라인리스트 가져오기 
	@Override
	public List<ApprovalVO> getapprovalLine(String ano) {
		List<ApprovalVO> aproList = sqlsession.selectList("approval.getapprovalLine",ano); 
		return aproList;
	}

	// 내결재문서 신청취소  
	@Override
	public int cancelmyapproval(String ano) {
		int n = sqlsession.update("approval.cancelmyapproval",ano); 
		return n;
	}
	@Override
	public int updatecancelmyapproval(String ano) {
		int n = sqlsession.update("approval.updatecancelmyapproval",ano);
		return n;
	}

	//내게온 결재문서 페이징 
	@Override
	public int getRequestedApprovalTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("approval.getRequestedApprovalTotalCount",paraMap); 
		return n;
	}
	@Override
	public List<ApprovalVO> requestedapprovalListPaging(Map<String, String> paraMap) {
		List<ApprovalVO> list = sqlsession.selectList("approval.requestedapprovalListPaging",paraMap);
		return list;
	}

	@Override
	public int requestedtodoTotalCount(Map<String, String> paraMap) {
		System.out.println("employee_no=>"+paraMap.get("employee_no"));
		int n = sqlsession.selectOne("approval.requestedtodoTotalCount",paraMap);
		return n;
	}

	@Override
	public List<ApprovalVO> requestedtodoListPaging(Map<String, String> paraMap) {
		List<ApprovalVO> list = sqlsession.selectList("approval.requestedtodoListPaging",paraMap);
		return list;
	}

	@Override
	public int updaterequestedapprove(Map<String, String> paraMap) {
		int n = sqlsession.update("approval.updaterequestedapprove",paraMap);
		return n;
	}

	@Override
	public String checkmymaxstep(Map<String, String> paraMap) {
		String chk = sqlsession.selectOne("approval.checkmymaxstep",paraMap);
		return chk;
	}

	@Override
	public int updateapprovedoc(String ano) {
		int n = sqlsession.update("approval.updateapprovedoc",ano);
		return n;
	}

	
	@Override
	public int updaterequestedreject(Map<String, String> paraMap) {
		int n = sqlsession.update("approval.updaterequestedreject",paraMap); 
		return n;
	}
	@Override
	public int updateapprovalreject(Map<String, String> paraMap) {
		int n = sqlsession.update("approval.updateapprovalreject",paraMap); 
		return n;
	}

	@Override
	public List<String> wordSearchShow(Map<String, String> paraMap) {
		List<String> list = sqlsession.selectList("approval.wordSearchShow", paraMap); 
		return list;
	}

	// 저장한 내 결재라인 가져오기 (Ajax)
	@Override
	public List<ApprovalVO> loadsavedline(Map<String, String> paraMap) {
		List<ApprovalVO> list = sqlsession.selectList("approval.loadsavedline", paraMap);
		return list;
	}

	
	
	@Override
	public String getspno() {
		 String spno= sqlsession.selectOne("approval.getspno");
		return spno;
	}
	@Override
	public int insertsignpath(Map<String, String> paraMap) {
		int n = sqlsession.insert("approval.insertsignpath", paraMap);
		return n;
	}
	@Override
	public int insertdetailsignpath(Map<String, String> paraMap) {
		int n = sqlsession.insert("approval.insertdetailsignpath", paraMap);
		return n;
	}

	@Override
	public List<ApprovalVO> getmyline(Map<String, String> paraMap) {
		List<ApprovalVO> list = sqlsession.selectList("approval.getmyline", paraMap);
		return list;
	}

	@Override
	public String getano() {
		String ano = sqlsession.selectOne("approval.getano");
		return ano;
	}

	@Override
	public int add(ApprovalVO approvalvo) {
		int n = sqlsession.insert("approval.add", approvalvo);
		return n;
	}

	@Override
	public int add_withFile(ApprovalVO approvalvo) {
		int n = sqlsession.insert("approval.add_withFile", approvalvo);
		return n;	
	}

	@Override
	public int addsignline(ApprovalVO approvalvo) {
		int n = sqlsession.insert("approval.addsignline",approvalvo); 
		return n;
	}

	@Override
	public int addrefer(ApprovalVO approvalvo) {
		int n = sqlsession.insert("approval.addrefer",approvalvo); 
		return n;
	}

	@Override
	public int addworkdoc(ApprovalVO approvalvo) {
		int n = sqlsession.insert("approval.addworkdoc",approvalvo); 
		return n;
	}
	@Override
	public int adddayoff(ApprovalVO approvalvo) {
		int n = sqlsession.insert("approval.adddayoff",approvalvo); 
		return n;
	}

	@Override
	public int minusempdayoff(ApprovalVO approvalvo) {
		int n = sqlsession.update("approval.minusempdayoff",approvalvo); 
		return n;
	}
	
}
