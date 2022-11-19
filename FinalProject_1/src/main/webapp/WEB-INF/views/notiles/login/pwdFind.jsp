<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
  
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
			
		});
		
	});// end of $(document).ready(function(){})---------------
	
	
	// 모달창에 입력한 input 태그 value 값 초기화 시키기
	function func_form_reset_empty() {  // 입력란에 있는 값 비워주는 메소드
		document.querySelector("form[name='pwdFindFrm']").reset();  // 해당 form 태그 초기화시키기
	}

</script>    
    
<form name="pwdFindFrm">

	<ul style="list-style-type: none">
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 90px; margin-left: 18px;">이름</label>
	       <input type="password" name="password" id="password" size="25" placeholder="이름" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	    </li>
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 90px; margin-left: 18px;">아이디</label>
	       <input type="password" name="password" id="password" size="25" placeholder="아이디" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	    </li>
	    <li style="margin: 10px 0 7px 0">
	       <label for="password" style="display: inline-block; width: 90px; margin-left: 18px;">이메일</label>
	       <input type="password" name="password" id="password" size="25" placeholder="이메일" autocomplete="off" required />  <!-- label 태그의 for값 == input 태그의 id값 -->
	       <%-- <span class="error text-danger">이메일 형식에 맞지 않습니다.</span> --%>
	    </li>
	</ul>

	<div class="text-center">
		<button type="button" class="btn btn-success" id="btnFind">확인</button>
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
