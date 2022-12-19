<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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

$(document).ready(function(){
	
	$(document).on("mouseover",".bg-light",function(){
		$(this).find(".avbtn").css({"visibility":"visible","transition":"all .1s"});
	});
	
	$(document).on("mouseout",".bg-light",function(){
		$(this).find(".avbtn").css({"visibility":"hidden","transition":"all .1s"});
	});
	
	// 게시판 읽어오기
	getboard("notice", 1);
	
	// 결재요청 읽어오기
	getAvList();
	
});//end of ready


/////////////////////////////////////////////////////////////////////////////////
// 결재 요청 읽어오기
function getAvList(){
	$.ajax({
		url:"<%=ctxPath%>/getMainAvList.up?employee_no="+"${sessionScope.loginuser.employee_no}",
		dataType:"json",
		success:function(json){
			var html = '';
			if(json.length > 0){
				$.each(json, function(index, item){
					html += '<div id="'+item.asno+'"class="bg-light text-dark" style="display: flex; padding-left: 15px; width: 83%; border-radius: 5px; margin: 10px 25px;">';
					
					if(item.profile_systemfilename == null){
						var name = item.name_kr.substring(1,3);
						html += '<span class="profilepics">'+
											'<span>'+name+'</span>'+
										'</span>';
					} else {
						html += '<span class="profilepics" style="background-color: inherit; background-size: cover;">'+
					      			'<img src="<%=ctxPath%>/resources/files/'+item.profile_systemfilename+'" width="38px" height="38px" style="border-radius: 12px;border: solid 1px rgba(0,0,0,0.1);">'+
					      		'</span>';
					}
						html += '<div class="card-body" style="height: 60px; display: table-cell; padding-left: 0; vertical-align: middle; clear: both; width: 1177px;">'+
						   		'<div class="apContent">'+
							   		'<span>승인 요청 - \''+item.title+'\'</span>'+
							   		'<span>'+item.name_kr+'・'+item.writeday+'</span>'+
							   		'<div>'+
								   		'<button type="button" onclick="updateAvStatus(2,\''+item.asno+'\')" class="btn btn-sm button avbtn" id="return" style="background-color: white; border: solid 0.5px #e6e6e6; color: #595959; margin-right: 1px; font-weight:600; font-size: 10pt; visibility: hidden;">반려</button>'+
										'<button type="button" onclick="updateAvStatus(1,\''+item.asno+'\')" class="btn btn-sm button avbtn" id="approval" style="background-color: #3385ff; color: white; font-weight:600; font-size: 10pt; visibility: hidden;">승인</button>'+
									'</div>'+
								'</div>'+
						   '</div>'+
						'</div>';
					
					
				});
			} else {
				html += '<div class="" style="padding-top:35px;">'+
							'<div class="icon icon-file-text2" style="margin-bottom: 5px; font-size: 11pt;"></div>'+
							'<div style="margin-bottom: 10px;">현재 요청사항이 없습니다.</div>'+
							'<button type="button" id="goav" onclick="javscript:location.href=\'<%=ctxPath%>/approval.up\'">결재 보기</button>'+
						'</div>';
			}
			
			$(".board-c").html(html);
			
		}
		
	});//end ajax
}//end getAvList


// 결재 승인/반려하기
function updateAvStatus(status, asno){
	
	$.ajax({
		url:"<%= ctxPath%>/updateMainAvStatus.up",
		data:{"signyn":status,
			"name_kr":"${sessionScope.loginuser.name_kr}",
			"asno":asno},
		dataType:"json",
		success:function(json){
			if(json.result == 1){
				//결재요청리스트 갱신하기
				getAvList();
			}
		}
		
	}); //end ajax
	
	
}//end updateAvStatus



// 게시판 읽어오기
function getboard(kind, curpage){
	$("#notice, #free").css("color","#D2D6D9");
	$("#notice, #free").removeClass("boardList_iscurrent");
	if(kind == "notice") {
		$("#notice").css("color","#4d4f53");
		$("#notice").addClass("boardList_iscurrent");
	} else {
		$("#free").css("color","#4d4f53");
		$("#free").addClass("boardList_iscurrent");
	}
	
	if(curpage == null) curpage = 1;
	
	$.ajax({
		url:"<%=ctxPath%>/getMainBoardList.up",
		data: {"kind":kind,"curpage":curpage},
		dataType:"json",
		success:function(json){
			
			var html = '';
			if(json.length > 1){
				$.each(json, function(index,item){
					if(index != 0){
						if(item.nbno != null){
							html += '<tr id="'+item.nbno+'" class="boardTr" onclick="javascript:location.href=\'<%=ctxPath%>/notice/view.up?nbno='+item.nbno+'\'">';
						} else {
							html += '<tr id="'+item.fbno+'" class="boardTr" onclick="javascript:location.href=\'<%=ctxPath%>/fboard/view.up?fbno='+item.fbno+'\'">';
						}
							html +=	'<td class="py-1 pl-2" style="font-weight: 500; font-size:11pt;">'+
										'<div>'+item.subject+'</div>'+
										'<span style="font-size:9pt; color:#8d96a1;">'+
											'<span style="margin-right: 15px;">'+item.writedate+'</span>'+
											'<span>'+item.name_kr;
											if(item.department_name != null){
												html += '·'+item.department_name+'</span>'; 
											}
										'</span>'+
									'</td>'+
								'</tr>';
					}
				});
			} else {
				html += '<tr><td width="100%" style="padding: 15px; font-size:9pt; color:#8d96a1; text-align:center;">조회된 게시글이 없습니다.</td></tr>';
				$("#boardPagingArrow").html("");
			}
			
			$("#mainboardList").html(html);
			
			// 페이지바 만들기
			pagebar(kind, json[0].total, curpage);
			
		}
	});
	
	
}//end getboard


