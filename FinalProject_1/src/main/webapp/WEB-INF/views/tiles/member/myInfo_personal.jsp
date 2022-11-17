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
		
	#phone, #message {
		border: 0.3px solid #d9d9d9;
		margin-top: 15px;
		margin-right: 3px;
		padding: 4.5px 6px 6px 6px;
		background-color: white;
		border-radius: 3px;
		font-size: 9pt;
	}	
	
	#status {
		border: 0.3px solid #d9d9d9;
		margin-top: 17px;
		margin-right: 3px;
		padding: 3px 6px;
		background-color: white;
		border-radius: 3px;
		font-size: 8pt;
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
		margin-left: 685px;
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
		padding: 20px;
		margin-bottom: 22px;
		width: 230px;  
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
		
		//offcanvas
	 	$(".update").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		$("#offcanvasScrollingLabel").text("개인 정보 수정");
	 		
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
	<div class="profile" href="#" style="margin-top: 23px; margin-bottom:30px;">
	    <span class="pic" style="height: 135px; width: 135px; font-size: 25pt; font-weight: bold;">
	    	<span>지은</span>
	   	</span>
	    <span class="myInfo">
	    	<span style="font-size: 16pt; font-weight: bold;">김지은</span><br>
	    	<span style="font-size: 9pt; padding: 4px 0;"><span id="team">소속</span>IT</span><br>
	    	<span style="font-size: 9pt; padding: 4px 0;"><span id="role">직무</span>개발자</span><br>
	    	<button type="button" id="phone"><span><i class="fas fa-phone-alt" style="transform: scaleX(-1); transition: .3s; color: #666666;"></i></span></button>
	    	<button type="button" id="message"><span><i class="far fa-envelope"></i></span></button>
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
  
  
	<div style="position: absolute; right: 162px; top: 365px;"> 
		<div class=moreInfo>
			<div style="padding-bottom: 20px;"><ion-icon name="time-outline"></ion-icon></div>
			<span style="font-size: 9pt; color: #595959;">근무시간</span><br>  
			<span style="font-size: 13pt;">7시간 20분</span>  
		</div><br> 
		<div class=moreInfo>
			<div style="padding-bottom: 20px; transform: scaleX(-1); padding-left: 165px;"><ion-icon name="leaf-outline"></ion-icon></div>
			<span style="font-size: 9pt; color: #595959;">남은연차</span><br>  
			<span style="font-size: 13pt;">25일</span>  
		</div><br> 
		<div class=moreInfo>
			<div style="padding-bottom: 20px;"><ion-icon name="server-outline"></ion-icon></div>
			<span style="font-size: 9pt; color: #595959;">급여</span><br>  
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
	  	<div>
	  		<div class="todayworkStatus-container">
		  		<span>총 근무</span>
		  		<div class="workingtotalhourByday ml-2"><span class="ml-1">9</span>시간</div>
		  		<div class="line"></div>
	  		</div>
	  		<!-- 근무 1개  -->
	  		<div class="workwirte-container dropdown">
				<div class="dropdown-toggle workwritebox btn" id="workwriteStatus" data-bs-toggle="dropdown" aria-expanded="false">
					<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>
					근무
				</div>
				<ul class="dropdown-menu workStatusbox" aria-labelledby="workwriteStatus" style="min-width: 7rem;">
					<li>
						<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>
							근무
						</a>
					</li>
					<li>
						<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/oncoming-automobile_1f698.png" width="16px"/>
							외근
						</a>
					</li>
					<li>
						<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/laptop_1f4bb.png" width="16px"/>
							원격근무
						</a>
					</li>
					<li>
						<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/spiral-calendar_1f5d3-fe0f.png" width="16px"/>
							출장
						</a>
					</li>
					<hr class="HRhr"style="margin:0; height:1px; background-color: rgba(242, 242, 242); border:none;"/>
					<li>
						<a class="dropdown-item" href="#">
							<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="16px"/>
							하루종일
						</a>
					</li>
					<li>
						<a class="dropdown-item" href="#">
							<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="16px"/>
							시간입력
						</a>
					</li>
				</ul>
				
				<div class="dropdown-toggle workStartbox" id="workwriteStart" data-bs-toggle="dropdown" aria-expanded="false">
					시작시간
				</div>
				<ul class="dropdown-menu workstarttime" aria-labelledby="workwriteStart" style="min-width: 6rem;">
					<c:forEach var="i" begin="0" end="23">
						<c:forEach var="j" begin="0" end="1">
							<c:if test="${i<10}"><li><a class="dropdown-item" href="#">0${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
							<c:if test="${i>=10}"><li><a class="dropdown-item" href="#">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
						</c:forEach>
					</c:forEach>
				</ul>
				
				<div style="display:inline-block;">
					<i class="fa-solid fa-arrow-right" style="color: #C6C6C6"></i>
				</div>
				
				<div class="dropdown-toggle workEndbox" id="workwriteEnd" data-bs-toggle="dropdown" aria-expanded="false">
					끝시간						
				</div>
				<ul class="dropdown-menu workendtime" aria-labelledby="workwriteEnd" style="min-width: 6rem;">
					<c:forEach var="i" begin="0" end="23">
						<c:forEach var="j" begin="0" end="1">
							<c:if test="${i<10}"><li><a class="dropdown-item" href="#">0${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
							<c:if test="${i>=10}"><li><a class="dropdown-item" href="#">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			
			<!-- 근무 1개 끝  -->
			
	  		<div class="workadd">
	  			<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt;">추가하기</span></div>
  			</div>
  			<div class="workstatus-buttoncontainer">
  				<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
	  			<button type="reset" class="workstatus-cancel">취소</button>
	  			<button type="button" class="workstatus-save">저장하기</button>
  			</div>
	  	</div>
	  </div>
	</div>
	<!-- 오프캔버스 끝 -->
		
</div>

