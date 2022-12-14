package com.spring.yeeun.model;

import java.util.List;
import java.util.Map;

public interface InterBoardDAO {
	
	// ***** 공지게시판 ***** //
	// 파일첨부가 없는 글쓰기
	int add(NoticeBoardVO boardvo);

	// 파일첨부가 있는 글쓰기
	int add_withFile(NoticeBoardVO boardvo);

	// 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기
	//List<NoticeBoardVO> boardListNoSearch();
	// 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기
	//List<NoticeBoardVO> boardListSearch(Map<String, String> paraMap);

	// 총 게시물 건수(totalCount) 구하기
	int getTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	List<NoticeBoardVO> boardListSearchWithPaging(Map<String, String> paraMap);

	// 북마크한 글목록 가져오기
	List<BoardScrapVO> bookmarkList(String fk_employee_no);

	// 북마크한 게시물인지 조회하기
	BoardScrapVO selbookmarkNo(Map<String, String> paraMap);

	// 북마크 추가
	int addbookmark(Map<String, String> paraMap);
	
	// 북마크 삭제 업데이트 
	int deletebookmark(Map<String, String> paraMap);

	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	NoticeBoardVO getView(Map<String, String> paraMap);

	// 글조회수 +1 증가시키기 (본인이 작성한 게시물이 아닐 경우에만 +1 증가)
	void setAddReadCnt(String nbno);
	
	// 좋아요한 글목록 가져오기
	//List<BoardHeartVO> heartList(String fk_employee_no);
	
	// 좋아요한 게시물인지 조회하기
	BoardHeartVO selHeartaddNo(Map<String, String> paraMap);

	// 좋아요 추가
	int addheart(Map<String, String> paraMap);

	// 좋아요 삭제 업데이트
	int deleteheart(Map<String, String> paraMap);

	// 게시글 1개의 좋아요 개수 알아오기
	int heartCntbyView(String fk_bno);

	// 게시글 1개에서 좋아요 여부 확인
	int heartCheck(Map<String, String> paraMap);

	// 게시글 1개에서 북마크 여부 확인
	int bookmarkCheck(Map<String, String> paraMap);
	
	// 게시글 수정하기
	int boardEdit(NoticeBoardVO boardvo);

	// 게시글 삭제하기
	int boardDel(Map<String, String> paraMap);

	
	
	
	
	// ***** 자유게시판 ***** //
	// 파일첨부가 없는 글쓰기
	int fb_add(FreeBoardVO boardvo);

	// 파일첨부가 있는 글쓰기
	int fb_add_withFile(FreeBoardVO boardvo);

	// 총 게시물 건수(totalCount) 구하기
	int getfnTotalCount(Map<String, String> paraMap);

	// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	List<FreeBoardVO> fboardListSearchWithPaging(Map<String, String> paraMap);

	// 북마크한 글목록 가져오기
	List<BoardScrapVO> fn_bookmarkList(String fk_employee_no);

	// 북마크한 게시물인지 조회하기
	BoardScrapVO fb_selbookmarkNo(Map<String, String> paraMap);

	// 북마크 추가
	int fn_addbookmark(Map<String, String> paraMap);

	// 북마크 삭제 업데이트 
	int fn_deletebookmark(Map<String, String> paraMap);

	
	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	FreeBoardVO getfn_View(Map<String, String> paraMap);

	// 글조회수 +1 증가시키기 (본인이 작성한 게시물이 아닐 경우에만 +1 증가)
	void setfn_AddReadCnt(String fbno);
	
	// 좋아요한 게시물인지 조회하기
	FreeBoardVO fn_selHeartaddNo(Map<String, String> paraMap);

	// 좋아요 추가
	int fn_addheart(Map<String, String> paraMap);

	// 좋아요 삭제 업데이트
	int fn_deleteheart(Map<String, String> paraMap);

	// 게시글 1개의 좋아요 개수 알아오기
	int fn_heartCntbyView(String fk_bno);

	// 게시글 1개에서 좋아요 여부 확인
	int fn_heartCheck(Map<String, String> paraMap);

	// 게시글 1개에서 북마크 여부 확인
	int fn_bookmarkCheck(Map<String, String> paraMap);

	// 게시글 수정하기
	int fn_boardEdit(FreeBoardVO boardvo);

	// 게시글 삭제하기
	int fn_boardDel(Map<String, String> paraMap);

	
	
	// ***** 자유게시판 댓글작성 ***** //
	// 댓글테이블에 insert
	int addComment(Fb_CommentVO commentvo);

	// 자유게시판 테이블 댓글개수 컬럼 1증가하기
	int upadateCommentCount(String fk_fbno);

	// 원게시물의 댓글을 페이징 처리해서 조회해오기(Ajax 처리)
	List<Fb_CommentVO> getCommentListPaging(Map<String, String> paraMap);

	// 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리)
	int commentTotalPage(Map<String, String> paraMap);

	// 본인 댓글 삭제하기(Ajax 처리)
	int delComment(String cno);

	



	
		
	
	
	
	
	
	
	
	
	
	
	
	



	

}
