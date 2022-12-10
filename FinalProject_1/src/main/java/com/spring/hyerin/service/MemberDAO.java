package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.TeamVO;

@Repository
public class MemberDAO implements InterMemberDAO {
	@Resource
	private SqlSessionTemplate sqlsession;
	
	//부서정보 가져오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = sqlsession.selectList("member.getdept");
		return deptList;
	}
	
	
	//부서, 팀 이름 알아오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = sqlsession.selectList("member.getdt");
		return dtList;
	}

	
	//해당 empno사원의 정보 가져오기
	@Override
	public EmployeeVO getempvo(String empno) {
		EmployeeVO evo = sqlsession.selectOne("member.getempvo",empno);
		return evo;
	}

	
	//파일업로드해주기
	@Override
	public int addProfile(Map<String, String> paraMap) {
		int n = sqlsession.update("member.addProfile",paraMap);
		return n;
	}

	
	//프로필 파일이름 알아오기
	@Override
	public String getImg(String employee_no) {
		String filename = sqlsession.selectOne("member.getImg", employee_no);
		return filename;
	}

	// 해당 사원의 오늘 근무시간 알아오기
	@Override
	public String getWorkinghour(String employee_no) {
		String workingmin = sqlsession.selectOne("member.getWorkinghour",employee_no);
		return workingmin;
	}

	
	// 멤버리스트 가져오기
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> empList = sqlsession.selectList("member.getEmpList",paraMap);
		return empList;
	}

	
	// 구성원 리스트의 총 페이지수
	@Override
	public int getEmpTotal(Map<String, String> paraMap) {
		int emptotal = sqlsession.selectOne("member.getEmpTotal",paraMap);
		return emptotal;
	}

	
	// 부서목록 가져오기
	@Override
	public List<DepartmentsVO> getdeptname() {
		List<DepartmentsVO> dvoList = sqlsession.selectList("member.getdeptname");
		return dvoList;
	}

	
	// 직위목록 가져오기
	@Override
	public List<String> getposition() {
		List<String> pList = sqlsession.selectList("member.getposition");
		return pList;
	}

	// 고용형태 가져오기
	@Override
	public List<String> getjointype() {
		List<String> jtList = sqlsession.selectList("member.getjointype");
		return jtList;
	}

	
	// 해당 부서의 팀 가져오기
	@Override
	public List<TeamVO> getTeams(String deptno) {
		List<TeamVO> tvoList = sqlsession.selectList("member.getTeams",deptno);
		return tvoList;
	}
	
	
	
}
