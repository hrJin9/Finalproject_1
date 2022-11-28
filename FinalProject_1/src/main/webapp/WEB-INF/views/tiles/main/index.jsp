<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%> 
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index.css?after">
<style type="text/css">
	
</style>

<script type="text/javascript">
	//캘린더
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, { 
		  headerToolbar: {
		    left: 'prev,next today', 
		    center: 'title',
		    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		  },
		 
		  locale: 'ko', 
		  navLinks: true, // can click day/week names to navigate views
		  businessHours: true, // display business hours
		  editable: true,
		  selectable: true,
		  select: function(arg) {
		      var title = prompt('일정 추가','입력해주세요..');
		      if (title) { 
		          calendar.addEvent({ 
		              title: title,
		              start: arg.start,
		              end: arg.end,
		              allDay: arg.allDay
		          })
		      }
		      calendar.unselect()
		  },
		  eventClick: function(arg) { 
		      if (confirm('일정을 삭제하시겠습니까?')) {
		          arg.event.remove()
		      }
		  }
		
		
		});
		
		calendar.render();

	});//end of calendar


	$(document).ready(function(){
		loopshowNowTime();
		
		//내피드 글씨 검정색으로 바꾸기
		$("#main").css("color","#4d4f53");
		$(".boardList_iscurrent").css("color","#4d4f53");
		
		// 근무 fadeToggle 이벤트
		$("#workStatusListBox").fadeOut(100);
		$("#workStatusChange").fadeOut(100);
		
		$("#workStatus").click(function(){
			$("#workStatusListBox").fadeToggle(100); 
		});
		
		$("#changeWorkingStatus").click(function(){
			$("#workStatusChange").fadeToggle(100);
			$("#workStatusChange").mouseleave(function(){
				$(this).fadeOut(200);
			});
		});
		
		
		
		
		
	});//end of ready

	// 외부 클릭시 닫기
	$(document).mouseup(function(e){
		if( !(($("#workStatusListBox").has(e.target).length||$("#workStatusChange").has(e.target).length)) ){
			$("#workStatusListBox").fadeOut(100);
			$("#workStatusChange").fadeOut(100);
		}//end of mouseup
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


</script>

<div class="main_container">
	<div class="row">
		<div id="today" class="col-3">
			<table width="90%" align="center">
				<tr height="60px"><td colspan="2" style="font-size: 15pt; vertical-align: bottom; font-weight: bold; color: #4d4f53;">Today</td></tr>
				<tr height="40px"><td colspan="2" id="date" style="color: gray; font-size: 10pt;"></td></tr>
				<tr height="60px"><td colspan="2" id="workingtime" style="font-size: 25pt; color: #4d4f53;">
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
							<hr style="margin: 2px;" class="HRhr"/>
							<div style="font-size: 8pt; color: gray; margin: 7px 0 7px 10px;">근무</div>
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
				<hr style="margin: 2px;" class="HRhr"/>
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
		
		<div id="board" class="col-8">
			<div style="font-size: 15pt; vertical-align: bottom; margin: 20px 0 10px 20px; font-weight: bold; color: #4d4f53;">Board</div>
			<nav id="boardList">
				<a class="boardList_iscurrent">공지사항</a>
				<a>자유게시판</a>
				<div class="boardList_underline"></div>
			</nav>
			<hr style="margin-top: 0px;" class="HRhr"/>
			<table width="100%" style="font-size: 11pt; width: 95%" align="center">
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
			<hr style="position:relative; top:80px;" class="HRhr"/>
			<div id="boardPagingArrow" align="center" style="position:relative; top:80px; color: #4d4f53;">
				<span class="mr-5"><i class="fa-solid fa-angle-left" style="font-size:10pt;"></i></span>
				<span><i class="fa-solid fa-angle-right" style="font-size:10pt;"></i></span>
			</div>
		</div>
	</div>
	
	
	<div class="row">	
		<div class="box col-3" style="display: inline-block; margin: 100px 50px 0 0;">
			<div>
		        <div style="position:relative; right:48px; top:-50px; font-size: 15pt; font-weight: bold; color: #4d4f53;">Report</div>            
				  <ul class="pagination" style="position:relative; right:30px; top:-30px; color: gray;">    
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
		        
		       <div class="" style="position:relative; right:43px;">  
		       	  <h6 style="font-size: small">정규근무</h6>        
				  <h4 style="width: 100px; color: #4d4f53;">42h 24m</h4>    
				  <h6 style="font-size: small; position: relative; left: 185px; bottom: 23px;">최대 52h</h6>               
				  <div class="progress" style="width: 235px; position: relative; bottom: 20px; ">    
				    <div class="progress-bar" style="width:70%; background: rgb(253, 199, 67);"></div> 
				  </div>   
			   </div>     
				  
				<div class="" style="position:relative; right:43px;">  
		       	  <h6 style="font-size: small">초과근무</h6>        
				  <h4 style="width: 100px; color: #4d4f53;">05h 10m</h4>    
				  <div class="progress" style="width: 235px; position: relative;">       
				    <div class="progress-bar" style="width:30%; background: rgb(253, 199, 67);"></div>  
				  </div>   
			   </div>    
		         
		       <hr class="HRhr" style="width: 270px; position: relative; right: 55px;"/>    
		         
		       <div style="margin: 0 auto;">       
			       <h6 style="font-size: small; position: relative; right: -135px; top: 10px;">총근무시간</h6>         
			       <h1 style="width:200px; position: relative; right: -25px; color: #4d4f53;">47h 34m</h1>  
		        </div>
	        </div>
	    </div>           
	    <div class="col-8 calendar-box">
			<div id="calendar" style="float: left; margin: 30px 0 20px 0; padding: 0 30px; width: 100%; font-size: 9pt; color: #4d4f53;">
				<div id="calendar_header" style="width:100%;">
					<i class="icon-chevron-left"></i>
					<h1></h1><i class="icon-chevron-right"></i>
				</div>
				<div id="calendar_weekdays" style="width:100%;"></div>
				<div id="calendar_content" style="width:100%;"></div>
			</div>
		</div>
	</div>
	
</div>
