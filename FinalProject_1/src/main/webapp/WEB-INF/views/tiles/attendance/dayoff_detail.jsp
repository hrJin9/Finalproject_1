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
		<%-- $("select#selyear").change(function(e) {
			const year = $("select#selyear").val();
			console.log(year);
			
			$.ajax({
				url:"<%= request.getContextPath()%>/dayoff/detail2.up",
				data:{"year":year},
				type:"POST",
				dataType:"JSON",          // AttendanceController.java 로 data 를 보낸다.
				success:function(json){   // AttendanceController.java 에서 jsonObj.put() 한  것을 받아옴.
					console.log(JSON.stringify(json));  // 배열타입도 모두 찍을 수 있다.
					
					let html = "";
		         	var num = 1;  
		           	if(json.length != 0) {
		           		
		           		console.log(json[0].list);
		           		//console.log(arr);
		           		var arr = json[0].list;
		           		
			     		$.each(arr, function(index, item){  // list 만큼 반복
			     			
			     			console.log("길이:" +item.length);
			     			
			     			html += '<tr>';
			     					
				     				if( num < 10 ) {
				     					html += '<td>'+year+'. 0'+num+'</td>';
				     					if( num == 1 ) {
				     						html += '<td>11일</td>';
				     					} else {
				     						html += '<td>+1일</td>';
				     					}
				     					html += '<td> </td>'
				     					      + '<td> </td>';
			     					    if(item == '0') {
					     					html += '<td> </td>';
				     					} else {
					     					html += '<td>-'+item+'</td>';
				     					}
				     				}
				     				else {  // 10월 이상이면
				     					html += '<td>'+year+'. '+num+'</td>';
				     					if( num == 1 ) {
				     						html += '<td>11일</td>';
				     					} else {
				     						html += '<td>+1일</td>';
				     					}
				     					html += '<td> </td>'
				     					      + '<td> </td>';
				     					if(item == '0') {
							     			html += '<td> </td>';
						     			} else {
							     			html += '<td>-'+item+'</td>';
						     			}
				     				}
			     				
			     			html += '</tr>';
		     			    num++;
		     			   $(".dayoffDetail").html(html);
			     		}); 
			     		
		            }
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }					
			});
		}); // end of $("select#selyear").change--------------  --%>
		 
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
				<!-- <select name="selyear" id="selyear">
					<option value="2019">2019년</option>
					<option value="2020">2020년</option>
					<option value="2021">2021년</option>
					<option value="2022" selected>2022년</option>
				</select> -->
			</div>
		</div>
		<div class="dayoff-detail-sumbox">
			<div>
				<div style="background-color:green;"></div>
				<span>자동 부여</span>
				<div class="dayoff-plus">+ ${requestScope.dayoff_receiveCnt}일</div>
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
			<table id="doyoffTable">
				<thead>
					<tr>
						<td>날짜</td>
						<td>자동 부여</td>
						<td>자동 소멸</td>
						<td>조정</td>
						<td>사용</td>
						<!-- <td>잔여</td>  -->
						<!-- <td><div>잔여</div><div style="font-size:8pt;">전년도이월 0</div></td> -->
					</tr>
				</thead>
				<tbody class="dayoffDetail">
					<%-- <tr>
						<td>2022.11</td>
						<td>+${requestScope.doaddResult}일</td>
						<td></td>
						<td></td>
						<td></td>
						<td>${requestScope.UnusedDays + requestScope.lastUsedays}</td>
					</tr> --%>
					<c:forEach varStatus="i" begin="0" end="${requestScope.thismm -1}" var="dovo" items="${requestScope.list}">
					<%-- <c:forEach varStatus="i" begin="0" end="12" var="dovo" items="${requestScope.list}"> --%> <!-- (1년치 확인용)테스트 -->
						<tr>
							<c:choose>
								<c:when test="${requestScope.thismm == 1 && requestScope.workingyear >= 1}">  <!-- ★★ 매년 1월기준  근속년수 1년 이상 직원일 경우 ★★ -->
									<c:if test="${i.count < 10}"> <%-- 1 ~ 9월 --%>
										<td>${requestScope.thisyyyy}. 0${i.count}</td>
										
										<c:if test="${i.count == 1 && sessionScope.loginuser.position == '사원'}">
											<td>+15일</td>
										</c:if>
										<c:if test="${i.count == 1 && sessionScope.loginuser.position == '대리'}">
											<td>+17일</td>
										</c:if>
										<c:if test="${i.count == 1 && sessionScope.loginuser.position == '과장'}">
											<td>+20일</td>
										</c:if>
										<c:if test="${i.count == 1 && sessionScope.loginuser.position == '부장'}">
											<td>+22일</td>
										</c:if>
										<c:if test="${i.count == 1 && sessionScope.loginuser.position == '대표'}">
											<td>+25일</td>
										</c:if>
										<c:if test="${i.count != 1}">
											<td>+0일</td>
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
									</c:if>
									<c:if test="${i.count >= 10}"> <%-- 10 ~ 12월 --%>
										<td>${requestScope.thisyyyy}. ${i.count}</td>
										<td>+0일</td>
										<td></td>
										<td></td>
										<c:if test="${dovo == '0'}">
											<td></td>
										</c:if>
										<c:if test="${dovo != '0'}">
											<td>-${dovo}</td>
										</c:if>
										<!-- <td></td> -->
									</c:if>
								</c:when>
								
								
								<c:otherwise> <!-- ★★ 매년 1월기준  근속년수 1년 미만 직원일 경우 ★★ -->
		                           <c:if test="${i.count < 10}"> <%-- 1 ~ 9월 --%>
		                              <c:if test="${requestScope.hiredate_mm <= i.count}"> <!-- 중간에 1년이 되었을시 -->
		                                 <td>${requestScope.thisyyyy}. 0${i.count}</td>
		                                 
		                                 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '사원'}">
											<td>+${15- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '대리'}">
											<td>+${17- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '과장'}">
											<td>+${20- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '부장'}">
											<td>+${22- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '대표'}">
											<td>+${25- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm != i.count}">
											<td>+0일</td>
										 </c:if>
		                                 
		                                 <td></td>
		                                 <td></td>
		                                 <c:if test="${dovo == '0'}">
		                                    <td></td>
		                                 </c:if>
		                                 <c:if test="${dovo != '0'}">
		                                    <td>-${dovo}</td>
		                                 </c:if>
		                              </c:if>
		                              
		                              <c:if test="${requestScope.hiredate_mm > i.count}">  <!-- 1년 미만시 -->
		                                 <td>${requestScope.thisyyyy}. 0${i.count}</td>
		                                 <td>+1일</td>
		                                 <td></td>
		                                 <td></td>
		                                 <c:if test="${dovo == '0'}">
		                                    <td></td>
		                                 </c:if>
		                                 <c:if test="${dovo != '0'}">
		                                    <td>-${dovo}</td>
		                                 </c:if>
		                                 <!-- <td></td> -->
		                              </c:if>
		                           </c:if>
		                           
		                           <c:if test="${i.count >= 10}"> <%-- 10 ~ 12월 --%>
		                              <c:if test="${requestScope.hiredate_mm <= i.count}"> <!-- 중간에 1년이 되었을시 -->
		                                 <td>${requestScope.thisyyyy}. ${i.count}</td>
		                                 
		                                 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '사원'}">
											<td>+${15- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '대리'}">
											<td>+${17- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '과장'}">
											<td>+${20- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '부장'}">
											<td>+${22- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm == i.count && sessionScope.loginuser.position == '대표'}">
											<td>+${25- (i.count -1)}일</td>
										 </c:if>
										 <c:if test="${requestScope.hiredate_mm != i.count}">
											<td>+0일</td>
										 </c:if>
		                                 
		                                 <td></td>
		                                 <td></td>
		                                 <c:if test="${dovo == '0'}">
		                                    <td></td>
		                                 </c:if>
		                                 <c:if test="${dovo != '0'}">
		                                    <td>-${dovo}</td>
		                                 </c:if>
		                              </c:if>
		                              <c:if test="${requestScope.hiredate_mm > i.count}"> <!-- 1년 미만시 -->
		                                 <td>${requestScope.thisyyyy}. ${i.count}</td>  
		                                 <td>+1일</td>
		                                 <td></td>
		                                 <td></td>
		                                 <c:if test="${dovo == '0'}">
		                                    <td></td>
		                                 </c:if>
		                                 <c:if test="${dovo != '0'}">
		                                    <td>-${dovo}</td>
		                                 </c:if>
		                                 <!-- <td></td> -->
		                              </c:if>
		                              <%-- <td>${requestScope.thisyyyy}. ${i.count}</td>
		                              <td>+1일</td>
		                              <td></td>
		                              <td></td>
		                              <c:if test="${dovo == '0'}">
		                                 <td></td>
		                              </c:if>
		                              <c:if test="${dovo != '0'}">
		                                 <td>-${dovo}</td>
		                              </c:if>
		                              <!-- <td></td> --> --%>
		                           </c:if>
		                        </c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
	</div>
</div>	