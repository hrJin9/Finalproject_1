<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>  
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
    
<style type="text/css">

   @font-face {
     font-family: 'Pretendard-Regular';
     src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
     /* font-weight: 400; */
     /* font-style: normal; */
   }
   body{
     /* font-size: 9pt; */
     font-family: 'Pretendard-Regular';
   }
   div.sidebar{
     width: 186px;
     height: 100%;
     background-color: rgb(249, 250, 250);
     position: fixed;
     top: 0;
     left: -104px;
     z-index: 1;
     transition: all .35s;
     padding: 26px 10px 24px 13px;
     display: flex;
     flex-direction: column;
     height: 100%;
   }
   input#menuicon:checked + label + div{
     left:0;
   }
   input#menuicon + label{
     display: block;
     width:30px;
     height: 10px;
     position: fixed;
     bottom:30px;
     left:31px;
     transition: all .35s;
     cursor: pointer;
     z-index: 2;
   }
   input#menuicon:checked + label{
     z-index: 2;
     /* left: 200px; */
   }
   
   input#menuicon{display: none;}
   input#menuicon + label span{display: block;position: absolute;width: 50%;height: 2px;border-radius: 30px;background-color: rgb(214, 214, 214);transition: all .35s;}
   input#menuicon + label span:nth-child(1){top: 0;}
   input#menuicon + label span:nth-child(2){top: 50%;transform: translateY(-50%);}
   input#menuicon + label span:nth-child(3){bottom: 0;}
   /* input#menuicon:checked + label{z-index: 2;} */
   /* input#menuicon:checked + label span{background-color: #fff;} */
   input#menuicon:checked + label span:nth-child(1){top: 50%;transform: translateY(-50%) rotate(45deg);}
   input#menuicon:checked + label span:nth-child(2){opacity: 0;}
   input#menuicon:checked + label span:nth-child(3){bottom: 50%;transform: translateY(50%) rotate(-45deg);}
   
   /* 확장시 아이콘만 보이게 */
   input#menuicon + label + div > div>ul>li>a>span.menu-text, 
   input#menuicon:checked + label + div > div>ul>li>a>span.newred, 
   input#menuicon + label + div > div>ul>li>a>span.badge, 
   input#menuicon + label + div > div.profile > span.my
   {opacity: 0;transition: all .1s;cursor: default;}
   
   input#menuicon:checked + label + div > div>ul>li>a>span.menu-text,
   input#menuicon + label + div > div>ul>li>a>span.newred,
   input#menuicon:checked + label + div > div>ul>li>a>span.badge
   {opacity: 100;transition: all .5s;cursor: pointer;}
   input#menuicon:checked + label + div > div.profile > span.my
   {opacity: 100;transition: all 1.7s;}
   
   input#menuicon:checked + label + div > div>ul>li {
     cursor: pointer;width: 100%;}
   
   input#menuicon + label + div > div>ul>li>a:nth-child(1){position:relative;right: -105px;transition: all .35s;}
   input#menuicon + label + div > div.profile > span.pic{position:relative;right: -98px;transition: all .35s;}
   input#menuicon:checked + label + div > div>ul>li>a:nth-child(1),
   input#menuicon:checked + label + div > div.profile > span.pic
   {position:relative;right: 0px;transition: all .35s;}
   
   input#menuicon:checked + label + div +div+div.news{
   	position:absolute;
   	left: 143px;
    top: 169px;
    transition: all .35s;
   }
   div#mycontent{
   	  transition':all 0.5s;
   }
   input#menuicon + label + div +div+div.news {
      border: 1px solid #e6e6e6;
      padding: 20px;
      margin-bottom: 22px;
      width: 270px;  
      height: 120px; 
      border-radius: 10px;
      background-color: white;
      display: inline-block;
      float: left;
      font-size: 18pt;
      
      position: absolute; 
      top: 23%;
      left: 3.5%;
      z-index: 2;
      
      overflow:hidden;
      height:auto;
   } 
   .nav-menu ul{
     padding-left: 5px;
   }
   .nav-menu li:hover, .profile:hover{
     background-color: rgb(244, 244, 244);
   }
   
   .nav-menu li{
      cursor: pointer; 
     /* position: absolute; */
     color: inherit;
     border-radius: 8px;
     list-style: none;
     padding: 10px 0 ;
     color: #556372;
   }
   
   /* a {
     -webkit-transition: .3s all ease;
     -o-transition: .3s all ease;
     transition: .3s all ease; } */
   .nav-menu a, .nav-menu a:hover {
   text-decoration: none !important; }
   
   .nav-menu a:hover{
      
   }
   .menu-text{
     color:#556372;
     font-size: 10pt;
     position: relative;
     bottom: 1.1px;
   }
   span.icon{
     padding-left: 10px;
     color:#556372;
     padding-right: 10px;
     font-size: 11.5pt;
   }
   .profile{
     color: inherit;
     border-radius: 8px;
     position: relative;
     cursor: pointer;
     padding: 1px 13px;
     text-align: initial;
     display: flex;
   }
   .pic{
     height: 38px;
	 width: 38px;
     font-size: 9pt;
     position: relative;
     display: flex;
     align-items: center;
     justify-content: center;
     flex-shrink: 0;
     isolation: isolate;
     color: #fbfbfb;
     -webkit-mask-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxwYXRoIGQ9Ik0wLjUgMTAwQzAuNSA3OS40MjM5IDEuNjAzMTcgNjIuOTIzNSA0LjUzMjYyIDQ5Ljc0MjFDNy40NjA4MiAzNi41NjY0IDEyLjIwNzEgMjYuNzM3NSAxOS40NzIzIDE5LjQ3MjNDMjYuNzM3NSAxMi4yMDcxIDM2LjU2NjQgNy40NjA4MiA0OS43NDIxIDQuNTMyNjJDNjIuOTIzNSAxLjYwMzE3IDc5LjQyMzkgMC41IDEwMCAwLjVDMTIwLjU3NiAwLjUgMTM3LjA3NyAxLjYwMzE3IDE1MC4yNTggNC41MzI2MkMxNjMuNDM0IDcuNDYwODIgMTczLjI2MiAxMi4yMDcxIDE4MC41MjggMTkuNDcyM0MxODcuNzkzIDI2LjczNzUgMTkyLjUzOSAzNi41NjY0IDE5NS40NjcgNDkuNzQyMUMxOTguMzk3IDYyLjkyMzUgMTk5LjUgNzkuNDIzOSAxOTkuNSAxMDBDMTk5LjUgMTIwLjU3NiAxOTguMzk3IDEzNy4wNzcgMTk1LjQ2NyAxNTAuMjU4QzE5Mi41MzkgMTYzLjQzNCAxODcuNzkzIDE3My4yNjIgMTgwLjUyOCAxODAuNTI4QzE3My4yNjIgMTg3Ljc5MyAxNjMuNDM0IDE5Mi41MzkgMTUwLjI1OCAxOTUuNDY3QzEzNy4wNzcgMTk4LjM5NyAxMjAuNTc2IDE5OS41IDEwMCAxOTkuNUM3OS40MjM5IDE5OS41IDYyLjkyMzUgMTk4LjM5NyA0OS43NDIxIDE5NS40NjdDMzYuNTY2NCAxOTIuNTM5IDI2LjczNzUgMTg3Ljc5MyAxOS40NzIzIDE4MC41MjhDMTIuMjA3MSAxNzMuMjYyIDcuNDYwODIgMTYzLjQzNCA0LjUzMjYyIDE1MC4yNThDMS42MDMxNyAxMzcuMDc3IDAuNSAxMjAuNTc2IDAuNSAxMDBaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K);
     -webkit-mask-size: contain;
     background-color: #4285f4;
   }
   .my{
     margin-left: 14px;
     position: relative;
     top: 2px;
     font-size: 13px;
   }
   .role{
     font-size: 5px;
     position: relative;
     color: #ababab;
     top: -3px;
   }
   .name{
     font-weight: bold;
   }
   .badge{
	 background-color: rgb(242, 75, 23);
	 padding: 0.5em 0.5em;
	 width: 15px;
	 height: 13px;
	 font-size: 1px;
	 font-weight: 600;
	 color: #fbfbfb;
	 display: inline-block;
	 position: relative;
	 bottom: 4.3px;
	 left: 18px;
	 box-shadow: inset 0px 0px 0px 1px rgb(0 0 0 / 4%);
	}
   .newred{
     background-color: rgb(242, 75, 23);
     width: 5px;
     height: 5px;
     border-radius: 3px;
     display: inline-block;
     position: relative;
     bottom: 10px;
     right: 68px;
   }
   .newCnt{
     font-size: 5pt;
     position: relative;
     top: 0px;
     display: flex;
     align-items: center;
     justify-content: center;
     flex-shrink: 0;
     isolation: isolate;
   }
   
   .newsIcon {
      padding: 15px;
      margin-bottom: 22px;
      width: 18px;  
      height: 18px; 
      border-radius: 10px;
      background-color: #a4c1df;
      display: inline-block;
      float: left;
   } 

   .newred2{
      border: 1px solid white;
      background-color: rgb(242, 75, 23);
      width: 8px;
      height: 8px;
      border-radius: 20px;
      display: inline-block;
      position: relative;
      bottom: 20px;
      left: 10px;
   }
   
   #mycontent{
   	float: right; width: 94.6%; margin: 0 auto;
   }
   
   /* 
   #mycontent{
		margin-left : 3%;
   }
    */
