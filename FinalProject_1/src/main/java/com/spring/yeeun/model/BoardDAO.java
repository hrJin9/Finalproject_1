package com.spring.yeeun.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements InterBoardDAO {

	@Resource
	private SqlSessionTemplate sqlsession;

	// 파일첨부가 없는 글쓰기
	@Override
	public int add(NoticeBoardVO boardvo) {
		int n = sqlsession.insert("board.add", boardvo);
		return n;
	}

	// 파일첨부가 있는 글쓰기
	@Override
	public int add_withFile(NoticeBoardVO boardvo) {
		int n = sqlsession.insert("board.add_withFile", boardvo);
		return n;
	}




	




	
	








	


	

	


	
}

