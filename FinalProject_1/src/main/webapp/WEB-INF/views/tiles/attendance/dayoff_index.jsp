<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="dayoff_header.jsp"%>
<script>
	$(document).ready(function(){
		$("a#dayoff").css("color","black");
		$("a#dayoff-index").css("color","black");
		
		flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dayoff-datepicker"));
		$(".dayoff-datepicker").flatpickr({
		    dateFormat: "Y년",
		    defaultDate: new Date(),
			local: 'ko'
		});
		
		// offcanvas
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
		
		
	});
	
	
	// function declaration
	function goApproval(){
		location.href="<%=ctxPath%>/approval/writing.up";
	}//end of goApproval()
	
</script>

<div class="dayoff-index-container">
	<div class="dayoff-write">
		<div class="margin-container dayoff-subject">잔여 휴가</div>
		<div class="ml-1 margin-container">
			<div class="dayoff-box timeoff" onclick="javascript:location.href='<%=ctxPath%>/approval/writing.up?type=timeoff'">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="25px"/>
				<div>
					<div>연차</div>
					<div><span>1</span>일 / <span>20</span>일</div>
				</div>			
			</div>
			<div class="dayoff-box sick" onclick="javascript:location.href='<%=ctxPath%>/approval/writing.up?type=sick'">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/pill_1f48a.png" width="25px"/>
				<div>
					<div>병가</div>
					<div>연차 소진시 60일</div>
				</div>	
			</div>
			<div class="dayoff-box etc" onclick="javascript:location.href='<%=ctxPath%>/approval/writing.up'">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="25px"/>
				<div>
					<div>기타</div>
					<div>신청</div>
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
							<span class="do-use-date">2022. 11. 17 (목)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
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
				<input type="text" class="dayoff-datepicker"/>
				<i class="fas fa-chevron-down"></i>
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
							<span class="do-use-date">2022. 11. 18 (금)</span>
						</td>
						<td width="5%">
							<div class="dayoff-cntinfo"><div>1일</div></div>
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
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 오프캔버스 시작 -->
	<div class="offcanvas offcanvas-end dayoff-offcanvas" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
	  <div class="offcanvas-header">
	    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
	    <div class="do-oc-header">
	    	<div><span class="pic"><span>지은</span></span></div>
	    	<div>
	    		<div style="font-weight: bold;"><span>김지은</span>님의 휴가 요청</div>
		    	<div class="do-oc-date"></div> <!-- 여긴 자바스크릡트 안해도 됨! -->
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