<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="dayoff_header.jsp"%>

<style type="text/css">

.dayoffdate {
    font-weight: 400;
    color: #4d4d4d;
    font-size: 10.5pt;
}

#selyear {
    border: solid 1px rgba(0, 0, 0, .1);
    border-radius: 5px;
    background-color: transparent;
    height: 30px;
    width: 110px;
    font-size: 11pt;
    position: relative;
    bottom: 1px;
    right: 25%;
    font-weight: 500;
    color: rgba(0,0,0,0.7);
    padding: 0 15px;
    cursor: pointer;
}

</style>
 
<script type="text/javascript">

	$(document).ready(function(){
		$("a#dayoff").css("color","black");
		$("a#dayoff-index").css("co,lor","black");
		
		/* 
		// datepicker
		flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dayoff-datepicker"));
		$(".dayoff-datepicker").flatpickr({
		    dateFormat: "Y년",
		    defaultDate: new Date(),
			local: 'ko'
		}); */

		
		//** offcanvas 시작 **//
		$(".dayoff-recordtable tr").click(function(e) {
			$('.offcanvas').offcanvas('show');

			// 해당 날짜 넣어주기
			const do_date = $(this).find(".do-use-date").text();
			$(".do-oc-date").text(do_date);
		});//end of offcanvas click
		
		
		//... 클릭시 휴가 취소
		$(".dayoff-more").click(function(){
			$(".do-more-cancel").fadeToggle(100);
		});
		//** offcanvas 끝 **//
		
		
		// ** selectbox 최근 5년으로 기간 설정 시작 ** //
		var date = new Date();
		var selYear = date.getFullYear(); // 현재시간에 따라 지정된 날짜의 년도를 반환
		
		// 현재 년도 기준으로 호출
		getYears(selYear);
		$("#selyear").val(selYear);
		// ** selectbox 최근 5년으로 기간 설정 끝 ** //
		
		
		// 예정휴가 목록 전체개수
		const plan_allCnt = $("span.do-use-plan-date").length;
		document.getElementById("dayoff-plancnt").textContent = plan_allCnt;
		// 사용기록 목록 전체개수
		const use_allCnt = $("span.do-use-date").length;
		document.getElementById("dayoff-usecnt").textContent = use_allCnt;
		
		
		// 사용기록 datepicker 년도 설정
		//const year = $("input.dayoff-datepicker").val();
		$("select#selyear").change(function(e) {
			const year = $("select#selyear").val();
			//console.log(year);
			
			$.ajax({
				url:"<%= request.getContextPath()%>/dayoff/index2.up",
				data:{"year":year},
				type:"POST",
				dataType:"JSON",   // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한  것을 받아옴.
					let html = "";
		         	
				    const use_allCnt = json.length;
	    			document.getElementById("dayoff-usecnt").textContent = use_allCnt;
					
		           	if(json.length != 0) {
		           		
		           		html += '<div class="dayoff-exist">'
		     					+ '<table class="dayoff-recordtable last_dayoff">';
		           		
			     		$.each(json, function(index, item){  // 반복문
			     			 html += '<tr>'
									+ '<td width="2.5%">'
										+ '<div style="margin-right: 10px;">'
											+ '<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>'
										+ '</div>'
									+ '</td>'
									+ '<td>'
										+ '<span>'+item.docatgo+'</span>'
										+ '<span class="dayoff-line"></span>'
										+ '<span class="do-use-date dayoffdate">'+item.startdate+'&nbsp;('+item.startday+')&nbsp;&nbsp;~&nbsp;&nbsp;'+item.enddate+'&nbsp;('+item.endday+')</span>'
									+ '</td>'
									+ '<td width="5%">'
										+ '<div class="dayoff-cntinfo"><div>'+item.usedays+'일</div></div>'
									+ '</td>'
								+ '</tr>';
			     		}); 
			     		
			     		html += '</table>'
							+ '</div>';
		            }
			        else {
			        	html += '<div class="dayoff-none"><div>'
				        	        + '<i class="fa-solid fa-circle-info" style="display: block; margin-bottom: 5px;"></i>'
				        	        + '사용 기록이 없습니다.'
			        	        + '</div></div>';
			        }
	           	
	   	         	// $(".last_dayoff").html(html); 
	   	         	$(".last_dayoffStatus").html(html); 
	   	         	
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});
		});// end of $("select#selyear").change--------------
		
		
	});// end of $(document).ready(function(){})----------------
	
	
	// function declaration
	function goApproval(){
		location.href="<%=ctxPath%>/approval/writing.up";
	}//end of function goApproval()------------
	
	
	// 올해 기준으로 최근 5년 보여주기
	function getYears(getY) {
		// 기존 option 삭제하기
		$("#selyear option").remove();
		
		var stY = Number(getY)-4;
		var edY = Number(getY);
		for(var y=stY; y<=edY; y++){
			$("#selyear").append("<option value='"+y+"'>"+ y +"년" +"</option>");
		}
	}// end of function getYears(getY)----------
	
	
</script>

