<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="attendance_header.jsp"%>

<script>
	$(document).ready(function(){
	/* 
		$("label[for='menuicon']").click(function(){
			$(".attendance_container").css("margin-left","150px");
		});
	 */
		$("a#attendance").addClass("list_iscurrent");
	 	$("a#dayoff").removeClass("list_iscurrent");
	 
	    $('.datepicker').datepicker({
			 dateFormat: 'yy-mm-dd'  //Input Display Format 변경
					,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
					,changeYear: true        //콤보박스에서 년 선택 가능
					,changeMonth: true       //콤보박스에서 월 선택 가능                
					,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,yearSuffix: "년"         //달력의 년도 부분 뒤에 붙는 텍스트
					,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
					,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
					,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
					,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
					//,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					//,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)                
		});
	 	$('.datepicker').datepicker('setDate', 'today');
	 	$(".ui-datepicker-trigger").hide();
	 	
	 	// 시간 infobox
	 	$(".workingiweek-infobox").hide();
	 	$(".workingweek-info").hover(function(){
	 		$(".workingiweek-infobox").fadeIn("fast");
	 	}, function(){
	 		$(".workingiweek-infobox").fadeOut("fast");
	 	});
	 	
	 	// sum막대바 info박스
	 	$(".workingweek-sumbar-infobox").hide();
	 	$(".workingweek-sumbar-default").hover(function(){
	 		$(".workingweek-sumbar-infobox").fadeIn("fast");
	 	}, function(){
	 		$(".workingweek-sumbar-infobox").fadeOut("fast");
	 	});
	 	
	 	// 
	 	$(".workingweek-sumbar-goal-infobox").hide();
	 	$(".workingweek-sumbar-goal").hover(function(){
	 		$(".workingweek-sumbar-goal-infobox").fadeIn("fast");
	 	}, function(){
	 		$(".workingweek-sumbar-goal-infobox").fadeOut("fast");
	 	});
	 	
	 	
	 	// 이번주 날짜 
	 	for(var i=0; i<7; i++){
		 	$(".date").eq(i).html(getCurrentWeek()[i]);
	 	}
	 	
	 	// <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
	 	
	 	// 오늘 날짜 dot
	 	const now = new Date();
	 	const week = ['sun', 'mon','tue','wed','thu','fri','sat'];
	 	let dayOfweek = week[now.getDay()];
	 	/* 
	 	if(dayOfweek=="mon"){html="<div class='todaydot'></div>"; $(".mon").append(html);}
	 	if(dayOfweek=="tue"){html="<div class='todaydot'></div>"; $(".tue").append(html);}
	 	if(dayOfweek=="wed"){html="<div class='todaydot'></div>"; $(".wed").append(html);}
	 	if(dayOfweek=="thu"){html="<div class='todaydot spinner-grow spinner-grow-sm' role='status' aria-hidden='true'></div>"; $(".thu").append(html);}
	 	if(dayOfweek=="fri"){html="<div class='todaydot'></div>"; $(".fri").append(html);}
	 	if(dayOfweek=="sat"){html="<div class='todaydot'></div>"; $(".sat").append(html);}
	 	if(dayOfweek=="sun"){html="<div class='todaydot'></div>"; $(".sun").append(html);}
	 	 */
	 	html = '<div class="spinner"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>';
	 	if(dayOfweek=="mon"){$(".mon").append(html);}
	 	if(dayOfweek=="tue"){$(".tue").append(html);}
	 	if(dayOfweek=="wed"){$(".wed").append(html);}
	 	if(dayOfweek=="thu"){$(".thu").append(html);}
	 	if(dayOfweek=="fri"){$(".fri").append(html);}
	 	if(dayOfweek=="sat"){$(".sat").append(html);}
	 	if(dayOfweek=="sun"){$(".sun").append(html);}
	 	
	 	 
	 	//offcanvas
	 	$(".workingweek > table > tbody > tr:first-child ~ tr").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		
	 		const mmdd = $(e.target).parent().find("span.date").text();
	 		const mm = mmdd.substr(0,2);
	 		const dd = mmdd.substr(4);
	 		$("#offcanvasScrollingLabel").text(mm+"월 "+dd+"일");
	 		
	 	});
	 	
	 	
	}); //end of ready

	
	// function declaration
	function getCurrentWeek() {
		const day = new Date();
		
		const monday = day.getDate()+10 - day + (day == 0 ? -6 : 1)
		//const sunday = day.getTime() - 86400000 * day.getDay();
	
		let date = day.toISOString().slice(5, 7);
		date +=  ". "+day.toISOString().slice(8, 10);
		const result = [ date ];
		
		for (let i = 1; i < 8; i++) {
			day.setTime(day.getTime() + 86400000);
			let date = day.toISOString().slice(5, 7);
			date += ". "+day.toISOString().slice(8, 10);
			result.push(date);
		}
		return result;
	}

	
