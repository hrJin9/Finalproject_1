<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%> 

<style type="text/css">
/* 페이지 전체 레이아웃 */
.main_container {
	width: 88%;
	margin: 0 auto;
}

div#alert {
	width: 200px; 
	height: 35px; 
	background-color: #4d4d4d; 
	color: white; 
	font-weight: bold; 
	font-size:10pt; 
	border-radius: 2em; 
	padding-left: 32px;
	position: fixed; 
	top: 15px;
	right: 40%;
	box-shadow: 1px 1px 1px 1.3px rgba(0, 0, 0, 0.2);
}

.button {
	font-weight: bold;
	width: 44px;
	height: 28px;
	padding: 3.5px 8px;
	font-size: 10pt;
}

</style>

<script type="text/javascript">

	$(document).ready(function(){
	
		$("div#alert").hide();  // 알림창 숨기고 시작한다.
	
		
		$("button#return").click(function(){  // 반려버튼 클릭시
			$("div#alert").show();
			$("span#alertText").html("반려처리 되었습니다.");
		});
	   
	});// end of $(document).ready(function(){})-----------------------------	

</script>

<div class="main_container">
	<div style="font-weight: bold; font-size: 13pt; color: #595959; margin-top: 50px; margin-bottom: 30px;">진행중인 일&nbsp;<span style="font-weight: normal; font-size: 11.5pt; color: #8c8c8c;">(1)</span></div>
    <div class="bg-light text-dark">
	   	<i class="fas fa-user-circle" style="color:#737373; font-size:33px; float: left; padding: 20px 0 20px 35px;"></i>
	   	<div class="card-body" style="height: 80px; display: table-cell; vertical-align: middle; clear: both;">
	   		<span style="font-weight: bold; font-size: 11pt; color: #4d4d4d; padding-right: 38px;">승인 요청 - '출장비 신청'</span>
	   		<span style="font-weight: bold; font-size: 9pt; color: #8c8c8c; padding-right: 450px;">김지은・30분전</span>
	   		<button type="button" class="btn btn-sm button" id="return" style="background-color: white; border: solid 0.5px #e6e6e6; color: #595959; margin-right: 1px;">반려</button>
			<button type="button" class="btn btn-sm button" id="approval" style="background-color: #3385ff; color: white;">승인</button>
	   	</div>
	</div>
	<hr>
	
	<div style="font-weight: bold; font-size: 13pt; color: #595959; margin-top: 30px; margin-bottom: 30px;">완료한 일&nbsp;<span style="font-weight: normal; font-size: 11.5pt; color: #8c8c8c;">(2)</span></div>
    <div class="bg-light text-dark">
	   	<i class="fas fa-user-circle" style="color:#737373; font-size:33px; float: left; padding: 20px 0 20px 35px;"></i>
	   	<div class="card-body" style="height: 80px; display: table-cell; vertical-align: middle;">
	   		<span style="font-weight: bold; font-size: 11pt; color: #4d4d4d; padding-right: 38px;">승인 요청 - '야근식대 신청'</span>
	   		<span style="font-weight: bold; font-size: 9pt; color: #8c8c8c; padding-right: 480px;">진혜린・30분전</span>
			<button type="button" class="btn btn-sm button" style="background-color: #07B4191F; color: #034C0B; border-radius: 2em;">승인</button>
	   	</div>
	</div>
	<br>
    <div class="bg-light text-dark">
	   	<i class="fas fa-user-circle" style="color:#737373; font-size:33px; float: left; padding: 20px 0 20px 35px;"></i>
	   	<div class="card-body" style="height: 80px; display: table-cell; vertical-align: middle;">
	   		<span style="font-weight: bold; font-size: 11pt; color: #4d4d4d; padding-right: 38px;">승인 요청 - '초과수당 신청'</span>
	   		<span style="font-weight: bold; font-size: 9pt; color: #8c8c8c; padding-right: 480px;">진혜린・30분전</span>
	   		<button type="button" class="btn btn-sm button" style="background-color: #F24B171F; color: #661400; border-radius: 2em;">반려</button>
	   	</div>
	</div>
	
	<div id="alert">
		<i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:7px; font-size:13pt;"></i>
		<span id="alertText"></span>
	</div>
	
</div>


