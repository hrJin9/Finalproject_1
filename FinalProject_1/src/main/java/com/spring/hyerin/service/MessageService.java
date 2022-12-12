package com.spring.hyerin.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.finalproject.common.FileManager;
import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.InterMessageDAO;
import com.spring.hyerin.model.MessageFileVO;
import com.spring.hyerin.model.MessageSendVO;
import com.spring.hyerin.model.MessageVO;

@Service
public class MessageService implements InterMessageService {
	
	@Autowired
	private InterMessageDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Map<String,String>> getmvoList(Map<String, String> paraMap) {
		List<Map<String,String>> mvoList = dao.getmvoList(paraMap);
		return mvoList;
	}

	// 메시지리스트의 총페이지수 알아오기
	@Override
	public int getmgtotal(Map<String, String> paraMap) {
		int mgtotal = dao.getmgtotal(paraMap);
		return mgtotal;
	}
	
	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	@Override
	public MessageVO getmvo(Map<String, String> paraMap) {
		MessageVO mvo = dao.getmvo(paraMap);
		return mvo;
	}
	
	// 메시지 수신자 정보 알아오기
	@Override
	public List<MessageSendVO> getmsvoList(String mno) {
		List<MessageSendVO> msvo = dao.getmsvoList(mno);
		return msvo;
	}
	
	// 메시지의 파일 정보 알아오기
	@Override
	public List<MessageFileVO> getmfile(String mno) {
		List<MessageFileVO> mfList = dao.getmfile(mno); 
		return mfList;
	}
	
	// 부서 정보 구해오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = dao.getdept();
		return deptList;
	}
	
	//부서, 팀 이름 알아오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = dao.getdt();
		return dtList;
	}
	
	//구성원 목록을 읽어오기
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> empList = dao.getEmpList(paraMap);
		return empList;
	}
	
	// mno 채번해오기
	@Override
	public String getmno() {
		String mno = dao.getmno();
		return mno;
	}

	// 메시지 insert (transaction)
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {Throwable.class})
	public int addMessage(MultipartFile[] attaches, MultipartHttpServletRequest mrequest, MessageSendVO msvo, MessageVO mvo) throws Exception{
		
		// 1. tbl_message 메시지 insert
		int n = 0, m = 0, l = 0; 
		try {
			n = dao.addMessage(mvo);
		} catch(Throwable e) {
			e.printStackTrace();
		}
		
		if (n == 1) {
			// 2. tbl_message_file 파일 insert
			for(MultipartFile attach: attaches) {
				if(!attach.isEmpty()) { // 첨부파일이 있는 경우
					MessageFileVO mfvo = new MessageFileVO();
						
					HttpSession session = mrequest.getSession();
					String root = session.getServletContext().getRealPath("/");
					String path = root + "resources" + File.separator + "files";

					String newFileName = "";
					byte[] bytes = null;
					long fileSize = 0;

					try {
						bytes = attach.getBytes();
						// 첨부파일의 내용을 읽어오는 것
						String originalFileName = attach.getOriginalFilename();
						newFileName = fileManager.doFileUpload(bytes, originalFileName, path);
						fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte)
						
						mfvo.setFk_mno(mvo.getMno());
						mfvo.setM_systemfilename(newFileName);
						mfvo.setM_originfilename(originalFileName);
						System.out.println(mfvo.getM_systemfilename());
						mfvo.setFile_size(String.valueOf(fileSize));
						
						m = dao.addMF(mfvo);
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}//end of if
				else { // 첨부파일이 없는 경우
					m = 1;
					break;
				}
			}//end of for
			
		}
		
		// 3. tbl_message_send에 메시지 송신 insert
		if(m == 1) {
			String str_empno = mrequest.getParameter("receiver");
			String[] empnoArr = str_empno.split(",");
			
			for(String empno : empnoArr) {
				MessageSendVO ist_msvo = new MessageSendVO();
				ist_msvo.setFk_mno(mvo.getMno());
				ist_msvo.setReceiver(empno);
				try {
					l = dao.addMS(ist_msvo);
				} catch (Throwable e) {
					e.printStackTrace();
				}
			}
		}
		return l;
	}//end of addMessage
	
	// 관련메시지 3개  알아오기
	@Override
	public Map<String,String> getmgroupList(Map<String, String> paraMap) {
		Map<String,String> mgroupList = dao.getmgroupList(paraMap);
		return mgroupList;
	}
	
	
	//해당 메시지 읽음처리하기
	@Override
	public int changeMgStatus(MessageSendVO msvo) {
		int n = dao.changeMgStatus(msvo);
		return n;
	}
	
	
	// 탭별 메시지 개수 알아오기
	@Override
	public int getMgCnt(Map<String, String> paraMap){
		int mgCnt = dao.getMgCnt(paraMap);
		return mgCnt;
	}

	
	//체크된것 처리하기
	@Override
	public int chxStatus(Map<String, String> paraMap) {
		int n = dao.chxStatus(paraMap);
		return n;
	}

	
	// 해당 메시지 파일의 정보 가져오기
	@Override
	public MessageFileVO getmfvo(MessageFileVO mfvo_y) {
		MessageFileVO mfvo = dao.getmfvo(mfvo_y);
		return mfvo;
	}
	
	// 로그인유저의 메시지리스트 불러오기
	@Override
	public List<MessageVO> getMsmvoList(Map<String, String> paraMap) {
		List<MessageVO> getMsmvoList = dao.getMsmvoList(paraMap);
		return getMsmvoList;
	}
	
	// 메시지리스트의 총페이지수 알아오기
	@Override
	public int getMsmgtotal(Map<String, String> paraMap) {
		int msmgtotal = dao.getMsmgtotal(paraMap);
		return msmgtotal;
	}
	
	// 탭별 메시지 개수 알아오기
	@Override
	public int getMsMgCnt(Map<String, String> paraMap) {
		int MsMgCnt = dao.getMsMgCnt(paraMap);
		return MsMgCnt;
	}
	
	//보낸 메시지 => 체크된 것 condition에 따라 상태 update해주기
	@Override
	public int sendchxStatus(Map<String, String> paraMap) {
		int n = dao.sendchxStatus(paraMap);
		return n;
	}
	
	// empname, deptname 알아오기
	@Override
	public List<EmployeeVO> getempname(Map<String, String[]> paraMap) {
		List<EmployeeVO> empList = dao.getempname(paraMap); 
		return empList;
	}

	
	
	
	
	
}
