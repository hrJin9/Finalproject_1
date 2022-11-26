<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%> 

<style type="text/css">
	/* 페이지 전체 레이아웃 */
	.main_container {
		width: 88%;
		margin: 0 auto;
	}
	
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
	
	#today{
		margin-top : 20px;
		margin-left : 50px;
		font-size : 12pt;
		height: 360px;
		border: 1px solid #f2f2f2;
		box-shadow: 5px 5px 5px #F3F4F6;
		border-radius : 10px;
		float: left;
	}
	
	.workBtn{
		width: 95%;
		height: 40px;
		border: solid 2px #F3F4F6;
		border-radius: 20px;
		font-size: 10pt;
	}
	
	#goWork{
		background-color: white;
		color: #E0E0E0;
	}
	
	#leaveWork{
		color: gray;
	}
	
	#workStatus{
		width: 100%;
		height: 45px;
		border: solid 2px #F3F4F6;
		border-radius: 15px;
		vertical-align: middle;
	}
	
	#workStatus span{
		position: relative;
		top: 7px;
	}
	
	#workStatus:hover {
		background-color: #F2F2F2;
		border-radius: 15px;
		cursor: pointer;
	}
	
	trWorkStatus:hover td{
		background-color: #F3F4F6;
	}
	
	#working{
		border: solid 1px #DAEEDC;
		border-radius: 5px;
		background-color: #DFF2E0; 
		color:#034007; 
		font-size: 9pt;
		padding: 2px 3px; 
		font-weight: bold; 
		vertical-align: middle;
	}
	
	#workStatusListBox{
		position:relative;
		bottom: 10px;
		
	}
	
	#workStatusListBox, #workStatusChange{
		border: solid 1px #F2F2F2;
		list-style-type: none;
		box-shadow: 5px 5px 5px #F3F4F6;
		border-radius : 5%;
		background-color: white;
		padding: 0;
	}
	
	#workStatusListBox li, #workStatusChange li{
		padding: 10px 7px 7px 10px;
		font-size: 10pt;
	}
	
	#workStatusListBox li:hover, #workStatusChange li:hover{
		background-color : #F2F2F2;
		border-radius: 5px;
		cursor: pointer;
	}
	
	#workStatusChange{
		position: relative;
		bottom: 170px;
		left: 225px;
		background-color: white;
	}
	
	#board{
		margin-top : 20px;
		margin-left : 50px;
		font-size : 12pt;
		height: 400px;
		border: 1px solid #f2f2f2;
		box-shadow: 5px 5px 5px #F3F4F6;
		border-radius : 10px;
	}
	
	.boardTr:hover{
		background-color: #F2F2F2;
		cursor: pointer;
		border-radius: 10%;	
	}
	
	#boardPagingArrow span{
		display: inline-block;
		width: 30px;
		border-radius: 10%;
	}
	#boardPagingArrow span:hover{
		background-color: #F2F2F2;
		cursor: pointer;
	}

	/* 메인 하단 */
	.box {
		border: 1px solid #f2f2f2;
		margin: 100px 200px;   
		padding: 80px;
		width: 250px;  
		height: 500px; 
		border-radius: 10px;
		box-shadow: 5px 5px 5px #F3F4F6;
		position: relative; bottom: 60px; 
	}   
	 .box2 {
		border: 1px solid #f2f2f2;
		margin: 100px 200px;  
		padding: 80px;
		width: 450px;      
		height: 500px;   
		border-radius: 10px;
		box-shadow: 5px 5px 5px #F3F4F6;
	}              
	/* hr {  
		width : 245px; 
		position: relative;
		left: -77px; 
		top: 40px;         
	} */  
	#calendar{
		border: 1px solid #f2f2f2;
		border-radius: 10px;
		box-shadow: 5px 5px 5px #F3F4F6;
		width: 75%; 
		height:auto;  
		font-family: 'Lato', sans-serif;
		position:relative; bottom: 30px; 
	  
	}
	#calendar_weekdays div{
		display:inline-block;
		vertical-align:top;
	}
	#calendar_content, #calendar_weekdays, #calendar_header{
		position: relative;
		width: 320px;
		overflow: hidden;
		float: left;
		z-index: 10;
	}
	#calendar_weekdays div, #calendar_content div{
		width:40px;
		height: 40px;
		overflow: hidden;
		text-align: center;
		background-color: #FFFFFF;
		color: #787878;
	}
	#calendar_content{ 
		-webkit-border-radius: 0px 0px 12px 12px;
		-moz-border-radius: 0px 0px 12px 12px; 
		border-radius: 0px 0px 12px 12px;
	}
	#calendar_content div{
		float: left;
	}
	#calendar_content div:hover{
		background-color: #f2f2f2;
	}
	#calendar_content div.blank{
		background-color: #f2f2f2;
	}
	#calendar_header, #calendar_content div.today{
		zoom: 1;
		filter: alpha(opacity=70);
		opacity: 0.7;
	}
	#calendar_content div.today{
		color: rgb(253, 199, 67);
	}
	#calendar_header{
		width: 100%;
		height: 37px;
		text-align: center;
		background-color: #d9d9d9; 
		padding: 18px 0; 
		-webkit-border-radius: 12px 12px 0px 0px;
		-moz-border-radius: 12px 12px 0px 0px; 
		border-radius: 12px 12px 0px 0px;
	}
	#calendar_header h1{
		font-size: 1.5em;
		color: #black;  
		float:left;
		text-align:center;   
		width:70%; 
		margin-left:80px;   
	}
	i[class^=icon-chevron]{
		color: #f2f2f2;
		float: left;
		width:15%; 
		border-radius: 50%; 
	}   
