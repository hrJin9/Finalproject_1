<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>  

<style type="text/css">
	/* 페이지 전체 레이아웃 */
	.member_container {
		width: 88%;
		margin: 0 auto;
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
	
	/* 인사정보, 근무정보 */
	#hrInfo, #workInfo {
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

	/* 우측 사이드 근무시간, 남은연차, 급여 */
	.moreInfo {
		border: 1px solid #e6e6e6;
		padding: 15.5px 22px;
		margin-bottom: 22px;
		width: 246px;  
		height: 130px; 
		border-radius: 10px;
		display: inline-block;
		float: left;
		font-size: 18pt;
		/* box-shadow: 3px 3px 10px 5px #f2f2f2;    */
	} 

</style>   

<script type="text/javascript">
	$(document).ready(function(){
		
		// nav바에서 개인정보 클릭시 개인정보 페이지로 이동
		$(".myInfo_pView").click(function(){
			location.href= "<%= ctxPath%>/myInfo_personal.up";
		});
		
	});
	
</script>

<div class="member_container">
	<form name="myInfo">
	
	<div class="col-md-16">
	<div style="padding: 30px 0 30px 25px; font-size: 10pt; font-weight: bold;">
		<span style="color: #8c8c8c;">구성원&nbsp;&nbsp;/&nbsp;&nbsp;</span>
		<span>김지은</span>
	</div>
	<div class="profile" href="#" style="margin-top: 22px; margin-bottom:30px;">
	    <span class="pic" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold;">
	    	<span>지은</span>
	   	</span>
	    <span class="myInfo">
	    	<span style="font-size: 16pt; font-weight: bold;">김지은</span><br>
	    	<span style="font-size: 9pt; padding: 4px 0; display: block; margin-bottom: -8px;"><span id="team">소속</span>IT</span>
	    	<span style="font-size: 9pt; padding: 4px 0; display: block; margin-bottom: -2px;"><span id="role">직무</span>개발자</span>
	    	<button type="button" id="phone"><span><i class="fas fa-phone-alt" style="transform: scaleX(-1); transition: .3s; color: #666666;"></i></span></button>
	    	<button type="button" id="message" style="font-size: 9.5pt"><span><i class="far fa-envelope"></i></span></button>
	    	<button type="button" id="status"><span><i class="fas fa-circle" style="color: #07B419; padding-right: 5px; font-size: 7pt;"></i>재직중</span></button>
		    </span>
		</div>
	   </div> 
	
		<nav id="list" class="header-nav">
			<a class="list_iscurrent myInfo_hView">인사 정보</a>
			<a class="myInfo_pView">개인 정보</a>
			<div class="list_underline"></div>
		</nav>   
		 
	 	<hr style="margin-top: 0px;"/><br>
			
			
		<div class="container">
			<%-- <div id="hrInfo">인사 정보<span><i class="fas fa-list-ul menubar"></i><i class="fas fa-pen update"></i></span></div><br> --%>
			<div id="hrInfo">인사 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="250px" />
		          <col />
		     	</colgroup>
		          <tbody>
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
		                   <td>IT부서&nbsp;&nbsp;&nbsp;개발1팀</td>   
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
		          <col width="250px" />
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
		  </div>
	</form>
  
  
	<div style="position: absolute; right: 140px; top: 365px;"> 
		<div class=moreInfo>
			<div style="padding-bottom: 21px;"><ion-icon name="time-outline"></ion-icon></div>
			<span style="font-size: 9pt; color: #595959; margin-bottom: -9px; display: block;">근무시간</span> 
			<span style="font-size: 13pt;">7시간 20분</span>  
		</div><br> 
		<div class=moreInfo>
			<div style="padding-bottom: 21px; transform: scaleX(-1); padding-left: 176px;"><ion-icon name="leaf-outline"></ion-icon></div>
			<span style="font-size: 9pt; color: #595959; margin-bottom: -9px; display: block;">남은연차</span>
			<span style="font-size: 13pt;">25일</span>  
		</div><br> 
		<div class=moreInfo>
			<div style="padding-bottom: 21px;"><ion-icon name="server-outline"></ion-icon></div>
			<span style="font-size: 9pt; color: #595959; margin-bottom: -9px; display: block;">급여</span>  
			<span style="font-size: 13pt;">11월 급여명세서</span>  
		</div><br> 
	</div>
</div>




