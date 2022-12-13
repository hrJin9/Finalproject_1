<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="dayoff_header.jsp"%>

<style type="text/css">

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

<script>
	$(document).ready(function(){
		$("a#dayoff").css("color","black");
		$("a#dayoff-detail").css("color","black");
		$("a#dayoff-detail").addClass("iscurrent");
		
		// 플랫피커
		/* flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dayoff-datepicker"));
		$(".dayoff-datepicker").flatpickr({
		    dateFormat: "Y년",
		    defaultDate: new Date(),
			local: 'ko'
		}); */
		
		
		// ** selectbox 최근 5년으로 기간 설정 시작 ** //
		var date = new Date();
		var selYear = date.getFullYear(); // 현재시간에 따라 지정된 날짜의 년도를 반환
		
		// 현재 년도 기준으로 호출
		getYears(selYear);
		$("#selyear").val(selYear);
		// ** selectbox 최근 5년으로 기간 설정 끝 ** //
		
		
		
		// 연차 상세현황 datepicker 년도 설정
		//const year = $("input.dayoff-datepicker").val();
		$("select#selyear").change(function(e) {
			const year = $("select#selyear").val();
			console.log(year);
			
			$.ajax({
				url:"<%= request.getContextPath()%>/dayoff/detail2.up",
				data:{"year":year},
				type:"POST",
				dataType:"JSON",          // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한  것을 받아옴.
					let html = "";
		         	
					/* html = '<span id="dayoff-usecnt"></span>';
				
					
		           	if(json.length != 0) {
			     		$.each(json, function(index, item){
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
		            }
			        else {
			        	html += '<div class="dayoff-none"><div>'
				        	        + '<i class="fa-solid fa-circle-info" style="display: block; margin-bottom: 5px;"></i>'
				        	        + '사용 기록이 없습니다.'
			        	        + '</div></div>';
			        }
	           	
	   	         	$(".last_dayoff").html(html);  */
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});
		});// end of $("select#selyear").change--------------
		
		
	});// end of $(document).ready(function(){})----------------
	
	
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

<div class="dayoff-detail-container margin-container">
	<div class="dayoff-detail">
		<div>
			<div class="dayoff-subject">연차 상세 현황</div>
			<div style="position: relative; top:25px; left: 12px;">
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
		<div class="dayoff-detail-sumbox">
			<div>
				<div style="background-color:green;"></div>
				<span>자동 부여</span>
				<div class="dayoff-plus">+ ${requestScope.totalUsedays}일</div>
			</div>
			<div class="sumbox-verticalline"></div>
			<div>
				<div style="background-color:#BF2604;"></div>
				<span>자동 소멸</span>
				<div class="dayoff-nonecnt">없음</div>
			</div>
			<div class="sumbox-verticalline"></div>
			<div>
				<div style="background-color:#F29F05;"></div>
				<span >조정</span>
				<div class="dayoff-nonecnt">없음</div>
			</div>
			<div class="sumbox-verticalline"></div>
			<div>
				<div style="background-color:#5E9FF2;"></div>
				<span>사용</span>
				<div class="dayoff-minus">- ${requestScope.lastUsedays}일</div>
			</div>
		</div>
		<div class="dayoff-adjustmentbox" style="margin-bottom: 80px;">
			<table>
				<thead>
					<tr>
						<td>날짜</td>
						<td>자동 부여</td>
						<td>자동 소멸</td>
						<td>조정</td>
						<td>사용</td>
						<!-- <td>잔여</td> -->
						<!-- <td><div>잔여</div><div style="font-size:8pt;">전년도이월 0</div></td> -->
					</tr>
				</thead>
				<tbody>
					<%-- <tr>
						<td>2022.11</td>
						<td>+${requestScope.doaddResult}일</td>
						<td></td>
						<td></td>
						<td></td>
						<td>${requestScope.UnusedDays + requestScope.lastUsedays}</td>
					</tr> --%>
					<c:forEach varStatus="i" begin="0" end="${requestScope.thismm}" var="dovo" items="${requestScope.list}">
						<tr>
							<c:choose>
								<c:when test="${i.count < 10}">
									<td>${requestScope.thisyyyy}. 0${i.count}</td>
									<c:if test="${i.count == 1}">
										<td>+${requestScope.totalUsedays - 11}일</td>
									</c:if>
									<c:if test="${i.count != 1}">
										<td>+1일</td>
									</c:if>
									<td></td>
									<td></td>
									<c:if test="${dovo == '0'}">
										<td></td>
									</c:if>
									<c:if test="${dovo != '0'}">
										<td>-${dovo}</td>
									</c:if>
									<!-- <td></td> -->
								</c:when>
								
								<c:otherwise>
									<td>${requestScope.thisyyyy}. ${i.count}</td>
									<c:if test="${i.count == 1}">
										<td>+${requestScope.totalUsedays - 11}일</td>
									</c:if>
									<c:if test="${i.count != 1}">
										<td>+1일</td>
									</c:if>
									<td></td>
									<td></td>
									<c:if test="${dovo == '0'}">
										<td></td>
									</c:if>
									<c:if test="${dovo != '0'}">
										<td>-${dovo}</td>
									</c:if>
									<!-- <td></td> -->
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				
					<%-- <tr id="workwirte-container0">
						<td>2022.12</td>
						<td>+1일</td>
						<td></td>
						<td></td>
						<td>-${requestScope.thismmUsedays}일</td> <!-- 월단위로 사용연차  -->
						<td>${requestScope.UnusedDays}</td>
					</tr> --%>
				</tbody>
			</table>
		</div>
	</div>
</div>	