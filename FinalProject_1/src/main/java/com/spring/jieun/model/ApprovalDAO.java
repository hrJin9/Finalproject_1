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
	
}
