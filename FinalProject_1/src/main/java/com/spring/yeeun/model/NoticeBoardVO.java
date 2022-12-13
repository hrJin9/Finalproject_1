package com.spring.yeeun.model;

import org.springframework.web.multipart.MultipartFile;

public class NoticeBoardVO {
	
	private String nbno;            // 공지게시물번호
    //private String lg_nbc_no;       // 공지사항분류
    private String fk_sm_nbc_no;    // 게시글분류번호 (카테고리)
    private String fk_employee_no;  // 사원번호
    private String name_kr;         // 작성자명
    private String position;        // 직위
    private String subject;         // 글제목
    private String content;         // 글내용
    private String readcnt;         // 글조회수
    private String writedate;       // 작성일자
    private String status;          // 글삭제여부  1:사용가능한 글,  0:삭제된글
    
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
	
    private String nb_fileName;     // 저장될 파일명   
    private String nb_orgFilename;  // 오리지널파일명
    private String fileSize;        // 파일크기
	
	public NoticeBoardVO() {}

	public NoticeBoardVO(String nbno, String lg_nbc_no, String fk_sm_nbc_no, String fk_employee_no, String name_kr,
				   String position, String subject, String content, String readcnt, String writedate, String status,
				   String nb_systemfilename, String nb_originfilename, String file_size) {
		super();
		this.nbno = nbno;
		//this.lg_nbc_no = lg_nbc_no;
		this.fk_sm_nbc_no = fk_sm_nbc_no;
		this.fk_employee_no = fk_employee_no;
		this.name_kr = name_kr;
		this.position = position;
		this.subject = subject;
		this.content = content;
		this.readcnt = readcnt;
		this.writedate = writedate;
		this.status = status;
	}

	public String getNbno() {
		return nbno;
	}

	public void setNbno(String nbno) {
		this.nbno = nbno;
	}

	public String getFk_sm_nbc_no() {
		return fk_sm_nbc_no;
	}

	public void setFk_sm_nbc_no(String fk_sm_nbc_no) {
		this.fk_sm_nbc_no = fk_sm_nbc_no;
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

	public String getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getNb_fileName() {
		return nb_fileName;
	}

	public void setNb_fileName(String nb_fileName) {
		this.nb_fileName = nb_fileName;
	}

	public String getNb_orgFilename() {
		return nb_orgFilename;
	}

	public void setNb_orgFilename(String nb_orgFilename) {
		this.nb_orgFilename = nb_orgFilename;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	
	

	
	
	
	

}

