<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/admin_ad_usage.css?after">

<style type="text/css">
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	var sc = "${requestScope.paraMap.sc}";
	var sv = "${requestScope.paraMap.sv}";
	var dc = "${requestScope.paraMap.dc}";
	var dv = "${requestScope.paraMap.dv}";
	var sp = "${requestScope.paraMap.sp}";
	var year = "${requestScope.paraMap.year}";
	
	if(sc != "") 
		$("#searchCondition").val(sc);
	if(sv != "") 
		$("input[name='sv']").val(sv);
	if(dc != "")
		$("#dc").val(dc);
	if(dv != "")
		$("#dv").val(dv);
	if(sp != "")
		$("#cntselect").val(sp);
	if(year != "")
		$("#year").val(year);
	
	
	// 데이트피커
	$("#year").datepicker({
	    format: "yyyy",
	    viewMode: "years",
	    minViewMode: "years",
	    autoclose:true //to close picker once year is selected
	});
	
	if($("#year").val() == ""){
		var defaultYear = new Date().getFullYear();
		$("#year").val(defaultYear);
	}
	
	$(".dateDown").click(function(){
		$("#year").trigger("click");
	});
	
	
	// 기간 선택시 검색input박스 바꿔주기
	$("#searchCondition").change(function(){
		$("#sv").val("");
		
		if($(this).val() == "period"){
			$("#sv").addClass("daterangeSelector");
			// 기간 데이트피커
			flatpickr.localize(flatpickr.l10ns.ko);
			$(".daterangeSelector").flatpickr({
				mode: "range",
			    local: 'ko'
			});
		} else {
			flatpickr(".daterangeSelector").destroy();
		}
		
	});
	
	
	//검색
	$(".icon-search").click(function(){
		var frm = document.douseForm;
		frm.action = "<%=ctxPath%>/admin_attendanceList_usage.up";
		frm.submit();
	});
	 
	$("#sv").keyup(function(e){
		if(e.keyCode==13){
			var frm = document.douseForm;
			frm.action = "<%=ctxPath%>/admin_attendanceList_usage.up";
			frm.submit();
		}
	});
	
	
	$(".dropdown-menu > a").click(function(){
		var dc = $(this).parent().attr("id");
		var dv = $(this).attr("id");
		
		$("#dc").val(dc);
		$("#dv").val(dv);
		
		var frm = document.douseForm;
		frm.action = "<%=ctxPath%>/admin_attendanceList_usage.up";
		frm.submit();
	});
	
	
	$("#year").change(function(){
		var frm = document.douseForm;
		frm.action = "<%=ctxPath%>/admin_attendanceList_usage.up";
		frm.submit();
	});
	
	$("#write").click(function(){
		getExcelAdUse();
	});
	
	
});// end ready
//////////////////////////////////////////////////////////////////////////////////////

//엑셀 다운로드
function getExcelAdUse(){
	
	const frm = document.douseForm;
	frm.method = "post";
	frm.action = "<%= ctxPath%>/getExcelAdUse.up";
	frm.submit();
	
}//end of getExcelEmp


	
</script>

<nav id="admin_mainList" class="margin-container">
	<a id="admin_attendance_holding" href="<%= request.getContextPath()%>/admin_attendanceList_holding.up" class="header-nonsub">휴가 보유 현황</a>
	<a id="admin_attendance_usage" href="<%= request.getContextPath()%>/admin_attendanceList_usage.up" style="color: rgb(77, 79, 83);"  class="header-nonsub">휴가 사용 내역</a>
	<div class="list_underline"></div>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>


