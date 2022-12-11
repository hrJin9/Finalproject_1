<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/memberInfo.css?after">
<style type="text/css">
</style>   

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- src 경로는 daum에서 준 우편번호찾기 사이트이다. -->
<script type="text/javascript">
//"우편번호찾기" 를 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도.
let b_flag_addressBtn_click = false;

// 휴대전화 변경했는지 알아오기 위한 용도
let b_flag_mobile_update = false;

// "휴대전화 인증하기" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도.
let b_flag_mobileCheckBtn_click = false;

// "휴대전화 인증코드확인" 을 확인 했는지 알아오기 위한 용도.
let b_flag_mobileVerifyCode_click = false;

// 이베일 변경했는지 알아오기 위한 용도
let b_flag_email_update = false;

// "이메일 인증하기" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도.
let b_flag_emailCheckBtn_click = false;

// "이메일 인증코드확인" 을 확인 했는지 알아오기 위한 용도.
let b_flag_emailVerifyCode_click = false;

// 휴대폰 인증번호
let smsCertificationCode = "";

// 이메일 인증번호
let certificationCode = "";

$(document).ready(function(){
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	var empno = "${requestScope.empno}";
	if(empno == "") { //내프로필 조회시
		empno = "${sessionScope.loginuser.employee_no}";
	}
	
	// 첫페이지 로딩시 근무시간 읽어오기
	getWorkinghour();
	
	
	// nav바에서 인사정보 클릭시 인사정보 페이지로 이동
	$(".memberInfo_hView").click(function(){
		location.href= "<%= ctxPath%>/memberInfo_hr.up?empno="+empno;
	});
	
	// 카메라 버튼을 눌러 파일을 변경하면 프로필사진 등록
	$(document).on("change","#addprofile",handleImgFileSelect);
	
	
	// 핸드폰 버튼 클릭시 핸드폰번호 복사
	$("#phone").click(function(){
		var mobile = "${requestScope.evo.mobile}";
		window.navigator.clipboard.writeText(mobile);
		$("#alert").fadeIn("fast");
		setTimeout(function(){
			$("#alert").fadeOut("fast");
		}, 1500);
	});
	
	// 메시지 버튼 클릭시 메시지 보내기로 이동
	$("#message").click(function(){
		location.href="<%= ctxPath%>/message/write.up?to="+"${requestScope.empno}";
	});
	
	// 개인정보수정- offcanvas
 	$(".update").click(function(e){
 		$('.offcanvas').offcanvas('show');
 		$("#offcanvasScrollingLabel").text("개인 정보 수정");
		
 		flatpickr.localize(flatpickr.l10ns.ko);
        flatpickr($(".dateSelector"));
        // 생년월일 데이트피커
        $(".dateSelector").flatpickr({
           dateFormat: "Y-m-d",
           conjunction: " ~ ",
           local: 'ko'
        });
			
		// 우편번호찾기 버튼 클릭시
		$("button#addressBtn").click(function(){
			
			new daum.Postcode({   // 다음사이트에서 제공하는 "우편번호찾기" 코드
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                let extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extra_address").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extra_address").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detail_address").focus();  // 본인이 직접 입력해야하는 부분
	            }
	        }).open();
			
		});
			
		// 우편번호, 주소, 추가주소 입력란 클릭시 알림메시지 띄우기
        $("input#postcode, input#address, input#extra_address").bind("click", function() {
   	        alert("우편번호찾기를 클릭하셔서 주소를 입력하세요.");
        });
		
 	});// $(".update").click(function(e){});---------------------------
	
	
	
});// end of $(document).ready(function(){})-------------------------------


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


