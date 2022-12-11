package com.spring.hyerin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.TeamVO;

@Service
public class MemberService implements InterMemberService {
	@Autowired
	private InterMemberDAO dao;
	
	//부서정보 가져오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = dao.getdept();
		return deptList;
	}

	//부서, 팀의 정보 구해오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = dao.getdt();
		return dtList;
	}
	
	//해당 empno사원의 정보 가져오기
	@Override
	public EmployeeVO getempvo(String empno) {
		EmployeeVO evo = dao.getempvo(empno);
		return evo;
	}
	
	//파일업로드해주기
	@Override
	public int addProfile(Map<String, String> paraMap) {
		int n = dao.addProfile(paraMap);
		return n;
	}
	
	//프로필 파일이름 알아오기
	@Override
	public String getImg(String employee_no) {
		String filename = dao.getImg(employee_no);
		return filename;
	}

	// 해당 사원의 오늘 근무시간 알아오기
	@Override
	public String getWorkinghour(String employee_no) {
		String workingmin = dao.getWorkinghour(employee_no);
		return workingmin;
	}
	
	// 멤버리스트 가져오기
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> empList = dao.getEmpList(paraMap);
		return empList;
	}
	
	// 구성원 리스트의 총 페이지수
	@Override
	public int getEmpTotal(Map<String, String> paraMap) {
		int emptotal = dao.getEmpTotal(paraMap);
		return emptotal;
	}
	
	// 부서목록 가져오기
	@Override
	public List<DepartmentsVO> getdeptname() {
		List<DepartmentsVO> dvoList = dao.getdeptname();
		return dvoList;
	}
	
	// 직위목록 가져오기
	@Override
	public List<String> getposition() {
		List<String> pList = dao.getposition();
		return pList;
	}

	// 고용형태 가져오기
	@Override
	public List<String> getjointype() {
		List<String> jtList = dao.getjointype();
		return jtList;
	}
	
	// 해당 부서의 팀 가져오기
	@Override
	public List<TeamVO> getTeams(String deptno) {
		List<TeamVO> tvoList = dao.getTeams(deptno);
		return tvoList;
	}
	
	
	// 트랜잭션 처리 (fk_department_no나 fk_team_no가 add라면 먼저 insert해준 뒤 사원정보 insert)
	@Override
	@Transactional (propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {Throwable.class })
	public Map<String, String> addEmployee(EmployeeVO evo) throws Throwable {
		
		int n=0, m=0, l=0;
		String s_department_no = "", s_team_no = ""; 
		
		String fk_department_no = evo.getFk_department_no();
		if("add".equals(fk_department_no)) {
			String department_name = evo.getDepartment_name();
			
			//새로운 부서의 no 채번해오기
			s_department_no = dao.getNewDepartment(); 
			
			
			Map<String,String> paraMap = new HashMap<String, String>();
			paraMap.put("fk_department_no", s_department_no);
			paraMap.put("department_name", department_name);
			
			// 새로운 부서를 만들어주기
			n = dao.addDepartment(paraMap);
			
			// fk_department_no를 바꿔주기
			evo.setFk_department_no(s_department_no);
			
		} else {
			n=1;
		}
		
		String fk_team_no = evo.getFk_team_no();
		if("add".equals(fk_team_no)) {
			//새로운 팀을 만들 번호 채번하기
			s_team_no = dao.getNewTeam();
			
			// 새로운 팀을 만들어주기
			String team_name = evo.getTeam_name();
			Map<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("team_no",s_team_no);
			paraMap.put("team_name",team_name);
			paraMap.put("fk_department_no",evo.getFk_department_no());
			
			m = dao.addTeam(paraMap);
			
			// fk_team_no를 바꿔주기
			evo.setFk_team_no(s_team_no);
			
		} else {
			m=1;
		}
		
		System.out.println("fk_department_no" + evo.getFk_department_no());
		System.out.println("fk_team_no" + evo.getFk_team_no());
		
		
		if (n==1 && m==1) {
			// 사원번호 채번해오기
			String employee_no = dao.getNewEmpno(evo.getFk_department_no());
			System.out.println("employee_no : " + employee_no);
			
			evo.setEmployee_no(employee_no);
			// 사원테이블에 insert
			l = dao.addEmployee(evo);
			
		}
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("employee_no",evo.getEmployee_no());
		resultMap.put("l",String.valueOf(l));
		
		return resultMap;
	}//end of addEmployee
	
	
	// 해당 사원들의 status를 0으로 바꿔주기
	@Override
	public int goDeleteEmp(Map<String, String[]> paraMap) {
		int n = dao.goDeleteEmp(paraMap);
		return n;
	}
	
}
