package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import com.spring.jieun.model.*;

public interface InterApprovalService {

	
    // 내가 작성한 결재문서 총 건수(totalCount)
	int getMyApprovalTotalCount(Map<String, String> paraMap);

    // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	List<ApprovalVO> approvalListSearchWithPaging(Map<String, String> paraMap);

	//	*** 북마크 추가 업데이트 ***
	int updateaddbookmark(Map<String, String> paraMap);

	// 로그인한 사원 연차갯수 알아오기 
	int seldayoffcnt(Map<String, String> paraMap);

	// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다. 
	// 하나의 결재문서에 대한 정보 가져오기 
	List<ApprovalVO> getapprovalOneInfo(Map<String, String> paraMap);

	// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다.
	ApprovalVO getdayoffInfo(String ano);
	ApprovalVO getworkdocvoInfo(String ano);
	ApprovalVO getapprovalInfo(String ano);

	// 한문서에 대해 결재라인리스트 가져오기 
	List<ApprovalVO> getapprovalLine(String ano);

	// 내가 신청한 결재문서 결재신청취소 
	int updatecancelmyapproval(String ano);

	// 내게 온 결재문서 페이징처리 
	List<ApprovalVO> requestedapprovalListPaging(Map<String, String> paraMap);

	// 내게 온 결재문서 총 건수 
	int getRequestedApprovalTotalCount(Map<String, String> paraMap);

	// 내가 결재해야할 결재문서 
	int requestedtodoTotalCount(Map<String, String> paraMap);
	List<ApprovalVO> requestedtodoListPaging(Map<String, String> paraMap);

	// 결재 승인으로 업댓
	int updaterequestedapprove(Map<String, String> paraMap);

	// 결재 반려로 업댓 
	int updaterequestedreject(Map<String, String> paraMap);

	// 검색어 입력시 자동글 완성하기 (Ajax)
	List<String> wordSearchShow(Map<String, String> paraMap);

	// 저장한 내 결재라인 가져오기 (Ajax)
	List<ApprovalVO> loadsavedline(Map<String, String> paraMap);



	String getspno();
	int savemyline(Map<String, String> paraMap);

	List<ApprovalVO> getmyline(Map<String, String> paraMap);

	
	// 결재문서 인서트 
	int add(ApprovalVO approvalvo);
	int add_withFile(ApprovalVO approvalvo);
	String getano();
	int addsignline(ApprovalVO approvalvo);
	int addrefer(ApprovalVO approvalvo);
	int addworkdoc(ApprovalVO approvalvo);
	int adddayoff(ApprovalVO approvalvo);
	
//	int cancelmyapproval(String ano);



}
