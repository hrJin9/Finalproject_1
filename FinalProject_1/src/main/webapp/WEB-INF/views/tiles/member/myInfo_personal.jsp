<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="sidebar.jsp"%>  --%>
    
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

	/* 상단 프로필 */
	.myInfo {
		padding: 10px 42px;
	}
	
	#team, #role {
		color: #808080; 
		padding-right: 14px;
	}
		
	#phoneIcon, #messageIcon {
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
		font-size: 14pt;
	}
	
	.menubar {
		margin-left: 810px;
		color: #a6a6a6; 
		font-size: 10pt;
	}
	
	.update {
		margin-left: 25px;
		color: #a6a6a6; 
		font-size: 10pt;
	}
	
	.content {
		color: #556372; 
		font-size: 11pt;
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

	/* 오프캔버스 */
	.offcanvas-end {
		width: 711px;
	}
	
	form input, form > select {
		border: 1.5px solid #cccccc;
		border-radius: 3.5px;
		width: 100%;
		padding: 10px 17px;
		margin: 7px 0 18px 0;
		opacity: 0.85;
		font-size: 10pt;
		line-height: 20px;
	}
	
	#idCheck, 
	#emailCheck,
	#btn_emailVerifyCodeCheck,
	#mobileCheck,
	#btn_mobileVerifyCodeCheck	{
		color:#333333;
		height: 30px;
		border-style: none;
		border-radius: 5%;
	} 
	
	
	input:focus {
		border: 1.8px solid #4285f4;
    	outline: none;
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
		
		$("#selboxDirect").hide();  // 소속 직접작성란 숨기고 시작한다.
		
		// offcanvas
	 	$(".update").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		$("#offcanvasScrollingLabel").text("개인 정보 수정");
	 		
			// 소속 입력
			$("#team").change(function() {
				//직접입력을 누를 때 나타남
				if($("#team").val() == "direct") {
					/* $("select#team").hide(); */
					$("#selboxDirect").show();
					$("select#team").css('margin-bottom','0px');    
				}  else {
					$("#selboxDirect").hide();
					$("select#team").css('margin-bottom','18px');
				}
		
			}) 
	 	});
		
		   

		
	});// end of $(document).ready(function(){})-------------------------------

</script>