</script>
<div class="attendance-container">
	<div class="datebox ">
		<button type="button" class="datearrow" style="border-right: none;"><i class="fa-solid fa-angle-left" style="font-size:10pt;"></i></button>
		<span><input type="" class="datepicker"/></span>
		<button type="button" class="datearrow" style="border-left: none;"><i class="fa-solid fa-angle-right" style="font-size:10pt;"></i></button>
		<button type="button" class="today">오늘</button>
	</div>
	<hr class="HRhr"/>
	<div class="workingweek-sum">
		<span class="fontsize-basic"><span style="font-weight: bold; font-size: 12pt;">16시간</span> / 52시간</span>
		<div class="workingweek-info">
			<i class="fa-solid fa-circle-info ml-2" style="color: #C6C6C6; font-size: 9pt;"></i>
			<div class="workingiweek-infobox">
				<table>
					<tr><td>소정근무</td><td style="color:white;">16시간</td></tr>
					<tr><td>기본</td><td>14시간 30분</td></tr>
					<tr><td>야간</td><td>1시간 30분</td></tr>
					<tr><td colspan="2"><hr class="HRhr"style="margin:5px 0 5px 0; background-color:#B1B5B9; border:none; height:1px;"/></td></tr>
					<tr><td>합계</td><td class="workingweek-total">16시간</td></tr>
				</table>
			</div>
		</div>
		<div class="workingweek-sumbar">
			<div class="workingweek-sumbar-default"></div>
			<div class="workingweek-sumbar-infobox">
				<table>
					<tr><td>기본</td><td>14시간 30분</td></tr>
					<tr><td>야간</td><td>1시간 30분</td></tr>
					<tr><td colspan="2"><hr class="HRhr"style="margin:5px 0 5px 0; background-color:#B1B5B9; border:none; height:1px;"/></td></tr>
					<tr><td>합계</td><td class="workingweek-total">16시간</td></tr>
				</table>
			</div>
			<div class="workingweek-sumbar-goal"></div>
			<div class="workingweek-sumbar-goal-infobox">
				<table><tr><td>목표시간</td><td>40시간</td></tr></table>
			</div>
		</div>
	</div>
	<div class="workingweek">
		<table class="fontsize-basic">
			<tr class="workinghour">
				<td></td>
				<c:forEach var="i" begin="0" end="23">
					<td colspan="2">${i}</td>
				</c:forEach>
			</tr>
			<tr>
				<td class="mon"><span class="date"></span>(월)<div class="workingtotalhourByday"><span>9시간</span></div></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
				<div class="working-recordbar"></div>
			</tr>
			<tr>
				<td class="tue"><span class="date"></span>(화)</td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr>
				<td class="wed"><span class="date"></span>(수)</td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr>
				<td class="thu"><span class="date"></span>(목)</td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr>
				<td class="fri"><span class="date"></span>(금)</td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr class="font-red">
				<td class="sat"><span class="date"></span>(토)</td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr class="font-red">
				<td class="sun"><span class="date"></span>(일)</td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
		</table>
		
		<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		  <div class="offcanvas-body">
		  	<div>
		  		<div class="todayworkStatus-container">
			  		<span>총 근무</span>
			  		<div class="workingtotalhourByday ml-2"><span class="ml-1">9</span>시간</div>
			  		<div class="line"></div>
		  		</div>
		  		<!-- 근무 1개  -->
		  		<div class="workwirte-container dropdown">
					<div class="dropdown-toggle workwritebox btn" id="workwriteStatus" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>
						근무
					</div>
					<ul class="dropdown-menu workStatusbox" aria-labelledby="workwriteStatus" style="min-width: 7rem;">
						<li>
							<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>
								근무
							</a>
						</li>
						<li>
							<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/oncoming-automobile_1f698.png" width="16px"/>
								외근
							</a>
						</li>
						<li>
							<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/laptop_1f4bb.png" width="16px"/>
								원격근무
							</a>
						</li>
						<li>
							<a class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/spiral-calendar_1f5d3-fe0f.png" width="16px"/>
								출장
							</a>
						</li>
						<hr class="HRhr"style="margin:0; height:1px; background-color: rgba(242, 242, 242); border:none;"/>
						<li>
							<a class="dropdown-item" href="#">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="16px"/>
								하루종일
							</a>
						</li>
						<li>
							<a class="dropdown-item" href="#">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="16px"/>
								시간입력
							</a>
						</li>
					</ul>
					
					<div class="dropdown-toggle workStartbox" id="workwriteStart" data-bs-toggle="dropdown" aria-expanded="false">
						시작 시각
					</div>
					<ul class="dropdown-menu workstarttime" aria-labelledby="workwriteStart" style="min-width: 6rem;">
						<c:forEach var="i" begin="0" end="23">
							<c:forEach var="j" begin="0" end="1">
								<c:if test="${i<10}"><li><a class="dropdown-item" href="#">0${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
								<c:if test="${i>=10}"><li><a class="dropdown-item" href="#">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
							</c:forEach>
						</c:forEach>
					</ul>
					
					<div style="display:inline-block;">
						<i class="fa-solid fa-arrow-right" style="color: #C6C6C6"></i>
					</div>
					
					<div class="dropdown-toggle workEndbox" id="workwriteEnd" data-bs-toggle="dropdown" aria-expanded="false">
						종료 시각						
					</div>
					<ul class="dropdown-menu workendtime" aria-labelledby="workwriteEnd" style="min-width: 6rem;">
						<c:forEach var="i" begin="0" end="23">
							<c:forEach var="j" begin="0" end="1">
								<c:if test="${i<10}"><li><a class="dropdown-item" href="#">0${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
								<c:if test="${i>=10}"><li><a class="dropdown-item" href="#">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
							</c:forEach>
						</c:forEach>
					</ul>
				</div>
				
				<!-- 근무 1개 끝  -->
				
		  		<div class="workadd">
		  			<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt;">추가하기</span></div>
	  			</div>
	  			<div class="workstatus-buttoncontainer">
	  				<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
		  			<button type="button" class="workstatus-save">저장하기</button>
	  			</div>
		  	</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->
	</div>
</div>
