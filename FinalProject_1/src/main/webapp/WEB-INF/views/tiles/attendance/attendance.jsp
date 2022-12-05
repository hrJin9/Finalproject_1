<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="attendance_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.workstatus-save:hover{color: white;}
	
	.workwirte-container {margin-bottom: 11px;}
	
	.delete {
		display: none;
	    border: solid 1px rgba(0, 0, 0, .1);
	    border-radius: 5px;
	    background-color: white;
	    height: 25px;
	    width: 25px;
	    font-size: 9pt;
	    position: absolute;
	    right: -4%;
	    top: 23%;
		z-index: 9999 !important;
	    font-weight: 700;
	    color: #e60000;
	    padding: 0;
	}
	.delete:hover {
	    color: #e60000;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var attendancetype;
		var todaydate;

		$("a#attendance").addClass("list_iscurrent");
	 	$("a#dayoff").removeClass("list_iscurrent");
		
	 	// 날짜피커
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
		    dateFormat: "H:i",
			local: 'ko'
	 	}); 
	 	 
		
		// 오늘 버튼 클릭시 오늘로 날짜 설정
		$(".today").click(function(){
			$(".dateSelector").flatpickr({
				defaultDate:new Date(),
				dateFormat: "Y. m. d"
			});
			getSelectedDate();
			putDate();
			putTodayDot();
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
	 		const yyyymmdd = $(e.target).parent().find("span.date").text();
	 		const yyyy = yyyymmdd.substr(0,4);
	 		const mm = yyyymmdd.substr(6,2);
	 		const dd = yyyymmdd.substr(10,2);
	 		$("#offcanvasScrollingLabel").text(yyyy+"년 "+mm+"월 "+dd+"일");
	 		todaydate = yyyy+"년 "+mm+"월 "+dd+"일"
	 	});
	 	
	 	
	 	// 근무형태 선택 dropdown 값 선택이벤트
	 	/* $(".workStatusbox li").click(function(){
	 		const selectedimg = $(this).find("img").attr("src");
	 		const selectedtxt = $(this).find("a").text();
	 		$("#workwriteStatus > img").attr("src",selectedimg);
	 		$("#workwriteStatus > span").text(selectedtxt);
	 		attendancetype = selectedtxt;
	 	}); */
	 	/* $(document).on("click", ".workStatusbox li", function(e){
	 		const selectedimg = $(this).find("img").attr("src");
	 		const selectedtxt = $(this).find("a").text();
	 		$("#workwriteStatus > img").attr("src",selectedimg);
	 		$("#workwriteStatus > span").text(selectedtxt);
	 		attendancetype = selectedtxt;
	 	});  */
	 	
	 	
	 	// 근무형태 containter hover 시 삭제버튼 생성
	 	$(document).on("mouseenter", "div.workwirte-container", function(e){
	 		$("button.delete").css("display","block");
	 	}); 
	 	$(document).on("mouseleave", "div.workwirte-container", function(e){
	 		$("button.delete").css("display","none");
	 	}); 
	 	
	 	// 여기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	 	/* $(document).on("click", "#del_stepattendance", function(e){
	 		//$(this).parent("").remove(); //.remove 하면 모든 input이 삭제되어 버리기 때문에 따로 input에 class나 id를 안줬으면 last-child로 마지막 것 부터 하나씩 잡아 지워나간다.
	 		$(this).parents("attendanceplus *").remove(); //.remove 하면 모든 input이 삭제되어 버리기 때문에 따로 input에 class나 id를 안줬으면 last-child로 마지막 것 부터 하나씩 잡아 지워나간다.

		}); */
	 	
	 	
	 	
	 	
	 	$("span#all").click(function(e){
			$("span#all").css("font-weight","bold");
			location.href="<%= ctxPath%>/attendance.up";
		});
	 	
	 	
	 	// 저장하기 버튼 클릭시
	 	$("#goSave").click(function(){
	 		
	 		if(attendancetype == null || attendancetype == '') {
	 			attendancetype = '근무'
	 		}
	 		
	 		var att = [];
	 		var start = [];
	 		var end = [];
	 		
	 		//var select = document.getElementsByClassName('workwirte-container'); // 전체박스
	 		//console.log("select 길이 : "+ select.length);
	 		var select = $(".workwirte-container"); // 전체박스 번호
	 		//console.log("select 길이 : "+ select.length);
	 		
	 		//var stime = $(".stime").val();
	 		//var etime = $(".etime").val();
	 		
	 		for (var i=0; i<select.length; i++) {
            	att.push(select[i].innerText); // 근무형태
            }
	 		
	 		/*for (var z=0; z<select.length; z++) { 
	 			//start.push(select[z].getElementsByClassName('stime'));
	 			//start.push(select[z].stime);
	 			//console.log(select[z]);
	 			//console.log(select[z].findOne("#workwriteStart"));
	 			//start.push(select[z].find("#startdate").val());
            }*/
	 		
	 		/*for (var x=0; x<select.length; x++) {
	 			//end.push(select[x].getElementsByClassName('workEndbox'));
            }*/
	 		
	 		var stimearr = $(".stime");
			for (var z=0; z<stimearr.length; z++) { 
				start.push($(".stime").eq(z).val());
			}
			
	 		var etimearr = $(".etime");
			for (var x=0; x<etimearr.length; x++) { 
				end.push($(".etime").eq(x).val());
			}
	 		
	 		for (var j=0; j<att.length; j++) {
	 			console.log("att>>>>" + att[j]);
	 			console.log("start>>>>" + start[j]);
	 			console.log("end>>>>" + end[j]);
            }
	 		
	 		
	 		
	 		
	 		//var attendancetype = ["123","가나다","abc"];
	 		//var startdate = ["123","가나다","abc"];
	 		//var enddate = ["123","가나다","abc"];
	 		
	 		<%-- $.ajax({
				url:"<%= request.getContextPath()%>/attendance2.up",
				data:{"employee_no":$("input#employee_no").val()
					 ,"attendancetype":attendancetype
					 ,"todaydate":todaydate
					 ,"startdate":startdate
					 ,"enddate":enddate,
				type:"POST",
				dataType:"JSON",   // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한 json.name 을 받아옴.
					// json ==> {"n":1,"name":"이예은"} 또는 {"n":0,"name":"이예은"}
					/* const n  = json.n;
					if(n==0) {  // 포인트가 300점이 초과한다면
						alert(json.name + "님의 포인트는 300점을 초과할 수 없으므로 댓글쓰기가 불가합니다."); 
					}
					else {
						// goReadComment();  // 페이징 처리 안한 댓글 읽어오기
						goViewComment(1);    // 페이징 처리한 댓글 읽어오기.  맨처음에 (1)페이지를 읽어온다.				  
					}
					
					$("input#commentContent").val("");  // 입력한 댓글이 update 되면 입력란 비우기
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});  --%>
	 		
	 		
	 		<%-- $.ajax({
				url:"<%= request.getContextPath()%>/attendance2.up",
				data:{"employee_no":$("input#employee_no").val()
					 ,"attendancetype":attendancetype
					 ,"todaydate":todaydate
					 ,"startdate":$("input#startdate").val()
					 ,"enddate":$("input#enddate").val()},
				type:"POST",
				dataType:"JSON",   // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한 json.name 을 받아옴.
					// json ==> {"n":1,"name":"이예은"} 또는 {"n":0,"name":"이예은"}
					/* const n  = json.n;
					if(n==0) {  // 포인트가 300점이 초과한다면
						alert(json.name + "님의 포인트는 300점을 초과할 수 없으므로 댓글쓰기가 불가합니다."); 
					}
					else {
						// goReadComment();  // 페이징 처리 안한 댓글 읽어오기
						goViewComment(1);    // 페이징 처리한 댓글 읽어오기.  맨처음에 (1)페이지를 읽어온다.				  
					}
					
					$("input#commentContent").val("");  // 입력한 댓글이 update 되면 입력란 비우기 */
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});  --%>
	 		
	 		
	 		
	 		
	 	})// end of $("#goSave").click(function()----------
	 	
	 	
	});//end of $(document).ready(function(){})------------------
	
	
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
			
			thisWeek[i] = yyyy + '. ' + mm + '. ' + dd;
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
	
	/* 근무상태 박스 한개 비우기 */
	function del_stepattendance(e){
		const del_box = $(e.target).parent();
		console.log("del_box =>"+del_box)
		del_box.remove();
		
		//$("#workwirte-container"+num).remove();
	}
	
	// 근무형태 변경하기
	let id = null;
	function add_workwriteStatus(num, e){
		// num = $(e.target).attr("id");
		id = $(e.target).attr("id");
		//console.log("id 값 =>"+id);
		//console.log("num 값 =>"+num);
		const selectedimg = $(e.target).find("img").attr("src");
 		const selectedtxt = $(e.target).text();
 		
 		//console.log("selectedimg 값 =>"+selectedimg);
		//console.log("selectedtxt 값 =>"+selectedtxt);
 		$("#workwriteStatus"+num +" > img").attr("src",selectedimg);
 		$("#workwriteStatus"+num +" > span").text(selectedtxt);
 		//attendancetype = selectedtxt;
	}
	
     var i = 0;   
	/* 근무 박스 추가 */
	function attendanceplus(){
     ++i;
     var html = '<div class="workwirte-container dropdown" id="workwirte-container'+i+'" onclick="add_workwriteStatus('+i+',event)">'
                	+'<div class="dropdown-toggle workwritebox btn" id="workwriteStatus'+i+'" data-bs-toggle="dropdown" aria-expanded="false">'
		               +'<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>'
		                  +'<span>근무</span>'
	                +'</div>'
	                  +'<ul class="dropdown-menu workStatusbox" id="workStatusbox'+i+'" aria-labelledby="workwriteStatus" style="min-width: 7rem;">'
	                  +'<li>'
	                     +'<a id="statusval-working" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>근무</a>'
	                  +'</li>'
	                  +'<li>'
	                     +'<a id="statusval-remote" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/laptop_1f4bb.png" width="16px"/>원격근무</a>'
	                  +'</li>'
	                  +'<li>'
	                     +'<a id="statusval-outside" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/oncoming-automobile_1f698.png" width="16px"/>외근</a>'
	                  +'</li>'
	                  +'<li>'
	                     +'<a id="statusval-trip" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/spiral-calendar_1f5d3-fe0f.png" width="16px"/>출장</a>'
	                  +'</li>'
	                +'</ul>'
	               
	                +'<div class="workStartbox" id="workwriteStart">'
	                  +'<input type="text" class="timeSelector stime" id="startdate'+i+'" name="timepicker" placeholder="시작 시각"/>   '               
	                +'</div>'
	                +'<div style="display:inline-block;">'
	                  +'<i class="fa-solid fa-arrow-right" style="color: #C6C6C6"></i>'
	                +'</div>'
	               
	                +'<div class="workEndbox" id="workwriteEnd">'
	                  +'<input type="text" class="timeSelector etime" id="enddate'+i+'" name="timepicker" placeholder="종료 시각"/>'                  
	                +'</div>'
	                +'<button type="button" class="delete btn" onclick="del_stepattendance(event)">X</button>'
	                +'<input type="hidden" id="employee_no" value="${sessionScope.loginuser.employee_no}"/>'
	             +'</div>'
                +'</div>';
	       $("div.attendanceplus").append(html);
	       $(document).find("input[name=timepicker]").removeClass('hasDatepicker').flatpickr({
	            enableTime: true,
	            noCalendar: true,
	            dateFormat: "H:i",
	            local: 'ko'});  
  	 }
	
	
	/* 근무상태 박스 전체 비우기 */
	function del_allapproval(){
		i = 0;
		$(".attendanceplus").empty();
	}
	
	
