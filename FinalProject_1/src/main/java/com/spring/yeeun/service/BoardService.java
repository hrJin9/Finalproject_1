package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.yeeun.model.InterBoardDAO;
import com.spring.yeeun.model.NoticeBoardVO;

@Service
public class BoardService implements InterBoardService {

	// 의존객체
	@Autowired
	private InterBoardDAO dao;

	// 파일첨부가 없는 글쓰기
	@Override
	public int add(NoticeBoardVO boardvo) {
		int n = dao.add(boardvo); // 다시 add 매퍼로  InterBoardDAO.java ->BoardDAO.java 통해서  보내주기
		return n;
	}

	// 파일첨부가 있는 글쓰기
	@Override
	public int add_withFile(NoticeBoardVO boardvo) {
		int n = dao.add_withFile(boardvo); // 첨부파일이 있는 경우
		return n;
	}

	// 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
	/*
	@Override
	public List<NoticeBoardVO> boardListNoSearch() {
		List<NoticeBoardVO> boardList = dao.boardListNoSearch();
		return boardList;
	} */

	// 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기
	@Override
	public List<NoticeBoardVO> boardListSearch(Map<String, String> paraMap) {
		List<NoticeBoardVO> boardList = dao.boardListSearch(paraMap);
		return boardList;
	}

	



	


	
	
	
}

