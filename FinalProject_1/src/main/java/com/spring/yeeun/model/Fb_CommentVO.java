package com.spring.yeeun.model;

public class Fb_CommentVO {
	
	private String cno;             // 댓글번호
    private String fk_employee_no;  // 사원번호  
    private String name_kr;         // 작성자명
    private String position;        // 직위
    private String content;         // 댓글내용   
    private String writedate;       // 작성일자
    private String fk_fbno;         // 원게시물 자유게시물번호
    private String status;          // 글삭제여부
    private String groupno;         // 댓글 그룹번호
    /*
	        답변글쓰기에 있어서 그룹번호 
	        원글(부모글)과 답변글은 동일한 groupno 를 가진다.
	        답변글이 아닌 원글(부모글)인 경우 groupno 의 값은 groupno 컬럼의 최대값(max)+1 로 한다.
	*/
    private String fk_cno;          // 대댓글이라면 댓글(부모글)의 seq 컬럼의 값, 대댓글이 아닌 댓글일 경우 0
    /*
       fk_cno 컬럼은 절대로 foreign key가 아니다.!!!!!!
       fk_cno 컬럼은 자신의 글(답변글)에 있어서 
              원글(부모글)이 누구인지에 대한 정보값이다.
              답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 
              원글(부모글)의 seq 컬럼의 값을 가지게 되며,
              답변글이 아닌 원글일 경우 0 을 가지도록 한다. 
     */
    
    private String depthno;         // 댓글(부모글)의 depthno + 1, 대댓글 아닌 댓글일 경우 0
    /*
	     답변글쓰기에 있어서 답변글 이라면
	     원글(부모글)의 depthno + 1 을 가지게 되며,
	     답변글이 아닌 원글일 경우 0 을 가지도록 한다. 
	*/
    
	public Fb_CommentVO() {}

	public Fb_CommentVO(String cno, String fk_employee_no, String name_kr, String position, String content,
			String writedate, String fk_fbno, String status, String groupno, String fk_cno, String depthno) {
		super();
		this.cno = cno;
		this.fk_employee_no = fk_employee_no;
		this.name_kr = name_kr;
		this.position = position;
		this.content = content;
		this.writedate = writedate;
		this.fk_fbno = fk_fbno;
		this.status = status;
		this.groupno = groupno;
		this.fk_cno = fk_cno;
		this.depthno = depthno;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getFk_fbno() {
		return fk_fbno;
	}

	public void setFk_fbno(String fk_fbno) {
		this.fk_fbno = fk_fbno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGroupno() {
		return groupno;
	}

	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}

	public String getFk_cno() {
		return fk_cno;
	}

	public void setFk_cno(String fk_cno) {
		this.fk_cno = fk_cno;
	}

	public String getDepthno() {
		return depthno;
	}

	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}

	

	
	

}

