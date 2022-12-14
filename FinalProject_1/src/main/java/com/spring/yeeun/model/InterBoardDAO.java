package com.spring.yeeun.model;

public interface InterBoardDAO {
	
	// 파일첨부가 없는 글쓰기
	int add(NoticeBoardVO boardvo);

	// 파일첨부가 있는 글쓰기
	int add_withFile(NoticeBoardVO boardvo);










	

}
