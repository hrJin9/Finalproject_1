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

	
	// ***** 공지게시판 ***** //
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
	/* @Override
	public List<NoticeBoardVO> boardListSearch(Map<String, String> paraMap) {
		List<NoticeBoardVO> boardList = sqlsession.selectList("board.boardListSearch", paraMap);
		return boardList;
	} */

	// 총 게시물 건수(totalCount) 구하기
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.getTotalCount", paraMap);
		return n;
	}

	// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	@Override
	public List<NoticeBoardVO> boardListSearchWithPaging(Map<String, String> paraMap) {
		List<NoticeBoardVO> boardList = sqlsession.selectList("board.boardListSearchWithPaging", paraMap);
		return boardList;
	}

	// 북마크한 글목록 가져오기
	@Override
	public List<BoardScrapVO> bookmarkList(String fk_employee_no) {
		List<BoardScrapVO> bookmarkList = sqlsession.selectList("board.bookmarkList", fk_employee_no);
		return bookmarkList;
	}
	
	// 북마크한 게시물인지 조회하기
	@Override
	public BoardScrapVO selbookmarkNo(Map<String, String> paraMap) {
		BoardScrapVO bookmarkNo = sqlsession.selectOne("board.selbookmarkNo", paraMap);
		return bookmarkNo;
	}
	
	// 북마크 추가
	@Override
	public int addbookmark(Map<String, String> paraMap) {
		int n = sqlsession.insert("board.addbookmark",paraMap);
		return n;
	}
	
	// 북마크 삭제 업데이트
	@Override
	public int deletebookmark(Map<String, String> paraMap) {
		int n = sqlsession.update("board.deletebookmark",paraMap);
		return n;
	}

	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	@Override
	public NoticeBoardVO getView(Map<String, String> paraMap) {
		NoticeBoardVO boardvo = sqlsession.selectOne("board.getView", paraMap);
		return boardvo;
	}

	// 글조회수 +1 증가시키기 (본인이 작성한 게시물이 아닐 경우에만 +1 증가)
	@Override
	public void setAddReadCnt(String nbno) {
		sqlsession.update("board.setAddReadCnt", nbno);
	}

	// 좋아요한 글목록 가져오기
	/* @Override
	public List<BoardHeartVO> heartList(String fk_employee_no) {
		List<BoardHeartVO> heartList = sqlsession.selectList("board.heartList", fk_employee_no);
		return heartList;
	} */
	
	// 좋아요한 게시물인지 조회하기
	@Override
	public BoardHeartVO selHeartaddNo(Map<String, String> paraMap) {
		BoardHeartVO heartAddNo = sqlsession.selectOne("board.selHeartaddNo", paraMap);
		return heartAddNo;
	}

	// 좋아요 추가
	@Override
	public int addheart(Map<String, String> paraMap) {
		int n = sqlsession.insert("board.addheart",paraMap);
		return n;
	}

	// 좋아요 삭제 업데이트
	@Override
	public int deleteheart(Map<String, String> paraMap) {
		int n = sqlsession.update("board.deleteheart",paraMap);
		return n;
	}

	// 게시글 1개의 좋아요 개수 알아오기
	@Override
	public int heartCntbyView(String fk_bno) {
		int heartCnt = sqlsession.selectOne("board.heartCntbyView", fk_bno);
		return heartCnt;
	}

	// 게시글 1개에서 좋아요 여부 확인
	@Override
	public int heartCheck(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.heartCheck", paraMap);
		return n;
	}

	// 게시글 1개에서 북마크 여부 확인
	@Override
	public int bookmarkCheck(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.bookmarkCheck", paraMap);
		return n;
	}

	// 게시글 수정하기
	@Override
	public int boardEdit(NoticeBoardVO boardvo) {
		int n = sqlsession.update("board.boardEdit", boardvo);
		return n;
	}
	
	// 게시글 삭제하기
	@Override
	public int boardDel(Map<String, String> paraMap) {
		int n = sqlsession.delete("board.boardDel", paraMap);
		return n;
	}

	
	

	// ***** 자유게시판 ***** //
	// 파일첨부가 없는 글쓰기
	@Override
	public int fb_add(FreeBoardVO boardvo) {
		int n = sqlsession.insert("board.fb_add", boardvo);
		return n;
	}

	// 파일첨부가 있는 글쓰기
	@Override
	public int fb_add_withFile(FreeBoardVO boardvo) {
		int n = sqlsession.insert("board.fb_add_withFile", boardvo);
		return n;
	}

	
	// 총 게시물 건수(totalCount) 구하기
	@Override
	public int getfnTotalCount(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.getfnTotalCount", paraMap);
		return n;
	}

	// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	@Override
	public List<FreeBoardVO> fboardListSearchWithPaging(Map<String, String> paraMap) {
		List<FreeBoardVO> boardList = sqlsession.selectList("board.fboardListSearchWithPaging", paraMap);
		return boardList;
	}


	// 북마크한 글목록 가져오기
	@Override
	public List<BoardScrapVO> fn_bookmarkList(String fk_employee_no) {
		List<BoardScrapVO> bookmarkList = sqlsession.selectList("board.fn_bookmarkList", fk_employee_no);
		return bookmarkList;
	}
	
	// 북마크한 게시물인지 조회하기
	@Override
	public BoardScrapVO fb_selbookmarkNo(Map<String, String> paraMap) {
		BoardScrapVO bookmarkNo = sqlsession.selectOne("board.fb_selbookmarkNo", paraMap);
		return bookmarkNo;
	}
	
	// 북마크 추가
	@Override
	public int fn_addbookmark(Map<String, String> paraMap) {
		int n = sqlsession.insert("board.fn_addbookmark",paraMap);
		return n;
	}
	
	// 북마크 삭제 업데이트
	@Override
	public int fn_deletebookmark(Map<String, String> paraMap) {
		int n = sqlsession.update("board.fn_deletebookmark",paraMap);
		return n;
	}

	
	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	@Override
	public FreeBoardVO getfn_View(Map<String, String> paraMap) {
		FreeBoardVO boardvo = sqlsession.selectOne("board.getfn_View", paraMap);
		return boardvo;
	}

	// 글조회수 +1 증가시키기 (본인이 작성한 게시물이 아닐 경우에만 +1 증가)
	@Override
	public void setfn_AddReadCnt(String fbno) {
		sqlsession.update("board.setfn_AddReadCnt", fbno);
	}

	// 좋아요한 게시물인지 조회하기
	@Override
	public FreeBoardVO fn_selHeartaddNo(Map<String, String> paraMap) {
		FreeBoardVO heartAddNo = sqlsession.selectOne("board.fn_selHeartaddNo", paraMap);
		return heartAddNo;
	}

	// 좋아요 추가
	@Override
	public int fn_addheart(Map<String, String> paraMap) {
		int n = sqlsession.insert("board.fn_addheart",paraMap);
		return n;
	}

	// 좋아요 삭제 업데이트
	@Override
	public int fn_deleteheart(Map<String, String> paraMap) {
		int n = sqlsession.update("board.fn_deleteheart",paraMap);
		return n;
	}

	// 게시글 1개의 좋아요 개수 알아오기
	@Override
	public int fn_heartCntbyView(String fk_bno) {
		int heartCnt = sqlsession.selectOne("board.fn_heartCntbyView", fk_bno);
		return heartCnt;
	}

	// 게시글 1개에서 좋아요 여부 확인
	@Override
	public int fn_heartCheck(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.fn_heartCheck", paraMap);
		return n;
	}

	// 게시글 1개에서 북마크 여부 확인
	@Override
	public int fn_bookmarkCheck(Map<String, String> paraMap) {
		int n = sqlsession.selectOne("board.fn_bookmarkCheck", paraMap);
		return n;
	}

	// 게시글 수정하기
	@Override
	public int fn_boardEdit(FreeBoardVO boardvo) {
		int n = sqlsession.update("board.fn_boardEdit", boardvo);
		return n;
	}
		
	// 게시글 삭제하기
	@Override
	public int fn_boardDel(Map<String, String> paraMap) {
		int n = sqlsession.delete("board.fn_boardDel", paraMap);
		return n;
	}

	
	
	
	
	// ***** 자유게시판 댓글작성 ***** //
	// 댓글테이블에 insert
	@Override
	public int addComment(Fb_CommentVO commentvo) {
		int n = sqlsession.insert("board.addComment", commentvo);
		return n;
	}

	// 자유게시판 테이블 댓글개수 컬럼 1증가하기
	@Override
	public int upadateCommentCount(String fk_fbno) {
		int n = sqlsession.update("board.upadateCommentCount", fk_fbno);
		return n;
	}

	// 원게시물의 댓글을 페이징 처리해서 조회해오기(Ajax 처리)
	@Override
	public List<Fb_CommentVO> getCommentListPaging(Map<String, String> paraMap) {
		List<Fb_CommentVO> commentList = sqlsession.selectList("board.getCommentListPaging", paraMap);
		return commentList;
	}

	// 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리)
	@Override
	public int commentTotalPage(Map<String, String> paraMap) {
		int totalPage = sqlsession.selectOne("board.commentTotalPage", paraMap);  // selectOne 은 Count(*) 이기 때문에  1개만 나온다.
		return totalPage; 
	}

	// 본인 댓글 삭제하기(Ajax 처리)
	@Override
	public int delComment(String cno) {
		int n = sqlsession.delete("board.delComment", cno);
		return n;
	}

	
		

		




	
	








	


	

	


	
}

