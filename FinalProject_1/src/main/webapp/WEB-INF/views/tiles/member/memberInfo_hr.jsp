<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String ctxPath = request.getContextPath(); %> 
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/memberInfo.css?after">
<style type="text/css">
</style>   

<script type="text/javascript">
$(document).ready(function(){
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	var empno = "${requestScope.empno}";
	if(empno == "") { //내프로필 조회시
		empno = "${sessionScope.loginuser.employee_no}";
	}
	
	
	// nav바에서 개인정보 클릭시 개인정보 페이지로 이동
	$(".memberInfo_pView").click(function(){
		location.href= "<%= ctxPath%>/memberInfo_personal.up?empno="+empno;
	});
	
	
	// 카메라 버튼을 눌러 파일을 변경하면 프로필사진 등록
	$(document).on("change","#addprofile",handleImgFileSelect);
	
	
	// 핸드폰 버튼 클릭시 핸드폰번호 복사
	$("#phone").click(function(){
		var mobile = "${requestScope.evo.mobile}";
		window.navigator.clipboard.writeText(mobile);
		alert("복사성공");
	});
	
	// 메시지 버튼 클릭시 메시지 보내기로 이동
	$("#message").click(function(){
		location.href="<%= ctxPath%>/message/write.up?to="+"${requestScope.empno}";
	});
	
	
});//end of ready


///////////////////////////////////////////////////////////////////////////////////////////
function handleImgFileSelect(e){
	var file = e.target.files;
	var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	
	if (!file[0].type.match(reg)) {
        alert("이미지 파일을 선택해주세요.");
        return;
    } 
	
	addProfile();
}


