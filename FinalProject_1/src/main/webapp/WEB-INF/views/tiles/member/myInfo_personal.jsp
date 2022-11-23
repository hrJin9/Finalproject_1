<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
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
	
	/* 개인정보 */
	#personalInfo {
		font-weight: bold;
		font-size: 14pt;
	}
	
	/* .menubar {
		margin-left: 810px;
		color: #a6a6a6; 
		font-size: 10pt;
	} */
	
	.update {
		margin-left: 810px;
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
	    background-color: #4285f4;
	    color: white;
	    height: 41px;
	    width: 100px;
	    border-style: none;
	    border-radius: 4px;
	} 
	
	
	input:focus {
		border: 1.8px solid #4285f4;
    	outline: none;
	}
	
	#phoneCheck, 
	#mobileCheckBtn,
	#mobileCodeCheckBtn,
	#emailCheckBtn, 
	#emailCodeCheckBtn {
	    background-color: #cfc9c9;
	    color: white;
	    height: 40px;
	    width: 100px;
	    border-style: none;
	    border-radius: 7px;
	} 
	
	#addressBtn {
	    background-color: #cfc9c9;
	    color: white;
	    height: 40px;
	    width: 100px;
	    border-style: none;
	    border-radius: 7px;
	}
	
	#btnUpdate {
		width: 190px;
	    padding: 7.5px;
	    border: 1px solid #4285f4;
		background-color: #4285f4;
		color: white;
		font-size: 13pt;
		border-radius: 30px;
	}
	
	#btnUpdate:hover {
		opacity: 1;
	}
	
</style>   

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- src 경로는 daum에서 준 우편번호찾기 사이트이다. -->
<script type="text/javascript">
	// "우편번호찾기" 를 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도.
	let b_flag_addressBtn_click = false;  // 초기값을 false 로 줌. 

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
		
		// nav바에서 인사정보 클릭시 인사정보 페이지로 이동
		$(".myInfo_hView").click(function(){
			location.href= "<%= ctxPath%>/myInfo_hr.up";
		});
		
		// 개인정보수정- offcanvas
	 	$(".update").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		$("#offcanvasScrollingLabel").text("개인 정보 수정");
			
	 		// 생년월일
	        $(".dateSelector").flatpickr({
        	  dateFormat: "Y-m-d",
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
	
 	// >>> Function Declaration <<< //
	// 휴대전화 인증확인하기
	/* function mobileVerifyCodeCheck() {
		
		const userVerifyCode = $("input#mobileCode").val();

		if(smsCertificationCode == userVerifyCode){
			b_flag_mobileVerifyCode_click = true; // 인증확인 버튼 클릭함.
			$('div#mobileVerify').hide();        // 휴대전화 인증코드입력란 및 인증확인버튼 숨기기
			$('span#mobileCodeConfirm').show();  // 인증결과 보여준다.
			$("#editCompletion").prop("disabled", false); // 수정버튼 활성화
		}
		else{
			alert("인증번호가 틀렸습니다. 인증하기 버튼을 눌러 인증코드를 다시 발급받으세요.");
			b_flag_mobileVerifyCode_click = false;  // 휴대전화 인증확인 버튼 초기화
			$("input#mobileCode").val("");       // 인증코드 입력란 비우기
			$("div#mobileVerify").hide();        // 인증코드 입력란과 인증확인버튼 숨기고 시작한다.
			$("span#mobileCodeConfirm").hide();  // 인증결과도 숨기고 시작한다.
		} */
		

	
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
			<a class="list_iscurrent myInfo_hView">인사 정보</a>
			<a class="myInfo_pView">개인 정보</a>
			<div class="list_underline"></div>
		</nav>     
	 
	 	<hr style="margin-top: 0px;"/><br>
		
		<div class="container">
			<%-- <div id="personalInfo">개인 정보<span><i class="fas fa-list-ul menubar"></i><i class="fas fa-pen update"></i></span></div><br> --%>
			<div id="personalInfo">개인 정보<span><i class="fas fa-pen update"></i></span></div><br>
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
		                   <td>급여계좌</td>   
		                   <td>국민은행  912-01-200357  김지은</td>   
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
						<input id="Egname" type="text" class="required" name="name" size="20" placeholder="영문이름 입력" />
					</div>
					
					<div style="clear: both;">생년월일</div>
					<input id="birthday" name="birthday" class="dateSelector" placeholder="ex) 2020-09-01" />
					
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
					<select id="hp1" name="hp1" style="width: 18%;">
		                	<option value="010">010</option>
			                <option value="011">011</option>
			                <option value="016">016</option>
			                <option value="017">017</option>
			                <option value="018">018</option>
			                <option value="019">019</option>
	                </select>&nbsp;-&nbsp;
	                <input type="text" id="hp2" name="hp2" maxlength="4" value="" style="width: 18%;"/>&nbsp;-&nbsp;            <%-- 휴대폰 중간번호 4자리 --%>
	                <input type="text" id="hp3" name="hp3" maxlength="4" value="" style="width: 18%; margin: 7px 7px 18px 0;"/> <%-- 휴대폰 마지막번호 4자리 --%>
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
					<span style="display: block; margin-bottom: 7px;"><input class="addressInput mt-2" type="text" id="postcode" name="postcode" value="${sessionScope.loginuser.postcode}" size="20" maxlength="5" style="width: 45.5%; margin: 7px 7px 0 0;" placeholder="우편번호" readonly />
					<button type="button" id="addressBtn">우편번호찾기</button></span>
					<%-- <span class="error" style="color: red">우편번호 형식이 아닙니다.</span><br> --%>
					<input class="addressInput mt-2" type="text" id="address" name="address" value="${sessionScope.loginuser.address}" size="50" style="display: block; margin-bottom: 7px;" placeholder="주소" readonly  />
	                <input class="addressInput mt-2" type="text" id="extra_address" name="extra_address" value="${sessionScope.loginuser.extra_address}" size="50" style="display: block; margin-bottom: 7px;" placeholder="추가주소" readonly />
	                <input class="addressInput mt-2" type="text" id="detail_address" name="detail_address" value="${sessionScope.loginuser.detail_address}" size="50" style="display: block; margin-bottom: 18px;" placeholder="상세주소 입력" />
					<%-- <span class="error" style="color: red">주소를 입력하세요.</span> --%>
				
					<div style="vertical-align: middle;">은행 선택</div>
					<select id="bank" name="bank" class="required" style="display: inline-block; width: 22%;">
						<option value="1">은행 선택</option>
						<option value=2>KEB하나은행</option>
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
			  			<button type="button" class="workstatus-save">저장하기</button>
			  			<button type="reset" class="workstatus-cancel">취소</button>
		  			</div>
				
				</form>
			</div> 
		</div>
	</div>
	<!-- 오프캔버스 끝 -->
		
</div>

