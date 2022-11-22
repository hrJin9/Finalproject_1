<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="meetingroom_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.workingweek > table > tbody > tr > td:first-child{ padding-left: 20px; }
	.meetingroom-recordbar{
		width: 50%;
		height: 20px;
		background-color: #04BFAD;
		border-radius: 5px;
		position: absolute; top:46%; left:25%;
	}
</style>

<script>
	$(document).ready(function(){
		$("a#mettingroom-3").removeClass("iscurrent");
		$("a#mettingroom-1").css("color","black");
		$("a#mettingroom-1").addClass("iscurrent");
		
		
		//offcanvas
	 	$(".workingweek > table > tbody > tr:first-child ~ tr").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		
	 		const meetingroom_name = $(e.target).parent().find("td:first-child").text();
			$(".offcanvas-title").text(meetingroom_name);	 		
	 	});
		
		
		// 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d H:i",
			enableTime: true,
			minuteIncrement: 30,
			conjunction: " ~ ",
			local: 'ko'
		});
		
		
		
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

		}); //end of ready
</script>

<div class="mettingroom-container margin-container">
	<div class="mettingroom-date">
		<div style="display: block;">
			<div>예약현황</div>
			<div>
				<input type="text"/>
				<div><i class="fa-solid fa-angle-left"></i></div>
				<div><i class="fa-solid fa-angle-right"></i></div>
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
				<tr>
					<td>가 회의실(20명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
					<div class="meetingroom-recordbar"></div>
				</tr>
				<tr>
					<td>나 회의실(30명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>다 회의실(15명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>라 회의실(10명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>마 회의실(8명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
				<tr>
					<td>바 회의실(8명)</td>
					<c:forEach var="i" begin="0" end="47">
						<td></td>
					</c:forEach>
				</tr>
			</table>
			
			
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
			  		
			  		<div class="mr-write-container">
			  			<div style="font-weight: bold;">예약 일정·정보 입력</div>
			  			<div>
			  				<div>
			  					<input id="mr-startdate" class="dateSelector" placeholder="ex) 2022-01-01" />
		  					</div>
							<i class="fa-solid fa-arrow-right" style="color: #C6C6C6; margin: 0px 2%;"></i>
							<div style="text-align: right;">
								<input id="mr-enddate" class="dateSelector" placeholder="ex) 2022-01-01" />
							</div>
			  			</div>
			  			<span class="mr-write-allday-container">
			  				<input id="mr-write-allday" type="checkbox"/> <label for="mr-write-allday">종일</label>
			  			</span>
			  		</div>
		  			<textarea class="mr-write" placeholder="예약 목적 입력"></textarea>
			  		
			  		<%-- 
			  		<div class="mr-writedetail-container">
			  			<div style="font-weight: bold;">상세 일정 편집</div>
			  			<div>
			  				<div>
					  			2022. 11. 9 (수)
			  				</div>
				  			<div>
				  				<div>
				  					<div class="dropdown-toggle" id="mr-status" data-bs-toggle="dropdown" aria-expanded="false">
				  						하루 종일
				  					</div>
				  					<ul class="dropdown-menu" aria-labelledby="mr-status" style="min-width: 6rem;">
										<li><a class="dropdown-item" href="#">시간 입력</a></li>
										<li><a class="dropdown-item" href="#">하루 종일</a></li>
									</ul>
				  				</div>
				  				<div class="dropdown-toggle workStartbox" id="workwriteStart" data-bs-toggle="dropdown" aria-expanded="false">
									시작 시각
								</div>
								<ul class="dropdown-menu workstarttime" aria-labelledby="workwriteStart" style="min-width: 6rem;">
									<c:forEach var="i" begin="0" end="23">
										<c:forEach var="j" begin="0" end="1">
											<c:if test="${i<10}"><li><a class="dropdown-item" href="#">0${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
											<c:if test="${i>=10}"><li><a class="dropdown-item" href="#">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
										</c:forEach>
									</c:forEach>
								</ul>
								<i class="fa-solid fa-arrow-right" style="color: #C6C6C6; margin: 0px 2%;"></i>
								<div class="dropdown-toggle workEndbox" id="workwriteEnd" data-bs-toggle="dropdown" aria-expanded="false">
									종료 시각						
								</div>
								<ul class="dropdown-menu workendtime" aria-labelledby="workwriteEnd" style="min-width: 6rem;">
									<c:forEach var="i" begin="0" end="23">
										<c:forEach var="j" begin="0" end="1">
											<c:if test="${i<10}"><li><a class="dropdown-item" href="#">0${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
											<c:if test="${i>=10}"><li><a class="dropdown-item" href="#">${i}:<fmt:formatNumber pattern="00" value="${j*30}" /></a></li></c:if>
										</c:forEach>
									</c:forEach>
								</ul>
				  			</div>
			  			</div>
			  		</div>
			  		 --%>
			  		
			  		
			  	<div class="workstatus-buttoncontainer">
		  			<button type="button" class="workstatus-save">저장하기</button>
		  			<button type="reset" class="workstatus-cancel text-reset" data-bs-dismiss="offcanvas" aria-label="Close">취소</button>
	  			</div>
			  </div>
			</div>
			<!-- 오프캔버스 끝 -->
			</div>
			
		</div>
	</div>

</div>