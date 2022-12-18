<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="meetingroom_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.workingweek > table > tbody > tr > td:first-child{ padding-left: 20px; }
	.meetingroom-recordbar{
		height: 25px;
		background-color: #04BFAD;
		border-radius: 5px;
		position: absolute;
	}
	
	.meeting{
		height: 68%; 
    	border: none; 
	}
	
	.mr-write-container > div:nth-child(2) {  
	    width: 100% !important; 
	}
	
</style>

 
<script>

$(document).ready(function(){
	
	/* 
	var timearr = [{"starttime":"01:00","endtime":"07:00","meetingroom":"b"},
					{"starttime":"12:00","endtime":"13:00","meetingroom":"b"},
					{"starttime":"13:00","endtime":"15:00","meetingroom":"a"},
					{"starttime":"10:00","endtime":"12:00","meetingroom":"d"}
					]; 
	
	var defaultposition = 0;
	$.each(timearr, function(index, item){
		
		var starttime_h = item.starttime.substr(0,2);
		var starttime_m = item.starttime.substr(3,2);
		var endtime_h = item.endtime.substr(0,2);
		var endtime_m = item.endtime.substr(3,2);
		
		var startclass = Number(starttime_h) * 2;
		var endclass = Number(endtime_h) * 2;
		if(starttime_m == "30")
			startclass++;
		if(endtime_m == "30")
			endclass++;
		var toppx = $("."+item.meetingroom).eq(0).parent().attr("id");
		toppx = defaultposition + Number(toppx);
		
		var width = ((endclass-startclass) > 0) ? (endclass-startclass) : 0;
		var leftpx = 418;
		leftpx += (startclass * 21.79);
		var widthpx = width * 21.79;
		
		
		var html = "<div class='meetingroom-recordbar' style='display:inline-block; width:"+widthpx+"px; left:"+leftpx+"px; top:"+toppx+"px;'></div>";
		$("#barcontainer-"+item.meetingroom).append(html);	
	});
	
	 */
	 
	 
	 
	
	var timearr = [{"startdate":"01:00","enddate":"07:00","meetingroom":"b"}];      
	
	  
	var defaultposition = 0;
	$.each(timearr, function(index, item){ 
		
		var startdate_h = item.startdate.substr(0,2);
		var startdate_m = item.startdate.substr(3,2);
		var enddate_h = item.enddate.substr(0,2);
		var enddate_m = item.enddate.substr(3,2);
		
		var startclass = Number(startdate_h) * 2;
		var endclass = Number(enddate_h) * 2;
		if(startdate_m == "30")
			startclass++;
		if(enddate_m == "30")
			endclass++;
		var toppx = $("."+item.meetingroom).eq(0).parent().attr("id");
		toppx = defaultposition + Number(toppx);
		
		var width = ((endclass-startclass) > 0) ? (endclass-startclass) : 0;
		var leftpx = 418;
		leftpx += (startclass * 21.79);
		var widthpx = width * 21.79;
		
		
		var html = "<div class='meetingroom-recordbar' style='display:inline-block; width:"+widthpx+"px; left:"+leftpx+"px; top:"+toppx+"px;'></div>";
		$("#barcontainer-"+item.meetingroom).append(html);	
	});
	/* recodr-bar 용 */
	
	
	
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
	
	
	
	
/* 	
	// flatpickr에서 선택된 날짜 구하고 날짜를 넣어주기
	getSelectedDate();
	putDate();
	putTodayDot();
	// flatpickr 날짜 변경 이벤트 
	$("dateSelector").change(function(){
		getSelectedDate(); 
		putDate();
		putTodayDot();
	}); 
	
	 */ 
	
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
	
		
		
<%-- 		
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
	 		
	 		// 회의실 예약하기 
	 		$.ajax({
				url:"<%= request.getContextPath()%>/support/meetingroom.up", 
				traditional: true, // 배열 넘겨줄때 필요
				data:{"startTimeArr":start 
					 ,"endTimeArr":end
					 }, 
				//type:"POST",
				dataType:"JSON",   // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한 json.name 을 받아옴.
					console.log("startTimeArr : " +startTimeArr);
					console.log("endTimeArr : " +endTimeArr); 
					alert("근무 상태가 저장되었습니다.");
					location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(==새로고침) 서버에 가서 다시 읽어옴. 
					
				}, 
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});
			
	 	});// end of $("#goSave").click(function()----------
		
 --%>		
	
	//=== ***(type="date")관련 시작 *** === // 
	// 시작시간, 종료시간		
	var html="";
	for(var i=0; i<24; i++){
		if(i<10){
			html+="<option value='0"+i+"'>0"+i+"</option>";
		}
		else{
			html+="<option value="+i+">"+i+"</option>";
		}
	}// end of for----------------------
	
	$("select#startHour").html(html);
	$("select#endHour").html(html);
	 
	// 시작분, 종료분 
	html="";
	for(var i=0; i<60; i=i+5){
		if(i<10){
			html+="<option value='0"+i+"'>0"+i+"</option>";
		}
		else {
			html+="<option value="+i+">"+i+"</option>";
		}
	}// end of for--------------------
	html+="<option value="+59+">"+59+"</option>"
	
	$("select#startMinute").html(html);
	$("select#endMinute").html(html); 
	// === ***(type="date")관련 끝 *** === // 
	
	// '종일' 체크박스 클릭시
	$("input#allDay").click(function() {
		var bool = $('input#allDay').prop("checked");
		
		if(bool == true) {
			$("select#startHour").val("00");
			$("select#startMinute").val("00");
			$("select#endHour").val("23");
			$("select#endMinute").val("59");
			$("select#startHour").prop("disabled",true);
			$("select#startMinute").prop("disabled",true);
			$("select#endHour").prop("disabled",true);
			$("select#endMinute").prop("disabled",true);
		} 
		else {
			$("select#startHour").prop("disabled",false);
			$("select#startMinute").prop("disabled",false);
			$("select#endHour").prop("disabled",false);
			$("select#endMinute").prop("disabled",false);
		}
	}); 	
	 	
		
	//저장 버튼 클릭  
	$("#goSave").click(function(){ 
	
		// 일자 유효성 검사 (시작일자가 종료일자 보다 크면 안된다!!)
		var startDate = $("input#startDate").val();	
	 	var sArr = startDate.split("-");
	 	startDate= "";	 
	 	for(var i=0; i<sArr.length; i++){
	 		startDate += sArr[i];
	 	}
	 	
	 	var endDate = $("input#endDate").val();	
	 	var eArr = endDate.split("-");   
	  	var endDate= "";
	  	for(var i=0; i<eArr.length; i++){
	  		endDate += eArr[i];
	  	}
			
	  	var startHour= $("select#startHour").val();
	  	var endHour = $("select#endHour").val();
	  	var startMinute= $("select#startMinute").val();
	  	var endMinute= $("select#endMinute").val();
	     
	  	// 조회기간 시작일자가 종료일자 보다 크면 경고
	     if (Number(endDate) - Number(startDate) < 0) {
	      	alert("종료일이 시작일 보다 작습니다."); 
	      	return;
	     }
	     
	  	// 시작일과 종료일 같을 때 시간과 분에 대한 유효성 검사
	     else if(Number(endDate) == Number(startDate)) {
	     	
	     	if(Number(startHour) > Number(endHour)){
	     		alert("종료일이 시작일 보다 작습니다."); 
	     		return;
	     	}
	     	else if(Number(startHour) == Number(endHour)){
	     		if(Number(startMinute) > Number(endMinute)){
	     			alert("종료일이 시작일 보다 작습니다.");  
	     			return;
	     		}
	     		else if(Number(startMinute) == Number(endMinute)){
	     			alert("시작일과 종료일이 동일합니다."); 
	     			return;
	     		}
	     	} 
	     }// end of else if---------------------------------
	 	
			
			// 오라클에 들어갈 date 형식(년월일시분초)으로 만들기
			var sdate = startDate+$("select#startHour").val()+$("select#startMinute").val()+"00";
			var edate = endDate+$("select#endHour").val()+$("select#endMinute").val()+"00";
			
			$("input[name=startdate]").val(sdate);
			$("input[name=enddate]").val(edate);
		
			  
			var frm = document.meetingFrm; 
			frm.action="<%= ctxPath%>/support/meetingroom_add.up";    
			frm.method="post"; 
			frm.submit(); 
			
			
			
			
	
		});// end of $("button#register").click(function(){})--------------------
	 	
	 	
		

		}); //end of ready
		 
		
		
		/////////////////////////////////////////////////////////////////////////////////////////////
		// function declaration
 		

		  
		
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
				<tr id="206">  
					<td>가 회의실(20명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td id="${i}" class="a"></td> 
					</c:forEach> 
				</tr>
				<tr id="260">
					<td>나 회의실(30명)</td>
					<c:forEach var="i" begin="0" end="47"> 
						<td id="${i}" class="b"></td>
					</c:forEach>
				</tr>
				<tr id="313">
					<td>다 회의실(15명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td id="${i}" class="c"></td>
					</c:forEach>
				</tr>
				<tr id="365">
					<td>라 회의실(10명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td id="${i}" class="d"></td>
					</c:forEach>
				</tr>
				<tr id="418">
					<td>마 회의실(8명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td id="${i}" class="e"></td>
					</c:forEach>
				</tr>
				<tr id="472">
					<td>바 회의실(8명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td id="${i}" class="f"></td>
					</c:forEach>
				</tr>
			</table>
			 
			<div id="barcontainer-a" style="float:left; margin-left: 262px;">
			</div>
			<div id="barcontainer-b" style="float:left; margin-left: 262px;">
			</div>
			<div id="barcontainer-c" style="float:left; margin-left: 262px;">
			</div>
			<div id="barcontainer-d" style="float:left; margin-left: 262px;">
			</div>
			<div id="barcontainer-e" style="float:left; margin-left: 262px;">
			</div>
			<div id="barcontainer-f" style="float:left; margin-left: 262px;">
			</div>
			
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
			  		
			  		<form name="meetingFrm">  
			  		<div class="mr-write-container">
			  			<div style="font-weight: bold;">예약 일정·정보 입력</div>
			  			<!-- 
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
			  			</span> -->  
			  			<div style="display: flex;align-items: center;">    
							<input type="date" id="startDate" value="${requestScope.chooseDate}" style="height: 30px;max-width: 18%;"/>&nbsp;  
							<select id="startHour" class="meeting"></select> 시  
							<select id="startMinute" class="meeting"></select> 분 
							<a style="margin: 0% 5%;">-</a>   
							<input type="date" id="endDate" value="${requestScope.chooseDate}" style="height: 30px;max-width: 18%;"/>&nbsp;
							<select id="endHour" class="meeting"></select> 시 
							<select id="endMinute" class="meeting"></select> 분&nbsp;  
							   
							<div style="display: flex;align-items: center;margin-left: 4%;">   
								<input type="checkbox" id="allDay" style="width: 31%;"/>&nbsp;<label for="allDay" style="">종일</label>    
							</div>
							
							<input type="hidden" name="startdate"/>
							<input type="hidden" name="enddate"/>
						</div> 
			  		</div> 
		  			<textarea class="mr-write" name="r_content" id="r_content" placeholder="예약 목적 입력"></textarea>
			  	<div class="workstatus-buttoncontainer">
		  			<button type="button" class="workstatus-save gradientbtn" id="goSave">저장하기</button> 
		  			<button type="reset" class="workstatus-cancel text-reset" data-bs-dismiss="offcanvas" aria-label="Close">취소</button>
	  			</div>
	  			<input type="hidden" value="${sessionScope.loginuser.employee_no}" name="fk_employee_no"/> 
	  		  </form>
			  </div>
			</div>
			<!-- 오프캔버스 끝 -->
			</div>
			
		</div>
	</div>

</div>