function pagebar(kind, total, curpage){
	
	if(Number(total) > 0){
		const blockSize = 10;
		if(typeof curpage == "string"){
			curpage = Number(curpage);
		}
		let pageNo = Math.floor((curpage - 1)/blockSize) * blockSize + 1;
		
		let pageBarHTML = "<nav style='position: relative; left: 340px;'>"+
							"<a aria-label='이전' href='javascript:getboard(\""+kind+"\", "+(pageNo)+")'><span aria-hidden='true'><i class='fa-solid fa-angle-left' style='font-size:10pt;'></i></span></a>";
		if(pageNo == curpage){
			pageBarHTML += "<a aria-label='다음' ><span aria-hidden='true' style='cursor:not-allowed;'><i class='fa-solid fa-angle-right' style='font-size:10pt;'></i></span></a>";
		} else {
			pageBarHTML += "<a aria-label='다음' href='javascript:getboard(\""+kind+"\", "+(pageNo+1)+")'><span aria-hidden='true'><i class='fa-solid fa-angle-right' style='font-size:10pt;'></i></span></a>";
		}
		pageBarHTML += "</nav>";
		
		
		$("#boardPagingArrow").html(pageBarHTML);
		
	}
	
}


</script>

<div style="margin-left: 0.5%; width: 60%; float:left; height: 640px;">
	<div class="mainheader">
		<div style="width: 100%;">
			<span>내근무</span>
			<span style="float:right;"><button type="button" class="headerMore" onclick="javascript:location.href='<%=ctxPath%>/attendance.up'">더보기</button></span>
		</div>
	</div>
	<div class="Ad-c" style="height: 154px;">
		<div class="todayAd" style="width: 100%; padding-left: 5%; ">
			<div><div class="main-iconindex" style="background-color: rgba(66, 133, 244, 0.2);"><img src="https://emojipedia-us.s3.amazonaws.com/source/microsoft-teams/337/alarm-clock_23f0.png" width="25px"style="margin: auto;"></div></div>
			<div style="margin-left: 15px;">
				<div class="ad-sumheader">오늘의 근무</div>
				<table class="Adtable">
					<tr>
						<td>출근</td>
						<c:if test="${not empty requestScope.starttime}">
							<td>${requestScope.starttime}</td>
						</c:if>
						<c:if test="${empty requestScope.starttime}">
							<td style="color:#D2D6D9;">미지정</td>
						</c:if>
						<td style="padding-left: 10px;">퇴근</td>
						<c:if test="${not empty requestScope.endtime}">
							<td>${requestScope.endtime}</td>
						</c:if>
						<c:if test="${empty requestScope.endtime}">
							<td style="color:#D2D6D9;">미지정</td>
						</c:if>
						<c:if test="${not empty emptyrequestScope.todayWorkingTime}">
						<td><div class="AdtimeSub">${requestScope.todayWorkingTime}</div></td>
						</c:if>
					</tr>
				</table>
			</div>
			<div><i class="fas fa-angle-right" aria-hidden="true" style="visibility: hidden;"></i></div>
		</div>
		<hr style="border:none; height:1px; background-color: rgba(220,220,220); margin: 0;"/>
		<div class="weekAd todayAd" style="padding-left: 5%; width: 100%;">
			<div><div class="main-iconindex" style="background-color: #FFFADF;"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/briefcase_1f4bc.png" width="20px"style="margin: auto; left:11px;"></div></div>
			<div style="margin-left: 15px;">
				<div class="ad-sumheader">이번주 근무</div>
				<table class="Adtable">
					<tr>
						<td>정규</td>
						<c:if test="${requestScope.regularWt != '0'}">
							<td>${requestScope.regularWt}</td>
						</c:if>
						<c:if test="${requestScope.regularWt == '0'}">
							<td style="color:#D2D6D9;">미지정</td>
						</c:if>
						<td style="padding-left: 10px;">초과</td>
						<c:if test="${requestScope.overWt != '0'}">
							<td>${requestScope.overWt}</td>
						</c:if>
						<c:if test="${requestScope.overWt == '0'}">
							<td style="color:#D2D6D9;">미지정</td>
						</c:if>
						<c:if test="${not empty emptyrequestScope.weekWorkingTime}">
						<td><div class="AdtimeSub">${requestScope.weekWorkingTime}</div></td>
						</c:if>
					</tr>
				</table>
			</div>
			<div><i class="fas fa-angle-right" aria-hidden="true" style="visibility: hidden;"></i></div>
		</div>
	</div>
	<div class="mainheader" style="clear:both; border-top: solid 1px rgba(240,240,240);">
		<div style="width: 100%;">
			<span>게시판</span>
			<span style="float:right;"><button type="button" class="headerMore" onclick="javascript:location.href='<%=ctxPath%>/board_all.up'">더보기</button></span>
		</div>
	</div>
	<div class="todayAd-c" style="height: 300px;">
		<div id="board">
			<nav id="boardList">
				<a id="notice" class="boardList_iscurrent" onclick="getboard('notice',1)">공지사항</a>
				<a id="free" onclick="getboard('free',1)">자유게시판</a>
				<div class="boardList_underline"></div>
			</nav>
			<hr style="border: none; height:1px; background-color: rgba(210,210,210); margin:0;">
			<table id="mainboardList" width="100%" style="font-size: 11pt; width: 100%;" align="center">
			</table>
			<hr style="background-color: rgba(240,240,240); margin:0;" class="HRhr"/>
			<div id="boardPagingArrow" align="center" style="color: #4d4f53; margin-top: 20px; position: absolute; top: 610px;">
			</div>
		</div>
	</div>
