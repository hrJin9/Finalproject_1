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
		font-weight: 500;		
	}
	
	form#login_frm {
	  	padding: 65px 0;
	    margin: 0 auto;
	    margin-top: 40px;
	    margin-bottom: 40px;
	    border-top: 0;
	}
	
	/* 로그인폼 내용 전체 */
	div#login_box{
		width:350px;
	}
	
	/* 아이디, 비밀번호 박스*/
 	div#input_login > input {
		border: 2px solid #dbdbdb;
		width: 99%;
		padding: 10px 30px;
		margin: 3px 0;
		opacity: 0.85;
		border-radius: 20px;
		font-size: 10pt;
		line-height: 20px;
	} 
	
	div#input_login > input:focus {
    	outline: none;
		border: 2px solid transparent;
		background-image: linear-gradient(white, white), linear-gradient(60deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
    	background-origin: border-box;
    	background-clip: padding-box, border-box;
	}
	
	div#input_login > input::placeholder {
		color: #999999;
	}
	
	div#input_loginhover,
	button#btn_submit:hover {
	 	opacity: 1;
	}
	
	/* 계정 저장, 비번 및 아이디찾기 */
	div#idPwdSave,
	div#pwdFind, div#register {
		font-size: 10pt;
		color: rgba(36, 42, 48, 0.48);
		font-weight: 600;
	}

	/* 로그인 버튼 */
	button#btn_submit {
		border-style: none;
		width: 99%;
	    height: 45px;
	    opacity: 0.9;
		padding: 12px;
		font-size: 13pt;
		line-height: 20px;
	    border-radius: 20px;
	    border-style: none;
	    background-image: linear-gradient(40deg, rgb(0 101 204) 7.04%, rgb(120 215 255) 100%);
	    border: rgb(0 101 204) solid 1px;
	    font-weight: 600;
	    cursor: pointer;
	    color: white;
		/* margin-bottom: 5px; */
	}
	
	#btn_register {
		border-style: none;
		background-color: #ffffff;
		color: rgba(36, 42, 48, 0.48);;
		font-size: 10pt;
	}
	
	
	#id_save_find label, #id_save_find a{
		font-weight: 600;
	}
	
	#idPwdSave * {
		cursor: pointer;
	}
	
</style>

<script type="text/javascript">
	
$(document).ready(function(){
	
	//계정정보 저장했을때
	if(localStorage.getItem("saveid") != null){
		$("input#loginUserid").val(localStorage.getItem("saveid"));
		$("input#saveid").prop("checked",true);
	}
	
	// 패스워드 엔터시
	$("#loginPwd").keyup(function(e){
		if(e.keyCode==13){
			goLogin();
		}
	});
	
	// 비밀번호 찾기창 닫기 버튼 클릭 시
	$("button.pwdFindClose").click(function() {
		const iframe_pwdFind = document.getElementById("iframe_pwdFind"); // 대상 아이프레임 선택
		const iframe_window = iframe_pwdFind.contentWindow;

		iframe_window.func_form_reset_empty();
	});
	
	
	$("#pwdFindClose").click(function(){
		$("#iframe_pwdFind").attr("src","<%= request.getContextPath()%>/login/pwdFind.up"); //초기화
	});
	
	
});// end of $(document).ready(function(){})---------------


// 로그인 처리 함수
function goLogin() {

	const loginUserid = $("input#loginUserid").val().trim();
	const loginPwd = $("input#loginPwd").val().trim();

	if (loginUserid == "") {
		//alert("아이디를 입력하세요!");
		$("input#loginUserid").val("");
		$("input#loginUserid").focus();
		return; // 함수 종료
	}

	if (loginPwd == "") {
		//alert("비밀번호를 입력하세요!");
		$("input#loginPwd").val("");
		$("input#loginPwd").focus();
		return; // 함수 종료
	}
	
	// 계정 저장을 체크했을 경우
	if ($("#saveid").prop("checked")) {
		localStorage.setItem("saveid", loginUserid);
	}
	// 계정 저장 체크 해제했을 경우
	else{
		localStorage.removeItem("saveid");
	}
	
	const frm = document.login_frm;
	frm.action = "<%=ctxPath%>/loginEnd.up";
    frm.method = "post";
    frm.submit(); 
}

</script>