<div class="container" style="margin-right: 145px;">
	<form name="myInfo">
	
	<div class="col-md-16">
	<div style="padding: 30px 0 30px 25px; font-size: 10pt; font-weight: bold;">
		<span style="color: #8c8c8c;">구성원&nbsp;&nbsp;/&nbsp;&nbsp;</span>
		<span>김지은</span>
	</div>
	<div class="profile" href="#" style="margin-top: 22px; margin-bottom:30px;">
	    <span class="pic" style="height: 135px; width: 135px; font-size: 25pt; font-weight: bold;">
	    	<span>지은</span>
	   	</span>
	    <span class="myInfo">
	    	<span style="font-size: 16pt; font-weight: bold;">김지은</span><br>
	    	<span style="font-size: 9pt; padding: 4px 0; display: block; margin-bottom: -8px;"><span id="team">소속</span>IT</span>
	    	<span style="font-size: 9pt; padding: 4px 0; display: block; margin-bottom: -2px;"><span id="role">직무</span>개발자</span>
	    	<button type="button" id="phoneIcon"><span><i class="fas fa-phone-alt" style="transform: scaleX(-1); transition: .3s; color: #666666;"></i></span></button>
	    	<button type="button" id="messageIcon" style="font-size: 9.5pt"><span><i class="far fa-envelope"></i></span></button>
	    	<button type="button" id="status"><span><i class="fas fa-circle" style="color: #07B419; padding-right: 5px; font-size: 7pt;"></i>재직중</span></button>
		    </span>
		</div>
	   </div>  
	
	<nav id="list">
		<a class="list_iscurrent">인사 정보</a>
		<a>개인 정보</a>
		<div class="list_underline"></div>
	</nav>    
	 
	 	<hr style="margin-top: 0px;"/><br>
		
		<div class="container">
			<div id="hrInfo">개인 정보<span><i class="fas fa-list-ul menubar"></i><i class="fas fa-pen update"></i></span></div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="250px" />
		          <col />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이름</td>   
		                   <td>김지은</td>   
		                </tr>
		                <tr>
		                   <td>영문이름</td>   
		                   <td>KIM JI EUN</td>   
		                </tr>
		                <tr>
		                   <td>생년월일</td>   
		                   <td>1997-01-20&nbsp;(만 25세)</td>   
		                </tr>
		                <tr>
		                   <td>성별</td>   
		                   <td>여자</td>   
		                </tr>
		                <tr>
		                   <td>이메일</td>   
		                   <td>yelee0124@gamil.com</td>   
		                </tr>
		                <tr>
		                   <td>연락처</td>   
		                   <td>010-1234-5678</td>   
		                </tr>
		                <tr>
		                   <td>주소</td>   
		                   <td>경기도 성남시 분당구 판교원로 68(운중동, 산운마을11단지 판교 포레라움아파트),<br><br>
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
		                   <td>고용형태</td>   
		                   <td>정직원</td>   
		                </tr>
		          </tbody>
		 	</table>
	 	</div>
	</form>
  
  
	<div style="position: absolute; right: 165px; top: 365px;"> 
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
	
	<!-- 오프캔버스 시작 -->
	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		<div class="offcanvas-header">
		  <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
		  <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		<div class="offcanvas-body">
			<div class="collapse show">
				<form name="updateFrm">
					<div style="float: left; width: 45.5%;">
						<div>이름</div>
						<input id="name" type="text" class="required" name="name" size="20" placeholder="이름 입력" />
					</div>
						
					<div style="float: left; width: 52%; margin-left: 16px;">
						<div>영문이름</div>
						<input id="Egname" type="text" class="required" name="name" size="20" placeholder="이름 입력" />
					</div>
					
					<div style="clear: both;">생년월일</div>
					<input id="Egname" type="text" class="required" name="name" size="20" placeholder="이름 입력" />
					
					<div>소속</div>
					<%-- <input id="team" type="text" class="required" name="team" size="50" placeholder="소속 입력" /> --%>
					<select id="team" name="team" class="required">
						<option value="">소속 선택</option>
						<option value="hr">인사팀</option>
						<option value="accounting">회계팀</option>
						<option value="sales">영업팀</option>
						<option value="planning">기획팀</option>
						<option value="IT">IT팀</option>
						<option value="design">디자인팀</option>
						<option value="direct">직접 입력</option>
					</select>
					<input input type="text" id="selboxDirect" name="selboxDirect" />
					
					<div style="vertical-align: middle;">이메일</div>
					<input id="email" type="text" class="required" name="email" placeholder="이메일 입력"/>
					<%--<button type="button" id="emailCheck">인증하기</button>
					<span id="spinner" class="spinner-border text-success"></span>
					<span id="emailCheckResult"></span>
					<span class="error" style="color: red">이메일 형식에 맞지 않습니다.</span>
					<br>
					<div id="emailVerify">
						<input id="userEmailVerifyCode" type="text" name="emailVerifyCode" class="mt-2" size="20"/>
						<button type="button" id="btn_emailVerifyCodeCheck" onclick="emailVerifyCodeCheck();">인증확인</button>
						<span id="emailTimer" class="text-danger"></span>
					</div>
					<div id="emailVerifyConfirm">이메일 인증이 확인되었습니다.</div> --%>
					
					<div style="vertical-align: middle;">연락처</div>
					<input id="phone" type="text" class="required" name="연락처" placeholder="연락처 입력"/>
				</form>
			</div> 
		</div>
	</div>
	<!-- 오프캔버스 끝 -->
		
</div>

