package com.spring.jieun.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.finalproject.common.FileManager;
import com.spring.jieun.model.ApprovalVO;
import com.spring.jieun.model.InterApprovalDAO;

@Service
public class ApprovalService implements InterApprovalService {

	// 의존객체 
	@Autowired
	private InterApprovalDAO dao;


	@Autowired
	private FileManager fileManager;

    // 내가 작성한 결재문서 총 건수(totalCount)
	@Override
	public int getMyApprovalTotalCount(Map<String, String> paraMap) {
		int n = dao.getMyApprovalTotalCount(paraMap);
		return n;
	}


    // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
	@Override
	public List<ApprovalVO> approvalListSearchWithPaging(Map<String, String> paraMap) {
		List<ApprovalVO> approvalList = dao.approvalListSearchWithPaging(paraMap);
		return approvalList;
	}

	//	*** 북마크 추가 업데이트 ***
	@Override
	public int updateaddbookmark(Map<String, String> paraMap) {
		String yn = paraMap.get("yn");
		int n = 0;
		if("y".equals(yn)) {
			n = dao.updateaddbookmark(paraMap);
		}
		else{
			n = dao.updatedeletebookmark(paraMap);
		}
		
		return n;
	}

	// 로그인한 사원 연차갯수 알아오기 
	@Override
	public int seldayoffcnt(Map<String, String> paraMap) {
		int result = dao.seldayoffcnt(paraMap);
		return result;
	}

	// 하나의 결재문서에 대한 정보 가져오기 
	@Override
	public List<ApprovalVO> getapprovalOneInfo(Map<String, String> paraMap) {
		List<ApprovalVO> appvo = dao.getapprovalOneInfo(paraMap);
		return appvo;
	}

	// 결재문서타입이 연차와 업무문서일경우 해당테이블과 결재테이블에서 정보를 가져와야한다.
	@Override
	public ApprovalVO getdayoffInfo(String ano) {
		ApprovalVO appvo = dao.getdayoffInfo(ano);
		return appvo;
	}
	@Override
	public ApprovalVO getworkdocvoInfo(String ano) {
		ApprovalVO appvo = dao.getworkdocvoInfo(ano);
		return appvo;
	}
	@Override
	public ApprovalVO getapprovalInfo(String ano) {
		ApprovalVO appvo = dao.getapprovalInfo(ano);
		return appvo;
	}

	// 한문서에 대해 결재라인리스트 가져오기 
	@Override
	public List<ApprovalVO> getapprovalLine(String ano) {
	List<ApprovalVO> aproList = dao.getapprovalLine(ano) ;
		return aproList;
	}

	// 내결재문서 신청취소  
	@Override
	public int updatecancelmyapproval(String ano) {
		int result = dao.updatecancelmyapproval(ano); // 문서상태 취소로 만들기 
		return result;
	}


	@Override
	public int getRequestedApprovalTotalCount(Map<String, String> paraMap) {
		int n = dao.getRequestedApprovalTotalCount(paraMap); 
		return n;
	}
	@Override
	public List<ApprovalVO> requestedapprovalListPaging(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.requestedapprovalListPaging(paraMap); 
		return list;
	}

	
	@Override
	public int requestedtodoTotalCount(Map<String, String> paraMap) {
		int n = dao.requestedtodoTotalCount(paraMap);
		return n;
	}
	@Override
	public List<ApprovalVO> requestedtodoListPaging(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.requestedtodoListPaging(paraMap); 
		return list;
	}

	// 결재 승인으로 업댓
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {Throwable.class})
	public int updaterequestedapprove(ApprovalVO apvo) {
		// 내가 해당 문서에 대해 마지막 결재자인지 확인하고 마지막결재자일경우 두테이블에 업댓 
		
		int result = 0;
		if("1".equals(apvo.getSignyn())){ // 승인 일경우
			String chk_ano = dao.checkmymaxstep(apvo);
//			System.out.println("chk_ano =>"+chk_ano);
			int n = 0;
//			String ano = paraMap.get("ano");
			if(chk_ano != null) {	//마지막 결재자일경우  
				n = dao.updateapprovedoc(apvo);// tbl_approval 업데이트
			}else {	//마지막 결재자가 아닐 경우
				n = 1;
			}
//			System.out.println("n => "+n);
			
			if(n==1) result=dao.updaterequestedapprove(apvo); // tbl_approval_sign 업데이트
//			System.out.println("result => "+result);
			
		}else if("2".equals(apvo.getSignyn())){ // 반려 일경우 
			int n = dao.updaterequestedreject(apvo); // tbl_approval_sign 업데이트 
			result = n==1? dao.updateapprovalreject(apvo) : 0; // tbl_approval final_signyn 업데이트 
		}
		
		return result;
	}

	// 검색어 입력시 자동글 완성하기
	@Override
	public List<String> wordSearchShow(Map<String, String> paraMap) {
		List<String> list = dao.wordSearchShow(paraMap);
		return list;
	}

	// 저장한 내 결재라인 가져오기 (Ajax)
	@Override
	public List<ApprovalVO> loadsavedline(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.loadsavedline(paraMap) ;
		return list;
	}

	// 결재라인 저장하기 
	@Override
	public String getspno() {
		String signpath_no = dao.getspno(); // 채번하기 
		return signpath_no;
	}
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {Throwable.class})
	public int savemyline(Map<String, String> paraMap) throws Exception {
		int result = 0;
		
		String signstep = paraMap.get("signstep");
		String signpatharr = paraMap.get("signpatharr");
		String[] arr = signpatharr.split(",");

		int n = 0;
		if("1".equals(signstep) ) {
			for(int i =0; i<=arr.length; i++) {
				System.out.println("arr "+i+"=>" +arr[i]);
				if(i==0) { // 한번만 tbl_signpath 에 넣기 
					n = dao.insertsignpath(paraMap);
				}
				break;
			}
		}
		
		for(String signpath : arr) {
			paraMap.put("sign_empno", signpath);
			n = dao.insertdetailsignpath(paraMap);
			n *= n ;
		}
		
		result = n;
		return result;
	}


	@Override
	public List<ApprovalVO> getmyline(Map<String, String> paraMap) {
		List<ApprovalVO> list = dao.getmyline(paraMap); 
		return list;
	}

	
	// 채번하기 
	@Override
	public String getano() {
		String ano = dao.getano();
		return ano;
	}
	
