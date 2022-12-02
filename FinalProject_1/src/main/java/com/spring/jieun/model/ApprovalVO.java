package com.spring.jieun.model;

public class ApprovalVO {

	// *** 작성한 결재 태이블 *** //
	private String ano; 				// 결재문서번호 ( d-결재신청날짜-seq => d-20221128-123 ) 
	private String fk_empno; 			// 작성사원번호
	//작성사원직위
	private String ap_type; 			//결재문서종류
	private String title; 				//제목
	private String content; 			//내용
	private String final_signyn; 		// default 0         -- 최종승인여부 (0:진행중 1:승인 2:반려)
	
	private String ap_systemFileName; 	// 파일서버에 업로드되어지는 실제 제품설명서 파일명 (파일명이 중복되는 것을 피하기 위해서 중복된 파일명이 있으면 파일명뒤에 숫자가 자동적으로 붙어 생성됨)
	private String ap_originFileName; 	// 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명 
	private String filesize; 			// 파일크기
	private String preserveperiod; 		// 보존연한 (0:영구 1:1년 3:3년 5:5년)
	private String status;				// default 1      -- 삭제여부 (0:삭제 1:유지)
	private String writeday; 			// default sysdate      -- 작성일자
	private String modifyday; 			// 수정일
	private String fk_ano_refer; 		// 참고문서
	private String bookmark; 		// 북마크 
	
	private String feedbackcnt; 		// 피드백갯수 
	
	
	// *** 결재할 태이블 *** //
	private String asno; // 결재번호 seq
	private String fk_ano; // 결재문서번호 ( d-결재신청날짜-seq => d-20221128-123 ) 
	private String fk_sign_empno; // 결재사원번호
	// --,                       not null              -- 결재사원직위
	private String signstep; // 결재순번 
	private String signyn; // default 0           -- 결재결과 (0:진행중 1:승인 2:거절)
	private String signdate; // default sysdate     -- 결재일자 
	private String feedback; //  피드백
	
	
	public String getBookmark() {
		return bookmark;
	}
	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	public String getModifyday() {
		return modifyday;
	}
	public void setModifyday(String modifyday) {
		this.modifyday = modifyday;
	}
	public String getFeedbackcnt() {
		return feedbackcnt;
	}
	public void setFeedbackcnt(String feedbackcnt) {
		this.feedbackcnt = feedbackcnt;
	}
	
	
	public String getFinal_signyn() {
		return final_signyn;
	}
	public void setFinal_signyn(String final_signyn) {
		this.final_signyn = final_signyn;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getFk_empno() {
		return fk_empno;
	}
	public void setFk_empno(String fk_empno) {
		this.fk_empno = fk_empno;
	}
	public String getAp_type() {
		return ap_type;
	}
	public void setAp_type(String ap_type) {
		this.ap_type = ap_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAp_systemFileName() {
		return ap_systemFileName;
	}
	public void setAp_systemFileName(String ap_systemFileName) {
		this.ap_systemFileName = ap_systemFileName;
	}
	public String getAp_originFileName() {
		return ap_originFileName;
	}
	public void setAp_originFileName(String ap_originFileName) {
		this.ap_originFileName = ap_originFileName;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	public String getPreserveperiod() {
		return preserveperiod;
	}
	public void setPreserveperiod(String preserveperiod) {
		this.preserveperiod = preserveperiod;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getModifydate() {
		return modifyday;
	}
	public void setModifydate(String modifyday) {
		this.modifyday = modifyday;
	}
	public String getFk_ano_refer() {
		return fk_ano_refer;
	}
	public void setFk_ano_refer(String fk_ano_refer) {
		this.fk_ano_refer = fk_ano_refer;
	}
	public String getAsno() {
		return asno;
	}
	public void setAsno(String asno) {
		this.asno = asno;
	}
	public String getFk_ano() {
		return fk_ano;
	}
	public void setFk_ano(String fk_ano) {
		this.fk_ano = fk_ano;
	}
	public String getFk_sign_empno() {
		return fk_sign_empno;
	}
	public void setFk_sign_empno(String fk_sign_empno) {
		this.fk_sign_empno = fk_sign_empno;
	}
	public String getSignstep() {
		return signstep;
	}
	public void setSignstep(String signstep) {
		this.signstep = signstep;
	}
	public String getSignyn() {
		return signyn;
	}
	public void setSignyn(String signyn) {
		this.signyn = signyn;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
	
	
}
