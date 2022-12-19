<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    

<!DOCTYPE html>
<html>
<head>   

<title>Thumbs up</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/48a76cd849.js" crossorigin="anonymous"></script>
<!-- 폰트 목록 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- jQueryUI CSS 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'> 
  
<!-- pretendard-font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard-dynamic-subset.css" />

  
<style type="text/css">

	*{
		font-family: 'Pretendard';
		font-weight: 600;	
		color:	#595959;
	}
	
	.pwdFindFrm {
		text-align: center;
	}
	
	li input {
		border: 1.5px solid #cccccc;
		border-radius: 3.5px;
		width: 68%;
		padding: 5px 10px;
		opacity: 0.85;
		font-size: 9pt;
		line-height: 20px;
	}
	
	input:focus {
		outline: none;
		border: 1.8px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	label {
		display: inline-block; 
		width: 90px; 
		margin-left: 18px;
		margin-right: 25px;
		font-size: 10pt;
		font-weight: bold;
	}
	
	#btnFind {
		width: 66%; 
		/* border: rgb(0 101 204) 1px solid;
		background-image: linear-gradient(40deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%); */
		background-color: #0d6efd;
		color: white;
		font-size: 12pt;
		border-radius: 5px;
	}
	
	#btnFind:hover {
		opacity: 1;
	}
	
	
	.error {
		font-size: 9pt;
		color: rgb(0 101 204);
	    margin-left: 26.3%;
	    margin-top: 5px;
	}
	
	#emailcheckBtn{
		border: solid 1px #cccccc;
		background-color: white;
		padding: 6px 10px;
		color: rgba(36, 42, 48, 0.48);
		font-size: 10pt;
	}
	
	#btnReset{
	    border: solid 1px #dbdbdb;
	    font-size: 11pt;
	    color: rgba(36, 42, 48, 0.48);
	    width: 15%;
	    margin: 0px 10px 0 22px;
	}
	
	
</style>
  
  
<script type="text/javascript">

var code = ""; // 이메일 인증용
var b_emailSendCheck = false;
var b_emailCheck = false; // 이메일인증을 했는지 여부
var empno = "";

$(document).ready(function(){
	
	$(".error").hide();
	$("#emailCheckLi").hide();
	<%-- 
	$("button#btnFind").click(function(){
		location.href= "<%= ctxPath%>/login/pwdFind_update.up"; 
	});
	 --%>
	
	$("#btnReset").click(function(){
		$("#pwdFindClose",parent.document).trigger("click");
	});
	 
	 
});// end of $(document).ready(function(){})---------------

//////////////////////////////////////////////////////////////////////////////////////////////

// 모달창에 입력한 input 태그 value 값 초기화 시키기
function func_form_reset_empty() {  // 입력란에 있는 값 비워주는 메소드
	document.querySelector("form[name='pwdFindFrm']").reset();  // 해당 form 태그 초기화시키기
}


//해당정보에 해당하는 사원정보 가져오기
function employeeInfo(){
	
	
	
	if(!b_emailCheck){ //이메일 인증을 안한 경우
		// 이름 유효성검사
		const name = $("#name_kr").val().trim();
		if(name == ""){
			$("#name_kr").focus();
			$(".nameAlert").show();
			return;
		} else {
			$(".nameAlert").hide();
		}
		
		// 이메일 유효성검사
		const emailReg = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
		const email = $("#email").val().trim();
		if(!emailReg.test(email)){
			$("#email").focus();
			$(".emailAlert").show();
			return;
		} else {
			$(".emailAlert").hide();
		}
		
		$.ajax({
			url: "<%=ctxPath%>/getEmployeeInfo.up",
			type:"post",
			data:$("#pwdFindFrm").serialize(),
			dataType:"json",
			success:function(json){
				var alertHtml = '';
				if(json.employee_no != ""){
					goEmailCheck();
					empno = json.employee_no;
				} else {
					alertHtml = "조회된 사원정보가 없습니다. 다시 입력해주세요.";
				}
				$(".emailAlert").text(alertHtml);
				$(".emailAlert").show();
			}
		});
		
	} else { //모든 인증을 끝낸 경우
		location.href= "<%= ctxPath%>/login/pwdFind_update.up?empno="+empno; 
	}
	
	
	
}//end employeeInfo

