<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<style type="text/css">
	.member_container:not(.pic){
		color: #4d4f53;
	}
	
	/* 페이지 전체 레이아웃 */
	.member_container {
		width: 88%;
		margin: 0 auto;
	}

	/* 상단 프로필 */
	.myInfo {
		padding: 10px 20px;
		font-weight: 500;
	}
	
	.myprofiles{
		display: flex;
	}
	
	#team, #role {
		color: #808080; 
		padding-right: 14px;
	}
		
	#phone, #message {
		border: 0.3px solid #d9d9d9;
	    margin-top: 15px;
	    margin-right: 3px;
	    padding: 3.5px 6.5px 3.5px 6.5px;
	    background-color: white;
	    border-radius: 3px;
	    font-size: 9pt;
	    color: #555555;
	}	
	
	#status {
	    border: 0.3px solid #d9d9d9;
	    margin-top: 17px;
	    margin-right: 3px;
	    padding: 3.5px 7px 3.2px 7px;
	    background-color: white;
	    border-radius: 3px;
	    font-size: 9.2pt;
	}	
	
	/* nav바 */
	hr{
		border-top: solid 1px #949DA6 !important;
	}
	
	#list a:hover{
		color: #000000;
		cursor: pointer;
	}
		
	#list {
		position: relative;
		display: flex;
		width: 600px;
		font-size: 12pt;
		font-weight: bold;
	}
	
	#list a {
		display: block;
		width: 14%;
		padding: .75em 0;
		color: #333;
		text-decoration: none;
		text-align: left;
		margin-right: 13px;
		color: #D2D6D9;
	}
	
	.list_underline {
		position: absolute;
		left: 0;
		bottom: 0;
		width: 10%;
		height: 3px;
		background: #4285f4;
		transition: all .3s ease-in-out;
	}
	
	#list a:nth-child(1).list_iscurrent ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2).list_iscurrent ~ .list_underline {
		left: 16%; /* width랑 margin-left랑 합친거 */
		width: 10%;
	}
	#list a:nth-child(1):hover ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2):hover ~ .list_underline {
		left: 16%;
		width: 10%;
	}
	
	/* 개인정보 */
	#personalInfo {
		font-weight: bold;
		font-size: 15pt;
	}
	
	.content {
		color: #556372; 
		font-size: 11.5pt;
		margin-bottom: 70px;
	}
	
	.content td {
		padding-left: 1px;
	}
	
	.addprofileimg{
	    display: inline-block;
	    height: 30px;
	    width: 31px;
	    border-radius: 50%;
	    border: solid 1px #d9d9d9d9;
	    background-color: white;
	    cursor: pointer;
	    position: relative;
	    top: 115px;
	    right: 30px;
	}
	
	.addprofileimg:hover{
		background-color: #f1f1f1;
	}
	
	
	.addprofileimg > i{
	    font-size: 11pt;
	    color: #555555;
	    margin: auto;
	    position: relative;
	    left: 7px;
	    top: 2px;
	}
	
	input[type='checkbox'], input[type='radio']{
		position: relative;
		top: 2px;
		margin-right: 2px;
	}
	
	.gradientbtn {
		color: white !important;
	}

</style>   

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- src 경로는 daum에서 준 우편번호찾기 사이트이다. -->
<script type="text/javascript">
	
$(document).ready(function(){
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	var empno = "${requestScope.empno}";
	if(empno == "") { //내프로필 조회시
		empno = "${sessionScope.loginuser.employee_no}";
	}
	
	// nav바에서 인사정보 클릭시 인사정보 페이지로 이동
	$(".memberInfo_hView").click(function(){
		location.href= "<%= ctxPath%>/memberInfo_hr.up?empno="+empno;
	});
	
});// end of $(document).ready(function(){})-------------------------------
	
</script>

