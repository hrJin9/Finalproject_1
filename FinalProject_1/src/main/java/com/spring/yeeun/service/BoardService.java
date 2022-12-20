package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.finalproject.common.FileManager;
import com.spring.yeeun.model.BoardHeartVO;
import com.spring.yeeun.model.BoardScrapVO;
import com.spring.yeeun.model.Fb_CommentVO;
import com.spring.yeeun.model.FreeBoardVO;
import com.spring.yeeun.model.InterBoardDAO;
import com.spring.yeeun.model.NoticeBoardVO;

@Service
public class BoardService implements InterBoardService {

	// 의존객체
	@Autowired
	private InterBoardDAO dao;

	@Autowired   // Type 에 따라 알아서 Bean 을 주입해준다.
	private FileManager fileManager;  // 원래 fileManager 은 null 인데, FileManager 클래스에서  @Component 하여 bean 에 올렸기 때문에 @Autowired 만 해주면 bean 에 올라간다.
	
	
	
	// ***** 공지게시판 ***** //
	// 파일첨부가 없는 글쓰기
	@Override
	public int add(NoticeBoardVO boardvo) {
		int n = dao.add(boardvo);
		return n;
	}

	// 파일첨부가 있는 글쓰기
	@Override
	public int add_withFile(NoticeBoardVO boardvo) {
		int n = dao.add_withFile(boardvo);
		return n;
	}

	// 페이징 처리를 안한 검색어가 있는 전체 글목록 보여주기
	/* @Override
	public List<NoticeBoardVO> boardListSearch(Map<String, String> paraMap) {
		List<NoticeBoardVO> boardList = dao.boardListSearch(paraMap);
		return boardList;
	} */