</div>
<div style="width: 39.5%; float: right; border-left:solid 1px rgba(220,220,220); height: 640px;">
	<div class="mainheader">
		<div style="width: 100%;">
			<span>요청사항</span>
			<span style="float:right;"><button type="button" class="headerMore" style="margin-right: 60px;" onclick="javascript:location.href='<%=ctxPath%>/approval.up'">더보기</button></span>
		</div>
	</div>
	<div class="board-c" style="height: 135px; color:#D2D6D9; font-size: 10pt; text-align:center; vertical-align: middle;">
		<%-- 
		<c:if test="${empty requestScope.apList}">
			<div class="" style="padding-top:35px;">
				<div class="icon icon-file-text2" style="margin-bottom: 5px; font-size: 11pt;"></div>
				<div style="margin-bottom: 10px;">현재 요청사항이 없습니다.</div>
				<button type="button" id="goav">결재 보기</button>
			</div>
		</c:if>
		<c:if test="${not empty requestScope.apList}">
			<c:forEach var="ap" items="${requestScope.apList}">
				<div class="bg-light text-dark" style="display: flex; padding-left: 15px; width: 83%; border-radius: 5px; margin: 10px 25px;">
					<c:if test="${empty ap.profile_systemfilename}">
						<span class="profilepics">
							<span>${fn:substring(ap.name_kr,1,3)}</span>
						</span>
					</c:if>
					<c:if test="${not empty ap.profile_systemfilename}">
						<span class="profilepics" style="background-color: inherit; background-size: cover;">
			      			<img src="<%=ctxPath%>/resources/files/${sessionScope.loginuser.profile_systemfilename}" width="38px" height="38px" style="border-radius: 12px;border: solid 1px rgba(0,0,0,0.1);">
			      		</span>
					</c:if>
				   	<!-- <i class="fas fa-user-circle" style="color:#737373; font-size:33px; float: left; padding: 14px;"></i> -->
				   	<div class="card-body" style="height: 60px; display: table-cell; padding-left: 0; vertical-align: middle; clear: both; width: 1177px;">
				   		<div class="apContent">
					   		<span>승인 요청 - '${ap.title}'</span>
					   		<span>${ap.name_kr}・${ap.writeday}</span>
					   		<div>
						   		<button type="button" class="btn btn-sm button avbtn" id="return" style="background-color: white; border: solid 0.5px #e6e6e6; color: #595959; margin-right: 1px; font-weight:600; font-size: 10pt; visibility: hidden;">반려</button>
								<button type="button" class="btn btn-sm button avbtn" id="approval" style="background-color: #3385ff; color: white; font-weight:600; font-size: 10pt; visibility: hidden;">승인</button>
							</div>
						</div>
				   	</div>
				</div>
			</c:forEach>
		</c:if>		
		 --%>
		
	</div>
	<hr style="border:none; height:1px; background-color: rgba(220,220,220);"/>
	<div class="schedule-c" style="margin: 0 20px;">
		<div id="calendar" style=" margin: 30px 0 20px 0; padding: 0 30px; width: 512px; font-size: 9pt; color: #4d4f53; position:relative; right: 22px;">
		<div id="calendar_header" style="width:100%;">
			<i class="icon-chevron-left"></i>
			<h1></h1><i class="icon-chevron-right"></i>
		</div>
		<div id="calendar_weekdays" style="width:100%;"></div>
		<div id="calendar_content" style="width:100%;"></div>
	</div>
	</div>
	

</div>
