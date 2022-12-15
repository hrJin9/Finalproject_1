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
		  contentHeight: 350,
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

	/*
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
 */


</script>

<div style="margin-left: 0.5%; width: 60%; float:left; height: 640px;">
	<div class="mainheader">
		<div>내 근무</div>
	</div>
	<div class="Ad-c" style="margin-left: 5%; height: 160px;">
		<div class="todayAd" style="width: 95%;">
			<div><div class="main-iconindex" style="background-color: #FFFADF;"><img src="https://emojipedia-us.s3.amazonaws.com/source/microsoft-teams/337/alarm-clock_23f0.png" width="25px"style="margin: auto;"></div></div>
			<div style="margin-left: 15px;">
				<div class="ad-sumheader">오늘의 근무</div>
				<table class="Adtable">
					<tr>
						<td>출근시간</td>
						<td>미지정</td>
						<td>퇴근시간</td>
						<td>미지정</td>
						<td>근무시간</td>
						<td>미지정</td>
					</tr>
				</table>
			</div>
		</div>
		<hr style="border:none; height:1px; background-color: rgba(220,220,220); margin-left: 0;"/>
		<div class="weekAd" style="margin-left: 5%; width: 95%;">
			<div class="At-container">
				<div class="ad-sumheader">이번주 근무</div>
				<table class="Adtable">
					<tr>
						<td>정규근무</td>
						<td>시간</td>
						<td>초과근무</td>
						<td>시간</td>
						<td>총근무</td>
						<td>시간</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="mainheader" style="clear:both;">
		<div>게시판</div>
	</div>
	<div class="todayAd-c" style="height: 300px;">
		<div id="board">
			<nav id="boardList">
				<a class="boardList_iscurrent">공지사항</a>
				<a>자유게시판</a>
				<div class="boardList_underline"></div>
			</nav>
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
</div>
<div style="width: 39.5%; float: right; border-left:solid 1px rgba(220,220,220); height: 640px;">
	<div class="mainheader">
		<div>요청사항</div>
	</div>
	<div class="board-c" style="height: 150px;">
	
	</div>
	<hr style="border:none; height:1px; background-color: rgba(220,220,220);"/>
	<div class="schedule-c" style="margin: 0 20px;">
		<div id="calendar" style=" margin: 30px 0 20px 0; padding: 0 30px; width: 500px; font-size: 9pt; color: #4d4f53;">
		<div id="calendar_header" style="width:100%;">
			<i class="icon-chevron-left"></i>
			<h1></h1><i class="icon-chevron-right"></i>
		</div>
		<div id="calendar_weekdays" style="width:100%;"></div>
		<div id="calendar_content" style="width:100%;"></div>
	</div>
	</div>
	

</div>