function addProfile(){
	
	var form = new FormData();
	form.append("addprofile", $("#addprofile")[0].files[0]);
	
	$.ajax({
		url: "<%= ctxPath%>/addProfile.up",
		type : "POST",
		processData : false,
		contentType : false,
		data : form,
		success:function(response){
			// 기존에 있던 pic 시스템에서 삭제하기
			var systemfn = $(".profileimg").attr("src");
			systemfn = systemfn.split("/");
			systemfn = systemfn.reverse()[0];
			
			//시스템에서 기존 이미지 삭제하기
			delImg(systemfn);
			
			// 로그인한 유저라면 이미지를 바꿔주기
			if("${sessionScope.loginuser.employee_no}" == "${requestScope.evo.employee_no}"){
				getImg("${requestScope.evo.employee_no}");
			}
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
}//end of addProfile

//기존에 있던 pic 시스템에서 삭제하기
function delImg(systemfn){
	$.ajax({
		url: "<%= ctxPath%>/delImg.up",
		data: {"profile_systemfilename":systemfn},
		type: "post",
		dataType:"json",
		success:function(json){
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
}//end of getImg()

// pic을 바꿔주기
function getImg(empno){
	$.ajax({
		url: "<%= ctxPath%>/getImg.up",
		data: {"empno":empno},
		type: "post",
		dataType:"json",
		success:function(json){
			var html = '<span><img class="profileimg" src="<%=ctxPath%>/resources/files/'+json.profile_systemfilename+'" width="150px" height="150px"/></span>';
			var sbsrc = '<%=ctxPath%>/resources/files/'+json.profile_systemfilename;
			$(".sbpics > img").attr("src", sbsrc);
			$(".profiles").html(html);
			
			//세션 새로고침 해주기
			reSession(json.profile_systemfilename);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
}//end of getImg()

function reSession(filename){
	$.ajax({
		url: "<%= ctxPath%>/reSession.up",
		data: {"profile_systemfilename":filename},
		type: "post",
		dataType:"json",
		success:function(json){
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}



</script>

<div class="member_container">
	<form name="myinfofrm" onsubmit="return false">
	
	<div class="col-md-16">
	<div style="padding: 30px 0; font-size: 11pt; font-weight: bold;">
		<span style="color: #8c8c8c; font-weight: 500;">구성원&nbsp;&nbsp;/&nbsp;&nbsp;</span>
		<span>${requestScope.evo.name_kr}</span>
	</div>
	<div class="myprofiles" style="margin-top: 22px; margin-bottom:30px;">
		<c:if test="${empty requestScope.evo.profile_systemfilename}">
		    <span class="pic profiles" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold; color:white !important;">
		    	<span><c:set var="name" value="${requestScope.evo.name_kr}"/>${fn:substring(name,1,3)}</span>
		   	</span>
		</c:if>
		<c:if test="${not empty requestScope.evo.profile_systemfilename}">
		    <span class="profiles" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold; color:white !important;">
		    	<span><img class="profileimg" src="<%=ctxPath%>/resources/files/${requestScope.evo.profile_systemfilename}" width="150px" height="150px"/></span>
		   	</span>
		</c:if>
		<c:if test="${sessionScope.loginuser.employee_no == requestScope.empno}">
	    	<label class="addprofileimg" for="addprofile">
	    		<input type="file" id="addprofile" name="addprofile" style="display:none;"/>
	    	<i class="icon icon-camera"></i>
	    	</label>
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
			<a class="list_iscurrent memberInfo_hView" style="color: #4d4f53;">인사 정보</a>
			<a class="memberInfo_pView">개인 정보</a>
			<div class="list_underline"></div>
		</nav>    
		 
	 	<hr style="margin-top: 0px;"/><br>
		
		<div class="">
			<%-- <div id="hrInfo">인사 정보<span><i class="fas fa-list-ul menubar"></i><i class="fas fa-pen update"></i></span></div><br> --%>
			<div id="hrInfo">인사 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="16%" />
		          <col />
		     	</colgroup>
		          <tbody>
		          	<!-- 본인이 아닐때 보여지는건 소속, 직위, 직무 -->
		          	<c:set var="at" value="${requestScope.evo.authority}"/>
		          	<c:set var="logat" value="${sessionScope.loginuser.authority}"/>
	          		 <c:if test="${sessionScope.loginuser.employee_no == requestScope.empno || logat==3 || logat==6 || logat==12 || logat==15 || logat==21 || logat==24 || logat==30 || logat==42 || logat==60 || logat==84 || logat==105 || logat==120 || logat==210 || logat==420 || logat==840 || logat==99}">
		                <tr>
						   <td>사번</td>   
						   <td>${requestScope.evo.employee_no}</td>   
						</tr>
						<tr>
						   <td>입사일</td>   
						   <td>${requestScope.evo.hire_date}</td>   
						</tr>
						<tr>
						   <td>입사 유형</td>   
						   <td>${requestScope.evo.jointype}</td>   
						</tr>
		                <tr>
		                   <td>고용형태</td>   
		                   <td>정직원</td>   
		                </tr>
			        </c:if>
		                <tr>
		                   <td>소속</td>   
		                   <td>${requestScope.evo.department_name}/${requestScope.evo.team_name}</td>   
		                </tr>
		                <tr>
		                   <td>직위</td>   
		                   <td>${requestScope.evo.position}</td>   
		                </tr>
		                <tr>
		                   <td>직무</td>   
		                   <td>${requestScope.evo.role}</td>   
		                </tr>
			          </tbody>
				 	</table>
				 	
				 	<c:if test="${sessionScope.loginuser.employee_no == requestScope.empno || logat==3 || logat==6 || logat==12 || logat==15 || logat==21 || logat==24 || logat==30 || logat==42 || logat==60 || logat==84 || logat==105 || logat==120 || logat==210 || logat==420 || logat==840 || logat==99}">
				 	<div id="workInfo">근무 정보</div><br>
				 	<table class="table table-borderless content" style="float: left;">
				       <colgroup>
				          <col width="16%" />
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
		 		</c:if>
		 	
		 	<c:if test="${logat == 99}"> <!-- 관리자계정일때만 권한 주기 -->
		 	<div id="workInfo">계정 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="16%" />
		          <col />
		     	</colgroup>
		        <tbody>
		        	<tr>
	                   <td>권한</td>   
	                   <td>
	                   	<div>
		                   	<div class="condition-cell">
		                   	 <span style="margin-right: 30px;">
		                   	 	<c:choose>
		                   	 		<c:when test="${at == 1}">
						                <input type="checkbox" class="custom-control-radio2" id="general" name="authority" value="1" checked/>
		                   	 		</c:when>
			                   	 	<c:otherwise>
						                <input type="checkbox" class="custom-control-radio2" id="general" name="authority" value="1"/>
			                   	 	</c:otherwise>
		                   	 	</c:choose>
				                <label for="general" class="js-period-type radio-label-checkbox2" data-code="unlimit">일반</label>
		                   	 </span>
		                   	 <span style="margin-right: 30px;">
		                   	 	<c:choose>
		                   	 		<c:when test="${at==2 || at==6 || at==8 || at==10 || at==14 || at==24 || at==30 ||  at==40 || at==42 || at==56 || at==70 || at==120 || at==210 || at==280 || at==840}">
				                		<input type="checkbox" class="custom-control-radio2" id="insight" name="authority" value="2" checked>
				                	</c:when>
				                	<c:otherwise>
				                		<input type="checkbox" class="custom-control-radio2" id="insight" name="authority" value="2">
				                	</c:otherwise>
				                </c:choose>
				                <label for="insight" class="js-period-type radio-label-checkbox2" data-code="unlimit">인사이트</label>
		                   	 </span>
		                   	 <span style="margin-right: 30px;">
		                   	 	<c:choose>
		                   	 		<c:when test="${at==3 || at==6 || at==12 || at==15 || at==21 || at==24 || at==30 || at==42 || at==60 || at==84 || at==105 || at==120 || at==210 || at==420 || at==840}">
					               		<input type="checkbox" class="custom-control-radio2" id="member" name="authority" value="3" checked>
					                </c:when>
				                	<c:otherwise>
					               		<input type="checkbox" class="custom-control-radio2" id="member" name="authority" value="3">
				                	</c:otherwise>
				                </c:choose>
				                <label for="member" class="js-period-type radio-label-checkbox2" data-code="unlimit">구성원</label>
		                   	 </span>
		                   	 <span style="margin-right: 30px;">
		                   	 	<c:choose>
		                   	 		<c:when test="${at==4 || at==8 || at==12 || at==20 || at==24 || at==28 || at==40 || at==56 || at==60 || at==84 || at==120 || at==140 || at==280 || at==420 || at==840}">
					               		<input type="checkbox" class="custom-control-radio2" id="payroll" name="authority" value="4" checked>
					                </c:when>
				                	<c:otherwise>
					               		<input type="checkbox" class="custom-control-radio2" id="payroll" name="authority" value="4">
				                	</c:otherwise>
				                </c:choose>
				                <label for="payroll" class="js-period-type radio-label-checkbox2" data-code="unlimit">급여</label>
		                   	 </span>
		                   	 <span style="margin-right: 30px;">
		                   	 	<c:choose>
		                   	 		<c:when test="${at==5 || at==10 || at==15 || at==30 || at==35 || at==40 || at==60 || at==70 || at==105 || at==120 || at==140 || at==210 || at==280 || at==420 || at==840}">
					               		<input type="checkbox" class="custom-control-radio2" id="log" name="authority" value="5" checked>
					                </c:when>
				                	<c:otherwise>
					               		<input type="checkbox" class="custom-control-radio2" id="log" name="authority" value="5">
				                	</c:otherwise>
				                </c:choose>
				                <label for="log" class="js-period-type radio-label-checkbox2" data-code="unlimit">로그</label>
		                   	 </span>
		                   	 <span style="margin-right: 30px;">
		                   	 	<c:choose>
		                   	 		<c:when test="${at==7 || at==14 || at==20 || at==21 || at==28 || at==35 || at==42 || at==56 || at==70 || at==84 || at==105 || at==140 || at==210 || at==280 || at==420 || at==840}">
					               		<input type="checkbox" class="custom-control-radio2" id="attendance" name="authority" value="7" checked>
					                </c:when>
				                	<c:otherwise>
					               		<input type="checkbox" class="custom-control-radio2" id="attendance" name="authority" value="7">
				                	</c:otherwise>
				                </c:choose>
				                <label for="attendance" class="js-period-type radio-label-checkbox2" data-code="unlimit">근태</label>
		                   	 </span>
		                   	 <span>
		                   	 	<c:choose>
		                   	 		<c:when test="${at==99}">
					               		<input type="checkbox" class="custom-control-radio2" id="admin" name="authority" value="99" checked>
					                </c:when>
				                	<c:otherwise>
					               		<input type="checkbox" class="custom-control-radio2" id="admin" name="authority" value="99">
				                	</c:otherwise>
				                </c:choose>
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
		                   	 	<c:if test="${requestScope.evo.status == 1}">
				                	<input type="radio" class="custom-control-radio2" id="nomal" name="accountStatus" checked>
				                </c:if>
		                   	 	<c:if test="${requestScope.evo.status != 1}">
				                	<input type="radio" class="custom-control-radio2" id="nomal" name="accountStatus" checked>
				                </c:if>
				                <label for="nomal" class="js-period-type radio-label-checkbox2" data-code="unlimit">정상</label>
		                   	 </span>
		                   	 <span>
		                   	 	<c:if test="${requestScope.evo.status == 0}">
				                	<input type="radio" class="custom-control-radio2" id="stop" name="accountStatus" checked>
				                </c:if>
		                   	 	<c:if test="${requestScope.evo.status != 0}">
				                	<input type="radio" class="custom-control-radio2" id="stop" name="accountStatus">
				                </c:if>
				                <label for="stop" class="js-period-type radio-label-checkbox2" data-code="unlimit">중지</label>
		                   	 </span>
							</div>
	                   	</div>
	                   </td>     
	                </tr>
		        </tbody>
		 	</table>
		  
		  <div class="workstatus-buttoncontainer" style="margin-right: 45%;">
			 <button type="button" class="workstatus-save gradientbtn btn">저장하기</button>
			 <button type="reset" class="workstatus-cancel btn" style="color: #4d4f53;">취소</button><br><br><br><br>
	      </div>
	      </c:if>
       </div>
       <c:if test="${sessionScope.loginuser.employee_no == requestScope.empno}">
       <div style="position: absolute; right: 140px; top: 373px;"> 
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
       </c:if>
	</form>
  
</div>




