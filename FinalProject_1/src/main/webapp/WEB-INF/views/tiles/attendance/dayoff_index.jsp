<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="dayoff_header.jsp"%>
<script>
	$(document).ready(function(){
		$("a#dayoff").css("color","black");
		$("a#dayoff-index").css("color","black");
		
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

<div class="dayoff-index-container">
	<div class="dayoff-write">
		<div class="margin-container dayoff-subject">휴가 등록</div>
		<div class="ml-1 margin-container">
			<div class="dayoff-box timeoff">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="25px"/>
				<div>
					<div>연차</div>
					<div>1일</div>
				</div>			
			</div>
			<div class="dayoff-box sick">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/pill_1f48a.png" width="25px"/>
				<div>
					<div>병가</div>
					<div>연차 소진시 60일</div>
				</div>	
			</div>
			<div class="dayoff-box condole">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="25px"/>
				<div>
					<div>조의</div>
					<div>신청시 5일 지급</div>
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
				<span class="dayoff-count">1</span>
			</div>
			<div class="dayoff-exist">
				<table class="dayoff-recordtable">
					<tr>
						<td width="2.5%">
							<div style="margin-right: 10px;">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>
							</div>
						</td>
						<td>
							<span>연차</span>
							<span class="dayoff-line"></span>
							<span>2022. 11. 18 (금)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
						</td>
						<td width="5%">
							<div class="dayoff-more"><i class="fa-solid fa-ellipsis" style="margin:13px;"></i></div>
						</td>
					</tr>
					<tr>
						<td width="2.5%">
							<div style="margin-right: 10px;">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>
							</div>
						</td>
						<td>
							<span>연차</span>
							<span class="dayoff-line"></span>
							<span>2022. 11. 18 (금)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
						</td>
						<td width="5%">
							<div class="dayoff-more"><i class="fa-solid fa-ellipsis" style="margin:13px;"></i></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	
	<div class="dayoff-record margin-container">
		<div class="dayoff-subject">
			<div>사용 기록 
				<!-- 연차사용내역이 있는 경우 -->
				<span class="dayoff-count">1</span>
			</div>
			<div>
				<input type="text"/>
				<div><i class="fa-solid fa-angle-left"></i></div>
				<div><i class="fa-solid fa-angle-right"></i></div>
			</div>
		</div>
		<div>
			<!-- 연차 사용내역이 없는 경우 -->
			<!-- 
			<div class="dayoff-none">
				<div>
					<i class="fa-solid fa-circle-info" style="display: block; margin-bottom: 5px;"></i>
					사용 기록이 없습니다.
				</div>
			</div>
			 -->
			<!-- 연차 사용내역이 있는 경우 -->
			<div class="dayoff-exist">
				<table class="dayoff-recordtable">
					<tr>
						<td width="2.5%">
							<div style="margin-right: 10px;">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>
							</div>
						</td>
						<td>
							<span>연차</span>
							<span class="dayoff-line"></span>
							<span>2022. 11. 18 (금)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
						</td>
						<td width="5%">
							<div class="dayoff-more"><i class="fa-solid fa-ellipsis" style="margin:13px;"></i></div>
						</td>
					</tr>
					<tr>
						<td width="2.5%">
							<div style="margin-right: 10px;">
								<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="20px"/>
							</div>
						</td>
						<td>
							<span>연차</span>
							<span class="dayoff-line"></span>
							<span>2022. 11. 18 (금)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
						</td>
						<td width="5%">
							<div class="dayoff-more"><i class="fa-solid fa-ellipsis" style="margin:13px;"></i></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</div>	