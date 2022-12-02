package com.spring.hyerin.model;

public class EmployeeVO {
	private String employee_no;
	private String fk_department_no;
	private String department_name;
	private String fk_team_no;
	private String team_name;
	private String name_kr;
	private String name_en;
	private String passwd;
	private String jointype;
	private String hire_date;
	private String salary;
	private String commission_pct;
	private String mobile;
	private String postcode;
	private String address;
	private String detail_address;
	private String extra_address;
	private String email;
	private String gender;
	private String profile_systemfilename;
	private String profile_orginfilename;
	private String academic_ability;
	private String major;
	private String militaryservice;
	private String bank;
	private String accountnumber;
	private String status;
	private String role;
	private String position;
	private String authority;
	private String dayoff_cnt;
	
	
	public EmployeeVO() {}
	
	
	public EmployeeVO(String employee_no, String fk_department_no, String department_name, String fk_team_no,
			String team_name, String name_kr, String name_en, String passwd, String jointype, String hire_date,
			String salary, String commission_pct, String mobile, String postcode, String address, String detail_address,
			String extra_address, String email, String gender, String profile_systemfilename,
			String profile_orginfilename, String academic_ability, String major, String militaryservice, String bank,
			String accountnumber, String status, String role, String position, String authority, String dayoff_cnt) {
		super();
		this.employee_no = employee_no;
		this.fk_department_no = fk_department_no;
		this.department_name = department_name;
		this.fk_team_no = fk_team_no;
		this.team_name = team_name;
		this.name_kr = name_kr;
		this.name_en = name_en;
		this.passwd = passwd;
		this.jointype = jointype;
		this.hire_date = hire_date;
		this.salary = salary;
		this.commission_pct = commission_pct;
		this.mobile = mobile;
		this.postcode = postcode;
		this.address = address;
		this.detail_address = detail_address;
		this.extra_address = extra_address;
		this.email = email;
		this.gender = gender;
		this.profile_systemfilename = profile_systemfilename;
		this.profile_orginfilename = profile_orginfilename;
		this.academic_ability = academic_ability;
		this.major = major;
		this.militaryservice = militaryservice;
		this.bank = bank;
		this.accountnumber = accountnumber;
		this.status = status;
		this.role = role;
		this.position = position;
		this.authority = authority;
		this.dayoff_cnt = dayoff_cnt;
	}


	public String getEmployee_no() {
		return employee_no;
	}

	public void setEmployee_no(String employee_no) {
		this.employee_no = employee_no;
	}

	public String getFk_department_no() {
		return fk_department_no;
	}

	public void setFk_department_no(String fk_department_no) {
		this.fk_department_no = fk_department_no;
	}

	public String getFk_team_no() {
		return fk_team_no;
	}

	public void setFk_team_no(String fk_team_no) {
		this.fk_team_no = fk_team_no;
	}

	public String getName_kr() {
		return name_kr;
	}

	public void setName_kr(String name_kr) {
		this.name_kr = name_kr;
	}

	public String getName_en() {
		return name_en;
	}

	public void setName_en(String name_en) {
		this.name_en = name_en;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getJointype() {
		return jointype;
	}

	public void setJointype(String jointype) {
		this.jointype = jointype;
	}

	public String getHire_date() {
		return hire_date;
	}

	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getCommission_pct() {
		return commission_pct;
	}

	public void setCommission_pct(String commission_pct) {
		this.commission_pct = commission_pct;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getExtra_address() {
		return extra_address;
	}

	public void setExtra_address(String extra_address) {
		this.extra_address = extra_address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfile_systemfilename() {
		return profile_systemfilename;
	}

	public void setProfile_systemfilename(String profile_systemfilename) {
		this.profile_systemfilename = profile_systemfilename;
	}

	public String getProfile_orginfilename() {
		return profile_orginfilename;
	}

	public void setProfile_orginfilename(String profile_orginfilename) {
		this.profile_orginfilename = profile_orginfilename;
	}

	public String getAcademic_ability() {
		return academic_ability;
	}

	public void setAcademic_ability(String academic_ability) {
		this.academic_ability = academic_ability;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getMilitaryservice() {
		return militaryservice;
	}

	public void setMilitaryservice(String militaryservice) {
		this.militaryservice = militaryservice;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccountnumber() {
		return accountnumber;
	}

	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getDayoff_cnt() {
		return dayoff_cnt;
	}

	public void setDayoff_cnt(String dayoff_cnt) {
		this.dayoff_cnt = dayoff_cnt;
	}
	
	
	
	
}
