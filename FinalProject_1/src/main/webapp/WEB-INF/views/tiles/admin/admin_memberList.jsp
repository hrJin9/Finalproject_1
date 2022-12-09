<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/admin_memberList.css?after">

<style type="text/css">
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	// 검색결과 유지용
	var sc = "${requestScope.paraMap.searchCondition}";
	var sv = "${requestScope.paraMap.searchVal}";
	var sp = "${requestScope.paraMap.sizePerPage}";
	
	if(sc != "") 
		$("#searchCondition").val(sc);
	if(sv != "") 
		$("input[name='sv']").val(sv);
	if(sp != "")
		$("#cntselect").val(sp);
	
	
	// 체크박스 전체선택 및 체크박스 하나 해제시 전체선택 해제
	$(".chkboxpnum").click(function(){
	      
	   var bFlag = false;
	   $(".chkboxpnum").each(function(){
	      var bChecked = $(this).prop("checked"); // 체크된 체크박스
	      if(!bChecked) { // 체크된 것이 아니라면
	         $("#memberAll").prop("checked",false);
	         bFlag = true;
	         return false;
	      }
	   });
	   
	   if(!bFlag) {
	      $("#memberAll").prop("checked",true);
	   }
	   
	});
      
		

});// end of$(document).ready(function(){})--------------------------


// Function declaration
// 전체선택 체크박스 클릭시
function allCheckBox() {

   var bool = $("#memberAll").is(":checked");
   
   $(".chkboxpnum").prop("checked", bool);  // 전체선택 체크박스 체크여부에 따라 개별 선택박스 모두 체크 or 모두 해제
}// end of function allCheckBox()-------------------------




</script>

