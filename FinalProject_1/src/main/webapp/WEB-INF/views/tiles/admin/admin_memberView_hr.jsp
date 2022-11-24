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
	
	#admin_memberadd {
		position: relative;
	    display: flex;
	    width: 11%;
	    font-size: 18pt;
	    font-weight: bold;
	    margin: 4px 0 0 70px;
	    padding: 0.8em 0 0.8em 0;
	    color: #333;
	}

	hr.memberaddhr{
		width: 100%;
		background-color: rgba(0,0,0, .3) !important;
		border: none; 
		height: 1px;
		margin-top: 0px;
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
		$(".memeberInfo_pView").click(function(){
			location.href= "<%= ctxPath%>/admin_memberView_personal.up";
		});
		
        flatpickr.localize(flatpickr.l10ns.ko);
        flatpickr($(".dateSelector"));
        // 생년월일 데이트피커
        $(".dateSelector").flatpickr({
           dateFormat: "Y-m-d",
           conjunction: " ~ ",
           local: 'ko'
        });
        
        $(".timeSelector").flatpickr({
        	enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr: true
        });
		
	});
	
</script>

<div class="container" style="margin-right: 145px;">
	<div id="admin_memberadd">멤버관리</div>
	<hr class="memberaddhr" /><br>
	
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
		                   <td colspan="3">김지은</td>   
		                </tr>
		                <tr>
		                   <td>영문이름</td>   
		                   <td colspan="3">KIM JI EUN</td>   
		                </tr>
		                <tr>
		                   <td>생년월일</td>   
		                   <td style="float:left; margin-right:0;">1997-01-20&nbsp;(만 25세)</td>   
		                   <td style="margin-left:0; margin-right:50;">성별</td> 
		                   <td style="padding-left: 57px;">여자</td>   
		                </tr>
		          </tbody>
		 	</table>
		</div> 
		 
		 
		<nav id="list" class="header-nav" style="clear: both;">
			<a class="list_iscurrent memeberInfo_hView">인사 정보</a>
			<a class="memeberInfo_pView">개인 정보</a>
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
		                   <tr>
		                   <td>사번</td>   
		                   <td>102503</td>   
		                </tr>
		                <tr>
		                   <td>입사일</td>   
		                   <td>2022.10.10</td>   
		                </tr>
		                <tr>
		                   <td>입사유형</td>   
		                   <td>경력</td>   
		                </tr>
		                <tr>
		                   <td>소속</td>   
		                   <td>IT팀</td>   
		                </tr>
		                <tr>
		                   <td>직위</td>   
		                   <td>부장</td>   
		                </tr>
		                <tr>
		                   <td>직무</td>   
		                   <td>개발자</td>   
		                </tr>
						<tr>
		                   <td>고용형태</td>   
		                   <td>정직원</td>   
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
	                   <td>기본 근무유형</td>   
	                </tr>
	                <tr>
	                   <td>일하는 방식</td>   
	                   <td>고정 출퇴근제</td>   
	                </tr>
	                <tr>
	                   <td>일하는 날</td>   
	                   <td>월요일,화요일,수요일,목요일,금요일</td>   
	                </tr>
	                <tr>
	                   <td>주휴일</td>   
	                   <td>일요일</td>   
	                </tr>
	                <tr>
	                   <td>출근 시간</td>   
	                   <td>09:00</td>   
	                </tr>
	                <tr>
	                   <td>일하는 시간</td>   
	                   <td>8시간</td>   
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
  			<button type="button" class="workstatus-save">저장하기</button>
  			<button type="reset" class="workstatus-cancel">취소</button><br><br><br><br>
		  </div>
		  
	</form>
</div>