<div class="dayoff-index-container">
	<div class="dayoff-write">
		<div class="margin-container dayoff-subject">잔여 휴가</div>
		<div class="ml-1 margin-container">
			<div class="dayoff-box timeoff" onclick="javascript:location.href='<%=ctxPath%>/approval/writing.up?type=timeoff'">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="25px"/>
				<div>
					<div>연차 신청</div>
					<%-- <div><span>${requestScope.evo.dayoff_cnt}</span>일 / <span>20</span>일</div> --%>
					<div><span>${requestScope.dayoff_receiveCnt - requestScope.lastUsedays}</span>일 / <span>${requestScope.dayoff_receiveCnt}</span>일</div>
				</div>			
			</div>
			<div class="dayoff-box sick" onclick="javascript:location.href='<%=ctxPath%>/approval/writing.up?type=sick'">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/pill_1f48a.png" width="25px"/>
				<div>
					<div>병가 신청</div>
					<div>연차 소진시 최대 30일</div>
				</div>	
			</div>
			<div class="dayoff-box etc" onclick="javascript:location.href='<%=ctxPath%>/approval/writing.up'">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="25px"/>
				<div>
					<div>기타 신청</div>
					<div>경조/공가</div>
				</div>
			</div>
		
		</div>
		<hr class="HRhr" style="margin: 40px 0;"/>
	</div>
	
	<!-- 예정된 휴가가 있는 경우, 없으면 아예 아래 dayoff-expected 가 뜨지 않음 -->
	<div class="dayoff-expected margin-container">
		<div>
			<div class="dayoff-subject">예정 휴가
				<!-- 연차사용예정이 있는 경우 -->
				<span class="dayoff-count" id="dayoff-plancnt"></span>
			</div>
			
			<!-- 연차 예정내역이 없는 경우 -->
			<c:if test="${empty requestScope.comedayoff}">
				<div class="dayoff-none">
					<div>
						<i class="fa-solid fa-circle-info" style="display: block; margin-bottom: 5px;"></i>
						예정 내역이 없습니다.
					</div>
				</div>
			</c:if>
			
			<!-- 연차 예정내역이 있는 경우 -->
			<div class="dayoff-exist">
				<table class="dayoff-recordtable">
				  <c:forEach var="dayoffvo" items="${requestScope.comedayoff}" varStatus="status">
					<tr>
						<td width="2.5%">
							<div style="margin-right: 10px;">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>
							</div>
						</td>
						<td>
							<span>${dayoffvo.docatgo}</span>
							<span class="dayoff-line"></span>
							<span class="do-use-plan-date dayoffdate">${dayoffvo.startdate}&nbsp;(${dayoffvo.startday})&nbsp;&nbsp;~&nbsp;&nbsp;${dayoffvo.enddate}&nbsp;(${dayoffvo.endday})</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>${dayoffvo.usedays}일</div></div>
						</td>
					</tr>
				  </c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	
	<div class="dayoff-record margin-container">
		<div class="dayoff-subject">
			<div>사용 기록 
				<!-- 연차사용내역이 있는 경우 -->
				<span class="dayoff-count" id="dayoff-usecnt"></span> <%-- 개수 구하기  --%>
			</div>
			<div>
				<!-- <input type="text" class="dayoff-datepicker"/>
				<i class="fas fa-chevron-down"></i> -->
				<select name="selyear" id="selyear">
					<!-- <option value="2019">2019년</option>
					<option value="2020">2020년</option>
					<option value="2021">2021년</option>
					<option value="2022" selected>2022년</option> -->
				</select>
			</div>
		</div>
		
		<div class="last_dayoffStatus">
			<!-- 연차 사용내역이 없는 경우 -->
			<c:if test="${empty requestScope.lastdayoff}">
				<div class="dayoff-none">
					<div>
						<i class="fa-solid fa-circle-info" style="display: block; margin-bottom: 5px;"></i>
						사용 기록이 없습니다.
					</div>
				</div>
			</c:if>
			
			<!-- 연차 사용내역이 있는 경우 -->
			<div class="dayoff-exist">
				<table class="dayoff-recordtable last_dayoff">
				  <c:forEach var="dayoffvo" items="${requestScope.lastdayoff}" varStatus="status">
					<tr>
						<td width="2.5%">
							<div style="margin-right: 10px;">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>
							</div>
						</td>
						<td>
							<span>${dayoffvo.docatgo}</span>
							<span class="dayoff-line"></span>
							<span class="do-use-date dayoffdate">${dayoffvo.startdate}&nbsp;(${dayoffvo.startday})&nbsp;&nbsp;~&nbsp;&nbsp;${dayoffvo.enddate}&nbsp;(${dayoffvo.endday})</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>${dayoffvo.usedays}일</div></div>
						</td>
					</tr>
				  </c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	
	
	<!-- 오프캔버스 시작 -->
	<!-- <div class="offcanvas offcanvas-end dayoff-offcanvas" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
	  <div class="offcanvas-header">
	    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
	    <div class="do-oc-header">
	    	<div><span class="pic"><span>지은</span></span></div>
	    	<div>
	    		<div style="font-weight: bold;"><span>김지은</span>님의 휴가 요청</div>
		    	<div class="do-oc-date"></div> 여긴 자바스크릡트 안해도 됨!
	    	</div>
	    </div>
	    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	  </div>
	  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
	  <div class="offcanvas-body">
	  	<div>
	  		<div style="font-weight: bold;"><span><i class="fas fa-paper-plane" style="font-size: 10pt; margin-right: 10px;"></i></span>요청 내용</div>
	  		<div class="do-oc-tablecontainer">
	  			<table class="do-oc-table">
	  				<tr>
	  					<td width="25%">휴가종류</td>
	  					<td width="75%">연차</td>
	  				</tr>
	  				<tr>
	  					<td>휴가기간</td>
	  					<td>2022. 11. 2(수) ~ 2022. 11. 3(목)</td>
	  				</tr>
	  				<tr>
	  					<td>사용시간</td>
	  					<td>2일</td>
	  				</tr>
	  				<tr>
	  					<td>메시지</td>
	  					<td>우왕</td>
	  				</tr>
	  			</table>
	  		</div>
  			<button type="reset" class="do-oc-cancel">휴가 취소하기</button>
	  	</div>
	  </div>
	</div> -->
	<!-- 오프캔버스 끝 -->
	
</div>	