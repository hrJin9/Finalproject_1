<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>  
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/sidebar.css?after">
    
<style type="text/css">
	.sidebar{
		border-right: solid 1px rgba(235,235,235);
	}
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		//사이드바 체크여부검사
		if(localStorage.getItem("sidebar_yn") != null){
			$("#side-expandcx").prop("checked",true);
			$("#menuicon").prop("checked",true);
			$("div#mycontent").css({'width':'88%','margin':'0 auto'});
			$(".sidebar *").css({"transition":"all 0s !important"});
			$("#side-expand").css({"background-color":"#4285f4"});
		}
	   
		
		$(".profile2").click(function(){  // 내프로필 클릭시
			if($(".myprofile").css('display') == 'none' || $(".myprofile").css('display') == '') {
			  $(".myprofile").fadeIn(100);
			  $(".news").fadeOut(100);
			} else {
			  $(".myprofile").fadeOut(100);
			}
		});
		
		$("li#newsIcon").click(function(){ // 새로운 소식 클릭시
			if($(".news").css('display') == 'none' || $(".news").css('display') == '') {
			  $(".news").fadeIn(100);  // 보이기
			  $(".myprofile").fadeOut(100);  // 숨기기
			} else {
			  $(".news").fadeOut(100);
			}
		});

      
		// 비밀번호 변경창 닫기 버튼 클릭 시
		$("button.pwdChangeClose").click(function() {
		   const iframe_pwdChange = document.getElementById("iframe_pwdChange"); // 대상 아이프레임 선택
		   const iframe_window = iframe_pwdChange.contentWindow;
		
		   iframe_window.func_form_reset_empty();
		});
      
      
		<%-- 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기 --%>
		$("input#menuicon").change(function(){
		    if($("#menuicon").is(":checked")){
		        $("div#mycontent").css({'transition':'all 0.5s','width':'88%','margin':'0 auto'});
		    }else{
		        $("div#mycontent").css({'width':'94.6%','transition':'all 0.5s'});
		    }
		});
      
      
		// 서치모달 닫힐 때 초기화
		$('#sideSearch').on('hidden.bs.modal', function () {
			 $('#mwa').attr('src', '<%= request.getContextPath()%>/side/search.up');
			 $("#se-searchicon").removeClass("fas"); $("#se-searchicon").removeClass("fa-chevron-left");
			 $("#se-searchicon").addClass("icon"); $("#se-searchicon").addClass("icon-search");
		});
      
        
		//넓게보기 클릭 이벤트
		$("#side-expand-a").click(function(){
		
			if($("#side-expandcx").is(":checked")){
				$("#side-expandcx").prop("checked",false);
				$("#menuicon").prop("checked",false);
				$("div#mycontent").css({'width':'94.6%','transition':'all 0.5s'});
				$("#side-expand").css({"background-color":"","transition":"all 0.5s"});
				localStorage.removeItem("sidebar_yn");
			} else {
				$("#side-expandcx").prop("checked",true);
				$("#menuicon").prop("checked",true);
				$("div#mycontent").css({'transition':'all 0.5s','width':'88%','margin':'0 auto'});
				$("#side-expand").css({"background-color":"#4285f4","transition":"all 0.5s"});
				localStorage.setItem("sidebar_yn","1");
			}
        	
        	
        	
        	<%-- 
        	//입력값을 session에 저장하기
    		$.ajax({
    			url: "<%=ctxPath%>/sbcheck.up",
    			type:"post",
    			data:{"sidebar_yn":sidebar_yn},
    			dataType:"json",
    			success:function(json){
    			},
    			error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
    			
    		});//end of ajax
    		 --%>
		});
        
        
        
	});// end of $(document).ready(function(){})---------------
	
	$(document).mouseup(function(e){
		if( !(($(".news").has(e.target).length))){
		    $(".news").fadeOut(100);
		}
		if( !(($(".myprofile").has(e.target).length))){
		     $(".myprofile").fadeOut(100);
		}
	});
   
   
	// 검색Modal에서 검색어를 입력할 때 get방식으로 검색어값을 보내기 ==> 이방법 아니면 ajax를 써보기
	// ajax 쓰려면 modal body를 iframe 쓰지 말고 (sidebar_search.jsp)내용을 그냥 갖다붙여서 써도,, ㄱㅊ을듯.. 따로 파일을 빼던가.. 
	function searchSrc(){
		//검색어 내용 알아오기
		var inputval = $("#ss-input").val();
		
		// iframe의 주소 변경
		$('#mwa').attr('src', '<%= request.getContextPath()%>/side/search.up?'+inputval);
	 
	}//end of searchSrc

	// sidebar_searchEnd.jsp 에서 아이콘을 바꾸기 위한 함수
	function sse_changeIcon(){
		$("#se-searchicon").removeClass("icon"); $("#se-searchicon").removeClass("icon-search");
		$("#se-searchicon").addClass("fas"); $("#se-searchicon").addClass("fa-chevron-left");
		
		$("#se-searchicon").hover(function(){
		 $("#se-icon-outer").css({"background-color":"rgba(230,230,230,0.4)","cursor":"pointer"});
		},function(){
		 $("#se-icon-outer").css({"background-color":"","cursor":""});  
		});
	}
   
   // 원래 아이콘으로 바꾸는 함수
   function sse_originIcon(){
		$("#se-searchicon").removeClass("fas"); $("#se-searchicon").removeClass("fa-chevron-left");
		$("#se-searchicon").addClass("icon"); $("#se-searchicon").addClass("icon-search");
   }
   