</style>

<script type="text/javascript">

$(document).ready(function(){
	loopshowNowTime();
	
	$("#workStatusListBox").hide();
	$("#workStatusChange").hide();
	
	$("#workStatus").click(function(){
		$("#workStatusListBox").toggle(); // 이거 왜 안먹는걸까..
	});
	
	$("#changeWorkingStatus").click(function(){
		$("#workStatusChange").toggle();
		$("#workStatusChange").mouseleave(function(){
			$(this).hide();
		});
	});
	
	$(".list_iscurrent").css("color","black");
	$(".boardList_iscurrent").css("color","black");
	
	
	// 컨테츠 아무곳이나 클릭시
	$("div.main_container").mouseup(function(){
		if($(".news").css('display') == 'block') {
            $(".news").fadeOut(100);
        }
		if($(".myprofile").css('display') == 'block') {
            $(".myprofile").fadeOut(100);
        }  // 왜 안먹냐... 
	});	
	
	
	
	
});//end of ready

// 외부 클릭시 닫기
$(document).mouseup(function(e){
	if( !(($("#workStatusListBox").has(e.target).length||$("#workStatusChange").has(e.target).length)) ){
		$("#workStatusListBox").hide();
		$("#workStatusChange").hide();
	}
});//end of mouseup

function showNowTime() {
	var now = new Date();
	var month = now.getMonth() + 1;
	var date = now.getDate();

	var hour = "";
	if (now.getHours() < 10) {
		hour = "0" + now.getHours();
	} else {
		hour = now.getHours();
	}

	var minute = "";
	if (now.getMinutes() < 10) {
		minute = "0" + now.getMinutes();
	} else {
		minute = now.getMinutes();
	}

	var second = "";
	if (now.getSeconds() < 10) {
		second = "0" + now.getSeconds();
	} else {
		second = now.getSeconds();
	}

	var strNow = now.getFullYear() + "년" + month + "월" + date + "일";
	strNow += " " + hour + ":" + minute + ":" + second;

	$("#date").html(strNow);
}// end of function showNowTime() -----------------------------

function loopshowNowTime() {
	showNowTime();

	var timejugi = 1000; // 시간을 1초 마다 자동 갱신하려고.

	setTimeout(function() {
		loopshowNowTime();
	}, timejugi);

}// end of loopshowNowTime() --------------------------

