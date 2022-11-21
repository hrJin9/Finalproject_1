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
	
	.pwdChangeFrm {
		text-align: center;
	}
	
	li input {
		border: 1.5px solid #cccccc;
		border-radius: 3.5px;
		width: 52%;
		padding: 5px 10px;
		opacity: 0.85;
		font-size: 9pt;
		line-height: 20px;
	}
	
	input:focus {
		border: 1.8px solid #4285f4;
    	outline: none;
	}
	
	label {
		display: inline-block; 
		width: 90px; 
		margin-left: 18px;
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
	    border: 1px solid #4285f4;
		width: 70%; 
		margin-left: 15px;
		margin-top: 90px;
	    padding: 5px;
		background-color: #4285f4;
		color: white;
		font-size: 12pt;
		border-radius: 30px;
	}
	
	#btnChange:hover {
		opacity: 1;
	}

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
		/* right: 81px; */
		box-shadow: 1px 1px 1px 1.3px rgba(0, 0, 0, 0.2);
	}
</style>
  
  
<script type="text/javascript">

	$(document).ready(function(){
	    
		$(".pwdAlert").hide();
		
		$("input#newPassword").click(function(){  // 입력란 클릭시
			$(".pwdAlert").show();
		});
		
		$('html').click(function(e) {   
			if(!$(e.target).hasClass('newPassword')){ 
				$(".pwdAlert").hide();
			}
		});
		// ***** 나중에 8자~15자로 입력과 영문,숫자,특수문자 각 1개 이상 사용의 유효성 검사에 따라 체크표시 색깔 변하도록 하면 될듯 하다. *****
		
		/* $("input#newPassword").keyup(function(){ // 입력란 클릭시
			$(".pwdAlert").hide();
		}); */
		
		
	});// end of $(document).ready(function(){})-------------------------------------
	
	// 모달창에 입력한 input 태그 value 값 초기화 시키기
	function func_form_reset_empty() {  // 비밀번호 입력란에 있는 값 비워주는 메소드
		document.querySelector("form[name='pwdChangeFrm']").reset();  // 해당 form 태그 초기화시키기
		$(".pwdAlert").hide();
	}

</script>    
</head>
<body>    
<form name="pwdChangeFrm">
	<ul style="list-style-type: none">
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 90px; margin-left: 18px;">비밀번호</label>
	       <input type="password" name="password" id="password" size="25" placeholder="현재 비밀번호 입력" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
		   <hr>
	    </li>
	    <li style="margin: 10px 0 6px 0;">
	       <label for="password">새 비밀번호</label>
	       <input type="password" class="newPassword" name="newPasswd" id="newPassword" size="25" placeholder="새 비밀번호" autocomplete="off" required />
	    </li>
	    <li>
	       <label for="password"></label>
	       <input type="password" name="newPasswdCheck" id="newPasswordCheck" size="25" placeholder="새 비밀번호 확인" autocomplete="off" required />
	    </li>
   </ul>

	<div class="text-center">
		<button type="button" class="btn btn-success" id="btnChange">변경하기</button>
    </div>
</form>

    <div class="pwdAlert" style="z-index: 9999;">
		<i class="fas fa-check-circle" style="color: #8c8c8c; margin-right: 7px; font-size:8pt;"></i>
		<span id="alertText" style="color: #cccccc;">8자~15자로 입력</span><br>
		<i class="fas fa-check-circle" style="color: #8c8c8c; margin-right: 7px; font-size:8pt;"></i>
		<span id="alertText" style="color: #cccccc;">영문,숫자,특수문자 각 1개 이상 사용</span>
	</div>
</body>
</html>	
