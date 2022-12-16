package com.spring.jieun.model;

import org.springframework.web.multipart.MultipartFile;


public class ApprovalVO {

	// *** 작성한 결재 태이블 *** //
	private String ano; 				// 결재문서번호 ( d-결재신청날짜-seq => d-20221128-123 ) 
	
	private String fk_empno; 			// 작성사원번호
	//작성사원직위
	private String ap_type; 			//결재문서종류
	private String title; 				//제목
	private String content; 			//내용
	private String final_signyn; 		// default 0         -- 최종승인여부 (0:진행중 1:승인 2:반려)
	
	private String preserveperiod; 		// 보존연한 (0:영구 1:1년 3:3년 5:5년)
	private String status;				// default 1      -- 삭제여부 (0:삭제 1:유지)
	private String writeday; 			// default sysdate      -- 작성일자
	
	private String modifyday; 			// 수정일
	private String fk_ano_refer; 		// 참고문서
	private String bookmark; 		// 북마크 
	private String feedbackcnt; 		// 피드백갯수 

	
	
	// 결재문서작성할때 필요한
	private String approvalline; 		// 결재사원 라인( 0000,0000/0000 ...) 
	private String approvalline_name; 		// 결재사원 라인( 0000,0000/0000 ...) 
	private String referline; 		// 피드백갯수 
	private String referline_name; 		// 피드백갯수 
	private String usedayoffcnt; 		// 피드백갯수 
//	private String leftdayoffcnt; 		// 피드백갯수 
	
//	private String appendchx;
//	
//	
//	 public String getAppendchx() {
//		return appendchx;
//	}
//	public void setAppendchx(String appendchx) {
//		this.appendchx = appendchx;
//	}
	private MultipartFile attach;
	 private String afno; 				// 결재문서 첨부파일 시퀀스 
	private String ap_systemfilename; 	// 파일서버에 업로드되어지는 실제 제품설명서 파일명 (파일명이 중복되는 것을 피하기 위해서 중복된 파일명이 있으면 파일명뒤에 숫자가 자동적으로 붙어 생성됨)
	 private String ap_originfilename; 	// 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 제품설명서 파일명 
	 private String filesize; 			// 파일크기
		   
	
	
	
	 // *** 참조사원 테이블 ***
	 private String referno;        // 시퀀스 
	 private String fk_refer_empno; // 참조 사원번호 
	 
	 
	 
	// *** 저장결재라인 테이블 ***
	private String signpath_no; 		// 결재라인번호  
	private String signpath_name; 		// 결재라인명 
	private String sign_empno; 		// 결재사원번호 
	private String role; 		
	private String step; 		// 결재단계 
	
	
	
	// join select용  
	private String name_kr; // 사원이름 
	private String department_name; // 부서이름 
	private String team_name; // 부서이름 
	private String position; // 직책명 
	 
	
	// *** 결재할 태이블 *** //
	private String asno; // 결재번호 seq
	private String fk_ano; // 결재문서번호 ( d-결재신청날짜-seq => d-20221128-123 ) 
	private String fk_sign_empno; // 결재사원번호
	private String signstep; // 결재순번 
	
	
	private String signyn; // default 0           -- 결재결과 (0:진행중 1:승인 2:거절)
	private String signdate; // default sysdate     -- 결재일자 
	private String feedback; //  피드백
	private String signemp_deptname; // 결재사원부서
	private String signemp_position; // 결재사원직위
	
	
	// *** 연차 테이블 *** //
	private String dono;         // 연차번호
	private String docnt;           // 연차수
	private String docatgo;      //  연차유형
	private String startdate;    //  연차시작일
	private String enddate;      //  연차종료일

	
	
	// *** 업무문서 테이블 *** //
	private String wdno;            // 업무기안문서번호
	private String executedate; 	// 업무시행일
	private String deptname; 		// 협조부서

	
	
	public String getAfno() {
		return afno;
	}
	public void setAfno(String afno) {
		this.afno = afno;
	}
	public String getApprovalline() {
		return approvalline;
	}
	public void setApprovalline(String approvalline) {
		this.approvalline = approvalline;
	}
	public String getApprovalline_name() {
		return approvalline_name;
	}
	public void setApprovalline_name(String approvalline_name) {
		this.approvalline_name = approvalline_name;
	}
	public String getReferline() {
		return referline;
	}
	public void setReferline(String referline) {
		this.referline = referline;
	}
	public String getReferline_name() {
		return referline_name;
	}
	public void setReferline_name(String referline_name) {
		this.referline_name = referline_name;
	}
	public String getReferno() {
		return referno;
	}
	public void setReferno(String referno) {
		this.referno = referno;
	}
	public String getFk_refer_empno() {
		return fk_refer_empno;
	}
	public void setFk_refer_empno(String fk_refer_empno) {
		this.fk_refer_empno = fk_refer_empno;
	}
	public String getUsedayoffcnt() {
		return usedayoffcnt;
	}
	public void setUsedayoffcnt(String usedayoffcnt) {
		this.usedayoffcnt = usedayoffcnt;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	public String getSignpath_no() {
		return signpath_no;
	}
	public void setSignpath_no(String signpath_no) {
		this.signpath_no = signpath_no;
	}
	public String getSignpath_name() {
		return signpath_name;
	}
	public void setSignpath_name(String signpath_name) {
		this.signpath_name = signpath_name;
	}
	public String getSign_empno() {
		return sign_empno;
	}
	public void setSign_empno(String sign_empno) {
		this.sign_empno = sign_empno;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getName_kr() {
		return name_kr;
	}
	public void setName_kr(String name_kr) {
		this.name_kr = name_kr;
	}
	public String getSignemp_deptname() {
		return signemp_deptname;
	}
	public void setSignemp_deptname(String signemp_deptname) {
		this.signemp_deptname = signemp_deptname;
	}
	public String getSignemp_position() {
		return signemp_position;
	}
	public void setSignemp_position(String signemp_position) {
		this.signemp_position = signemp_position;
	}
	public String getDono() {
		return dono;
	}
	public void setDono(String dono) {
		this.dono = dono;
	}
	public String getDocnt() {
		return docnt;
	}
	public void setDocnt(String docnt) {
		this.docnt = docnt;
	}
	public String getDocatgo() {
		return docatgo;
	}
	public void setDocatgo(String docatgo) {
		this.docatgo = docatgo;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getWdno() {
		return wdno;
	}
	public void setWdno(String wdno) {
		this.wdno = wdno;
	}
	public String getExecutedate() {
		return executedate;
	}
	public void setExecutedate(String executedate) {
		this.executedate = executedate;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
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
	public String getAp_systemfilename() {
		return ap_systemfilename;
	}
	public void setAp_systemfilename(String ap_systemfilename) {
		this.ap_systemfilename = ap_systemfilename;
	}
	public String getAp_originfilename() {
		return ap_originfilename;
	}
	public void setAp_originfilename(String ap_originfilename) {
		this.ap_originfilename = ap_originfilename;
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
