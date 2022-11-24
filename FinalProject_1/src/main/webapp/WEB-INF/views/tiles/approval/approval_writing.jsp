<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="approval_writing_header.jsp"%>
<style>
	.approval-box > div:hover{
	    background-color: rgba(200,200,200, .2);
	    cursor: pointer;
	}
</style>
<script>
	$(document).ready(function(){
		$("#writebtn").hide();
		
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
	       
	       
	       // offcanvas
	       $(".dayoff-recordtable tr").click(function(){
				$('.offcanvas').offcanvas('show');
	    	   
				// 해당 날짜 넣어주기
				const do_date = $(this).find(".do-use-date").text();
				$(".do-oc-date").text(do_date);
	       });//end of offcanvas click
	       
	       
	       
	});
</script>

<div class="dayoff-index-container">
	<div class="dayoff-write">
		<!-- <div class="margin-container dayoff-subject">잔여 휴가</div> -->
		<div class="ml-1 margin-container approval-box" >
			<div class="dayoff-box timeoff mb-2" style="width: 32.4%;">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="25px"/>
				<div>
					<div>연차</div>
					<!-- <div>1일</div> -->
				</div>			
			</div>
			<div class="dayoff-box sick" style="width: 32.4%;">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/pill_1f48a.png" width="25px"/>
				<div>
					<div>사유서</div>
					<!-- <div>연차 소진시 60일</div> -->
				</div>	
			</div>
			<div class="dayoff-box condole" style="width: 32.4%;">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="25px"/>
				<div>
					<div>업무기안서</div>
					<!-- <div>신청시 5일 지급</div> -->
				</div>
			</div>
			<br>
			<div class="dayoff-box condole" style="width: 32.4%;">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="25px"/>
				<div>
					<div>기타</div>
					<!-- <div>신청시 5일 지급</div> -->
				</div>
			</div>
		
		</div>
		<!-- <hr class="HRhr" style="margin: 40px 0;"/> -->
	</div>
	
	<!-- 예정된 휴가가 있는 경우, 없으면 아예 아래 dayoff-expected 가 뜨지 않음 -->
	<!-- <div class="dayoff-expected margin-container">
		<div>
			<div class="dayoff-subject">예정 휴가
				연차사용예정이 있는 경우
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
							<span class="do-use-date">2022. 11. 17 (목)</span>
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
							<span class="do-use-date">2022. 11. 18 (금)</span>
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
	 -->
	
	<!-- <div class="dayoff-record margin-container">
		<div class="dayoff-subject">
			<div>사용 기록 
				연차사용내역이 있는 경우
				<span class="dayoff-count">1</span>
			</div>
			<div>
				<input type="text"/>
				<div><i class="fa-solid fa-angle-left"></i></div>
				<div><i class="fa-solid fa-angle-right"></i></div>
			</div>
		</div>
		<div> -->
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
			<!-- <div class="dayoff-exist">
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
							<span class="do-use-date">2022. 11. 18 (금)</span>
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
							<span class="do-use-date">2022. 11. 18 (금)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
						</td>
						<td width="5%">
							<div class="dayoff-more"><i class="fa-solid fa-ellipsis" style="margin:13px;"></i></div>
						</td>
					</tr>
				</table>
			</div> -->
		</div>
	
	
	
	
	<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end dayoff-offcanvas" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
		    <div class="do-oc-header">
		    	<div><span class="pic"><span>지은</span></span></div>
		    	<div>
		    		<div style="font-weight: bold;"><span>김지은</span>님의 휴가 요청</div>
			    	<div class="do-oc-date"></div>
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
		</div>
		<!-- 오프캔버스 끝 -->
	
	
</div>	