package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import com.spring.jieun.model.ApprovalVO;

public interface InterApprovalService {

	
    // 내가 작성한 결재문서 총 건수(totalCount)
	int getMyApprovalTotalCount(Map<String, String> paraMap);

    // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	List<ApprovalVO> approvalListSearchWithPaging(Map<String, String> paraMap);

}