//이메일 인증
function goEmailCheck(){
	
	const email = $("#email").val().trim();
	
	$.ajax({
		url:"<%= ctxPath%>/mailPwdCheck.up?email="+email,
		type:"get",
		success:function(data){
			//console.log("data:" + data);
			code = data;
			
			$(".emailAlert").text("인증번호를 전송했습니다.인증번호를 입력해주세요.");
			$(".emailAlert").show();
			$("#emailCheckLi").show();
			b_emailSendCheck = true;
		}
	});//end ajax
	
}//end of goEmailCheck

//이메일 인증번호 비교
function checkEmailCode(){
	const inputval = $("#emailCheck").val();
	
	if(code != inputval){
		$(".emailCheckAlert").text("인증번호가 일치하지 않습니다.");
		$(".emailCheckAlert").show();
		return;
	} else {
		$(".emailCheckAlert").text("인증이 성공되었습니다.");
		$(".emailCheckAlert").show();
		$("#btnFind").text("비밀번호 변경");
		b_emailCheck = true;
	}
	
}//end checkEmailCode

</script>    
 
</head>
<body>   
<form id="pwdFindFrm" name="pwdFindFrm">
	<!-- 
	<h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 찾기</h4><br>
	 -->
	<ul style="list-style-type: none">
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 62px; margin-left: 18px;">이름</label>
	       <input type="text" name="name_kr" id="name_kr" size="25" placeholder="이름" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	    	<div class="error nameAlert">이름을 입력해주세요.</div> 
	    </li>
	    <!-- 
	    <li style="margin: 10px 0 7px 0">
	       <label for="userid" style="display: inline-block; width: 90px; margin-left: 18px;">사원번호</label>
	       <input type="text" name="employee_no" id="employee_no" size="25" placeholder="사원번호" autocomplete="off" required />  label 태그의 for값 == input 태그의 id값
	    </li>
	     -->
	    <li style="margin: 10px 0 7px 0">
	       <label for="email" style="display: inline-block; width: 62px; margin-left: 18px;">이메일</label>
	       <input type="text" name="email" id="email" size="25" placeholder="이메일" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	      <div class="error emailAlert">이메일 형식에 맞게 입력해주세요.</div> 
	    </li>
	    <li id="emailCheckLi" style="margin: 10px 0 7px 0">
	       <label for="email" style="display: inline-block; width: 62px; margin-left: 18px;">이메일 확인</label>
	       <input type="text" name="emailCheck" id="emailCheck" size="25" placeholder="인증번호입력" autocomplete="off" required style="width: 49%;"/>  <!-- label 태그의 for값 == input 태그의 id값 -->
	       <button id="emailcheckBtn" type="button" class="btn" onclick="checkEmailCode()">인증확인</button>
	      <div class="error emailCheckAlert"></div> 
	    </li>
	</ul>

	<div class="text-center" style="margin-top: 25px;">
		<button type="reset" class="btn" id="btnReset">취소</button>
		<button type="button" class="btn" id="btnFind" onclick="employeeInfo()">인증</button>
    </div>
    
    <div class="my-3" id="div_findResult">
		<p class="text-center">
			<span id="emailAlert" style="color: rgb(0 101 204); font-size: 11pt;"></span>
		<%-- 
			// get으로 들어올 경우
			<c:if test="${requestScope.isUserExist eq false}">
				<span style="color: red;">사용자 정보가 없습니다.</span>
			</c:if>
			
			// post 로 들어온 경우
			<c:if test="${requestScope.isUserExist eq true && requestScope.sendMailSuccess == true}">
				<div id="div_certification">
					<hr style="border: solid 1px gray; background-color: gray;">
					<span >임시비밀번호가 ${requestScope.email}로 발송되었습니다.</span><br>
	            </div>
			</c:if>
			
			// user는 존재하지만 메일이 제대로 전송되지 못한 경우
			<c:if test="${requestScope.isUserExist eq true && requestScope.sendMailSuccess == false}">
				<span style="font-size: 10pt; color: red;">메일 발송이 실패하였습니다.</span><br>
			</c:if>
			 --%>
		</p>
	</div>
</form>
</body>
</html>