</head>
<body> 
<div class="container">

	<%-- **** 로그인 폼 **** --%>
	<form id="login_frm" name="login_frm">
		<div id="login_box" class="d-flex flex-column m-auto">
			<img src="<%= ctxPath%>/resources/images/로고.png" class="logo" width=73% height="230px;" style="margin: 0 0 13px 44px;" alt="...">

			<div id="input_login" class="d-flex flex-column">
				<input type="text" name="userid" id="loginUserid" placeholder="사원번호" required> 
				<input type="password" name="passwd" id="loginPwd" placeholder="비밀번호" required>
			</div>

			<div id="id_save_find" class="w-98 d-flex justify-content-between" style="padding: 8px 11px 10px 3px;">

				<div id="idPwdSave">
					<input id="saveid" type="checkbox" style="position: relative; top:2px; border: 1px solid #c1c1c1; margin: 0 4px 0 2px;" title="계정 저장 선택" />
					<label for="saveid">계정 저장</label>
				</div>
				
				<div id="register">
					<a id="btn_register" href="<%=ctxPath%>/memberRegister.up" style="text-decoration: none; position:relative; left: 63px;">회원가입</a>
				</div>
				
				<div style="display:inline-block; background-color: #dbdbdb; width: 1.5px; height: 15px; margin: auto 0; position: relative; left: 33px;">
				</div>
				
				<div id="pwdFind">
					<a style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#userPwdFind" data-bs-dismiss="modal" data-bs-backdrop="static">
					비밀번호 찾기
					</a>
				</div>
				
				<%-- <div id="userFind">
					<a style="cursor: pointer;" data-toggle="modal" data-target="#userPwdFind" data-dismiss="modal" data-backdrop="static">아이디 찾기 |</a>
					<a style="cursor: pointer;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" data-backdrop="static">비밀번호찾기</a>
				</div> --%>

			</div>

			<div class="d-flex flex-column">
				<button type="button" id="btn_submit" onclick="goLogin()">로그인</button>
			</div>
		</div>
	</form>
	
	
	<%-- **** 비밀번호 찾기 Modal **** --%>
	<div class="modal fade" id="userPwdFind" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="background-color: rgba(240, 240, 240, 0.85);"> <%-- 아이디찾기 a 태그의 data-target="#userPwdFind" data-dismiss="modal" 와 매핑됨. --%>
	  <div class="modal-dialog" style="top: 15%;">
	    <div class="modal-content" style="border:none;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 4%), 0px 24px 72px rgb(36 42 48 / 30%);">
	      <!-- Modal header -->
	      <div class="modal-header" style="border-bottom: solid 1px rgba(36, 42, 48, 0.06);">
			<h4 class="modal-title" id="modarTitle" style="font-weight: 800; color: #595959; margin: 2px 10px;">비밀번호 찾기</h4>
			<button id="pwdFindClose" type="button"  class="pwdFindClose btn" data-bs-dismiss="modal" style="transition: transform 0.1s ease 0s;border: none;background-color: transparent;">
			<svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 26px; height: 26px; flex-shrink: 0;">
			<path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21ZM15.5303 15.5303C15.2374 15.8232 14.7626 15.8232 14.4697 15.5303L12.0001 13.0607L9.53033 15.5304C9.23744 15.8233 8.76256 15.8233 8.46967 15.5304C8.17678 15.2376 8.17678 14.7627 8.46967 14.4698L10.9394 12.0001L8.46968 9.53033C8.17679 9.23744 8.17679 8.76256 8.46968 8.46967C8.76257 8.17678 9.23745 8.17678 9.53034 8.46967L12.0001 10.9394L14.4697 8.46978C14.7626 8.17689 15.2374 8.17689 15.5303 8.46978C15.8232 8.76268 15.8232 9.23755 15.5303 9.53044L13.0607 12.0001L15.5303 14.4697C15.8232 14.7626 15.8232 15.2374 15.5303 15.5303Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd">
			</path></svg></button>
			<!-- 
			<button type="button" class="btn-close pwdFindClose" data-bs-dismiss="modal" style="margin: 30px 0px 10px 425px; font-size: 12pt;"></button>
			 -->
		</div>
	      <!-- Modal body -->
	      <div class="modal-body">
			<!-- 
			<h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 찾기</h4><br>
			 -->
			   <div id="pwdFind">
		      	  <iframe id="iframe_pwdFind" style="border: none; width: 100%; height: 340px;" src="<%= request.getContextPath()%>/login/pwdFind.up"></iframe>
			   </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
</div>
</body>
</html>