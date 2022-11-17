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
		border: 2px solid #cccccc;
		width: 99%;
		padding: 10px 30px;
		margin: 3px 0;
		opacity: 0.85;
		border-radius: 20px;
		font-size: 10pt;
		line-height: 20px;
	} 
	
	div#input_login > input:focus {
		border-color:#4285f4;
    	outline: none;
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
	div#pwdFind {
		font-size: 9pt;
		color: #8c8c8c;
		padding: 5px 18px 3px 7px;
	}

	/* 로그인 버튼 */
	button#btn_submit {
		border-style: none;
		width: 99%;
	    height: 45px;
		padding: 12px;
		opacity: 0.85;
		font-size: 13pt;
		line-height: 20px;
	    border-radius: 20px;
	    border-style: none;
	    background-color: #4285f4;
	    color: white;
	    font-weight: bold;
	    cursor: pointer;
		/* margin-bottom: 5px; */
	}
	
	button#btn_register {
		border-style: none;
		background-color: #ffffff;
		text-decoration: underline; 
		color: #4d4d4d;
		padding: 10px 145px;
	}
	
</style>

<script type="text/javascript">
	
	$(document).ready(function(){
	
		// 비밀번호 찾기창 닫기 버튼 클릭 시
		$("button.pwdFindClose").click(function() {
	
			const iframe_pwdFind = document.getElementById("iframe_pwdFind"); // 대상 아이프레임 선택
			const iframe_window = iframe_pwdFind.contentWindow;
	
			iframe_window.func_form_reset_empty();
		});
		
	});// end of $(document).ready(function(){})---------------
	
	
	// 로그인 처리 함수
	function goLogin() {
	
		const loginUserid = $("input#loginUserid").val().trim();
		const loginPwd = $("input#loginPwd").val().trim();

		if (loginUserid == "") {
			alert("아이디를 입력하세요!");
			$("input#loginUserid").val("");
			$("input#loginUserid").focus();
			return; // 함수 종료
		}

		if (loginPwd == "") {
			alert("비밀번호를 입력하세요!");
			$("input#loginPwd").val("");
			$("input#loginPwd").focus();
			return; // 함수 종료
		}
		
		// 계정 저장을 체크했을 경우
		if ($("#saveUser").prop("checked")) {
			localStorage.setItem("saveUser", loginUserid);
			localStorage.setItem("saveUser", loginPwd);
		}
		// 계정 저장 체크 해제했을 경우
		else{
			localStorage.removeItem("saveUser");
		}
		
		<%-- const frm = document.login_frm;
		frm.action = "<%=ctxPath%>/";
	    frm.method = "post";
	    frm.submit(); --%>
	}
	
</script>

<div class="container">

	<%-- **** 로그인 폼 **** --%>
	<form id="login_frm" name="login_frm">
		<div id="login_box" class="d-flex flex-column m-auto">
			<img src="<%= ctxPath%>/images/로고.png" class="logo" width=73% height="230px;" style="margin: 0 0 13px 44px;" alt="...">

			<div id="input_login" class="d-flex flex-column">
				<input type="text" name="userid" id="loginUserid" placeholder="아이디" required> 
				<input type="password" name="passwd" id="loginPwd" placeholder="비밀번호" required>
			</div>

			<div id="id_save_find" class="w-98 d-flex justify-content-between">

				<div id="idPwdSave">
					<input type="checkbox" style="border: 1px solid #c1c1c1; margin: 0 4px 0 2px;" id="saveUser" title="계정 저장 선택" />
					<label for="saveId">계정 저장</label>
				</div>

				<div id="pwdFind">
					<a style="cursor: pointer;" data-toggle="modal" data-target="#userPwdFind" data-dismiss="modal" data-backdrop="static">
					비밀번호찾기
					</a>
				</div>
				
				<%-- <div id="userFind">
					<a style="cursor: pointer;" data-toggle="modal" data-target="#userPwdFind" data-dismiss="modal" data-backdrop="static">아이디 찾기 |</a>
					<a style="cursor: pointer;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" data-backdrop="static">비밀번호찾기</a>
				</div> --%>

			</div>

			<div class="d-flex flex-column">
				<button type="button" id="btn_submit">로그인</button>
				<a href="#"><button type="button" id="btn_register">회원가입</button></a>
			</div>
		</div>
	</form>
	
	
	<%-- **** 비밀번호 찾기 Modal **** --%>
	<div class="modal fade" id="userPwdFind">  <%-- 아이디찾기 a 태그의 data-target="#userPwdFind" data-dismiss="modal" 와 매핑됨. --%>
    <div class="modal-dialog">
      <div class="modal-content">
      
       <!-- Modal header -->
       <button type="button" class="close pwdFindClose" data-dismiss="modal" style="margin: 20px 0px 10px 380px; font-size: 20pt;">&times;</button>
        
       <!-- Modal body -->
       <h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 찾기</h4><br>
       <div class="modal-body">
          <div id="pwdFind">
             <%-- <iframe id="iframe_pwdFind" style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath()%>/login/pwdChange.up"> --%>
             <iframe id="iframe_pwdFind" style="border: none; width: 100%; height: 350px;" src="http://localhost:9090/FinalProject/pwdFind.jsp">
             </iframe>
          </div>
       </div>
        
        <!-- Modal footer -->
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-danger pwdChangeClose" data-dismiss="modal">Close</button>
        </div> -->
      </div>
    </div>
  </div>
	
</div>
