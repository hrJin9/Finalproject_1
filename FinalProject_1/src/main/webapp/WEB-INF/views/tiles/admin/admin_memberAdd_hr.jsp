<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/admin_memberAdd.css?after">
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- src 경로는 daum에서 준 우편번호찾기 사이트이다. -->
<style type="text/css">
</style>   

<script type="text/javascript">
$(document).ready(function(){
	
	// 첫화면에 팀 보여주기
	getTeams(10);
	
	
	// 추가입력 input 숨기기
	$("#dept, #team").parent().next().find("input").hide();
	
	
	// 플랫피커
	flatpickr.localize(flatpickr.l10ns.ko);
	flatpickr($(".dateSelector"));
	// 생년월일 데이트피커
	$(".dateSelector").flatpickr({
	   dateFormat: "Y-m-d",
	   conjunction: " ~ ",
	   local: 'ko'
	});
       
	/* 
	// 출근시간 데이트피커
	flatpickr.localize(flatpickr.l10ns.ko);
	flatpickr($(".timeSelector2"));
	$(".timeSelector2").flatpickr({
		enableTime: true,
	    noCalendar: true,
	    dateFormat: "H:i",
		local: 'ko'
	});
	 */
	
	// *** 개인정보 테이블 ***
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
    	$("button#addressBtn").trigger("click");
    });
	
	
	// 부서값 변경시 해당부서의 팀 가져오기
	$("#dept").change(function(){
		getTeams($(this).val());
	});
	
	// 부서 또는 팀값이 추가 일 때 인풋박스 보여주기
	$(document).on("change","#dept",function(){
		if($(this).val() == "add"){
			$(this).parent().next().find("input").show();
		} else {
			$(this).parent().next().find("input").val(""); // 값 초기화
			$(this).parent().next().find("input").hide();
		}
	}); 
	
	$(document).on("change","#team",function(){
		if($(this).val() == "add"){
			$(this).parent().next().find("input").show();
		} else {
			$(this).parent().next().find("input").val(""); // 값 초기화
			$(this).parent().next().find("input").hide();
		}
	});
	
	
	// 유효성 검사하기
	$("input, select").blur(function(e){
		if(!$(e.target).is("#name, #birthday, #joindate, #jointype, #addDept, #addTeam, #position, #role, #employmenttype, #email, #hp1, #hp2, #hp3")) return;
		var flag = testForm($(this));
	});
	
	
	// 이름 입력시 프로필 사진안의 이름 값 바꿔주기
	$("#name").focusout(function(){
		var val = $("#name").val();
		if(val.length > 2){
			val = val.substr(1,2); 
		}
		$("form[name='myInfo'] .pic > span").text(val);
	});
	
	
	
	
});// end of $(document).ready(function(){});---------------------------------
	

