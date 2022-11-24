<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>  

<style type="text/css">

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	*{
		font-family: Pretendard-Regular;		
	}
	
	/* 상단 nav바 */
	#admin_memberadd {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}

	/* 상단 프로필 */
	.myInfo {
		padding: 10px 42px;
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
		text-align: center;
		margin-right: 13px;
		color: #D2D6D9;
	}
	
	.list_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 14%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		/* margin-left: 5%; */
	}
	
	#list a:nth-child(1).list_iscurrent ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2).list_iscurrent ~ .list_underline {
		left: 20%; /* width랑 margin-left랑 합친거 */
	}
	#list a:nth-child(1):hover ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2):hover ~ .list_underline {
		left: 15%;
		width: 16%;
	}
	
	/* 이름, 영문이름, 생년월일, 성별  */
	.topinfo {
		width:50.5%;
	}
	
	.topinfo input, .topinfo select {
		border: 1.5px solid #cccccc;
	    border-radius: 3.5px;
	    width: 100%;
	    padding: 5px 24px;
	    height: 38px;
	    opacity: 0.85;
	    font-size: 11pt;
	    line-height: 17px;
	    color: #737373!important;
	}
	
	
	/* 인사정보, 근무정보 */
	#hrInfo, #workInfo {
		font-weight: bold;
		font-size: 15pt;
	}
	
	form {
		margin-left: 155px;
	}
	
	.table>:not(caption)>*>* {
	    padding: 0.47rem 0.5rem;
	    background-color: var(--bs-table-bg);
	    /* border-bottom-width: 1px; */
	    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
	}
	
	form input, form select {
		border: 1.5px solid #cccccc;
	    border-radius: 3.5px;
	    width: 60%;
	    padding: 5px 24px;
	    height: 38px;
	    opacity: 0.85;
	    font-size: 11pt;
	    line-height: 17px;
	    color: #737373!important;
	}
	
	input:focus {
		border: 1.8px solid #4285f4;
    	outline: none;
	}
	
	.content {
		color: #556372; 
		font-size: 11.5pt;
		margin-bottom: 70px;
	}
	
	td {
		padding-left: 1px;
		vertical-align: middle;
	}
	
	.condition-cell {
	    display: table-cell;
	}
	.condition-cell:last-child {
	    width: 80%;
	}	
	
	#btnRegister {
		width: 190px;
	    padding: 7.5px;
	    border: 1px solid #4285f4;
		background-color: #4285f4;
		color: white;
		font-size: 13pt;
		border-radius: 30px;
	}
	
	#btnRegister:hover {
		opacity: 1;
	}

</style>   

<script type="text/javascript">
	$(document).ready(function(){
		
		// nav바에서 개인정보 클릭시 개인정보 페이지로 이동
		$(".memberInfo_pAdd").click(function(){
			location.href= "<%= ctxPath%>/admin_memberAdd_personal.up";
		});
		
        flatpickr.localize(flatpickr.l10ns.ko);
        flatpickr($(".dateSelector"));
        // 생년월일 데이트피커
        $(".dateSelector").flatpickr({
           dateFormat: "Y-m-d",
           conjunction: " ~ ",
           local: 'ko'
        });
        
        // 출근시간 데이트피커
        $(".timeSelector").flatpickr({
        	enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr: true
        });
		
	});
	
</script>

