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
		
		 $(".dayoff-datepicker").datepicker({
	           dateFormat: 'yy-mm-dd' //달력 날짜 형태
	           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	           ,changeYear: true //option값 년 선택 가능
	           ,changeMonth: true //option값  월 선택 가능                
	           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
	           ,buttonText: "선택" //버튼 호버 텍스트              
	           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	       });                    
	       
	       //초기값을 오늘 날짜로 설정해줘야 합니다.
	       $('.dayoff-datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
</script>

<div class="dayoff-detail-container contentsmargin">
	<div class="dayoff-detail">
		<div>
			<div>연차 상세 현황</div>
			<div>
				<input type="text"/>
				<div><i class="fa-solid fa-angle-left"></i></div>
				<div><i class="fa-solid fa-angle-right"></i></div>
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
				<div class="dayoff-none">없음</div>
			</div>
			<div class="sumbox-verticalline"></div>
			<div>
				<div style="background-color:#F29F05;"></div>
				<span >조정</span>
				<div class="dayoff-none">없음</div>
			</div>
			<div class="sumbox-verticalline"></div>
			<div>
				<div style="background-color:#5E9FF2;"></div>
				<span>사용</span>
				<div class="dayoff-minus">- 1일</div>
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
	

	<!-- 
	<div class="dayoff-sum-container">
		<div class="dayoff-sum">
			<div><div class="dayoff-year">발생연차</div><div class="dayoff-yearcnt">0</div></div>
			<div class="verticalline"></div>
			<div><div class="dayoff-mon">발생월차</div><div class="dayoff-moncnt">0</div></div>
			<div class="verticalline"></div>
			<div><div>이월월차</div><div class="dayoff-cnt">0</div></div>
			<div class="verticalline"></div>
			<div><div>조정연차</div><div class="dayoff-cnt">0</div></div>
			<div class="longer-verticalline"></div>
			<div><div>총연차</div><div class="dayoff-cnt">0</div></div>
			<div class="verticalline"></div>
			<div><div>사용연차</div><div class="dayoff-cnt">0</div></div>
			<div class="verticalline"></div>
			<div><div>잔여연차</div><div class="dayoff-cnt">0</div></div>
		</div>
	</div>
	<div class="dayoff-searchcontainer">
		<span>연차사용기간</span>
		<span class="ml-1">
			<input type="text" class="dayoff-datepicker"/>
			<input type="text" class="dayoff-datepicker"/>
		</span>
	</div>
	
	<div class="dayoff-use-container">
		<div>사용내역</div>
		<div>
			<table class="dayoff-use-table">
				<thead>
					<tr>
						<td>이름</td><td>부서</td><td>휴가종류</td><td>연차 사용기간</td><td>사용연차</td><td>내용</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>진혜린</td>
						<td>IT</td>
						<td>연차</td>
						<td>2022/11/09~2022/11/09</td>
						<td>1</td>
						<td>개인 사정으로 사용합니다.</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
 -->
</div>	