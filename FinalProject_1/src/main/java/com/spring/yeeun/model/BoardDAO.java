package com.spring.yeeun.model;

import java.util.List;
import java.util.Map;

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

	// 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
	/* @Override
	public List<NoticeBoardVO> boardListNoSearch() {
		List<NoticeBoardVO> boardList = sqlsession.selectList("board.boardListNoSearch");
		return boardList;
	} */

	// 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기
	@Override
	public List<NoticeBoardVO> boardListSearch(Map<String, String> paraMap) {
		List<NoticeBoardVO> boardList = sqlsession.selectList("board.boardListSearch", paraMap);
		return boardList;
	}




	




	
	








	


	

	


	
}

