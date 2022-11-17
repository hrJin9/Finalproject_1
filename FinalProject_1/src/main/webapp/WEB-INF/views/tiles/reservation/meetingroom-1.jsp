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
		position: absolute; top:53%; left:25%;
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
		
		
		
	}); //end of ready
</script>

<div class="mettingroom-container">
	<div>
		<div class="meetingroom-info">
			<i class="fa-solid fa-circle-info"></i>
			<div>
				<div>~에 위치한 회의실입니다. 예약 후 이용바랍니다.</div>
				<div>담당자 연락처 : 010-8828-4730</div>
			</div>
		</div>
	</div>
	<hr class="HRhr" style="margin: 20px 0;"/>
	<div class="mettingroom-date">
		<div style="display: block;">
			<div>예약하기</div>
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
			<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
			  <div class="offcanvas-header">
			    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
			    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
			  <div class="offcanvas-body">
			  	<div class="meetingroom-offcanvas">
			  		<table style="width:100%;">
			  			<tr>
			  				<td width="30%">예약일</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<td>예약자</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<td>익명예약</td>
			  				<td></td>
			  			</tr>
			  			<tr>
			  				<td>목적</td>
			  				<td></td>
			  			</tr>
			  		</table>
			  	</div>
			  </div>
			</div>
			<!-- 오프캔버스 끝 -->
			
			
		</div>
	</div>

</div>