<div class="container" style="margin-right: 145px;">
	<nav id="admin_memberadd" class="margin-container">
		<div id="memberadd" style="color: black;" class="header-nonsub">멤버생성</div>
	</nav>
	<hr class="HRhr" style="margin-top: 0px;"/><br>
	
	<form name="myInfo">
		<div class="col-md-16" style="float: left; margin-right: 70px;">
			<div class="profile" href="#" style="margin-top: 22px; margin-bottom:30px;">
			    <span class="pic" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold; margin-right: -15px;">
			    	<span>지은</span>
			   	</span>
			</div>
		</div> 
		<%-- 이름, 영문이름, 생년월일, 성별 --%>
		<div class="topinfo" style="float: left;">
	    	<table class="table table-borderless content" style="float: left; margin-top: 24px;">
		       <colgroup>
		          <col width="200px" />
		          <col width="350px" />
		          <col width="50px" />
		          <col width="150px" />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이름</td>   
		                   <td colspan="3"><input type="text" class="required" id="name"  name="name" size="10" value="" placeholder="이름" /></td>   
		                </tr>
		                <tr>
		                   <td>영문이름</td>   
		                   <td colspan="3"><input type="text" class="required" id="egname"  name="egname" size="10" value="" placeholder="영문이름" /></td>   
		                </tr>
		                <tr>
		                   <td>생년월일</td>   
		                   <td style="float:left; margin-right:0;"><input id="birthday" name="birthday" class="dateSelector" placeholder="ex) 2020-09-01" /></td>   
		                   <td style="margin-left:0;">성별</td> 
		                   <td>	
		                   	<select class="required" id="gender" name="gender">
								<option value="">성별</option>
								<option value="male">남자</option>
								<option value="female">여자</option>
							</select>
		                   </td>   
		                </tr>
		          </tbody>
		 	</table>
		</div> 
		 
		 
		<nav id="list" class="header-nav" style="clear: both;">
			<a class="list_iscurrent memberInfo_hAdd">인사 정보</a>
			<a class="memberInfo_pAdd">개인 정보</a>
			<div class="list_underline"></div>
		</nav> 
		 
		 
	 	<hr style="margin-top: 0px;"/><br>
			
		<div class="infocontainer" style="margin-left: 100px;">
			<%-- <div id="hrInfo">인사 정보<span><i class="fas fa-list-ul menubar"></i><i class="fas fa-pen update"></i></span></div><br> --%>
			<div id="hrInfo">인사 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>사번</td>   
		                   <td><input type="text" class="required" id="employeenum"  name="employeenum" size="10" value="" placeholder="ex) 102503" /></td>   
		                </tr>
		                <tr>
		                   <td>입사일</td> 
		                   <td><input class="dateSelector" id="joindate" name="joindate" value="" placeholder="ex) 2020-09-01" /></td>  
		                </tr>
		                <tr>
		                   <td>입사유형</td>  
		                   <td>	
		                   	<select class="required" id="jointype" name="jointype">
								<option value="">입사유형</option>
								<option value="newcomer">신입</option>
								<option value="experience">경력</option>
							</select>
		                   </td>
		                </tr>
		                <tr>
		                   <td>소속</td>  
		                   <td>	
		                   	<select class="required" id="team" name="team">
								<option value="">소속</option>
								<option value="1">인사·총무</option>
								<option value="2">회계·재무</option>
								<option value="3">법무</option>
								<option value="4">감사</option>
								<option value="5">업무지원</option>
								<option value="6">경영지원</option>
								<option value="7">영업</option>
								<option value="8">마케팅·홍보</option>
								<option value="9">기획</option>
								<option value="10">IT</option>
								<option value="11">디자인</option>
								<option value="12">연구·R&D</option>
								<option value="13">구매</option>
								<option value="14">무역</option>
								<option value="15">생산</option>
								<option value="16">서비스</option>
							</select>
		                   </td> 
		                </tr>
		                <tr>
		                   <td>직위</td>   
		                   <td>	
		                   	<select class="required" id="position" name="position">
								<option value="">직위</option>
								<option value="1">대표</option>
								<option value="2">부대표</option>
								<option value="3">이사</option>
								<option value="4">전무</option>
								<option value="5">상무</option>
								<option value="6">본부장</option>
								<option value="7">부장</option>
								<option value="8">차장</option>
								<option value="9">실장</option>
								<option value="10">과장</option>
								<option value="11">대리</option>
								<option value="12">주임</option>
								<option value="13">사원</option>
								<option value="14">연구원</option>
								<option value="15">수석연구원</option>
								<option value="16">책임연구원</option>
								<option value="17">선임연구원</option>
								<option value="18">전임연구원</option>
								<option value="19">주임연구원</option>
							</select>
		                   </td> 
		                </tr>
		                <tr>
		                   <td>직무</td>   
		                   <td><input type="text" class="required" id="role" name="role" size="40" value="" placeholder="직무" /></td>   
		                </tr>
						<tr>
		                   <td>고용형태</td>
		                   <td>	
		                   	<select class="required" id="employmenttype" name="employmenttype">
								<option value="">고용형태</option>
								<option value="1">정직원</option>
								<option value="2">계약직</option>
								<option value="3">관리자</option>
								<option value="4">임원</option>
								<option value="5">경영진</option>
								<option value="6">대표</option>
								<option value="7">부서장</option>
								<option value="8">수습</option>
								<option value="9">인턴</option>
								<option value="10">알바</option>
							</select>
		                   </td>    
		                </tr>
		          </tbody>
		 	</table>
		       
			<%-- <div id="workInfo">근무 정보<span><i class="fas fa-list-ul menubar"><i class="fas fa-pen update"></i></i></span></div><br> --%>
			<div id="workInfo">근무 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		        <tbody>
	                <tr>
	                   <td>근무유형</td>   
	                   <td><input type="text" class="required" id="worktype"  name="worktype" size="30" value="" placeholder="기본 근무유형" /></td>   
	                </tr>
	                <tr>
	                   <td>일하는 방식</td>
	                   <td>	
	                   	<select class="required" id="workway" name="workway">
							<option value="fix">고정 출퇴근제</option>
							<option value="flexible">유연근무제</option>
							<option value="2">스케줄제</option>
						</select>
	                   </td>       
	                </tr>
	                <tr>
	                   <td>일하는 날</td>   
	                   <td><input type="text" class="required" id="workday"  name="workday" size="50" value="" placeholder="월요일,화요일,수요일,목요일,금요일" /></td>   
	                </tr>
	                <tr>
	                   <td>주휴일</td>   
	                   <td><input type="text" class="required" id="weekholiday"  name="weekholiday" size="20" value="" placeholder="일요일" /></td>   
	                </tr>
	                <tr>
	                   <td>출근 시간</td>
	                   <td><input class="timeSelector" id="goworktime"  name="goworktime" value="" placeholder="ex) 09:00" /></td>   
	                </tr>
	                <tr>
	                   <td>일하는 시간</td>   
	                   <td><input type="text" class="required" id="workingtime"  name="workingtime" size="10" value="" placeholder="ex) 8시간" /></td>   
	                </tr>
		        </tbody>
		 	</table>
		 	
			<div id="workInfo">계정 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		        <tbody>
		        	<tr>
	                   <td>권한</td>   
	                   <td>
	                   	<div>
		                   	<div class="condition-cell">
		                   	 <span style="margin-right: 30px;">
				                <input type="radio" class="custom-control-radio2" id=general name="authority" style="width: 15%; height: 8%;" checked>
				                <label for="general" class="js-period-type radio-label-checkbox2" data-code="unlimit">일반</label>
		                   	 </span>
		                   	 <span>
				                <input type="radio" class="custom-control-radio2" id="admin" name="authority" style="width: 15%; height: 8%;">
				                <label for="admin" class="js-period-type radio-label-checkbox2" data-code="unlimit">관리</label>
		                   	 </span>
							</div>
	                   	</div>
	                   </td>   
	                </tr>
	                <tr>
	                   <td>계정상태</td>
	                   <td>
	                   	<div>
		                   	<div class="condition-cell">
		                   	 <span style="margin-right: 30px;">
				                <input type="radio" class="custom-control-radio2" id="nomal" name="accountStatus" style="width: 15%; height: 8%;" checked>
				                <label for="nomal" class="js-period-type radio-label-checkbox2" data-code="unlimit">정상</label>
		                   	 </span>
		                   	 <span>
				                <input type="radio" class="custom-control-radio2" id="stop" name="accountStatus" style="width: 15%; height: 8%;">
				                <label for="stop" class="js-period-type radio-label-checkbox2" data-code="unlimit">중지</label>
		                   	 </span>
							</div>
	                   	</div>
	                   </td>     
	                </tr>
		        </tbody>
		 	</table>
		  </div>
		  
		  <div class="workstatus-buttoncontainer" style="margin-right: 585px;">
  			<button type="button" class="workstatus-save gradientbtn">저장하기</button>
  			<button type="reset" class="workstatus-cancel">취소</button><br><br><br><br>
		  </div>
		  
	</form>
</div>




