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
		margin-left: 5%;
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
	    width: 62%;
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
	
	#addressBtn {
	    background-color: #d9d9d9;
	    color: white;
	    height: 40px;
        width: 15.5%;
	    border-style: none;
	    border-radius: 7px;
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
        
        // 출근시간 데이트피커
        flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".timeSelector2"));
		$(".timeSelector2").flatpickr({
			enableTime: true,
		    noCalendar: true,
		    dateFormat: "H:i",
			local: 'ko'
		});
		
		
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
		        alert("우편번호찾기를 클릭하셔서 주소를 입력하세요.");
	    });
		
		
	});// end of $(document).ready(function(){});---------------------------------
	
</script>

<nav id="admin_mainList" class="margin-container">
	<a id="memberadd" class="header-nonsub">구성원추가</a>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div style="margin-right: 5%;">
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
	    	<table class="table table-borderless content" style="float: left; margin: 25px 0 45px 0;">
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
		 
		 
	 	<hr id="list" style="margin-top: 0px; margin-right: 20%; clear: both; width: 98%;"/><br>
			
			
		<div class="infocontainer" style="margin-left: 2%;">
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
		 	
		 	
			<div id="workInfo">개인 정보</div><br>
		 	<table class="table table-borderless content" style="float: left;">
		       <colgroup>
		          <col width="200px" />
		          <col />
		     	</colgroup>
		          <tbody>
		                <tr>
		                   <td>이메일</td>   
		                   <td><input type="text" class="required" id="email"  name="email" size="50" value="" placeholder="이메일" /></td>   
		                </tr>
		                <tr>
		                   <td>연락처</td>   
		                   <td>
		                   	<select id="hp1" name="hp1" style="width: 19.5%;">
				                	<option value="010">010</option>
					                <option value="011">011</option>
					                <option value="016">016</option>
					                <option value="017">017</option>
					                <option value="018">018</option>
					                <option value="019">019</option>
			                </select>&nbsp;-&nbsp;
			                <input type="text" id="hp2" name="hp2" maxlength="4" value="" style="width: 19.5%;"/>&nbsp;-&nbsp;            <%-- 휴대폰 중간번호 4자리 --%>
			                <input type="text" id="hp3" name="hp3" maxlength="4" value="" style="width: 19.5%; margin: 7px 7px 18px 0;"/> <%-- 휴대폰 마지막번호 4자리 --%>
		                   </td>   
		                </tr>
		                <tr>
		                   <td style="padding-bottom: 154px;">주소</td> 
		                   <td>
		                    <span style="display: block; margin-bottom: 7px;"><input class="addressInput mt-2" type="text" id="postcode" name="postcode" value="" size="20" maxlength="5" style="width: 45.5%; margin: 7px 7px 0 0;" placeholder="우편번호" readonly />
							<button type="button" id="addressBtn">우편번호찾기</button></span>
							<%-- <span class="error" style="color: red">우편번호 형식이 아닙니다.</span><br> --%>
							<input class="addressInput mt-2" type="text" id="address" name="address" value="" size="50" style="display: block; margin-bottom: 7px;" placeholder="주소" readonly  />
			                <input class="addressInput mt-2" type="text" id="extra_address" name="extra_address" value="" size="50" style="display: block; margin-bottom: 7px;" placeholder="추가주소" readonly />
			                <input class="addressInput mt-2" type="text" id="detail_address" name="detail_address" value="" size="50" style="display: block; margin-bottom: 18px;" placeholder="상세주소 입력" />
		                   </td>  
		                </tr>
		                <tr>
		                   <td>최종학력</td>  
		                   <td><input type="text" class="required" id="major"  name="major" size="50" value="" placeholder="졸업학교(학교유형)" /></td> 
		                </tr>
		                <tr>
		                   <td>전공</td>  
		                   <td><input type="text" class="required" id="major"  name="major" size="50" value="" placeholder="전공" /></td> 
		                </tr>
		                <tr>
		                   <td>병역사항</td>  
		                   <td><input type="text" class="required" id="militaryservice"  name="militaryservice" size="50" value="" placeholder="병역사항" /></td> 
		                </tr>
		                <tr>
		                   <td>급여계좌</td>   
		                   <td>	
		                   	<select id="bank" name="bank" class="required" style="display: inline-block; width: 14.5%; padding: 2px 8px;">
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
							<input id=accountNumber type="text" class="required" name="accountNumber" size="20" placeholder="계좌번호" style="display: inline-block; width: 31.5%; padding: 2px 12px;"/>
							<input id=accountHolder type="text" class="required" name="accountHolder" size="20" placeholder="예금주" style="display: inline-block; width: 13%; padding: 2px 12px;"/>
		                   </td> 
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
		                   	 <span style="margin-right: 30px;">
				                <input type="checkbox" id="general_employee" onClick="allCheckBox();" style="width: 2%; height: 8%;" />
				                <label for="general_employee" class="js-period-type radio-label-checkbox2" data-code="unlimit">일반</label>
		                   	 </span>
			                   	 <span style="margin-right: 10px;">
					                <input type="checkbox" id="admin_payroll" onClick="allCheckBox();" style="width: 2%; height: 8%;" />
					                <label for="admin_payroll" class="js-period-type radio-label-checkbox2" data-code="unlimit">인사이트 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 10px;">
					                <input type="checkbox" id="admin_member" onClick="allCheckBox();" style="width: 2%; height: 8%;" />
					                <label for="admin_member" class="js-period-type radio-label-checkbox2" data-code="unlimit">구성원 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 10px;">
					                <input type="checkbox" id="admin_payroll" onClick="allCheckBox();" style="width: 2%; height: 8%;" />
					                <label for="admin_payroll" class="js-period-type radio-label-checkbox2" data-code="unlimit">급여 관리</label>
			                   	 </span>
			                   	 <span style="margin-right: 10px;">
					                <input type="checkbox" id="admin_payroll" onClick="allCheckBox();" style="width: 2%; height: 8%;" />
					                <label for="admin_payroll" class="js-period-type radio-label-checkbox2" data-code="unlimit">로그 관리</label>
			                   	 </span>
		                   	 </div>
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
		  
		  <%-- 버튼 --%>
	      <div class="workstatus-buttoncontainer" style="margin-right: 53%;">
			 <button type="button" class="workstatus-save gradientbtn" style="margin-top: 15%; margin-bottom: 15%">저장하기</button>
			 <button type="reset" class="workstatus-cancel" style="margin-top: 15%; margin-bottom: 15%">취소</button><br><br><br><br>
	      </div>
	      
	</form>
</div>