<nav id="admin_mainList" class="margin-container">
	<a id="admin_memberList" class="header-nonsub">구성원 관리</a>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div class="admin_container">
	<div style="margin-bottom: 15px; float: left;">
		<span>전체&nbsp; <span style="color:#4285f4;" id="memberCnt">${requestScope.paraMap.totalCount}</span>명</span>
	</div>
	<div class="contentsmargin" style="clear: both;">
		<div style="float:left;">
			<div style="display: inline-block;">
			    <a href="<%= request.getContextPath()%>/admin_memberAdd_hr.up" id="memberadd" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#212529;">
			       	<span><i class="fas fa-plus"></i></span>
			       	<span>구성원추가</span>
		       	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a href="#" id="memberdelete" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#212529;">
			       	<span><i class="fas fa-times"></i></span>
			       	<span>구성원삭제</span>
	      	 	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a href="#" id="memberupdate" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#212529;">
			       	<span><i class="fas fa-pencil-alt"></i></span>
			       	<span>멤버수정</span>
	      	 	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a href="#" id="listdownload" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid #cccccc; border-radius:5px; background-color:white; color:#212529; margin-left: 3px;">
			       	<span><i class="fa-solid fa-download"></i></span>
			       	<span>목록 다운로드</span>
	      	 	</a>
	      	 </div>
		</div>
		<%-- 검색 --%>
		<form class="booking-form ml-3">
			<div class="row" style="padding-bottom: 20px; float:right;">
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="sc" id="searchCondition" style="font-size: 9pt; padding:6.7px 6px;">
								<option value="name_kr">이름</option>
								<option value="email">이메일</option>
								<option value="mobile">연락처</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: 14px;">
							<input type="text" class="form-control" name="sv" placeholder="검색" style="width:105%; font-size: 9pt; padding:6px 6px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 10.5%;"></a>
					</div>
				</div>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field" style="padding-right:10px;">
							<select name="sp" id="cntselect" style="font-size: 9pt; padding:6.7px 12px;">
								<option value="20">20</option>
								<option value="40">40</option>
								<option value="80">80</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		
		
		<%-- 전체 구성원 --%>
		<div style="margin-bottom: 15px; clear:both;">
			<table class="table custom-table" id="memberList">   
		    	<thead>   
		            <tr >
		              <th><input type="checkbox" id="memberAll" onClick="allCheckBox();" /></th> 
		              <th onclick="sortTable()" class="boardth" width="11%" scope="col" id="namearray"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">이름<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></button></th>
		              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
						  <div id="department_name" class="dropdown-menu">
						  		<c:forEach var="dvo" items="${requestScope.dvoList}">
						  			<a id="${dvo.department_name}" class="dropdown-item" href="#">${dvo.department_name}</a>
						  		</c:forEach>
						  		<!-- 
						      <a class="dropdown-item" href="#">인사·총무</a>
						      <a class="dropdown-item" href="#">회계·재무</a>
						      <a class="dropdown-item" href="#">법무</a>
						      <a class="dropdown-item" href="#">감사</a> 
						      <a class="dropdown-item" href="#">업무지원</a>
						      <a class="dropdown-item" href="#">경영지원</a> 
						      <a class="dropdown-item" href="#">영업</a> 
						      <a class="dropdown-item" href="#">마케팅·홍보</a> 
						      <a class="dropdown-item" href="#">기획</a> 
						      <a class="dropdown-item" href="#">IT</a> 
						      <a class="dropdown-item" href="#">디자인</a> 
						      <a class="dropdown-item" href="#">연구·R&D</a> 
						      <a class="dropdown-item" href="#">구매</a> 
						      <a class="dropdown-item" href="#">무역</a> 
						      <a class="dropdown-item" href="#">생산</a> 
						      <a class="dropdown-item" href="#">서비스</a> 
						       -->
						  </div>
					  </th>
		              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">직위<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button> 
						  <div id="position" class="dropdown-menu">
						  		<c:forEach var="position" items="${requestScope.pList}">
						  			<a id="${position}" class="dropdown-item" href="#">${position}</a>
						  		</c:forEach>
						  		<!-- 
						      <a class="dropdown-item" href="#">대표</a>
						      <a class="dropdown-item" href="#">부대표</a>
						      <a class="dropdown-item" href="#">이사</a>
						      <a class="dropdown-item" href="#">전무</a> 
						      <a class="dropdown-item" href="#">상무</a> 
						      <a class="dropdown-item" href="#">본부장</a> 
						      <a class="dropdown-item" href="#">부장</a> 
						      <a class="dropdown-item" href="#">차장</a> 
						      <a class="dropdown-item" href="#">실장</a> 
						      <a class="dropdown-item" href="#">과장</a> 
						      <a class="dropdown-item" href="#">대리</a> 
						      <a class="dropdown-item" href="#">주임</a> 
						      <a class="dropdown-item" href="#">사원</a> 
						      <a class="dropdown-item" href="#">연구원</a> 
						      <a class="dropdown-item" href="#">수석연구원</a> 
						      <a class="dropdown-item" href="#">책임연구원</a> 
						      <a class="dropdown-item" href="#">선임연구원</a> 
						      <a class="dropdown-item" href="#">전임연구원</a> 
						      <a class="dropdown-item" href="#">주임연구원</a> 
						       -->
						  </div>
					  </th>
		              <th class="boardth" width="10%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">고용형태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
						  <div id="employeementtype" class="dropdown-menu">
						  		<c:forEach var="jointype" items="${requestScope.jtList}">
						  			<a id="${jointype}" class="dropdown-item" href="#">${jointype}</a>
						  		</c:forEach>
						  		<!-- 
						      <a class="dropdown-item" href="#">정직원</a>
						      <a class="dropdown-item" href="#">계약직</a>
						      <a class="dropdown-item" href="#">관리자</a>
						      <a class="dropdown-item" href="#">임원</a> 
						      <a class="dropdown-item" href="#">경영진</a> 
						      <a class="dropdown-item" href="#">대표</a> 
						      <a class="dropdown-item" href="#">부서장</a> 
						      <a class="dropdown-item" href="#">수습</a> 
						      <a class="dropdown-item" href="#">인턴</a> 
						      <a class="dropdown-item" href="#">알바</a>
						       --> 
						  </div>
		              </th>  
		              <th class="boardth" width="16%"scope="col"><span>이메일</span></th> 
		              <th class="boardth" width="14%"scope="col"><span>연락처</span></th> 
		              <th class="boardth" width="10%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">권한<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
						  <div id="authority" class="dropdown-menu">
						      <a id="1" class="dropdown-item" href="#">일반</a>
						      <a id="0" class="dropdown-item" href="#">관리</a>
						  </div>
		              </th>  
		              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">계정상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
						  <div id="status" class="dropdown-menu">
						      <a id="1" class="dropdown-item" href="#">정상</a>
						      <a id="0" class="dropdown-item" href="#">중지</a>
						  </div>
		              </th>  
		            </tr> 
				</thead>
				<tbody>
					<c:forEach var="emp" items="${requestScope.evoList}" varStatus="status">
						 <tr> 
			              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
			              <td>${emp.name_kr}</td>
			              <td>${emp.department_name}</td>
			              <td>${emp.position}</td>
			              <td>${emp.employeementtype}</td>
			              <td>${emp.email}</td>
			              <td>${emp.mobile}</td>
			              <c:choose>
			              	<c:when test="${emp.authority == 1}">
			              		<td>일반</td>
			              	</c:when>
			              	<c:otherwise>
			              		<td>관리</td>
			              	</c:otherwise>
			              </c:choose>
			              <c:if test="${emp.status == 1}">
				              <td>정상</td>
			              </c:if>
			              <c:if test="${emp.status == 0}">
				              <td>중지</td>
			              </c:if>
			            </tr> 
					</c:forEach>
		    	</tbody>        
			</table>
			<div>
				${requestScope.pageBar}
			</div>
		</div>
		</form>
	</div>
</div>