$(function(){function c(){p();var e=h();var r=0;var u=false;l.empty();while(!u){if(s[r]==e[0].weekday){u=true}else{l.append('<div class="blank"></div>');r++}}for(var c=0;c<42-r;c++){if(c>=e.length){l.append('<div class="blank"></div>')}else{var v=e[c].day;var m=g(new Date(t,n-1,v))?'<div class="today">':"<div>";l.append(m+""+v+"</div>")}}var y=o[n-1];a.css("background-color",e).find("h1").text(i[n-1]+" "+t);f.find("div").css("color",e);l.find(".today").css("background-color",e);d()}function h(){var e=[];for(var r=1;r<v(t,n)+1;r++){e.push({day:r,weekday:s[m(t,n,r)]})}return e}function p(){f.empty();for(var e=0;e<7;e++){f.append("<div>"+s[e].substring(0,3)+"</div>")}}function d(){var t;var n=$("#calendar").css("width",e+"px");n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")}function v(e,t){return(new Date(e,t,0)).getDate()}function m(e,t,n){return(new Date(e,t-1,n)).getDay()}function g(e){return y(new Date)==y(e)}function y(e){return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()}function b(){var e=new Date;t=e.getFullYear();n=e.getMonth()+1}var e=480;var t=2013;var n=9;var r=[];var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];var o=["#16a085","#1abc9c","#c0392b","#27ae60","#FF6860","#f39c12","#f1c40f","#e67e22","#2ecc71","#e74c3c","#d35400","#2c3e50"];var u=$("#calendar");var a=u.find("#calendar_header");var f=u.find("#calendar_weekdays");var l=u.find("#calendar_content");b();c();a.find('i[class^="icon-chevron"]').on("click",function(){var e=$(this);var r=function(e){n=e=="next"?n+1:n-1;if(n<1){n=12;t--}else if(n>12){n=1;t++}c()};if(e.attr("class").indexOf("left")!=-1){r("previous")}else{r("next")}})})

</script>

<div class="main_container">
	<div class="row">
		<div id="today" class="col-3">
			<table width="90%" align="center">
				<tr height="60px"><td colspan="2" style="font-size: 15pt; vertical-align: bottom;">Today</td></tr>
				<tr height="40px"><td colspan="2" id="date" style="color: gray; font-size: 10pt;"></td></tr>
				<tr height="60px"><td colspan="2" id="workingtime" style="font-size: 25pt;">
					<span style="font-weight:bold;">4</span>h
					<span style="font-weight:bold;">32</span>m
				</td></tr>
				<tr height="20px" style="font-size: 10pt; color: gray;">
					<td>출근시간</td>
					<td style="text-align: right;">미등록</td>
				</tr>
				<tr height="20px" style="font-size: 10pt; color: gray;">
					<td>퇴근시간</td>
					<td style="text-align: right;">미등록</td>
				</tr>
				<tr height="60px" align="center" style="padding-top:20px;">
					<td align="left"><button type="button" id="goWork" class="workBtn">출근하기</button></td>
					<td align="right"><button type="button" id="leaveWork" class="workBtn">퇴근하기</button></td>
				</tr>
				<tr id="trWorkStatus" height="70px" align="center">
					<td colspan="2">
						<div id="workStatus">
							<span id="working">근무중</span>
							<span style="font-size: 10pt;">7시간 41분</span>
							<span style="float:right; position:relative; right: 20px;"><i class="fa-solid fa-chevron-down" style="font-size: 5pt;"></i></span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<ul id="workStatusListBox" align="left">
							<li id="changeWorkingStatus">
								<span>근무 바꾸기</span>
								<span style="float:right; position:relative; right: 15px;"><i class="fa-solid fa-chevron-right" style="font-size: 5pt;"></i></span>
							</li>
							<hr style="margin: 2px;"/>
							<div style="font-size: 8pt; color: gray; margin: 5px 0 7px 10px;">근무</div>
							<li><span>지금 시작</span></li>
							<li><span>지금 종료</span></li>
						</ul>
					</td>
				</tr>
			</table>
			<ul id="workStatusChange" align="left">
				<div style="font-size: 8pt; color: gray; padding: 10px 0 7px 10px;">현재 근무</div>
				<li><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="15px"/>
					<span style="margin-left:10px;">근무</span>
				</li>
				<hr style="margin: 2px;"/>
				<li>
					<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/oncoming-automobile_1f698.png" width="15px"/>
					<span style="margin-left:10px;">외근</span>
				</li>
				<li>
					<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/laptop_1f4bb.png" width="15px"/>
					<span style="margin-left:10px;">원격 근무</span>
				</li>
				<li>
					<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/spiral-calendar_1f5d3-fe0f.png" width="15px"/>
					<span style="margin-left:10px;">출장</span>
				</li>
			</ul>
		</div>
		
		<div id="board" class="col-7">
			<div style="font-size: 15pt; vertical-align: bottom; margin: 20px 0 10px 20px;">Board</div>
			<nav id="boardList">
				<a class="boardList_iscurrent">공지사항</a>
				<a>자유게시판</a>
				<a>회의자료</a>
				<a>업무자료</a>
				<div class="boardList_underline"></div>
			</nav>
			<hr style="margin-top: 0px;"/>
			<table width="100%" style="font-size: 10pt; width: 95%" align="center">
				<tr class="boardTr">
					<td class="py-1 pl-2">
						<div>글제목</div>
						<span style="font-size:9pt; color:gray;">
							<span class="mr-4">날짜</span>
							<span>글쓴이·팀</span>
						</span>
					</td>
				</tr>
				<tr class="boardTr">
					<td class="py-1 pl-2">
						<div>글제목</div>
						<span style="font-size:9pt; color:gray;">
							<span class="mr-4">날짜</span>
							<span>글쓴이·팀</span>
						</span>
					</td>
				</tr>
			</table>
			<hr style="position:relative; top:100px;"/>
			<div id="boardPagingArrow" align="center" style="position:relative; top:105px;">
				<span class="mr-5"><i class="fa-solid fa-angle-left" style="font-size:10pt;"></i></span>
				<span><i class="fa-solid fa-angle-right" style="font-size:10pt;"></i></span>
			</div>
		</div>
	</div>
	
	
	<div class="row">	
		<div class="box col-3" style="display: inline-block; float: left; margin: 100px 50px 0 50px;">   
	        <div style="position:relative; right:60px; top:-50px; font-size: 15pt;">Report</div>            
	        
			  <ul class="pagination" style="position:relative; right:60px; top:-30px; color: gray;">    
			    <li class="page-item">
			      <a  href="#" aria-label="Previous"> 
			        <span aria-hidden="true" style="color: rgb(253, 199, 67);">&laquo;</span>  
			      </a>
			    </li> 
			    <li style="margin: 0 15px;">2022.11.01~2022.11.07</li> 
			    <li class="page-item">
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true" style="color: rgb(253, 199, 67);">&raquo;</span>
			      </a> 
			    </li>
			  </ul>
	        
	       <div class="container" style="position:relative; right:70px;">  
	       	  <h6 style="font-size: small">정규근무</h6>        
			  <h4 style="width: 100px;">42h 24m</h4>    
			  <h6 style="font-size: small; position: relative; left: 150px; bottom: 23px;">최대 52h</h6>               
			  <div class="progress" style="width: 200px; position: relative; bottom: 20px; ">    
			    <div class="progress-bar" style="width:70%; background: rgb(253, 199, 67);"></div> 
			  </div>   
		   </div>     
			  
			<div class="container" style="position:relative; right:70px;">  
	       	  <h6 style="font-size: small">초과근무</h6>        
			  <h4 style="width: 100px;">05h 10m</h4>    
			  <div class="progress" style="width: 200px; position: relative;">       
			    <div class="progress-bar" style="width:30%; background: rgb(253, 199, 67);"></div>  
			  </div>   
		   </div>    
	         
	       <hr/>    
	         
	       <div style="margin: 0 auto;">       
		       <h6 style="font-size: small; position: relative; right: -80px; ">총근무시간</h6>         
		       <h1 style="width:200px; position: relative; right: 0px; ">47h 34m</h1>  
	        </div>
	    </div>           
	    <!--     
	    <div class="box2" style="display: inline-block; float: right; position: relative; right: 400px;">     
	       <h3 style="position:relative; right:60px; top:-50px;">Calendar</h3> 
	    </div>              
	    -->        
	             
		<div id="calendar" class="col-7" style="float: left; margin: 100px 0; padding: 0px;">
			<div id="calendar_header" style="width:100%;"><i class="icon-chevron-left"></i>          <h1></h1><i class="icon-chevron-right"></i>         </div>
			<div id="calendar_weekdays" style="width:100%;"></div>
			<div id="calendar_content" style="width:100%;"></div>
		</div>
	</div>
	
</div>
