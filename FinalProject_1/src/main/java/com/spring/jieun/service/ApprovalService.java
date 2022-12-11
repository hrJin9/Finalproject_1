package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jieun.model.*;

@Service
public class ApprovalService implements InterApprovalService {

	// 의존객체 
	@Autowired
	private InterApprovalDAO dao;

	
    // 내가 작성한 결재문서 총 건수(totalCount)
	@Override
	public int getMyApprovalTotalCount(Map<String, String> paraMap) {
		int n = dao.getMyApprovalTotalCount(paraMap);
		return n;
	}


    // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	@Override
	public List<ApprovalVO> approvalListSearchWithPaging(Map<String, String> paraMap) {
		List<ApprovalVO> approvalList = dao.approvalListSearchWithPaging(paraMap);
		return approvalList;
	}

	//	*** 북마크 추가 업데이트 ***
	@Override
	public int updateaddbookmark(Map<String, String> paraMap) {
		String yn = paraMap.get("yn");
		int n = 0;
		if("y".equals(yn)) {
			n = dao.updateaddbookmark(paraMap);
		}
		else{
			n = dao.updatedeletebookmark(paraMap);
		}
		
		return n;
	}

	// 로그인한 사원 연차갯수 알아오기 
	@Override
	public int seldayoffcnt(Map<String, String> paraMap) {
		int result = dao.seldayoffcnt(paraMap);
		return result;
	}

	// 하나의 결재문서에 대한 정보 가져오기 
	@Override
	public List<ApprovalVO> getapprovalOneInfo(Map<String, String> paraMap) {
		List<ApprovalVO> appvo = dao.getapprovalOneInfo(paraMap);
		return appvo;
	}

	// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다.
	@Override
	public ApprovalVO getdayoffInfo(String ano) {
		ApprovalVO appvo = dao.getdayoffInfo(ano);
		return appvo;
	}
	@Override
	public ApprovalVO getworkdocvoInfo(String ano) {
		ApprovalVO appvo = dao.getworkdocvoInfo(ano);
		return appvo;
	}
	@Override
	public ApprovalVO getapprovalInfo(String ano) {
		ApprovalVO appvo = dao.getapprovalInfo(ano);
		return appvo;
	}

	// 한문서에 대해 결재라인리스트 가져오기 
	@Override
	public List<ApprovalVO> getapprovalLine(String ano) {
	List<ApprovalVO> aproList = dao.getapprovalLine(ano) ;
		return aproList;
	}

	// 내결재문서 신청취소  
	@Override
	public int updatecancelmyapproval(String ano) {
		int result = dao.updatecancelmyapproval(ano); // 문서상태 취소로 만들기 
		return result;
	}


	@Override
	public int getRequestedApprovalTotalCount(Map<String, String> paraMap) {
		int n = dao.getRequestedApprovalTotalCount(paraMap); 
		return n;
	}
	@Override
	public List<ApprovalVO> requestedapprovalListPaging(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.requestedapprovalListPaging(paraMap); 
		return list;
	}

	
	@Override
	public int requestedtodoTotalCount(Map<String, String> paraMap) {
		int n = dao.requestedtodoTotalCount(paraMap);
		return n;
	}
	@Override
	public List<ApprovalVO> requestedtodoListPaging(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.requestedtodoListPaging(paraMap); 
		return list;
	}

	// 결재 승인으로 업댓
	@Override
	public int updaterequestedapprove(Map<String, String> paraMap) {
		// 내가 해당 문서에 대해 마지막 결재자인지 확인하고 마지막결재자일경우 두테이블에 업댓 
		String chk_ano = dao.checkmymaxstep(paraMap);
		int n = 0;
		String ano = paraMap.get("ano");
		if(chk_ano != null) {//마지막 결재자일경우  
			n = dao.updateapprovedoc(ano);
		}else {//마지막 결재자가 아닐 경우
			n = 1;
		}
		int result = 0;
		result = n==1?dao.updaterequestedapprove(paraMap): 0 ;
		return result;
	}

	// 결재 반려로 업댓 
	@Override
	public int updaterequestedreject(Map<String, String> paraMap) {
		int result = 0;
		
		int n = dao.updaterequestedreject(paraMap);
		result = n==1? dao.updateapprovalreject(paraMap) : 0;
		
		return result;
	}

	// 검색어 입력시 자동글 완성하기
	@Override
	public List<String> wordSearchShow(Map<String, String> paraMap) {
		List<String> list = dao.wordSearchShow(paraMap);
		return list;
	}

	// 저장한 내 결재라인 가져오기 (Ajax)
	@Override
	public List<ApprovalVO> loadsavedline(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.loadsavedline(paraMap) ;
		return list;
	}

	// 결재라인 저장하기 
	@Override
	public String getspno() {
		String signpath_no = dao.getspno(); // 채번하기 
		return signpath_no;
	}
	@Override
	public int savemyline(Map<String, String> paraMap) {
		int result = 0;
		
		String signstep = paraMap.get("signstep");
		String signpatharr = paraMap.get("signpatharr");
		String[] arr = signpatharr.split(",");

		int n = 0;
		if("1".equals(signstep) ) {
			for(int i =0; i<=arr.length; i++) {
				System.out.println("arr "+i+"=>" +arr[i]);
				if(i==0) { // 한번만 tbl_signpath 에 넣기 
					n = dao.insertsignpath(paraMap);
				}
				break;
			}
		}
		
		
		for(String signpath : arr) {
			paraMap.put("sign_empno", signpath);
			n = dao.insertdetailsignpath(paraMap);
			n *= n ;
		}
		
		result = n;
		return result;
	}



}
