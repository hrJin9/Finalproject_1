package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import com.spring.yeeun.model.NoticeBoardVO;

public interface InterBoardService {

	// 파일첨부가 없는 글쓰기
	int add(NoticeBoardVO boardvo);

	// 파일첨부가 있는 글쓰기
	int add_withFile(NoticeBoardVO boardvo);

	// 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
	//List<NoticeBoardVO> boardListNoSearch();
	// 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기
	List<NoticeBoardVO> boardListSearch(Map<String, String> paraMap);




	



	


	





	
}