///////////////////////////////////////////////////////////////////
// function declaration
function getTeams(deptno){
	$.ajax({
		url: "<%= ctxPath%>/getTeams.up",
		data: {"deptno":deptno},
		dataType:"json",
		success:function(json){
			var html = '';
			if(json.length > 0){
				$.each(json, function(index, item){
					html += '<option value="'+item.team_no+'">'+item.team_name+'</option>';
				});
				html += '<option value="">미지정</option>' + 
						'<option value="add">추가...</option>';
			} else {
				if(deptno == "add"){
					html += '<option value="">미지정</option>'+
							'<option value="add">추가...</option>';
				} else if (deptno == ""){
					html += '<option value="">미지정</option>';
				} else {
					html += '<option value="">없음</option>';
				}
			}
			
			$("#team").html(html);
			$("#addTeam").val("");
			$("#addTeam").hide();
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
	
}// end of getTeams



// 유효성 검사하기
function testForm(input){
	var val = input.val().trim();
	var text = '';
	// 이메일 정규검사
	if(input.is("#email")) {
		let regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
		if(!regex.test(val)){
			text = '이메일 형식으로 입력해주세요.';
			input.focus();
		} else {
			text = '';
		}
		
		input.next().text(text);
		return;
	}
	
	// 숫자만 입력해야하는 것 정규검사
	if(input.is("#hp1, #hp2, #hp3")) {
		let regex = /^[0-9]+$/;
		if(!regex.test(val)){
			text = '숫자만으로 입력해주세요.';
			input.focus();
		} else {
			text = '';
		}
		input.parent().find(".alerts").text(text);
		return;
		
	}
	
	if(val == ""){
		text = '필수 입력사항입니다.';
		input.focus();
	} else {
		text = '';
	}
	
	input.next().text(text);
	
}//end of testForm


function goSubmit(){
	
	// 유효성 검사하기 
	$(".alerts").each(function(index, item){
		var prev = $(item).prev();
		if(prev.is("#hp3")) return;
		var preval = prev.val().trim();
		if(preval == ""){
			$(item).text("필수 입력사항입니다.");
			setTimeout( function(){ prev.focus(); }, 1 );
			return false;
		} else {
			$(item).text("");
		}
	});
	
	if ($("#dept").val() == "add") {
		if($("#addDept").val().trim() == ""){
			setTimeout( function(){ $("#addDept").focus(); }, 1 );
			return;
		}
	}
	
	if ($("#team").val() == "add"){
		if($("#addTeam").val().trim() == ""){
			setTimeout( function(){ $("#addTeam").focus(); }, 1 );
			return;
		}
	}
	
	 
	var mobile = "";
	if($("#hp1").val().trim() != "" && $("#hp2").val().trim() != "" && $("#hp3").val().trim() != "" ){
		mobile = $("#hp1").val().trim() + "-" + $("#hp2").val().trim() + "-" + $("#hp3").val().trim();
	}
	$("#mobile").val(mobile);
	
	
	var authority = 1;
	$("input[name='at']:checked").each(function(index, item){
		authority = authority * $(item).val();
	});
	
	$("#authority").val(authority);
	
	
	const frm = document.memberAdd;
	frm.method = "post";
	frm.action = "<%=ctxPath%>/memAddEnd.up";
	frm.submit();
	
	console.log(frm.team_name.value);	
	
}//end of goSubmit()


</script>

<nav id="admin_mainList" class="margin-container">
	<a id="memberadd" class="header-nonsub">구성원 추가</a>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div style="margin: 0 10%;">
	<form name="memberAdd">
		<div class="col-md-16" style="float: left;">
			<div class="profile" href="#" style="margin-top: 22px; margin-bottom:30px;">
			    <span class="pic" style="height: 150px; width: 150px; font-size: 25pt; font-weight: bold; margin-right: -15px;">
			    	<span>이름</span>
			   	</span>
			</div>
		</div> 
		<%-- 이름, 영문이름, 생년월일, 성별 --%>
		<div class="topinfo" style="float: right;">
	    	<table class="table table-borderless content" style="float: left; margin: 25px 0 45px 0;">
		       <colgroup>
		          <col width="200px" />
		          <col width="350px" />
		          <col width="50px" />
		          <col width="150px" />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이름<span class="essentials">*</span></td>   
		                   <td colspan="3">
		                   	<input type="text" class="required" id="name"  name="name_kr" size="10" value="" placeholder="이름" />
		                   	<div class="alerts" style="color:#4285f4;"></div>
		                   	</td>   
		                </tr>
		                <tr>
		                   <td>영문이름</td>   
		                   <td colspan="3"><input type="text" class="required" id="egname"  name="name_en" size="10" value="" placeholder="영문이름" /></td>   
		                </tr>
		                <tr>
		                   <td>생년월일<span class="essentials">*</span></td>   
		                   <td style="float:left; margin-right:0;"><input id="birthday" name="birthday" class="dateSelector" placeholder="ex) 2020-09-01" /><div class="alerts" style="color:#4285f4;"></div></td>   
		                   <td style="margin-left:0;">성별<span class="essentials">*</span></td> 
		                   <td>
		                   	<select class="required" id="gender" name="gender">
								<option value="1">남자</option>
								<option value="2">여자</option>
							</select>
		                   </td>   
		                </tr>
		          </tbody>
		 	</table>
		</div> 
		 
		 
	 	<hr id="list" style="margin-top: 0px; margin-right: 20%; clear: both; width: 100%;"/><br>
			
			
		<div class="infocontainer" style="margin-left: 2%;">
			<div id="hrInfo">인사 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col/>
		     	</colgroup>
		          <tbody>
		          		<!--
		                <tr>
		                   <td>사번</td>   
		                   <td><input type="text" class="required" id="employeenum"  name="employeenum" size="10" value="" placeholder="ex) 102503" /></td>   
		                </tr>
		                 -->
		                <tr>
		                   <td>입사일<span class="essentials">*</span></td> 
		                   <td><input class="dateSelector" id="joindate" name="hire_date" value="" placeholder="ex) 2020-09-01" /><div class="alerts" style="color:#4285f4;"></div></td>  
		                </tr>
		                <tr>
		                   <td>입사유형<span class="essentials">*</span></td>  
		                   <td>	
		                   	<select class="required" id="jointype" name="jointype">
								<option>신입</option>
								<option>경력</option>
							</select>
							<div class="alerts" style="color:#4285f4;"></div>
		                   </td>
		                </tr>
		                <tr>
		                   <td>부서<span class="essentials">*</span></td>  
		                   <td>	
		                   	<select class="required" id="dept" name="fk_department_no">
								<c:forEach var="dvo" items="${requestScope.dvoList}">
									<option value="${dvo.department_no}" >${dvo.department_name}</option>
								</c:forEach>
								<option value="">미지정</option>
								<option value="add">추가...</option>
								<!-- 
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
								 -->
							</select>
		                   </td> 
							<td><input type="text" id="addDept" name="department_name"/></td>
		                </tr>
		                <tr>
		                   <td>팀<span class="essentials">*</span></td>  
		                   <td>	
		                   	<select class="required" id="team" name="fk_team_no">
								<option value="">부서 선택...</option>
								<!-- 
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
								 -->
							</select>
		                   </td>
		                  	<td><input type="text" id="addTeam" name="team_name"/></td>
		                </tr>
		                <tr>
		                   <td>직위<span class="essentials">*</span></td>   
		                   <td>	
		                   	<select class="required" id="position" name="position">
								<option>사원</option>
								<option>주임</option>
								<option>실장</option>
								<option>대리</option>
								<option>과장</option>
								<option>차장</option>
								<option>부장</option>
								<option>본부장</option>
								<option>상무</option>
								<option>전무</option>
								<option>이사</option>
								<option>부대표</option>
								<option>대표</option>
								<option>연구원</option>
								<option>수석연구원</option>
								<option>책임연구원</option>
								<option>선임연구원</option>
								<option>전임연구원</option>
								<option>주임연구원</option>
							</select>
							<div class="alerts" style="color:#4285f4;"></div>
		                   </td> 
		                </tr>
		                <tr>
		                   <td>직무<span class="essentials">*</span></td>   
		                   <td><input type="text" class="required" id="role" name="role" size="40" value="" placeholder="직무" /><div class="alerts" style="color:#4285f4;"></div></td>   
		                </tr>
						<tr>
		                   <td>고용형태<span class="essentials">*</span></td>
		                   <td>	
		                   	<select class="required" id="employmenttype" name="employmenttype">
								<option>정직원</option>
								<option>계약직</option>
								<option>관리자</option>
								<option>임원</option>
								<option>경영진</option>
								<option>대표</option>
								<option>부서장</option>
								<option>수습</option>
								<option>인턴</option>
								<option>알바</option>
							</select>
							<div class="alerts" style="color:#4285f4;"></div>
		                   </td>    
		                </tr>
		          </tbody>
		 	</table>
		    <%-- 
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
	                   <td><input class="timeSelector2" id="goworktime"  name="goworktime" value="" placeholder="ex) 09:00" /></td>   
	                </tr>
	                <tr>
	                   <td>일하는 시간</td>   
	                   <td><input type="text" class="required" id="workingtime"  name="workingtime" size="10" value="" placeholder="ex) 8시간" /></td>   
	                </tr>
		        </tbody>
		 	</table>
		 	--%>
		 	
			<div id="workInfo">개인 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이메일<span class="essentials">*</span></td>   
		                   <td>
		                   	<input type="text" class="required" id="email"  name="email" size="50" value="" placeholder="이메일" />
		                   	<div class="alerts" style="color:#4285f4;"></div>
	                   		</td>   
		                </tr>
		                <tr>
		                   <td>연락처</td>   
		                   <td>
		                   	<select id="hp1" name="mobile1" style="width: 31.6%;">
				                	<option value="010">010</option>
					                <option value="011">011</option>
					                <option value="016">016</option>
					                <option value="017">017</option>
					                <option value="018">018</option>
					                <option value="019">019</option>
			                </select>&nbsp;-&nbsp;
			                <input type="text" id="hp2" name="mobile2" maxlength="4" value="" style="width: 31.6%;"/>&nbsp;-&nbsp;            <%-- 휴대폰 중간번호 4자리 --%>
			                <input type="text" id="hp3" name="mobile3" maxlength="4" value="" style="width: 31.6%; margin: 7px 7px 18px 0;"/> <%-- 휴대폰 마지막번호 4자리 --%>
		                   	<div class="alerts" style="color:#4285f4;"></div>
		                   </td>   
		                </tr>
		                <tr>
		                   <td style="padding-bottom: 154px;">주소</td> 
		                   <td>
		                    <span style="display: block; margin-bottom: 7px;"><input class="addressInput mt-2" type="text" id="postcode" name="postcode" value="" size="20" maxlength="5" style="width: 45.5%; margin: 7px 7px 0 0;" placeholder="우편번호" readonly />
							<button type="button" id="addressBtn" class="bluebtn btn">우편번호찾기</button></span>
							<%-- <span class="error" style="color: red">우편번호 형식이 아닙니다.</span><br> --%>
							<input class="addressInput mt-2" type="text" id="address" name="address" value="" size="50" style="display: block; margin-bottom: 7px;" placeholder="주소" readonly  />
			                <input class="addressInput mt-2" type="text" id="extra_address" name="extra_address" value="" size="50" style="display: block; margin-bottom: 7px;" placeholder="추가주소" readonly />
			                <input class="addressInput mt-2" type="text" id="detail_address" name="detail_address" value="" size="50" style="display: block; margin-bottom: 18px;" placeholder="상세주소 입력" />
		                   </td>  
		                </tr>
		                <tr>
		                   <td>최종학력</td>  
		                   <td><input type="text" class="required" id="academic_ability"  name="academic_ability" size="50" value="" placeholder="고졸/초대졸/대졸" /></td> 
		                </tr>
		                <tr>
		                   <td>전공</td>  
		                   <td><input type="text" class="required" id="major"  name="major" size="50" value="" placeholder="전공" /></td> 
		                </tr>
		                <tr>
		                   <td>병역사항</td>  
		                   <td>
		                   	<select class="required" name="militaryservice">
		                   		<option value="">해당사항없음</option>
		                   		<option value="0">미필</option>
		                   		<option value="1">군필</option>
		                   	</select>
		                   <!-- <input type="text" class="required" id="militaryservice"  name="militaryservice" size="50" value="" placeholder="병역사항" /> -->
		                   </td> 
		                </tr>
		                <tr>
		                   <td>급여계좌</td>   
		                   <td>	
		                   	<select id="bank" name="bank" class="required" style="display: inline-block; width: 14.5%; padding: 2px 8px;">
								<option value="">은행 선택</option>
								<option>KEB하나은행</option>
								<option>SC제일은행</option>
								<option>경남은행</option>
								<option>광주은행</option>
								<option>국민은행</option>
								<option>기업은행</option>
								<option>농협은행</option>
								<option>대구은행</option>
								<option>부산은행</option>
								<option>상호저축은행</option>
								<option>수협은행</option>
								<option>신한은행</option>
								<option>우리은행</option>
								<option>우체국</option>
								<option>전북은행</option>
								<option>카카오뱅크</option>
								<option>케이뱅크은행</option>
								<option>토스뱅크</option>
								<option>한국산업은행</option>
								<option>한국씨티은행</option>
								<option>제주은행</option>
								<option>산림조합</option>
								<option>새마을금고</option>
								<option>신협</option>
							</select>
							<input id=accountNumber type="text" class="required" name="accountnumber" size="20" placeholder="계좌번호" style="display: inline-block; width: 31.5%; padding: 2px 12px;"/>
							<!-- <input id=accountHolder type="text" class="required" name="accountHolder" size="20" placeholder="예금주" style="display: inline-block; width: 13%; padding: 2px 12px;"/> -->
		                   </td> 
		                </tr>
		          </tbody>
		 	</table>
		 	
		 	
			<div id="workInfo">계정 정보</div><br>
		 	<table class="table table-borderless content statusinfo" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		        <tbody>
		        	<tr>
	                   <td>권한<span class="essentials">*</span></td>   
	                   <td style="font-size: 11pt;">
	                   	<div class="authority">
		                   	 <span style="margin-right: 30px;">
				                <input type="checkbox" id="general_employee" name="at"  style="width: 2%; height: 8%;" value="1"/>
				                <label for="general_employee" class="js-period-type radio-label-checkbox2" data-code="unlimit">일반</label>
		                   	 </span>
			                   	 <span style="margin-right: 30px;">
					                <input type="checkbox" id="admin_insight" name="at"  style="width: 2%; height: 8%;" value="2"/>
					                <label for="admin_insight" class="js-period-type radio-label-checkbox2" data-code="unlimit">인사이트 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 30px;">
					                <input type="checkbox" id="admin_member" name="at"  style="width: 2%; height: 8%;" value="3"/>
					                <label for="admin_member" class="js-period-type radio-label-checkbox2" data-code="unlimit">구성원 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 30px;">
					                <input type="checkbox" id="admin_payroll" name="at"  style="width: 2%; height: 8%;" value="4"/>
					                <label for="admin_payroll" class="js-period-type radio-label-checkbox2" data-code="unlimit">급여 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 30px;">
					                <input type="checkbox" id="admin_log" name="at"  style="width: 2%; height: 8%;" value="5"/>
					                <label for="admin_log" class="js-period-type radio-label-checkbox2" data-code="unlimit">로그 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 30px;">
					                <input type="checkbox" id="admin_attendance" name="at"  style="width: 2%; height: 8%;" value="7"/>
					                <label for="admin_attendance" class="js-period-type radio-label-checkbox2" data-code="unlimit">근태 관리</label>
			                   	 </span>
		                   	 </div>
							</div>
	                   	</div>
	                   </td>   
	                </tr>
	                <!-- 
	                <tr>
	                   <td>계정상태</td>
	                   <td style="font-size: 11pt;">
	                   	<div>
		                   	<div class="condition-cell" style="position: relative; right: 2px;">
		                   	 <span style="margin-right: 30px;">
				                <input type="radio" class="custom-control-radio2" id="nomal" name="status" style="width: 15%; height: 8%;" value="1" checked>
				                <label for="nomal" class="js-period-type radio-label-checkbox2" data-code="unlimit">정상</label>
		                   	 </span>
		                   	 <span>
				                <input type="radio" class="custom-control-radio2" id="stop" name="status" style="width: 15%; height: 8%;" value="0">
				                <label for="stop" class="js-period-type radio-label-checkbox2" data-code="unlimit">중지</label>
		                   	 </span>
							</div>
	                   	</div>
	                   </td>     
	                </tr>
	                 -->
		        </tbody>
		 	</table>
		  </div>
		  
		  <%-- 버튼 --%>
	      <div class="workstatus-buttoncontainer" style="margin-right: 40%;">
			 <button type="button" class="workstatus-save bluebtn btn" onclick="goSubmit()">추가하기</button>
			 <button type="reset" class="workstatus-cancel btn" style="color: #4d4f53; width: 68px;">초기화</button><br><br><br><br>
	      </div>
	      
	      <input id="mobile" type="text" name="mobile"/>
	      <input id="authority" type="text" name="authority"/>
	      
	</form>
</div>




