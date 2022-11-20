<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="meetingroom_header.jsp"%>
<style>

</style>

<script>
	$(document).ready(function(){
		$("a#mettingroom-1").removeClass("iscurrent");
		$("a#mettingroom-3").css("color","black");
		$("a#mettingroom-3").addClass("iscurrent");
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
		<div>
			<div>예약하기</div>
			<div>
				<input type="text"/>
				<div><i class="fa-solid fa-angle-left"></i></div>
				<div><i class="fa-solid fa-angle-right"></i></div>
			</div>
		</div>
		<div>
		
		
		
		</div>
	</div>

</div>