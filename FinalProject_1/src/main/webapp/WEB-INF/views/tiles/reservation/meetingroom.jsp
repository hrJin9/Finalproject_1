<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="meetingroom_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.workingweek > table > tbody > tr > td:first-child{ padding-left: 20px; }
	.meetingroom-recordbar{
		width: 50%;
		height: 20px;
		background-color: #04BFAD;
		border-radius: 5px;
		position: absolute; top:46%; left:25%;
	}
</style>

<script>
	$(document).ready(function(){
		$("a#mettingroom-3").removeClass("iscurrent");
		$("a#mettingroom-1").css("color","black");
		$("a#mettingroom-1").addClass("iscurrent");
		
		
		//offcanvas
	 	$(".workingweek > table > tbody > tr:first-child ~ tr").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		
	 		const meetingroom_name = $(e.target).parent().find("td:first-child").text();
			$(".offcanvas-title").text(meetingroom_name);	 		
	 	});
		
		 
		// 날짜 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".mr-date"));
		$(".mr-date").flatpickr({
			dateFormat: "Y-m-d",
			defaultDate: new Date(),
			local: 'ko'
		});
		
		
		
		// 오프캔버스 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d H:i",
			enableTime: true,
			minuteIncrement: 30,
			conjunction: " ~ ",
			local: 'ko'
		});
		 
		
		// flatpickr에서 선택된 날짜 구하고 날짜를 넣어주기
		getSelectedDate();
		putDate();
		putTodayDot();
		// flatpickr 날짜 변경 이벤트 
		$(".mr-date").change(function(){
			getSelectedDate();
			putDate();
			putTodayDot();
		}); 
		
		
		
		//종일 체크시
		$("#mr-write-allday").change(function(e){
			if($(this).is(":checked")){
				$("#mr-enddate").attr("disabled", true);
				$("#mr-enddate").css("cursor","not-allowed");
				
				const allday_date = $("#mr-startdate").val().substr(0,10);
				$("#mr-startdate").val(allday_date);
			}
			else{
				$("#mr-enddate").attr("disabled", false);
				$("#mr-enddate").css("cursor","");
			}
		});
		
		$("#mr-startdate").change(function(e){
			if($("#mr-write-allday").is(":checked")){
				const allday_date = $("#mr-startdate").val().substr(0,10);
				$("#mr-startdate").val(allday_date);
			}
			else{
				$("#mr-enddate").attr("disabled", false);
			}
		});
		
		
		
		
		// 저장하기 버튼 클릭시
	 	$("#goSave").click(function(){
	 		
	 		
	 		var start = []; 
	 		var end = [];
	 		
	 		var stimearr = $(".stime");
			for (var y=0; y<stimearr.length; y++) { // 시작 시간
				start.push($(".stime").eq(y).val());
			}
			
	 		var etimearr = $(".etime");
			for (var z=0; z<etimearr.length; z++) { // 종료시간
				end.push($(".etime").eq(z).val());
			}
	 		
	 		// 근무상태 저장하기
	 		$.ajax({
				url:"<%= request.getContextPath()%>/support/meetingroom.up", 
				traditional: true, // 배열 넘겨줄때 필요
				data:{"startTimeArr":start 
					 ,"endTimeArr":end
					 }, 
				//type:"POST",
				dataType:"JSON",   // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한 json.name 을 받아옴.
					alert("근무 상태가 저장되었습니다.");
					location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(==새로고침) 서버에 가서 다시 읽어옴. 
					
				}, 
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});
			
	 	});// end of $("#goSave").click(function()----------
		
		
		
		
		

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
		 	//console.log("selected_date : " +selected_date); // 2022. 12. 07

		 	// 주차 구하기
			var currentDay = new Date(valDate);
			var theYear = currentDay.getFullYear();
			var theMonth = currentDay.getMonth();
			var theDate  = currentDay.getDate();
			var theDayOfWeek = currentDay.getDay();
			//console.log("theDate : " +theDate); // 7일(현재날짜)
			//console.log("theDayOfWeek : " +theDayOfWeek); // 이번주 세번째인 수요일 => 3
			
			
			for(var i=1; i<8; i++) {
				var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
				var yyyy = resultDay.getFullYear();
				var mm = Number(resultDay.getMonth()) + 1;
				var dd = resultDay.getDate();  // 이번주 일요일 날짜 => 11
				//console.log("resultDay : " +resultDay);
				//console.log("yyyy : " +yyyy);
				//console.log("mm : " +mm);
				//console.log("dd : " +dd);
				
				mm = String(mm).length === 1 ? '0' + mm : mm;
				dd = String(dd).length === 1 ? '0' + dd : dd;
				
				thisWeek[i] = yyyy + '. ' + mm + '. ' + dd;
				thisWeekArr[i] = new Date(yyyy, mm-1, dd);
			}
		}//end of getSelectedDate()
		
		
		// 선택된 날짜를 넣어주는 함수(메인★)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		function putDate(){
			$(".date").each(function(index, item){
				$(item).html(thisWeek[index+1]);
				
				//console.log("thisWeek[index+1] >>>"+thisWeek[index+1]);
				thisWeekDate = thisWeek[index+1];
				
				// 총 근무시간 및 시작,종료시간 조회해오기
				$.ajax({
					url:"<%= request.getContextPath()%>/getworkTimebyDay.up",
					traditional: true,
					data:{"thisWeekDate":thisWeekDate},
					//type:"POST",
					async:false,
					dataType:"JSON",  
					success:function(json){ 
						console.log(JSON.stringify(json));  // 배열타입도 모두 찍을 수 있다.
						//console.log("JSON.workTime : "+json[0].workTime);
						//console.log("JSON.workMin : "+json[0].workMin);
						
						if(json.length <= 0){
							$("#workTime"+index).css("display","none");
						} else {
							if(json[0].workTime != 0 && json[0].workMin != 0) {
								$("#workTime"+index+"> span").text(json[0].workTime+"시간 "+json[0].workMin+"분"); // json에서 받은 배열 리스트는 한행이므로 [0] 번째 인덱스에 모두 저장되있음.
							} else if(json[0].workTime != 0 && json[0].workMin == 0) {
								$("#workTime"+index+"> span").text(json[0].workTime+"시간");
							}
						}
						
						// 총 근무시간 합 구하기
						
					},
					error: function(request, status, error){
			            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			        }					
				});
				
				
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

<div class="mettingroom-container margin-container">
	<div class="mettingroom-date">
		<div style="display: block;">
			<div>예약현황</div>
			<div>
				<input type="text" class="mr-date"/>
				<i class="fas fa-chevron-down mr-downarrow"></i>
			</div>
		</div>
		<div class="workingweek" style="clear:both; display:block;">
			<table class="fontsize-basic" style="border-collapse: collapse; border-radius: 5px; border-style: hidden; box-shadow: 0 0 0 1px rgba(0, 0, 0, .1);">
				<tr class="workinghour">
					<td></td>
					<c:forEach var="i" begin="0" end="23">
						<td colspan="2">${i}</td>
					</c:forEach>
				</tr>
				<tr>
					<td>가 회의실(20명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
					<div class="meetingroom-recordbar"></div>
				</tr>
				<tr>
					<td>나 회의실(30명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>다 회의실(15명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>라 회의실(10명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>마 회의실(8명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>바 회의실(8명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
			</table>
			
			
			<!-- 오프캔버스 시작 -->
			<div class="offcanvas offcanvas-end meetingroom-offcanvas" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  <div class="offcanvas-header">
			    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
			    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
			  <div class="offcanvas-body">
			  	<div class="meetingroom-offcanvas-body">
			  		<div>
			  			<div class="meetingroom-info">
							<i class="fa-solid fa-circle-info"></i>
							<div>
								<div>~에 위치한 회의실입니다. 예약 후 이용바랍니다.</div>
								<div>담당자 연락처 : 010-8828-4730</div>
							</div>
						</div>
			  		</div>
			  		
			  		<div class="mr-write-container">
			  			<div style="font-weight: bold;">예약 일정·정보 입력</div>
			  			<div>
			  				<div>
			  					<input id="mr-startdate" class="dateSelector stime" placeholder="ex) 2022-01-01" />
		  					</div>
							<i class="fa-solid fa-arrow-right" style="color: #C6C6C6; margin: 0px 2%;"></i>
							<div style="text-align: right;"> 
								<input id="mr-enddate" class="dateSelector etime" placeholder="ex) 2022-01-01" />
							</div>
			  			</div>
			  			<span class="mr-write-allday-container">
			  				<input id="mr-write-allday" type="checkbox"/> <label for="mr-write-allday">종일</label>
			  			</span>
			  		</div>
		  			<textarea class="mr-write" placeholder="예약 목적 입력"></textarea>
			  	<div class="workstatus-buttoncontainer">
		  			<button type="button" class="workstatus-save gradientbtn" id="goSave">저장하기</button> 
		  			<button type="reset" class="workstatus-cancel text-reset" data-bs-dismiss="offcanvas" aria-label="Close">취소</button>
	  			</div>
			  </div>
			</div>
			<!-- 오프캔버스 끝 -->
			</div>
			
		</div>
	</div>

</div>