<form id="douseForm" name="douseForm" class="booking-form">
<div class="admin_container">	
	<div class="contentsmargin">
		<div style="display: inline-block;">
			<input id="year" name="year" type="text" class="dateSelector" data-provide="datepicker" style="border: solid 1px rgba(0,0,0,0.1);border-radius: 5px;padding: 5px 10px;font-size: 11pt;color: rgb(77, 79, 83);width: 90px;cursor: pointer;" readonly/>
			<i class="fa-solid fa-angle-down dateDown" style="cursor: pointer; position:relative; right:26px; top:1px; color: #d4d4d4;"></i>
		</div>
		<div id="getExcel" style="display: inline-block;">
      	 	<a id="write" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid rgba(0,0,0,0.1); border-radius:5px; background-color:white; color:#212529; margin-left: 3px;">
		       	<span><i class="fa-solid fa-download"></i></span>
		       	<span>목록 다운로드</span>
      	 	</a>
      	 </div>
		
		<%-- 검색 --%>
		<div class="row" style="padding-bottom: 20px; float: right;">
		    <div class=" mr-2">
				<div class="form-group">
					<div class="form-field">
						<select name="sc" id="searchCondition" style="font-size: 10pt; padding:8px 12px; font-weight: 500; color: #4d4f53;">
							<option value="name_kr" class="username">이름</option>
							<option value="period" class="period">기간</option>
						</select>
					</div>
				</div>
			</div>
			<div>
				<div class="form-group">
					<div class="form-field" style="padding-left:5px; margin-right: 14px;">
						<input type="text" class="" id="sv" name="sv" placeholder="검색" style="width:105%; font-size: 10pt; padding:7px 10px; border: solid 1px rgba(0,0,0,0.1); border-radius: 0.25rem;">
						<!-- <input type="text" class="form-control daterangeSelector" id="period" name="sv" placeholder="검색" style="display:none; width:105%; font-size: 9pt; padding:6px 6px; background-color: #fff;"> -->
					</div>
				</div>
			</div>
			<div class="align-items-end mt-1 mr-4">
				<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
					<a  class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 11pt; padding: 0.375rem; position: absolute; right: 9.2%; top:17.2%;"></a>
				</div>
			</div>
			<div class=" mr-2">
				<div class="form-group">
					<div class="form-field" style="padding-right:10px;">
						<select name="sp" id="cntselect" style="font-size: 10pt; padding:8px 12px; font-weight: 500; color: #4d4f53;">
							<option selected>20</option>
							<option>40</option>
							<option>80</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		
		<%-- 전체 구성원 --%>
		<div style="margin-bottom: 15px; float: left;">
	    <%-- 테이블 상단 버튼 만들기 --%>
		</div>
		<table class="custom-table my-3">   
	    	<thead>   
	            <tr>
	              <th class="boardth" width="11%" scope="col"><div style="border: none;">이름
	              <!-- <span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span> -->
	              </div></th>
	              <th class="boardth" width="12%" scope="col"><div data-bs-toggle="dropdown" style="border: none;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div>  
					  <div id="department_name" class="dropdown-menu">
					     <a id="" class="dropdown-item" >전체</a>
					  		<c:forEach var="dvo" items="${requestScope.dvoList}">
					  			<a id="${dvo.department_name}" class="dropdown-item" >${dvo.department_name}</a>
					  		</c:forEach>
				  			<a id="none" class="dropdown-item" >미지정</a>
					  </div>
				  </th>
	              <th class="boardth" width="11%" scope="col"><div data-bs-toggle="dropdown" style="border: none;">직위<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div> 
					  <div id="position" class="dropdown-menu">
						<a id="" class="dropdown-item" >전체</a>
						<c:forEach var="position" items="${requestScope.pList}">
						<a id="${position}" class="dropdown-item" >${position}</a>
						</c:forEach>
					  </div>
				  </th>
	              <th class="boardth" width="11%" scope="col"><div data-bs-toggle="dropdown" style="border: none;">항목<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div> 
					  <div id="ap_type" class="dropdown-menu">
					      <a id="연차" class="dropdown-item">연차</a>
					      <a id="경조" class="dropdown-item">경조</a>
					      <a id="공가" class="dropdown-item">공가</a>
					      <a id="병가" class="dropdown-item">병가</a>
					  </div>
				  </th>
	              <th class="boardth" width="16%" scope="col">기간</th>
				  <!-- 
	              <th class="boardth" width="13%" scope="col"><div data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">세부 항목<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div> 
					  <div class="dropdown-menu">
					      <a class="dropdown-item" >연차</a>
					      <a class="dropdown-item" >반차</a>
					      <a class="dropdown-item" >병가</a>
					      <a class="dropdown-item" >조의</a>
					      <a class="dropdown-item" >결혼</a>
					      <a class="dropdown-item" >배우자출산</a>
					      <a class="dropdown-item" >군소집훈련</a>
					      <a class="dropdown-item" >여름휴가</a>
					      <a class="dropdown-item" >기타 사유</a>
					  </div>
				  </th>
				   -->
	              <th class="boardth" width="11%" scope="col">결재신청일</th>
	              <th class="boardth" width="11%" scope="col"><div data-bs-toggle="dropdown" style="border: none;">승인 여부<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div> 
					  <div id="final_signyn" class="dropdown-menu">
					      <a id="1" class="dropdown-item">승인</a>
					      <a id="0" class="dropdown-item">반려</a>
					  </div>
				  </th>
	            </tr> 
			</thead>
			<tbody>
	           
            	<c:forEach var="evo" items="${requestScope.empList}">
            	 <tr> 
	              <td>${evo.name_kr}</td>
	              <td>${evo.department_name}</td>
	              <td>${evo.position}</td>
	              <td>${evo.ap_type}</td>
	              <td>${evo.startdate}&nbsp;~&nbsp;${evo.enddate}</td>
	              <td>${evo.writeday}</td>
	              <td>
	              	<c:if test="${evo.final_signyn == 1}">
	              		<button type="button" class="btn btn-sm button adStatus" style="background-color: #07B4191F; color: #034C0B; border-radius: 2em; font-weight: bold;">승인</button>
	              	</c:if>
	              	<c:if test="${evo.final_signyn == 0}">
	              		<button type="button" class="btn btn-sm button adStatus" style="background-color: #F24B171F; color: #661400; border-radius: 2em; font-weight: bold;">반려</button>
	              	</c:if>
              	</td>
            	 </tr> 
            	</c:forEach>
	    	</tbody>            
		</table>
		<div style="text-align: center;">
			${requestScope.pageBar}
		</div>
	</div>
	
	
	<input id="dc" type="hidden" name="dc" value=""/>
	<input id="dv" type="hidden" name="dv" value=""/>
</div>
</form>