</script>

<input type="checkbox" id="menuicon">
  <label for="menuicon">
    <span></span>
    <span></span>
    <span></span>
  </label>
  <div class="sidebar">

    <div class="profile profile2" href="#" style="margin-top: 29px; margin-bottom:30px;">
      <span class="pic">
      	<c:if test="${empty sessionScope.loginuser.profile_systemfilename }">
      		<span>${fn:substring(sessionScope.loginuser.name_kr,1,3)}</span>
      	</c:if>
      	<c:if test="${not empty sessionScope.loginuser.profile_systemfilename}">
      	</c:if>
      </span>
      <span class="my"><span class="name">${sessionScope.loginuser.name_kr}</span><br>
      <span class="role">${sessionScope.loginuser.role}</span>
      </span>
    </div>

    <div class="nav-menu">
      <ul>
        <li class="home" data-bs-toggle="modal" data-bs-target="#sideSearch" data-bs-dismiss="modal" data-bs-backdrop="static"><a href="#" ><span class="icon icon-search"></span><span class="menu-text">검색</span></a></li>
        <li class="home" id="newsIcon"><a href="#" ><span class="icon icon-bell"></span><span class="menu-text">새로운 소식</span>
          <span class="newred"></span>
          <span class="badge" style="border-radius: 6.25rem;"><span class="newCnt">1</span></span></a></li>

        <div style="border: 0.1px solid #f2f2f2; margin:20px;width:120%;position:relative;left:-40px;"></div>
		<div class="sidebar_content">
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/'"><a><span class="icon icon-home"></span><span class="menu-text">홈</span></a></li>
	        <li onclick="javascript:location.href='<%=request.getContextPath()%>/memberList.up'"><a><span class="icon icon-users"></span><span class="menu-text">구성원</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/calendar.up'"><a><span class="icon icon-calendar"></span><span class="menu-text">캘린더</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/message.up'"><a><span class="icon icon-envelop"></span><span class="menu-text">메시지</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/attendance.up'"><a><span class="icon icon-alarm"></span><span class="menu-text">근무</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/approval.up'"><a><span class="icon icon-file-text2"></span><span class="menu-text">결재</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/payroll.up'"><a><span class="icon icon-coin-dollar"></span><span class="menu-text">급여</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/board_all.up'"><a><span class="icon icon-pencil2"></span><span class="menu-text">게시판</span></a></li>
	        
	        <%-- 관리자로 로그인했을경우에만 --%>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_insight.up'"><a><span class="icon icon-stats-dots"></span><span class="menu-text">인사이트</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_login.up'"><a><span class="icon icon-history"></span><span class="menu-text">로그관리</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_memberList.up'"><a><span class="icon icon-user-tie"></span><span class="menu-text">구성원관리</span></a></li>
	        <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_payroll.up'"><a><span class="icon icon-magic-wand"></span><span class="menu-text">급여정산</span></a></li>
     		</div>
      </ul> 
    </div>
  </div>
  
  <div id="list-example" class="list-group myprofile" style="display:none; width: 200px; border-radius: 10px; position: fixed; top: 13.5%; left: 1%; z-index: 100; box-shadow: 0px 15px 20px 0px rgba(0,0,0,0.1);">
     <a class="list-group-item list-group-item-action" href="<%= request.getContextPath()%>/myInfo_hr.up" style="font-size: 14px; cursor: pointer;">
        <i class="far fa-user-circle" style="padding-right: 8px; font-size: 11pt;"></i>
        <span style="font-weight: bold; font-size: 9pt; margin-bottom: 3.5px;">내 프로필</span><br>
        <span style="font-size: 8.5pt; color: #737373;">${sessionScope.loginuser.email}</span><br>
        <span style="font-size: 8.5pt; color: #737373; padding-bottom: 3px; ">${sessionScope.loginuser.role}</span><br>
       </a>
     <a id="side-expand-a" class="list-group-item list-group-item-action" style="font-size: 9pt; cursor: pointer;">
        <i class="icon icon-enlarge" style="color: #666666; padding-right: 8px; font-size: 10pt; position:relative; top:1px;"></i>넓게보기
        <div id="side-expand"><input type="checkbox" id="side-expandcx" style="display: none;"/><label for="side-expandcx"></label></div>
     </a>
     <a class="list-group-item list-group-item-action" style="font-size: 9pt; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#userPwdChange" data-bs-dismiss="modal" data-bs-backdrop="static">
        <i class="fas fa-key" style="color: #666666; padding-right: 8px; font-size: 10pt;"></i>비밀번호 변경
     </a>
     <a class="list-group-item list-group-item-action" href="<%= ctxPath%>/logout.up" style="font-size: 9pt; color: #F24B17; cursor: pointer;"><i class="fas fa-sign-out-alt" style="transform: scaleX(-1); transition: .3s; padding-left: 8px; font-size: 10pt;"></i>로그아웃</a>
  </div>
    
    
   <div class="news" style="display:none; box-shadow: 0px 15px 20px 0px rgba(0,0,0,0.1);">
      <div style="font-size: 11.5pt; color: #595959; font-weight: bold; padding-bottom: 30px;">새로운 소식
         <button style="margin-left: 90px; border: none; font-size: 8pt; font-weight:bold; border-radius: 3px; background-color:#3B86C812; color: #2E5E87; padding: 5px 8px;">모두읽음</button>
      </div>
      <div>
         <span class="newsIcon" style="font-size: 9pt; position: relative; display: inline-block;">
            <span class="newred2"></span>
            <span class="icon icon-bell" style="color: #ffffff; position: absolute; left: 0px; bottom: 9px; font-size: 9pt;"></span>
         </span>
         <span style="padding-left:15px; position:relative; top:1px;">
            <span style="font-size:8pt; font-weight:bold; color:#595959; display: inline-block;">'비품신청'의 승인이 완료되었어요.<br>
            <span style="font-size:6pt; font-weight:bold; color: #a6a6a6;">7일 전</span></span>
         </span>
      </div>
   </div>
    
    
    
    <%-- **** 비밀번호 변경 Modal **** --%>
    <div class="modal fade" id="userPwdChange" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> <%-- 아이디찾기 a 태그의 data-target="#userPwdFind" data-dismiss="modal" 와 매핑됨. --%>
     <div class="modal-dialog">
       <div class="modal-content">
         <!-- Modal header -->
         <button type="button" class="btn-close pwdChangeClose" data-bs-dismiss="modal" style="margin: 30px 0px 10px 425px; font-size: 12pt;"></button>
         
         <!-- Modal body -->
         <div class="modal-body">
         <h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 변경</h4><br>
         <div id="pwdChange">
            <iframe id="iframe_pwdChange" style="border: none; width: 100%; height: 340px;" src="<%= request.getContextPath()%>/pwdChange.up"></iframe>
         </div>
         </div>
         
       </div>
     </div>
   </div>
   
   
   
   <%-- **** 검색 Modal **** --%>
	<div class="modal fade" id="sideSearch" aria-hidden="true" aria-labelledby="mw-address-label" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="display: flex;">
					<span id="se-icon-outer" style="margin: 4px 0 0 10px; color: rgba(0,0,0,0.7); padding: 5px 10px; border-radius: 10px;"><i id="se-searchicon" class="icon icon-search"></i></span>
					<div style="display: inline-block;">
						<input id="ss-input" type="text" placeholder="검색어 입력"/>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
			  		<div id="mwa-container">
						<iframe id="mwa" style="border: none; width: 100%; height: 250px;" src="<%= request.getContextPath()%>/side/search.up"></iframe>
					</div>
			  	</div>
			</div>
		</div>
	</div>