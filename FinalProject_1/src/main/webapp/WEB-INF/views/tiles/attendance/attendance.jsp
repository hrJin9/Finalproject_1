<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="attendance_header.jsp"%>

<script>
	$(document).ready(function(){

		$("a#attendance").addClass("list_iscurrent");
	 	$("a#dayoff").removeClass("list_iscurrent");
		
	 	// 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y. m. d",
			defaultDate: new Date(),
			local: 'ko'
		});
		
		// 오프캔버스 타임피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".timeSelector"));
		$(".timeSelector").flatpickr({
			enableTime: true,
		    noCalendar: true,
		    dateFormat: "H:i K",
			local: 'ko'
		});
		
		// 오늘 버튼 클릭시 오늘로 날짜 설정
		$(".today").click(function(){
			$(".dateSelector").flatpickr({
				defaultDate:new Date(),
				dateFormat: "Y. m. d"
			});
		});
		
		// flatpickr에서 선택된 날짜 구하고 날짜를 넣어주기
		getSelectedDate();
		putDate();
		putTodayDot();
		// flatpickr 날짜 변경 이벤트
		$(".dateSelector").change(function(){
			getSelectedDate();
			putDate();
			putTodayDot();
		});
	 	
	 	
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
	 	
	 	// hover
	 	$(".workingweek-sumbar-goal-infobox").hide();
	 	$(".workingweek-sumbar-goal").hover(function(){
	 		$(".workingweek-sumbar-goal-infobox").fadeIn("fast");
	 	}, function(){
	 		$(".workingweek-sumbar-goal-infobox").fadeOut("fast");
	 	});
	 	
	 	//offcanvas
	 	$(".workingweek > table > tbody > tr:first-child ~ tr").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		
	 		// header에 날짜를 알아오기
	 		const mmdd = $(e.target).parent().find("span.date").text();
	 		const mm = mmdd.substr(0,2);
	 		const dd = mmdd.substr(4,2);
	 		$("#offcanvasScrollingLabel").text(mm+"월 "+dd+"일");
	 		
	 	});
	 	
	}); //end of ready
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	// function declaration
	
	// flatpickr에 선택된 날짜를 구하는 함수
	var thisWeek = []; // 주차 데이터 넣는 용
	var thisWeekArr = []; //오늘날짜 dot 검사용
	function getSelectedDate(){
		//flatpickr에 선택된 날짜 구하기
	 	var selected_date = $(".dateSelector").val();
	 	var selected_yy = selected_date.substr(0,4);
	 	var selected_mm = selected_date.substr(6,2);
	 	var selected_dd = selected_date.substr(10,2);
	 	var valDate = new Date(selected_yy, selected_mm-1, selected_dd);

	 	// 주차 구하기
		var currentDay = new Date(valDate);
		var theYear = currentDay.getFullYear();
		var theMonth = currentDay.getMonth();
		var theDate  = currentDay.getDate();
		var theDayOfWeek = currentDay.getDay();
		
		for(var i=1; i<8; i++) {
			var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
			var yyyy = resultDay.getFullYear();
			var mm = Number(resultDay.getMonth()) + 1;
			var dd = resultDay.getDate();
			
			mm = String(mm).length === 1 ? '0' + mm : mm;
			dd = String(dd).length === 1 ? '0' + dd : dd;
			
			thisWeek[i] = mm + '. ' + dd;
			thisWeekArr[i] = new Date(yyyy, mm-1, dd);
		}
	}//end of getSelectedDate()
	
	// 선택된 날짜를 넣어주는 함수
	function putDate(){
		$(".date").each(function(index, item){
			$(item).html(thisWeek[index+1]);
		});
	}//end of putDate()
	
	// 선택된 날짜가 오늘날짜와 같으면 오늘날짜 dot를 넣어주는 함수
	function putTodayDot(){
		html = '<div class="spinner"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>';
		//같은 날짜인지 비교하는 함수
		const isSameDate = (date1, date2) => {
			return date1.getFullYear() === date2.getFullYear() && date1.getMonth() === date2.getMonth() && date1.getDate() === date2.getDate();
		}
		var nowdate = new Date();
		thisWeekArr.forEach(function(item, index, array){
			if(isSameDate(nowdate, item)){ //같은 날짜라면
				$("#datedot"+index).html(html);
				return; //반복문 종료
			} else{
				$("#datedot"+index).html("");
			}
			
			
		});
	}//end of putTodayDot()
	
	
</script>
<div class="attendance-container">
	<div class="datebox margin-container">
		<span class="" style="display: inline-block; width: 140px; ">
			<input class="dateSelector attendance-dateSelector">
			<i class="fas fa-chevron-down ad-downarrow"></i>
		</span>
		<button type="button" class="today">오늘</button>
	</div>
	<hr class="HRhr"/>
	<div class="workingweek-sum margin-container">
		<span class="fontsize-basic"><span style="font-weight: 600; font-size: 14pt;">16시간</span> / 52시간</span>
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
				<td class="mon"><span class="date"></span>(월)<span id="datedot1"></span><div class="workingtotalhourByday"><span>9시간</span></div></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
				<div class="working-recordbar"></div>
			</tr>
			<tr>
				<td class="tue"><span class="date"></span>(화)<span id="datedot2"></span></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr>
				<td class="wed"><span class="date"></span>(수)<span id="datedot3"></span></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr>
				<td class="thu"><span class="date"></span>(목)<span id="datedot4"></span></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr>
				<td class="fri"><span class="date"></span>(금)<span id="datedot5"></span></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr class="font-red">
				<td class="sat"><span class="date"></span>(토)<span id="datedot6"></span></td>
				<c:forEach var="i" begin="0" end="47"><td></td></c:forEach>
			</tr>
			<tr class="font-red">
				<td class="sun"><span class="date"></span>(일)<span id="datedot7"></span></td>
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
					
					<div class="workStartbox" id="workwriteStart">
						<input type="text" class="timeSelector" placeholder="시작 시각"/>						
					</div>
					<div style="display:inline-block;">
						<i class="fa-solid fa-arrow-right" style="color: #C6C6C6"></i>
					</div>
					
					<div class="workEndbox" id="workwriteEnd">
						<input type="text" class="timeSelector" placeholder="종료 시각"/>						
					</div>
				</div>
				
				<!-- 근무 1개 끝  -->
				
		  		<div class="workadd">
		  			<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt;">추가하기</span></div>
	  			</div>
	  			<div class="workstatus-buttoncontainer">
	  				<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		  			<button type="button" class="workstatus-save gradientbtn">저장하기</button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
	  			</div>
		  	</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->
	</div>
</div>
