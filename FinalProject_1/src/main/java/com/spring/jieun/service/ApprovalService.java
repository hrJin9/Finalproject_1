package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jieun.model.ApprovalVO;
import com.spring.jieun.model.InterApprovalDAO;

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

}
