package com.spring.yeeun.service;

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

	



	


	
	
	
}