	// 총 게시물 건수(totalCount) 구하기
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}

	// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	@Override
	public List<NoticeBoardVO> boardListSearchWithPaging(Map<String, String> paraMap) {
		List<NoticeBoardVO> boardList = dao.boardListSearchWithPaging(paraMap);
		return boardList;
	}


	// 북마크한 글목록 가져오기
	@Override
	public List<BoardScrapVO> bookmarkList(String fk_employee_no) {
		List<BoardScrapVO> bookmarkList = dao.bookmarkList(fk_employee_no);
		return bookmarkList;
	}

	// 북마크한 게시물인지 조회하기
	@Override
	public BoardScrapVO selbookmarkNo(Map<String, String> paraMap) {
		BoardScrapVO bookmarkNo = dao.selbookmarkNo(paraMap);
		return bookmarkNo;
	}
	
	//북마크 추가 업데이트
	@Override
	public int updateBookmark(Map<String, String> paraMap) {
		String update = paraMap.get("update");
		int n = 0;
		if("add".equals(update)) {  // 북마크했다면
			n = dao.addbookmark(paraMap);
		}
		else{ // "del" 이라면
			n = dao.deletebookmark(paraMap);
		}
		
		return n;
	}

	
	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	@Override
	public NoticeBoardVO getView(Map<String, String> paraMap) {
		
		NoticeBoardVO boardvo = dao.getView(paraMap); // 게시물 1개 조회하기
		
		String fk_employee_no = paraMap.get("fk_employee_no");
		// 로그인 한 상태라면 로그인한 사용자의 fk_employee_no 이고, 로그인 하지 않은 상태라면  null 이다.
		
		if(fk_employee_no != null &&  // 로그인 되어졌고
				  boardvo != null &&  // 글1개가 존재하고
		   !fk_employee_no.equals(boardvo.getFk_employee_no()) ) { // 로그인한 사원번호와 게시물을 작성한 사원번호가 같지 않다면
			// 글 조회수 증가는 로그인 한 상태에서 다른 사람의 글을 읽을때만 증가하도록 한다.
			
			dao.setAddReadCnt(boardvo.getNbno()); // 글조회수 1증가 하기
			boardvo = dao.getView(paraMap);
		}
		
		return boardvo;
	}
	
	// 글조회수 증가는 없고 게시물 1개만 조회 해주는 것 
	@Override
	public NoticeBoardVO getViewWithNoAddCount(Map<String, String> paraMap) {
		NoticeBoardVO boardvo = dao.getView(paraMap); // 게시물 1개 조회하기
		return boardvo;
	}
	
	// 좋아요한 게시물인지 조회하기
	@Override
	public BoardHeartVO selHeartaddNo(Map<String, String> paraMap) {
		BoardHeartVO heartAddNo = dao.selHeartaddNo(paraMap);
		return heartAddNo;
	}

	// 좋아요 추가 업데이트
	@Override
	public int updateHeart(Map<String, String> paraMap) {
		String update = paraMap.get("update");
		int n = 0;
		if("add".equals(update)) {  // 북마크했다면
			n = dao.addheart(paraMap);
		}
		else{ // "del" 이라면
			n = dao.deleteheart(paraMap);
		}
		
		return n;
	}

	// 게시글 1개의 좋아요 개수 알아오기
	@Override
	public int heartCntbyView(String fk_bno) {
		int heartCnt = dao.heartCntbyView(fk_bno);
		return heartCnt;
	}

	// 게시글 1개에서 좋아요 여부 확인
	@Override
	public int heartCheck(Map<String, String> paraMap) {
		int n = dao.heartCheck(paraMap);
		return n;
	}

	// 게시글 1개에서 북마크 여부 확인
	@Override
	public int bookmarkCheck(Map<String, String> paraMap) {
		int n = dao.bookmarkCheck(paraMap);
		return n;
	}

	// 게시글 수정하기
	@Override
	public int boardEdit(NoticeBoardVO boardvo) {
		int n = dao.boardEdit(boardvo);
		return n;
	}
	
	// 게시글 삭제하기
	@Override
	public int boardDel(Map<String, String> paraMap) {
		
		int n = dao.boardDel(paraMap); 
		
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 시작 **
		if(n == 1) {
			String path = paraMap.get("path");  // BoardController.java 에서 받아온 삭제해야할 파일이 저장된 경로
			String fileName = paraMap.get("fileName");  // BoardController.java 에서 받아온  삭제해야할 파일명
			
			if( fileName != null && !"".equals(fileName) ) {  // fileName(파일첨부된 파일) 이 있는 경우
				fileManager.doFileDelete(fileName, path);
			}
		}
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 끝 **
		
		return n;
	}

	
	// ***** 자유게시판 ***** //
	// 파일첨부가 없는 글쓰기
	@Override
	public int fb_add(FreeBoardVO boardvo) {
		int n = dao.fb_add(boardvo);
		return n;
	}

	// 파일첨부가 있는 글쓰기
	@Override
	public int fb_add_withFile(FreeBoardVO boardvo) {
		int n = dao.fb_add_withFile(boardvo);
		return n;
	}

	// 총 게시물 건수(totalCount) 구하기
	@Override
	public int getfnTotalCount(Map<String, String> paraMap) {
		int n = dao.getfnTotalCount(paraMap);
		return n;
	}

	// 페이징 처리한 글목록 가져오기 (검색이 있든지, 검색이 없든지 모두 다 포함한 것)
	@Override
	public List<FreeBoardVO> fboardListSearchWithPaging(Map<String, String> paraMap) {
		List<FreeBoardVO> boardList = dao.fboardListSearchWithPaging(paraMap);
		return boardList;
	}


	// 북마크한 글목록 가져오기
	@Override
	public List<BoardScrapVO> fn_bookmarkList(String fk_employee_no) {
		List<BoardScrapVO> bookmarkList = dao.fn_bookmarkList(fk_employee_no);
		return bookmarkList;
	}

	// 북마크한 게시물인지 조회하기
	@Override
	public BoardScrapVO fb_selbookmarkNo(Map<String, String> paraMap) {
		BoardScrapVO bookmarkNo = dao.fb_selbookmarkNo(paraMap);
		return bookmarkNo;
	}
	
	//북마크 추가 업데이트
	@Override
	public int fb_updateBookmark(Map<String, String> paraMap) {
		String update = paraMap.get("update");
		int n = 0;
		if("add".equals(update)) {  // 북마크했다면
			n = dao.fn_addbookmark(paraMap);
		}
		else{ // "del" 이라면
			n = dao.fn_deletebookmark(paraMap);
		}
		
		return n;
	}

	// 글조회수 증가와 함께 글 1개를 조회해주는 것 
	@Override
	public FreeBoardVO getfn_View(Map<String, String> paraMap) {
		
		FreeBoardVO boardvo = dao.getfn_View(paraMap); // 게시물 1개 조회하기
		
		String fk_employee_no = paraMap.get("fk_employee_no");
		// 로그인 한 상태라면 로그인한 사용자의 fk_employee_no 이고, 로그인 하지 않은 상태라면  null 이다.
		
		if(fk_employee_no != null &&  // 로그인 되어졌고
				  boardvo != null &&  // 글1개가 존재하고
		   !fk_employee_no.equals(boardvo.getFk_employee_no()) ) { // 로그인한 사원번호와 게시물을 작성한 사원번호가 같지 않다면
			// 글 조회수 증가는 로그인 한 상태에서 다른 사람의 글을 읽을때만 증가하도록 한다.
			
			dao.setfn_AddReadCnt(boardvo.getFbno()); // 글조회수 1증가 하기
			boardvo = dao.getfn_View(paraMap);
		}
		
		return boardvo;
	}
		
	// 글조회수 증가는 없고 게시물 1개만 조회 해주는 것 
	@Override
	public FreeBoardVO getfn_ViewWithNoAddCount(Map<String, String> paraMap) {
		FreeBoardVO boardvo = dao.getfn_View(paraMap); // 게시물 1개 조회하기
		return boardvo;
	}

	// 좋아요한 게시물인지 조회하기
	@Override
	public FreeBoardVO fn_selHeartaddNo(Map<String, String> paraMap) {
		FreeBoardVO heartAddNo = dao.fn_selHeartaddNo(paraMap);
		return heartAddNo;
	}

	// 좋아요 추가 업데이트
	@Override
	public int fn_updateHeart(Map<String, String> paraMap) {
		String update = paraMap.get("update");
		int n = 0;
		if("add".equals(update)) {  // 북마크했다면
			n = dao.fn_addheart(paraMap);
		}
		else{ // "del" 이라면
			n = dao.fn_deleteheart(paraMap);
		}
		
		return n;
	}

	// 게시글 1개의 좋아요 개수 알아오기
	@Override
	public int fn_heartCntbyView(String fk_bno) {
		int heartCnt = dao.fn_heartCntbyView(fk_bno);
		return heartCnt;
	}
	

	// 게시글 1개에서 좋아요 여부 확인
	@Override
	public int fn_heartCheck(Map<String, String> paraMap) {
		int n = dao.fn_heartCheck(paraMap);
		return n;
	}
	

	// 게시글 1개에서 북마크 여부 확인
	@Override
	public int fn_bookmarkCheck(Map<String, String> paraMap) {
		int n = dao.fn_bookmarkCheck(paraMap);
		return n;
	}

	// 게시글 수정하기
	@Override
	public int fn_boardEdit(FreeBoardVO boardvo) {
		int n = dao.fn_boardEdit(boardvo);
		return n;
	}

	// 게시글 삭제하기
	@Override
	public int fn_boardDel(Map<String, String> paraMap) {
		
		int n = dao.fn_boardDel(paraMap); 
		
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 시작 **
		if(n == 1) {
			String path = paraMap.get("path");  // BoardController.java 에서 받아온 삭제해야할 파일이 저장된 경로
			String fileName = paraMap.get("fileName");  // BoardController.java 에서 받아온  삭제해야할 파일명
			
			if( fileName != null && !"".equals(fileName) ) {  // fileName(파일첨부된 파일) 이 있는 경우
				fileManager.doFileDelete(fileName, path);
			}
		}
		// ** 파일첨부 된 글이라면 글 삭제시 먼저 첨부파일을 삭제하기 끝 **
		
		return n;
	}

	
	
	
	// ***** 자유게시판 댓글작성 ***** //
	// 첨부파일이 없는 댓글쓰기(Ajax 로 처리)
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor= {Throwable.class})  // 꽝되어지면 알아서 롤백한다.
	public int addComment(Fb_CommentVO commentvo) {
		
		int n=0, m=0;
		n = dao.addComment(commentvo); // 댓글쓰기(tbl_fb_comment 테이블에 insert)
		
		if(n==1) {  
			m = dao.upadateCommentCount(commentvo.getFk_fbno());  // tbl_free_board 테이블에 commentCount(댓글의 개수) 컬럼이 1증가하기
			//System.out.println("~~~ m 결과 : "+ m);
		}
		
		return m;
	}

	
	// 원게시물의 댓글을 페이징 처리해서 조회해오기(Ajax 처리)
	@Override
	public List<Fb_CommentVO> getCommentListPaging(Map<String, String> paraMap) {
		List<Fb_CommentVO> commentList = dao.getCommentListPaging(paraMap);
		return commentList;
	}

	// 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리)
	@Override
	public int commentTotalPage(Map<String, String> paraMap) {
		int totalPage = dao.commentTotalPage(paraMap);
		return totalPage;
	}
	
	// 본인 댓글 삭제하기(Ajax 처리)
	@Override
	public int delComment(String cno) {
		int n = dao.delComment(cno); 
		return n;
	}

	

	
	
	
	
	
	
	
	
	
	
	
	

	
		
		
		

		
	
	
	
	
	
	
	
	
	
	
	

	


	
	
	
}

