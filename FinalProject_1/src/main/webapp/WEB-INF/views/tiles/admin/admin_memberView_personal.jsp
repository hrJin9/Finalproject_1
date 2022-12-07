<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>  

<style type="text/css">
	/* 페이지 전체 레이아웃, 상단 nav바*/
	#admin_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#admin_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#admin_mainList a {
		display: block;
		width: 24%;
		padding: 0.7em 0 0.3em 0;
		color: #333;
		text-decoration: none;
		margin-right: 4%;
		color: black;
	}

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	*{
		font-family: Pretendard-Regular;		
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
	#personalInfo, #workInfo {
		font-weight: bold;
		font-size: 15pt;
	}
	
	form {
		margin-left: 155px;
	}
	
	.table>:not(caption)>*>* {
	    padding: 0.8rem 0.5rem;
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

<nav id="admin_mainList" class="margin-container">
	<a id="memberview" class="header-nonsub">멤버 상세보기</a>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div style="margin-right: 145px;">
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
	    	<table class="table table-borderless content" style="float: left; margin: 29px 0 35px 0;">
		       <colgroup>
		          <col width="200px" />
		          <col width="350px" />
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
		                   <td style="float:left; margin-right:0;">1997-01-20&nbsp;(만 25세)<span style="padding-left: 10px;">/</span><span style="padding-left: 10px;">여자</span></td>   
		                </tr>
		          </tbody>
		 	</table>
		</div> 
		 
		 
		<nav id="list" class="header-nav" style="clear: both;">
			<a class="list_iscurrent memeberInfo_hView" href="<%= request.getContextPath()%>/admin_memberView_hr.up">인사 정보</a>
			<a class="memeberInfo_pView" href="<%= request.getContextPath()%>/admin_memberView_personal.up">개인 정보</a>
			<div class="list_underline"></div>
		</nav> 
	 	<hr style="margin-top: 0px; margin-right: 20%;"/><br>
			
			
		<div class="infocontainer" style="margin-left: 100px;">
			<div id="personalInfo">개인 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이메일</td>   
		                   <td>yelee0124@gamil.com</td>   
		                </tr>
		                <tr>
		                   <td>연락처</td>   
		                   <td>010-1234-5678</td>   
		                </tr>
		                <tr>
		                   <td style="padding-bottom: 22px;">주소</td>   
		                   <td>경기도 성남시 분당구 판교원로 68(운중동, 산운마을11단지 판교 포레라움아파트),<br>
		                   	   101동 706호 <%-- 상세주소 --%>
		                   </td>   
		                </tr>
		                <tr>
		                   <td>최종학력</td>   
		                   <td>카이스트/대학교(일반대학)</td>   
		                </tr>
		                <tr>
		                   <td>전공</td>   
		                   <td>컴퓨터공학과</td>   
		                </tr>
		                <tr>
		                   <td>병역사항</td>   
		                   <td>해당없음</td>   
		                </tr>
		                <tr>
		                   <td>급여계좌</td>   
		                   <td>국민은행  912-01-200357  김지은</td>   
		                </tr>
		          </tbody>
		 	</table>
		</div>
		       
	   <div class="workstatus-buttoncontainer" style="margin-right: 53%;">
		 <button type="button" class="workstatus-save gradientbtn" style="margin-top: 15%; margin-bottom: 15%">저장하기</button>
		 <button type="reset" class="workstatus-cancel" style="margin-top: 15%; margin-bottom: 15%">취소</button><br><br><br><br>
       </div>
	      
	</form>
</div>



