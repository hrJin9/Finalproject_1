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

<style type="text/css">

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	*{
		font-family: Pretendard-Regular;	
		color: #404040;
	}
	
	form {
		margin-left: 155px;
	}
	
	
	form > input, form > select {
		border: 1.5px solid #cccccc;
		border-radius: 3.5px;
		width: 75%;
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
	   
	});// end of $(document).ready(function(){})-----------------------------	

</script>
</head>
<body>
<div class="container col-md-6">
  
	<div class="col-md-6">
    	<h2 style="font-weight: bold; font-size: 24pt; padding: 43px 0 32px 140px;">회원가입</h2>
    </div>  
  
	<div class="collapse show">
		<form name="registerFrm">
			<div>이름</div>
			<input id="name" type="text" class="required" name="name" size="50" placeholder="이름 입력" />
			
			<div>아이디</div>  <%-- 사번으로 입력 --%>
			<input id="userid" type="text" class="required" name="userid" size="50" placeholder="아이디 입력" />
			<%--<button type="button" id="idCheck">중복확인</button>
			<span id="idcheckResult" class="error" style="color: red">아이디는 영문소문자/숫자로 된 4~16자로 입력하세요.</span> --%>
  	  			
			<div>비밀번호<span style="font-size: 9pt; color: #666666; margin-left: 15px;">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</span></div>
			<input id="passwd" type="password" class="required" name="passwd" size="50" placeholder="비밀번호 입력" />
			<%-- <span class="error" style="color: red">비밀번호는 8자~15자 영문,숫자,특수문자로 입력하세요.</span> --%>
		
			<div>비밀번호확인</div>
			<input id="passwdCheck" type="password" class="required" name="passwdCheck" size="50" placeholder="비밀번호 확인" />
			<%-- <span class="error" style="color: red">암호가 일치하지 않습니다.</span> --%>
			
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
		</form>
	</div>    
   
	<div class="text-center" id="register" style="display: block;"> 
		<input type="button" id="btnRegister" onclick="goRegister()" value="가입하기" />
	</div>
    
</div>
</body>
</html>	
