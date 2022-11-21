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
	
	.pwdFindFrm {
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
	
	#btnFind {
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
	
	#btnFind:hover {
		opacity: 1;
	}

</style>
  
  
<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnFind").click(function(){
			location.href= "<%= ctxPath%>/login/pwdFind_update.up"; 
		});
		
	});// end of $(document).ready(function(){})---------------
	
	
	// 모달창에 입력한 input 태그 value 값 초기화 시키기
	function func_form_reset_empty() {  // 입력란에 있는 값 비워주는 메소드
		document.querySelector("form[name='pwdFindFrm']").reset();  // 해당 form 태그 초기화시키기
	}

</script>    
 
</head>
<body>   
<form name="pwdFindFrm">
	<!-- 
	<h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 찾기</h4><br>
	 -->
	<ul style="list-style-type: none">
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 90px; margin-left: 18px;">이름</label>
	       <input type="password" name="password" id="password" size="25" placeholder="이름" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	    </li>
	    <li style="margin: 10px 0 7px 0">
	       <label for="userid" style="display: inline-block; width: 90px; margin-left: 18px;">아이디</label>
	       <input type="text" name="userid" id="userid" size="25" placeholder="아이디" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	    </li>
	    <li style="margin: 10px 0 7px 0">
	       <label for="email" style="display: inline-block; width: 90px; margin-left: 18px;">이메일</label>
	       <input type="text" name="email" id="email" size="25" placeholder="이메일" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	       <%-- <span class="error text-danger">이메일 형식에 맞지 않습니다.</span> --%>
	    </li>
	</ul>

	<div class="text-center">
		<button type="button" class="btn btn-success" id="btnFind" >확인</button>
    </div>
    
    <%--
    <div class="my-3" id="div_findResult">
		<p class="text-center">
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
		</p>
	</div>
    --%>
</form>
</body>
</html>
