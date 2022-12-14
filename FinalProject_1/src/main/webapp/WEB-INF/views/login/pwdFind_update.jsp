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
	
	.pwdChangeFrm {
		text-align: center;
	}
	
	li input {
		border: 1.5px solid #cccccc;
		border-radius: 3.5px;
		width: 66%;
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
		margin-left: 5px;
		margin-right: 25px;
		font-size: 10pt;
		font-weight: bold;
	}
	
	hr {
		width: 90%;
		margin: 10px 0 0 15px;
		color: #f2f2f2;
		opacity: 0.3;
	}
	
	#btnChange {
		width:70%; 
		margin-left: 15px;
	    padding: 5px;
		background-image: linear-gradient(40deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
		border: rgb(0 101 204) 1px solid;
		color: white;
		font-size: 12pt;
		border-radius: 5px;
	}
	
	#btnChange:hover {
		opacity: 1;
	}
/* 
	.pwdAlert {
		width: 185px; 
		height: 48px; 
		background-color: #4d4d4d; 
		font-weight: bold; 
		font-size:7pt; 
		border-radius: 3.5px; 
		padding: 9px;
		position: fixed; 
		top: 98px;
		right: 0;
		right: 81px;
		box-shadow: 1px 1px 1px 1.3px rgba(0, 0, 0, 0.2);
	}
	 */
	#btnReset{
	    border: solid 1px #dbdbdb;
	    font-size: 11pt;
	    color: rgba(36, 42, 48, 0.48);
	    width: 15%;
        margin: 0px 10px 0 15px;
	}
</style>
  
  
<script type="text/javascript">

$(document).ready(function(){
    
	$(".error").hide();
	
	// ***** 나중에 8자~15자로 입력과 영문,숫자,특수문자 각 1개 이상 사용의 유효성 검사에 따라 체크표시 색깔 변하도록 하면 될듯 하다. *****
	
	/* $("input#newPassword").keyup(function(){ // 입력란 클릭시
		$(".pwdAlert").hide();
	}); */
	
	$("#modarTitle",parent.document).text("비밀번호 변경");
	
	$("#btnReset").click(function(){
		$("#pwdFindClose",parent.document).trigger("click");
	});
	
	
});// end of $(document).ready(function(){})-------------------------------------

// 모달창에 입력한 input 태그 value 값 초기화 시키기
function func_form_reset_empty() {  // 비밀번호 입력란에 있는 값 비워주는 메소드
	document.querySelector("form[name='pwdChangeFrm']").reset();  // 해당 form 태그 초기화시키기
	$(".error").hide();
	$("#pwdalert").css("color","#666666");
}


// 비밀번호 변경하기
function changePwd(){
	//비밀번호 유효성 검사하기
	const pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/
	const pwd = $("#passwd").val().trim();
	if(!pwdReg.test(pwd)){
		$("#passwd").focus();
		$("#pwdalert").css("color","#4285f4");
		return;
	} else {
		$("#pwdalert").css("color","#666666");
	}
	
	//비밀번호 확인값이 같은지 확인하기
	const pwdchx = $("#passwdChx").val().trim();
	if(pwd != pwdchx){
		$("#passwdChx").focus();
		$(".pwdchxAlert").show();
		return;
	} else {
		$(".pwdchxAlert").hide();
	}
	
	
	// 비밀번호 변경해주기
	$.ajax({
		url:"<%= ctxPath%>/pwdFindEnd.up",
		type:"post",
		data:$("#pwdChangeFrm").serialize(),
		dataType:"json",
		success:function(json){
			if(json.n == 1){
				alert("비밀번호가 변경되었습니다.");
				parent.$("#userPwdFind").modal('hide');
				parent.$("#iframe_pwdFind").attr("src","<%= request.getContextPath()%>/login/pwdFind.up"); // 초기화
			}
		}
	});
	
	
}//end changePwd


</script>  
  
</head>
<body> 
<form id="pwdChangeFrm" name="pwdChangeFrm">
	<!-- Modal header -->
	<!-- 
	<button type="button" class="btn-close pwdFindClose" data-bs-dismiss="modal" style="margin: 30px 0px 10px 425px; font-size: 12pt;"></button>
     -->
    <!-- 
    <h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 변경</h4><br>
	 -->
	<ul style="list-style-type: none">
	<!-- 
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 90px; margin-left: 18px;">비밀번호</label>
	       <input type="password" name="password" id="password" size="25" placeholder="임시 비밀번호 입력" autocomplete="off" required />  label 태그의 for값 == input 태그의 id값
		   <hr>
	    </li>
	     -->
	    <li style="margin: 10px 0 6px 0;">
	       <label for="password">새 비밀번호</label>
	       <input type="password" class="newPassword" name="passwd" id="passwd" size="25" placeholder="새 비밀번호" autocomplete="off" required />
	       <div id="pwdalert" class="pwdAlert" style="font-size: 9pt; color: #666666; margin-left: 125px;">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</div>
	    </li>
	    <li>
	       <label for="password"></label>
	       <input type="password" id="passwdChx" size="25" placeholder="새 비밀번호 확인" autocomplete="off" required />
	       <div class="error pwdchxAlert" style="font-size: 9pt; color: #4285f4; margin-left: 138px;">암호가 일치하지 않습니다.</div>
	    </li>
   </ul>

	<div class="text-center">
		<button type="reset" class="btn" id="btnReset">취소</button>
		<button type="button" class="btn" id="btnChange" onclick="changePwd()">변경하기</button>
    </div>
    <input type="hidden" name="employee_no" value="${requestScope.employee_no}"/>
</form>
<!-- 
    <div class="pwdAlert" style="z-index: 9999;">
		<i class="fas fa-check-circle" style="color: #8c8c8c; margin-right: 7px; font-size:8pt;"></i>
		<span id="alertText" style="color: #cccccc;">8자~15자로 입력</span><br>
		<i class="fas fa-check-circle" style="color: #8c8c8c; margin-right: 7px; font-size:8pt;"></i>
		<span id="alertText" style="color: #cccccc;">영문,숫자,특수문자 각 1개 이상 사용</span>
	</div>
	 -->
</body>
</html>	
	