<div class="member_container">
	<form name="myInfo">
	
	<div class="col-md-16">
	<div style="padding: 30px 0; font-size: 11pt; font-weight: bold;">
		<span style="color: #8c8c8c; font-weight: 500;">구성원&nbsp;&nbsp;/&nbsp;&nbsp;</span>
		<span>${requestScope.evo.name_kr}</span>
	</div>
	<div class="myprofiles" style="margin-top: 22px; margin-bottom:30px;">
	    <c:if test="${empty requestScope.evo.profile_systemfilename}">
		    <span class="pic" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold; color:white !important;">
		    	<span><c:set var="name" value="${requestScope.evo.name_kr}"/>${fn:substring(name,1,3)}</span>
		   	</span>
		</c:if>
		<c:if test="${not empty requestScope.evo.profile_systemfilename}">
		    <span class="" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold; color:white !important;">
		    	<span></span>
		   	</span>
		</c:if>
		<c:if test="${sessionScope.loginuser.employee_no == requestScope.empno}">
	    	<span class="addprofileimg"><i class="icon icon-camera"></i></span>
		</c:if>
		<c:if test="${sessionScope.loginuser.employee_no != requestScope.empno}">
	    	<span style="margin-right: 31px;"></span>
		</c:if>
	    <span class="myInfo">
	    	<span style="font-size: 20pt; font-weight: 700;">${requestScope.evo.name_kr}</span><br>
	    	<span style="font-size: 10pt; padding: 4px 0; display: block; margin-bottom: -8px;"><span id="team">소속</span>${requestScope.evo.department_name}/${requestScope.evo.team_name}</span>
	    	<span style="font-size: 10pt; padding: 4px 0; display: block; margin-bottom: -2px;"><span id="role">직무</span>${requestScope.evo.role}</span>
	    	<button type="button" id="phone" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="${requestScope.evo.mobile}"><span><i class="fas fa-phone-alt" style="transform: scaleX(-1); transition: .3s; color: #666666;"></i></span></button>
	    	<button type="button" id="message" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="메시지 보내기" style="font-size: 9.5pt"><span><i class="far fa-envelope"></i></span></button>
	    	<button type="button" id="status"><span><i class="fas fa-circle" style="color: #07B419; padding-right: 5px; font-size: 7pt;"></i>재직중</span></button>
		    </span>
		</div>
	   </div>  
	
		<nav id="list" class="header-nav">
			<a class="memberInfo_hView">인사 정보</a>
			<a class="memberInfo_pView list_iscurrent" style="color: #4d4f53;">개인 정보</a>
			<div class="list_underline"></div>
		</nav>   
	 
	 	<hr style="margin-top: 0px;"/><br>
		
		<div class="">
			<%-- <div id="personalInfo">개인 정보<span><i class="fas fa-list-ul menubar"></i><i class="fas fa-pen update"></i></span></div><br> --%>
			<div id="personalInfo">개인 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="16%" />
		          <col />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이름</td>   
		                   <td>${requestScope.evo.name_kr}</td>   
		                </tr>
		                <tr>
		                   <td>영문이름</td>   
		                   <td>${requestScope.evo.name_en}</td>   
		                </tr>
		                <tr>
		                   <td>이메일</td>   
		                   <td>${requestScope.evo.email}</td>   
		                </tr>
		                <tr>
		                   <td>연락처</td>   
		                   <td>${requestScope.evo.mobile}</td>   
		                </tr>
		                <!-- 생년원일부터는 본인/권한자만 -->
		                <c:set var="at" value="${requestScope.evo.authority}"/>
		          		<c:set var="logat" value="${sessionScope.loginuser.authority}"/>
		          		<c:if test="${sessionScope.loginuser.employee_no == requestScope.empno || logat==3 || logat==6 || logat==12 || logat==15 || logat==24 || logat==30 || logat==60 || logat==120 || logat==99}">
						<tr>
						  <td>생년월일</td>   
						  <td style="float:left; margin-right:0;">
						  		${requestScope.evo.birthday}&nbsp;(${requsetScope.evo.age}세)<span style="padding-left: 10px;">/</span>
							  <span style="padding-left: 10px;">
								  <c:if test="${requestScope.evo.gender == 1}">
								  	남성
								  </c:if>
								  <c:if test="${requestScope.evo.gender == 2}">
								  	여성
								  </c:if>
							  </span>
						  </td>   
						</tr>
		                <tr>
		                   <td style="padding-bottom: 22px;">주소</td>   
		                   <td>${requestScope.evo.address}${requestScope.evo.detail_address}(${requestScope.evo.postcode})<br>
		                   	   ${requestScope.evo.extra_address}<%-- 상세주소 --%>
		                   </td>   
		                </tr>
		                <tr>
		                   <td>최종학력</td>   
		                   <td>${requestScope.evo.academic_ability}</td>   
		                </tr>
		                <tr>
		                   <td>전공</td>   
		                   <td>${requestScope.evo.major}</td>   
		                </tr>
		                <tr>
		                   <td>병역사항</td>   
		                   <td>
								<c:if test="${requestScope.evo.militaryservice == 0}">
									미필
		                   		</c:if>
								<c:if test="${requestScope.evo.militaryservice == 1}">
									군필
		                   		</c:if>
								<c:if test="${empty requestScope.evo.militaryservice}">
									해당사항 없음
		                   		</c:if>
		                   	</td>   
		                </tr>
		                <tr>
		                   <td>급여계좌</td>   
							<td>
								<c:if test="${not empty requestScope.evo.bank}">
									${requestScope.evo.bank} ${requestScope.evo.accountnumber} ${requestScope.evo.name_kr}
								</c:if>
								<c:if test="${empty requestScope.evo.bank}">
									미기입
								</c:if>
		                   	</td>   
		                </tr>
		                </c:if>
		          </tbody>
		 	</table>
	 	</div>
	 	<!-- 
	 	<div class="workstatus-buttoncontainer" style="margin-right: 45%;">
		 <button type="button" class="workstatus-save gradientbtn">저장하기</button>
		 <button type="reset" class="workstatus-cancel">취소</button><br><br><br><br>
       </div>
        -->
	</form>
</div>

