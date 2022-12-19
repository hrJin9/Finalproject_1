<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
 	String ctxPath = request.getContextPath();
	//     /board
%>

<style type="text/css">

	#edit{
	  border: none;   
	  border-radius: 10px;
	  width: 66px; 
	  height: 34px; 
	  background-color: #5F98F6;
	  color: white;  
	
	} 
	#edit:hover {  
		color: white;    
		opacity: 50%;  
	} 
	
	#del_register{ 
	   border: none; 
	   border-radius: 10px;
	   width: 66px; 
	   height: 34px;   
	   background-color: #b4b4b4;
	   color: white;
	}
	#del_register:hover {   
		color: #ed0000;    
		opacity: 50%; 
	}
	
	#cancel{ 
	   border: none;  
	   border-radius: 10px;
	   width: 66px; 
	   height: 34px;   
	   background-color: #b4b4b4;
	   color: white;
	}
	#cancel:hover {   
		color: #ed0000;    
		opacity: 50%; 
	}



	tbody, td, tfoot, th, thead, tr {
		border-style: none; 
	} 
	
	.admin_container {
		width: 88%;
		margin: 0 auto;
	}

	/* 상단 nav바  */	
	#admin_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#admin_mainList { 
		position: relative;
		display: flex;
		width: 77%;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#admin_mainList a {
		display: block; 
		width: 13%;
		padding: 0.7em 0 0.9em 0;
		color: #333;
		text-decoration: none;
		margin-right: 4%;
		color: #D2D6D9;
	} 
	
	#schedule > tbody > tr > td{
		color: #7a7a7a; 
	}
	 
	 


	table#schedule{ 
		margin-left: 5%; 
	}
	
	table#schedule th, td{
	 	padding: 10px 5px;
	 	vertical-align: middle;
	}
	
	a{
	    color: #395673;
	    text-decoration: none;
	    cursor: pointer;
	}
	
	a:hover {
	    color: #395673;
	    cursor: pointer;
	    text-decoration: none;
		font-weight: bold;
	}
	
	button.btn_normal{
		background-color: #0071bd;
		border: none;
		color: white;
		width: 70px;
		height: 30px;
		font-size: 12pt;
		padding: 3px 0px;
		margin-right: 10px;
		border-radius: 10%;
	}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		// ==== 종일체크박스에 체크를 할 것인지 안할 것인지를 결정하는 것 시작 ==== //
		// 시작 시 분
		var str_startdate = $("span#startdate").text();
	 // console.log(str_startdate); 
		// 2021-12-01 09:00
		var target = str_startdate.indexOf(":");
		var start_min = str_startdate.substring(target+1);
	 // console.log(start_min);
		// 00
		var start_hour = str_startdate.substring(target-2,target);
	 //	console.log(start_hour);
		// 09
		
		// 종료 시 분
		var str_enddate = $("span#enddate").text();
	//	console.log(str_enddate);
		// 2021-12-01 18:00
		target = str_enddate.indexOf(":");
		var end_min = str_enddate.substring(target+1);
	 // console.log(end_min);
	    // 00 
		var end_hour = str_enddate.substring(target-2,target);
	 //	console.log(end_hour);
		// 18
		
		if(start_hour=='00' && start_min=='00' && end_hour=='23' && end_min=='59' ){
			$("input#allDay").prop("checked",true);
		}
		else{
			$("input#allDay").prop("checked",false);
		}
		// ==== 종일체크박스에 체크를 할 것인지 안할 것인지를 결정하는 것 끝 ==== //
		
	}); // end of $(document).ready(function(){})==============================


	// ~~~~~~~ Function Declartion ~~~~~~~
	
	// 일정 삭제하기
	function delSchedule(calno){    
	
		var bool = confirm("일정을 삭제하시겠습니까?");
		
		if(bool){
			$.ajax({
				url: "<%= ctxPath%>/schedule/deleteSchedule.up",
				type: "post",
				data: {"calno":calno},
				dataType: "json",
				success:function(json){
					if(json.n==1){
						alert("일정을 삭제하였습니다.");
					}
					else {
						alert("일정을 삭제하지 못했습니다.");
					}
					
					location.href="<%= ctxPath%>/schedule/scheduleManagement.up";
				},
				error: function(request, status, error){
		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
			});
		}
		
	}// end of function delSchedule(calno){}-------------------------


	// 일정 수정하기
	function editSchedule(calno){ 
		var frm = document.goEditFrm;
		frm.calno.value = calno;
		
		frm.action = "<%= ctxPath%>/schedule/editSchedule.up";
		frm.method = "post";
		frm.submit(); 
	}

</script>
 
<div>
<nav id="admin_mainList" class="margin-container"> 
	<a id="memberlogin_mainList" style="color: black;" class="header-nonsub">일정 상세보기</a><a href="<%= ctxPath%>/schedule/scheduleManagement.up" style="font-size: medium;position: absolute;top: 20%;right: -18%;"><span>◀캘린더로 돌아가기</span></a>  
	<div class="list_underline"></div>
</nav> 
<hr class="HRhr" style="margin-top: 0px;"/><br> 




		<table id="schedule" class="table table-bordered">
			<tr> 
				<th style="vertical-align: middle;">제목</th>
				<td>${requestScope.map.SUBJECT}</td>
			</tr>
		
		
			<tr>
				<th style="width: 160px; vertical-align: middle;">일자</th>
				<td>
					<span id="startdate">${requestScope.map.STARTDATE}</span>&nbsp;~&nbsp;<span id="enddate">${requestScope.map.ENDDATE}</span>&nbsp;&nbsp;  
					<input type="checkbox" id="allDay" disabled/>&nbsp;종일
				</td>
			</tr>
			
			
			<tr>
				<th style="vertical-align: middle;">캘린더종류</th>
				<td>
				<c:if test="${requestScope.map.FK_LGCATGONO eq '2'}">
					사내 캘린더 - ${requestScope.map.SMCATGONAME}
				</c:if>
				<c:if test="${requestScope.map.FK_LGCATGONO eq '1'}">
					내 캘린더 - ${requestScope.map.SMCATGONAME}
				</c:if></td> 
			</tr>
			<tr>
				<th style="vertical-align: middle;">장소</th> 
				<td>${requestScope.map.PLACE}</td>
			</tr> 
			
			<tr>
				<th style="vertical-align: middle;">공유자</th>
				<td>${requestScope.map.JOINUSER}</td> 
			</tr> 
			<tr>  
				<th style="vertical-align: middle;">내용</th> 
				<td><textarea id="content" rows="10" cols="100" style="height: 145px; border: revert;border-color: darkgray;border-radius: 10px;padding: 10px;color: #7a7a7a;" readonly>${requestScope.map.CONTENT}</textarea></td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">작성자</th>
				<td>${requestScope.map.name_kr}</td>  
			</tr>
		</table>
	 
	<input type="hidden" value="${sessionScope.loginuser.employee_no}" />
	<input type="hidden" value="${requestScope.map.FK_LGCATGONO}" />
	 
	<c:set var="v_fk_employee_no" value="${requestScope.map.FK_employee_no}" />
	<c:set var="v_fk_lgcatgono" value="${requestScope.map.FK_LGCATGONO}"/> 
	<c:set var="v_loginuser_employee_no" value="${sessionScope.loginuser.employee_no}"/> 
	 
 
	<div style="float: right;margin-right: 15.5%;">     
		<c:if test="${not empty requestScope.listgobackURL_schedule}">
	    <%--     
	               일정이 사내캘린더 인데, 로그인한 사용자가 4번 부서에 근무하는 3직급을 가진 사용자 이라면    
	        <c:if test="${v_fk_lgcatgono eq '2' && sessionScope.loginuser.fk_pcode =='3' && sessionScope.loginuser.fk_dcode == '4' }">  
	    --%>
			<c:if test="${v_fk_lgcatgono eq '2' && sessionScope.loginuser.position == '과장' }"> 
				<button type="button" id="edit" class="btn_normal" onclick="editSchedule('${requestScope.map.calno}')">수정</button> 
				<button type="button" id="del_register" class="btn_normal" onclick="delSchedule('${requestScope.map.calno}')">삭제</button>
			</c:if>
			<c:if test="${v_fk_lgcatgono eq '1' && v_fk_employee_no eq v_loginuser_employee_no}">   
				<button type="button" id="edit" class="btn_normal" onclick="editSchedule('${requestScope.map.calno}')">수정</button>
				<button type="button" id="del_register" class="btn_normal" onclick="delSchedule('${requestScope.map.calno}')">삭제</button>
			</c:if>
				<button type="button" id="cancel" class="btn_normal" style="margin-right: 0px;" onclick="javascript:location.href='<%= ctxPath%>${requestScope.listgobackURL_schedule}'">취소</button> 
		</c:if>   
		 
		<c:if test="${empty requestScope.listgobackURL_schedule}">   
		<%--  
	               일정이 사내캘린더 인데, 로그인한 사용자가 4번 부서에 근무하는 3직급을 가진 사용자 이라면   
	        <c:if test="${v_fk_lgcatgono eq '2' && sessionScope.loginuser.fk_pcode =='3' && sessionScope.loginuser.fk_dcode == '4' }">  
	    --%> 
	        <c:if test="${v_fk_lgcatgono eq '2' && sessionScope.loginuser.position == '과장' }">
				<button type="button" id="edit" class="btn_normal" onclick="editSchedule('${requestScope.map.calno}')">수정</button> 
				<button type="button" id="del_register" class="btn_normal" onclick="delSchedule('${requestScope.map.calno}')">삭제</button>
			</c:if>
			<c:if test="${v_fk_lgcatgono eq '1' && v_fk_employee_no eq v_loginuser_employee_no}">  
				<button type="button" id="edit" class="btn_normal" onclick="editSchedule('${requestScope.map.calno}')">수정</button>
				<button type="button" id="del_register" class="btn_normal" onclick="delSchedule('${requestScope.map.calno}')">삭제</button>
			</c:if>
				<button type="button" id="cancel" class="btn_normal" style="margin-right: 0px;" onclick="javascript:location.href='<%= ctxPath%>/schedule/detailSchedule.up'">취소</button> 
		</c:if>
	 
	</div> 
</div>

<form name="goEditFrm">
	<input type="hidden" name="calno"/> 
	<input type="hidden" name="gobackURL_detailSchedule" value="${requestScope.gobackURL_detailSchedule}"/>
</form>
