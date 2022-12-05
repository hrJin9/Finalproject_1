<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="dayoff_header.jsp"%>
<script>
	$(document).ready(function(){
		$("a#dayoff").css("color","black");
		$("a#dayoff-detail").css("color","black");
		$("a#dayoff-detail").addClass("iscurrent");
		
		// 플랫피커
		flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dayoff-datepicker"));
		$(".dayoff-datepicker").flatpickr({
		    dateFormat: "Y년",
		    defaultDate: new Date(),
			local: 'ko'
		});
		
		
	});
		
</script>

<div class="dayoff-detail-container margin-container">
	<div class="dayoff-detail">
		<div>
			<div class="dayoff-subject">연차 상세 현황</div>
			<div style="position: relative; top:25px; left: 12px;">
				<input type="text" class="dayoff-datepicker"/>
				<i class="fas fa-chevron-down"></i>
			</div>
		</div>
		<div class="dayoff-detail-sumbox">
			<div>
				<div style="background-color:green;"></div>
				<span>자동 부여</span>
				<div class="dayoff-plus">+ 1일</div>
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
				<div class="dayoff-minus">- ${requestScope.usedays}일</div>
			</div>
		</div>
		<div class="dayoff-adjustmentbox">
			<table>
				<thead>
					<tr>
						<td>날짜</td>
						<td>자동 부여</td>
						<td>자동 소멸</td>
						<td>조정</td>
						<td>사용</td>
						<td><div>잔여</div><div style="font-size:8pt;">전년도이월</div></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2022.10</td>
						<td>+1</td>
						<td></td>
						<td></td>
						<td></td>
						<td>-1</td>
					</tr>
					<tr>
						<td>2022.11</td>
						<td>+1</td>
						<td></td>
						<td></td>
						<td></td>
						<td>-1</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>	