</script>

<div class="attendance-container">
	<div class="datebox margin-container">
		<span class="" style="display: inline-block; width: 140px; ">
			<input class="dateSelector attendance-dateSelector">
			<i class="fas fa-chevron-down ad-downarrow"></i>
		</span>
		<button type="button" class="today btn">오늘</button>
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
		  	<form id="attendance_frm">
			  	<div>
			  		<div class="todayworkStatus-container">
				  		<span>총 근무</span>
				  		<div class="workingtotalhourByday ml-2"><span class="ml-1">9</span>시간</div>
				  		<div class="line"></div>
			  		</div>
			  		<!-- 근무 1개  -->
			  	    <div class="attendanceplus">
				  	    <div class="workwirte-container dropdown" id="workwirte-container0" onclick="add_workwriteStatus(0,event)">
							<div class="dropdown-toggle workwritebox btn" id="workwriteStatus0" data-bs-toggle="dropdown" aria-expanded="false">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>
								<span>근무</span>
							</div>
	 						<ul class="dropdown-menu workStatusbox" id="workStatusbox" aria-labelledby="workwriteStatus" style="min-width: 7rem;">
								<li>
									<a id="statusval-working" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/woman-technologist_1f469-200d-1f4bb.png" width="16px"/>
										근무
									</a>
								</li>
								<li>
									<a id="statusval-remote" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/laptop_1f4bb.png" width="16px"/>
										원격근무
									</a>
								</li>
								<li>
									<a id="statusval-outside" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/oncoming-automobile_1f698.png" width="16px"/>
										외근
									</a>
								</li>
								<li>
									<a id="statusval-trip" class="dropdown-item" href="#"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/325/spiral-calendar_1f5d3-fe0f.png" width="16px"/>
										출장
									</a>
								</li>
							</ul> 
							
							<div class="workStartbox" id="workwriteStart">
								<input type="text" class="timeSelector stime" id="startdate" name="timepicker" placeholder="시작 시각"/>						
							</div>
							<div style="display:inline-block;">
								<i class="fa-solid fa-arrow-right" style="color: #C6C6C6"></i>
							</div>
							
							<div class="workEndbox" id="workwriteEnd">
								<input type="text" class="timeSelector etime" id="enddate" name="timepicker" placeholder="종료 시각"/>						
							</div>
							<!-- <button type="button" class="delete btn" onclick="del_stepattendance(event)"><i class="fas fa-times"></i></button> -->
							<button type="button" class="delete btn" onclick="del_stepattendance(event)">X</button>
							<input type="hidden" id="employee_no" value="${sessionScope.loginuser.employee_no}"/>
						</div>
					</div>
					<!-- 근무 1개 끝  -->
					
			  		<div class="workadd" onclick="attendanceplus(1)">
			  			<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt;">추가하기</span></div>
		  			</div>
		  			<div class="workstatus-buttoncontainer">
		  				<button type="button" class="workstatusall-del btn" onclick="del_allapproval()"><i class="fa-solid fa-trash-can" ></i></button> <%-- 전체 삭제하기 --%>
			  			<button type="button" class="workstatus-save gradientbtn btn" id="goSave">저장하기</button>
			  			<button type="reset" class="workstatus-cancel btn">취소</button>
		  			</div>
			  	</div>
		  	</form>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->
	</div>
</div>