</style>

<script type="text/javascript">

   $(document).ready(function(){
	  // $(".myprofile").hide();
	  // $(".news").hide();
	   
      $(".profile").click(function(){  // 내프로필 클릭시
         // $(".myprofile").toggle();
      	 if($(".myprofile").css("display","none")) {
      		$(".myprofile").css("display","block");
      		$(".news").css("display","none");
      	 } else {
      		 // $(".myprofile").css("display","none");
      		$(".myprofile").toggle();
      	 }
      });
      
     /*  $(".profile").click(function(){  // 내프로필 클릭시
	      if($(".myprofile").css("display","block") ) { // 내프로필 창이 열려있다면
	    	  $("li#newsIcon").click(function(){
	   	         $(".myprofile").css("display","none");
	   	      });
	      }
      }); */
      
      /* $(".profile").click(function(){  // 내프로필 클릭시
	      if($(".myprofile").show()) { // 내프로필 창이 열려있다면
	    	  $("li#newsIcon").click(function(){
	   	         $(".myprofile").hide();
	   	      });
	      }
      }); */
      
      
      $("li#newsIcon").click(function(){ // 새로운 소식 클릭시
          // $(".news").toggle();
    	  if($(".news").css("display","none")) {
       		 $(".news").css("display","block");
       		 $(".myprofile").css("display","none");
       	  } else {
       		 // $(".news").css("display","none");
       		 $(".myprofile").toggle();
       	  }
      });
      
      /* $("li#newsIcon").click(function(){ // 새로운 소식 클릭시
	      if($(".news").css("display","block")) {  // 새로운소식 창이 열려있다면
	    	  $(".profile").click(function(){
	   	         $(".news").css("display","none");
	   	      });
	      }
      }); */
    	  
      /* $("li#newsIcon").click(function(){ // 새로운 소식 클릭시
	      if($(".news").show()) {  // 새로운소식 창이 열려있다면
	    	  $(".profile").click(function(){
	   	         $(".news").hide();
	   	      });
	      }
      }); */
    	  
      
      
      
      
      // 비밀번호 변경창 닫기 버튼 클릭 시
      $("button.pwdChangeClose").click(function() {

         const iframe_pwdChange = document.getElementById("iframe_pwdChange"); // 대상 아이프레임 선택
         const iframe_window = iframe_pwdChange.contentWindow;

         iframe_window.func_form_reset_empty();
      });
      
      
      <%-- 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기 --%>
      $("input#menuicon").change(function(){
          if($("#menuicon").is(":checked")){
              $("div#mycontent").css({'transition':'all 0.5s','width':'87%','margin':'0 auto'});
          }else{
              $("div#mycontent").css({'width':'94.6%','transition':'all 0.5s'});
          }
      });
      
   });// end of $(document).ready(function(){})---------------

