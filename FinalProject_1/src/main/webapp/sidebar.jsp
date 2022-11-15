<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">



	/* 메인 상단 */
	#boardList a:hover{
		color: #949DA6;
		cursor: pointer;
	}
	
	#boardList {
	  position: relative;
	  display: flex;
	  width: 640px;
	  margin: 4em auto;
	  font-size: 10pt;
	  margin: 5px 0 0 5px;
	}
	
	#boardList a {
		display: block;
		width: 12%;
		padding: .75em 0;
		color: #333;
		text-decoration: none;
		text-align: center;
		color: #D2D6D9;
	}
	
	.boardList_underline {
		position: absolute;
		left: 0;
		bottom: 0px;
		width: 8%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-left: 2%;
	}
	
	#boardList a:nth-child(1).boardList_iscurrent ~ .boardList_underline {
	  left: 0;
	}
	#boardList a:nth-child(2).boardList_iscurrent ~ .boardList_underline {
	  left: 12%; /* a태그의 width랑 margin-left랑 합친거 */
	}
	#boardList a:nth-child(3).boardList_iscurrent ~ .boardList_underline {
	  left: 24%; /* width랑 margin-left랑 합친거 */
	}
	#boardList a:nth-child(4).boardList_iscurrent ~ .boardList_underline {
	  left: 36%; /* width랑 margin-left랑 합친거 */
	}
	#boardList a:nth-child(1):hover ~ .boardList_underline {
	  left: 0;
	}
	#boardList a:nth-child(2):hover ~ .boardList_underline {
	  left: 12%;
	}
	#boardList a:nth-child(3):hover ~ .boardList_underline {
	  left: 24%;
	}
	#boardList a:nth-child(4):hover ~ .boardList_underline {
	  left: 36%;
	}
	
	
	div.sidebar{
	  width: 175px;
	  height: 100%;
	  background-color: rgb(249, 250, 250);
	  position: fixed;
	  top: 0;
	  left: -110px;
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
	  /* margin: 30px; */
	  width:30px;
	  height: 10px;
	  position: fixed;
	  bottom:30px;
	  left:28px;
	  /* bottom: calc(50%-25px); */
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
	
	
	ul{
	  padding-left: 5px;
	}
	li:hover, .profile:hover{
	  background-color: rgb(244, 244, 244);
	}
	
	li{
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
	a, a:hover {
	text-decoration: none !important; }
	
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
	  padding: 0 13px;
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
	  top: 5.5px;
	  font-size: 13px;
	}
	.role{
	  font-size: 5px;
	  position: relative;
	  color: #ababab;
	}
	.name{
	  font-weight: bold;
	}
	.badge{
	  background-color: rgb(242, 75, 23);
	  width: 14px;
	  height: 12px;
	  font-size: 5px;
	  font-weight: 600;
	  color: #fbfbfb;
	  border-radius: 20px;
	  display: inline-block;
	  position: relative;
	  bottom: 2.3px;
	  left: 18px;
	  box-shadow: inset 0px 0px 0px 1px rgba(0, 0, 0, 0.04);
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
	/* .newCnt{
	  position: relative;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  flex-shrink: 0;
	  isolation: isolate;
	} */
	.newbadge{
	  background-color: #dc3545;
	  width: 12px;
	  height: 12px;
	  display:inline-block;
	  border-radius: 1px;
	  position: relative;
	  left:10px; 
	  color:white;
	  font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center;
	  position: relative;
	  margin-right: 20px;
	}
	.titlefirst{
		font-weight: 800;
		font-size:11.5pt;
		padding-top:5px;
		padding-bottom: 9px;
	}
	.categorybadge{
	  background-color: #30353f;
	  padding: 1px 15px;
	  padding-top:3px;
	  font-size:7pt;
	  font-weight:bold;
	  width: auto;
	  height: 21px;
	  display:inline-block;
	  border-radius: 10px;
	  position: relative;
	  margin-right: 15px;
	  /* top:-2px;
	  left:10px; */ 
	  color:white;
	  /* font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center; */
	}
	.teamname{
	  position: relative;
	  top:2px;
	  margin-right: 15px;
	}
	.writedate{
	  position: relative;
	  top:2px;
	  color:#bfbfbf;
	}
	.icon-star-full{
		color:#ffc107;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
		top:12px;
	}
	.icon-star-empty{
		color:#bfbfbf;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
		top:12px;
	}
	a.icon:hover {
		color: #ffc107;
	}
	.title:hover{
		cursor: pointer; 
		text-decoration: underline;
	}
	img.boardprofile{
		border: 0px;
		border-radius: 20px;
		background-color: #D2D6D9;
	 
	}
</style>

</head>
<body>
<input type="checkbox" id="menuicon">
  <label for="menuicon">
    <span></span>
    <span></span>
    <span></span>
  </label>
  <div class="sidebar">

    <div class="profile" href="#" style="margin-top: 20px;margin-bottom:30px;">
      <span class="pic"><span>지은</span></span>
      <span class="my"><span class="name">김지은</span><br>
      <span class="role">개발자</span>
      </span>
    </div>

    <div class="nav-menu">
      <ul>
        <li class="home"><a href="#" ><span class="icon icon-search"></span><span class="menu-text">검색</span></a></li>
        <li class="home"><a href="#" ><span class="icon icon-bell"></span><span class="menu-text">새로운 소식</span>
          <span class="newred"></span>
          <span class="badge"><span class="newCnt">1</span></span></a></li>

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
</body>