function getWorkinghour(){
	$.ajax({
		url: "<%= ctxPath%>/getWorkinghour.up",
		data: {"employee_no":"${requestScope.evo.employee_no}"},
		type: "post",
		dataType:"json",
		success:function(json){
			var html = '';
			if(json.working_h != ""){
				if(json.working_m != null){
					html = json.working_h + '시간 ' + json.working_m + '분';
				} else {
					html = json.working_h + '시간';
				}
			} else {
				html = '정보 없음';
			}
			
			$("#working").html(html);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
}//end of getWorkinghour

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
			<div id="personalInfo">개인 정보
				<c:set var="logat" value="${sessionScope.loginuser.authority}"/>
          		 <c:if test="${logat==3 || logat==6 || logat==12 || logat==15 || logat==21 || logat==24 || logat==30 || logat==42 || logat==60 || logat==84 || logat==105 || logat==120 || logat==210 || logat==420 || logat==840 || logat==99}">
				<span><i class="fas fa-pen update"></i></span>
				</c:if>
			</div><br>
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
						  		${requestScope.evo.birthday}&nbsp;<span style="padding-left: 5px;">/</span>
							  <span style="padding-left: 5px;">
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
        <c:if test="${sessionScope.loginuser.employee_no == requestScope.empno}">
		<div style="position: absolute; right: 140px; top: 373px;"> 
			<div class="moreInfo" onclick="javascript:location.href='<%= ctxPath%>/attendance.up'">
				<div style="padding-bottom: 21px;"><ion-icon name="time-outline"></ion-icon></div>
				<span style="font-size: 9pt; color: #595959; margin-bottom: -9px; display: block;">근무시간</span> 
				<span id="working" style="font-size: 13pt;"></span>
			</div><br> 
			<div class="moreInfo" onclick="javascript:location.href='<%= ctxPath%>/dayoff/index.up'">
				<div style="padding-bottom: 21px; transform: scaleX(-1); padding-left: 176px;"><ion-icon name="leaf-outline"></ion-icon></div>
				<span style="font-size: 9pt; color: #595959; margin-bottom: -9px; display: block;">남은연차</span>
				<span style="font-size: 13pt;">${requestScope.evo.dayoff_cnt}일</span>  
			</div><br> 
			<div class="moreInfo" onclick="javascript:location.href='<%= ctxPath%>/payroll.up'">
				<div style="padding-bottom: 21px;"><ion-icon name="server-outline"></ion-icon></div>
				<span style="font-size: 9pt; color: #595959; margin-bottom: -9px; display: block;">급여</span>  
				<span style="font-size: 13pt;">11월 급여명세서</span>  
		</div><br> 
	</div>
	</c:if>
	
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
						<input id="name" type="text" class="required" name="name" size="20" placeholder="이름 입력" value="${requestScope.evo.name_kr}"/>
					</div>
						
					<div style="float: left; width: 52%; margin-left: 16px;">
						<div>영문이름</div>
						<input id="Egname" type="text" class="required" name="name" size="20" placeholder="영문이름 입력" value="${requestScope.evo.name_en}" />
					</div>
					
					<div style="clear: both;">생년월일</div>
					<input id="birthday" name="birthday" class="dateSelector" placeholder="ex) 2020-09-01" value="${requestScope.evo.birthday}"/>
					
					<div style="vertical-align: middle;">이메일</div>
					<input id="email" type="text" class="required" name="email" placeholder="이메일 입력" value="${requestScope.evo.email}"/>
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
					<select id="hp1" name="hp1" style="width: 18%;">
		                	<option value="010">010</option>
			                <option value="011">011</option>
			                <option value="016">016</option>
			                <option value="017">017</option>
			                <option value="018">018</option>
			                <option value="019">019</option>
	                </select>&nbsp;-&nbsp;
	                <input type="text" id="hp2" name="hp2" maxlength="4" value="" style="width: 18%;"/>&nbsp;-&nbsp;            
	                <input type="text" id="hp3" name="hp3" maxlength="4" value="" style="width: 18%; margin: 7px 7px 18px 0;"/>
		            <button type="button" id="mobileCheckBtn" style="cursor: pointer;">인증하기</button>
		            <%--
		            <span id="spinner" class="spinner-border text-success"></span>
		            <span class="error" style="color: red">휴대폰 형식이 아닙니다.</span><br>
		             --%>
		            <%--
		            <div id="mobileVerify">
						<input type="text" name="mobileCode" id="mobileCode"  class="mt-2" size="20"/>
						<button type="button" id="mobileCodeCheckBtn" onclick="mobileVerifyCodeCheck();">인증확인</button>
						<span id="timer" style="color: red"></span>
					</div>
					<span id="mobileCodeConfirm">휴대폰 인증이 확인되었습니다.</span>
		            --%>
					
					<div style="vertical-align: middle;">주소</div>
					<span style="display: block; margin-bottom: 7px;"><input class="addressInput mt-2" type="text" id="postcode" name="postcode" value="" size="20" maxlength="5" style="width: 45.5%; margin: 7px 7px 0 0;" placeholder="우편번호" readonly />
					<button type="button" id="addressBtn">우편번호찾기</button></span>
					<%-- <span class="error" style="color: red">우편번호 형식이 아닙니다.</span><br> --%>
					<input class="addressInput mt-2" type="text" id="address" name="address" value="" size="50" style="display: block; margin-bottom: 7px;" placeholder="주소" readonly  />
	                <input class="addressInput mt-2" type="text" id="extra_address" name="extra_address" value="" size="50" style="display: block; margin-bottom: 7px;" placeholder="추가주소" readonly />
	                <input class="addressInput mt-2" type="text" id="detail_address" name="detail_address" value="" size="50" style="display: block; margin-bottom: 18px;" placeholder="상세주소 입력" />
					<%-- <span class="error" style="color: red">주소를 입력하세요.</span> --%>
				
					<div style="vertical-align: middle;">급여계좌</div>
					<select id="bank" name="bank" class="required" style="display: inline-block; width: 22%;">
						<option value="1">은행 선택</option>
						<option value="2">KEB하나은행</option>
						<option value="3">SC제일은행</option>
						<option value="4">경남은행</option>
						<option value="5">광주은행</option>
						<option value="6">국민은행</option>
						<option value="7">기업은행</option>
						<option value="8">농협은행</option>
						<option value="9">대구은행</option>
						<option value="10">부산은행</option>
						<option value="11">상호저축은행</option>
						<option value="12">수협은행</option>
						<option value="13">신한은행</option>
						<option value="14">우리은행</option>
						<option value="15">우체국</option>
						<option value="16">전북은행</option>
						<option value="17">카카오뱅크</option>
						<option value="18">케이뱅크은행</option>
						<option value="19">토스뱅크</option>
						<option value="20">한국산업은행</option>
						<option value="21">한국씨티은행</option>
						<option value="22">제주은행</option>
						<option value="23">산림조합</option>
						<option value="24">새마을금고</option>
						<option value="25">신협</option>
					</select>
					<input id=accountNumber type="text" class="required" name="accountNumber" size="20" placeholder="계좌번호  입력" style="display: inline-block; width: 52%;"/>
					<input id=accountHolder type="text" class="required" name="accountHolder" size="20" placeholder="예금주  입력" style="display: inline-block; width: 24.7%;"/>
				
					<div class="workstatus-buttoncontainer" style="margin-bottom: 60px;">
			  			<button type="button" class="workstatus-save bluebtn">저장하기</button>
			  			<button type="reset" class="workstatus-cancel">취소</button>
		  			</div>
				
				</form>
			</div> 
		</div>
	</div>
	</form>
	
  	<div id="alert">
         <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
         <span id="alertText" style="position: relative; bottom: 2px;">${requestScope.evo.mobile}이 복사되었습니다.</span>
    </div>
</div>

