package com.spring.yeeun.model;

import org.springframework.web.multipart.MultipartFile;

public class FreeBoardVO {
	
	private String fbno;              // 자유게시물번호
    private String fk_employee_no;    // 사원번호  
    private String name_kr;           // 작성자명
    private String position;          // 직위
    
    private String subject;          // 글제목
    private String content;          // 글내용
    private String commentCheck;     // 댓글허용여부     1:댓글허용,  0:댓글불가
    private String commentCount;     // 댓글개수
    private String writedate;        // 작성일자
    private String readcnt;          // 글조회수
    private String status;           // 글삭제여부  1:사용가능한 글,  0:삭제된글
   
    private String bookmark;         // 북마크
    private String heart;            // 좋아요
    
    private String previousseq;      // 이전글번호 (select 용)
	private String previoussubject;  // 이전글제목
	private String nextseq;          // 다음글번호
	private String nextsubject;      // 다음글제목	
    
    /*
    === #152. 파일을 첨부하도록 VO 수정하기
              먼저, 오라클에서 tbl_board 테이블에 3개 컬럼(fileName, orgFilename, fileSize)을 추가한 다음에 아래의 작업을 한다. 
	*/
	private MultipartFile attach;  // add.jsp 에서 설정해준 name="attach" 와 동일하게 해줌.
	/*  form 태그에서 type="file" 인 파일을 받아서 저장되는 필드이다. 
	        진짜파일 ==> WAS(톰캣) 디스크에 저장됨.
	        조심할것은 MultipartFile attach 는 오라클 데이터베이스 tbl_board 테이블의 컬럼이 아니다.   
	    /Board/src/main/webapp/WEB-INF/views/tiles1/board/add.jsp 파일에서 input type="file" 인 name 의 이름(attach)과  
	        동일해야만 파일첨부가 가능해진다.!!!!
	*/
    
    private String fb_fileName;  // 저장될 파일명
    private String fb_orgFilename;  // 오리지널파일명
    private String fileSize;          // 파일크기
	
	public FreeBoardVO() {}

	public FreeBoardVO(String fbno, String fk_employee_no, String name_kr, String position, String subject,
			String content, String commentCheck, String commentCount, String writedate, String readcnt, String status,
			String bookmark, String heart, String previousseq, String previoussubject, String nextseq,
			String nextsubject, MultipartFile attach, String fb_fileName, String fb_orgFilename, String fileSize) {
		super();
		this.fbno = fbno;
		this.fk_employee_no = fk_employee_no;
		this.name_kr = name_kr;
		this.position = position;
		this.subject = subject;
		this.content = content;
		this.commentCheck = commentCheck;
		this.commentCount = commentCount;
		this.writedate = writedate;
		this.readcnt = readcnt;
		this.status = status;
		this.bookmark = bookmark;
		this.heart = heart;
		this.previousseq = previousseq;
		this.previoussubject = previoussubject;
		this.nextseq = nextseq;
		this.nextsubject = nextsubject;
		this.attach = attach;
		this.fb_fileName = fb_fileName;
		this.fb_orgFilename = fb_orgFilename;
		this.fileSize = fileSize;
	}

	public String getFbno() {
		return fbno;
	}

	public void setFbno(String fbno) {
		this.fbno = fbno;
	}

	public String getFk_employee_no() {
		return fk_employee_no;
	}

	public void setFk_employee_no(String fk_employee_no) {
		this.fk_employee_no = fk_employee_no;
	}

	public String getName_kr() {
		return name_kr;
	}

	public void setName_kr(String name_kr) {
		this.name_kr = name_kr;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCommentCheck() {
		return commentCheck;
	}

	public void setCommentCheck(String commentCheck) {
		this.commentCheck = commentCheck;
	}

	public String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBookmark() {
		return bookmark;
	}

	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getPreviousseq() {
		return previousseq;
	}

	public void setPreviousseq(String previousseq) {
		this.previousseq = previousseq;
	}

	public String getPrevioussubject() {
		return previoussubject;
	}

	public void setPrevioussubject(String previoussubject) {
		this.previoussubject = previoussubject;
	}

	public String getNextseq() {
		return nextseq;
	}

	public void setNextseq(String nextseq) {
		this.nextseq = nextseq;
	}

	public String getNextsubject() {
		return nextsubject;
	}

	public void setNextsubject(String nextsubject) {
		this.nextsubject = nextsubject;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getFb_fileName() {
		return fb_fileName;
	}

	public void setFb_fileName(String fb_fileName) {
		this.fb_fileName = fb_fileName;
	}

	public String getFb_orgFilename() {
		return fb_orgFilename;
	}

	public void setFb_orgFilename(String fb_orgFilename) {
		this.fb_orgFilename = fb_orgFilename;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	


	
	
	

	
	

}