</script>

<input type="checkbox" id="menuicon">
  <label for="menuicon">
    <span></span>
    <span></span>
    <span></span>
  </label>
  <div class="sidebar">

    <div class="profile" href="#" style="margin-top: 29px; margin-bottom:30px;">
      <span class="pic"><span>지은</span></span>
      <span class="my"><span class="name">김지은</span><br>
      <span class="role">개발자</span>
      </span>
    </div>

    <div class="nav-menu">
      <ul>
        <li class="home"><a href="#" ><span class="icon icon-search"></span><span class="menu-text">검색</span></a></li>
        <li class="home" id="newsIcon"><a href="#" ><span class="icon icon-bell"></span><span class="menu-text">새로운 소식</span>
          <span class="newred"></span>
          <span class="badge" style="border-radius: 6.25rem;"><span class="newCnt">1</span></span></a></li>

        <div style="border: 0.1px solid #f2f2f2; margin:20px;width:120%;position:relative;left:-40px;"></div>

        <li class="home"><a href="#" ><span class="icon icon-home"></span><span class="menu-text">홈</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-users"></span><span class="menu-text">구성원</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-clipboard"></span><span class="menu-text">스케쥴</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-alarm"></span><span class="menu-text">근무</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-file-text2"></span><span class="menu-text">결재관리</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-coin-dollar"></span><span class="menu-text">급여관리</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-pencil2"></span><span class="menu-text">게시판</span></a></li>
        <li class="member"><a href="#" ><span class="icon icon-cog"></span><span class="menu-text">설정</span></a></li>
      </ul>
    </div>
  </div>
  
  <div id="list-example" class="list-group myprofile" style="display:none; width: 200px; border: 0.2px solid #ffffff; border-radius: 10px; position: fixed; top: 14%; left: 1%; z-index: 1;">
     <a class="list-group-item list-group-item-action" href="#" style="font-size: 14px; cursor: pointer;">
        <i class="far fa-user-circle" style="padding-right: 8px; font-size: 11pt;"></i>
        <span style="font-weight: bold; font-size: 9pt; margin-bottom: 3.5px;">내 프로필</span><br>
        <span style="font-size: 8.5pt; color: #737373;">sawonwldms@gmail.com</span><br>
        <span style="font-size: 8.5pt; color: #737373; padding-bottom: 3px; ">개발자</span><br>
       </a>
     <a class="list-group-item list-group-item-action" style="font-size: 9pt; cursor: pointer;" data-toggle="modal" data-target="#userPwdChange" data-dismiss="modal" data-backdrop="static">
        <i class="fas fa-key" style="color: #666666; padding-right: 8px; font-size: 10pt;"></i>비밀번호 변경
       </a>
     <a class="list-group-item list-group-item-action" href="#" style="font-size: 9pt; color: #F24B17; cursor: pointer;"><i class="fas fa-sign-out-alt" style="transform: scaleX(-1); transition: .3s; padding-left: 8px; font-size: 10pt;"></i>로그아웃</a>
    </div>
    
    
   <div class=news style="display:none;">
      <div style="font-size: 11.5pt; color: #595959; font-weight: bold; padding-bottom: 30px;">새로운 소식
         <button style="margin-left: 90px; border: none; font-size: 8pt; font-weight:bold; border-radius: 3px; background-color:#3B86C812; color: #2E5E87; padding: 5px 8px;">모두읽음</button>
      </div>
      <div>
         <span class="newsIcon" style="font-size: 9pt; position: relative; display: inline-block;">
            <span class="newred2"></span>
            <span class="icon icon-bell" style="color: #ffffff; position: absolute; left: 0.7px; bottom: 9px; font-size: 9pt;"></span>
         </span>
         <span style="padding-left:15px; position:relative; top:1px;">
            <span style="font-size:8pt; font-weight:bold; color:#595959; display: inline-block;">'비품신청'의 승인이 완료되었어요.<br>
            <span style="font-size:6pt; font-weight:bold; color: #a6a6a6;">7일 전</span></span>
         </span>
      </div>
   </div>
    
    
    
    
    
    <%-- **** 비밀번호 변경 Modal **** --%>
   <div class="modal fade" id="userPwdChange">  <%-- 아이디찾기 a 태그의 data-target="#userPwdChange" data-dismiss="modal" 와 매핑됨. --%>
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal header -->
       <button type="button" class="close pwdChangeClose" data-dismiss="modal" style="margin: 20px 0px 10px 380px; font-size: 20pt;">&times;</button>
        
        <!-- Modal body -->
        <h4 class="modal-title" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 변경</h4><br>
        <div class="modal-body">
          <div id="pwdChange">
             <iframe id="iframe_pwdChange" style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath()%>/member/pwdChange.up">
             <%-- <iframe id="iframe_pwdChange" style="border: none; width: 100%; height: 350px;" src="<%= ctxPath%>/WEB-INF/views/tiles/member/pwdChange.jsp"> --%>
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