//	결재문서 인서트 
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {Throwable.class})
	public int add(ApprovalVO approvalvo, MultipartFile[] attaches, MultipartHttpServletRequest mrequest) throws Exception {

		// 1. tbl_approval insert
		int n = 0, m = 0, l = 0, r=0, p=0, result = 0; 
		try {
			n = dao.add(approvalvo);
		} catch(Throwable e) {
			e.printStackTrace();
		}
		
		// 2. tbl_approval_file 파일 insert
		if (n == 1) {
			for(MultipartFile attach: attaches) {
				if(!attach.isEmpty()) { // 첨부파일이 있는 경우
						
					HttpSession session = mrequest.getSession();
					String root = session.getServletContext().getRealPath("/");
					String path = root + "resources" + File.separator + "files";

					String newFileName = "";
					byte[] bytes = null;
					long fileSize = 0;

					try {
						bytes = attach.getBytes();
						String originalFilename = attach.getOriginalFilename();
						newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
						approvalvo.setAp_systemfilename(newFileName);
						approvalvo.setAp_originfilename(originalFilename);
						fileSize = attach.getSize();// 첨부파일의 크기(단위는 byte임)
						approvalvo.setFilesize(String.valueOf(fileSize));
						
						m = dao.addfile(approvalvo);
						
					} catch (Exception e) { // 파일이 깨졌을까봐 
						e.printStackTrace();
					} 
				}//end of if
				else { // 첨부파일이 없는 경우
					m = 1;
					break;
				}
			}//end of for
		}
		
		// 2. tbl_approval_sign 결재사원 insert
		String approvalline = approvalvo.getApprovalline();
		String approvalline_name = approvalvo.getApprovalline_name();
		String referline = approvalvo.getReferline();
		String referline_name = approvalvo.getReferline_name();
		if(m == 1 && approvalline != "") {
			
			// 결재라인 넣어주기 
			String[] approvallinearr = approvalline.split("\\/");
			String[] approvalline_namearr = approvalline_name.split("\\/");
			
			for(int i=0; i<approvallinearr.length; i++) {
				String[] linearr = approvallinearr[i].split(",");
				String[] namearr = approvalline_namearr[i].split(",");
				for(int j=0; j<linearr.length; j++) {
					//System.out.println(i+"단계 signemp ->"+linearr[j]);
					approvalvo.setFk_sign_empno(linearr[j]);
					approvalvo.setName_kr(namearr[j]);
					approvalvo.setSignstep(String.valueOf(i+1));
					
					l = dao.addsignline(approvalvo);
				}
			}
		}
		// 3. tbl_approval_refer 참조사원 insert
		if(l==1) {
			// 참조사원 넣어주기
			String[] referlinearr = referline.split(",");
			String[] referline_namearr = referline_name.split(",");
			for(int i=0; i<referlinearr.length; i++) {
				if(!referlinearr[i].trim().isEmpty()) {
					approvalvo.setFk_refer_empno(referlinearr[i]);
					approvalvo.setName_kr(referline_namearr[i]);
					r = dao.addrefer(approvalvo);
					
				}else r=1;
			}
				
		}
		
		// 4. 각 템플릿에 맞게 양식 넣어두기 
		if(r ==1) {
			if("연차".equals(approvalvo.getAp_type())) {
				 p = dao.adddayoff(approvalvo);
				 if(p==1) {// 연차 갯수 줄이기 
					result = dao.minusempdayoff(approvalvo); 
				 }
			}else if("업무기안서".equals(approvalvo.getAp_type().trim())) {
				System.out.println("approvalvo.getAp_type() => "+approvalvo.getAp_type());
				approvalvo.setDeptname(approvalvo.getDeptname().trim());
				 result = dao.addworkdoc(approvalvo);
			}else result = 1;
		}
		
		return result;
	}


	// 한문서 첨부파일 가져오기 
	@Override
	public List<ApprovalVO> viewFile(String ano) {
		List<ApprovalVO> list = dao.viewFile(ano);
		return list;
	}


	// 첨부파일 있는지 상태보기 
	@Override
	public ApprovalVO approvalfilestatus(Map<String, String> paraMap) {
		ApprovalVO apvo = dao.approvalfilestatus(paraMap); 
		return apvo;
	}

	// 부서명 가져오기 
	@Override
	public List<String> getdeptname() {
		List<String> dept = dao.getdeptname();
		return dept;
	}


	




}
