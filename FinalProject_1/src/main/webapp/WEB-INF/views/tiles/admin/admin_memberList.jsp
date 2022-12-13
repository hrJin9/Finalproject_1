<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/admin_memberList.css?after">

<style type="text/css">
#memberList tbody tr:hover{
	cursor: pointer;
	background-color: rgba(230,230,230,0.1);
}
div#alert {
    display: none;
    height: 35px;
    background-color: #4d4d4d;
    color: white;
    font-weight: bold;
    font-size: 10pt;
    border-radius: 2em;
    padding: 0 32px;
    position: fixed;
    top: 15px;
    right: 38%;
    box-shadow: 1px 1px 1px 1.3px rgb(0 0 0 / 20%);
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	// 검색결과 유지용
	var sc = "${requestScope.paraMap.searchCondition}";
	var sv = "${requestScope.paraMap.searchVal}";
	var sp = "${requestScope.paraMap.sizePerPage}";
	var dc = "${requestScope.paraMap.dropCondition}";
	var dv = "${requestScope.paraMap.dropVal}";
	
	if(sc != "") 
		$("#searchCondition").val(sc);
	if(sv != "") 
		$("input[name='sv']").val(sv);
	if(sp != "")
		$("#cntselect").val(sp);
	if(dc != "")
		$("#dc").val(dc);
	if(dv != "")
		$("#dv").val(dv);
	
	
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
	
	$("#searchVal").keyup(function(e){
		if(event.keyCode == 13){
			var frm = document.memform;
			frm.action = "<%=ctxPath%>/admin_memberList.up";
			frm.submit();
		}
	});
	
	
	$(".dropdown-menu > a").click(function(){
		var dc = $(this).parent().attr("id");
		var dv = $(this).attr("id");
		
		$("#dc").val(dc);
		$("#dv").val(dv);
		
		console.log("${requestScope.gobackURL}");
		var frm = document.memform;
		frm.action = "<%=ctxPath%>/admin_memberList.up";
		frm.submit();
	});
    
	
	$("#memberList tbody tr").click(function(e){
		if($(e.target).is("td:first-child, td:first-child *")) return;
		
		var empno = $(this).attr("id");
		
		location.href="<%=ctxPath%>/memberInfo_hr.up?empno="+empno;
	})
	
	//구성원 삭제버튼 클릭 이벤트
	$("#memberdelete").click(function(){
		goDelete();
	})
	
	
	$("#memberupdate").click(function(){
		goUpdate();
	});
	
	$("#listdownload").click(function(){
		getExcelEmp("chx");
	})
	
	$("#listdownloadAll").click(function(){
		getExcelEmp();
	})
	
		

});// end of$(document).ready(function(){})--------------------------


// Function declaration
// 전체선택 체크박스 클릭시
function allCheckBox() {

   var bool = $("#memberAll").is(":checked");
   
   $(".chkboxpnum").prop("checked", bool);  // 전체선택 체크박스 체크여부에 따라 개별 선택박스 모두 체크 or 모두 해제
}// end of function allCheckBox()-------------------------


// 구성원삭제 클릭시
function goDelete(){
	
	var chxArr = $("input[name='pnum']:checked");
	var empnoArr = new Array();
	chxArr.each(function(index, item){
		empnoArr.push($(item).parent().parent().attr("id"));
	});
	
	if(empnoArr.length < 1){
		$(".deleteAlert").fadeIn("fast");
		setTimeout(function(){
			$(".deleteAlert").fadeOut("fast");
		}, 1500);
		return;
	}
	
	$.ajax({	 
		url: "<%= ctxPath%>/goDeleteEmp.up",
		traditional: true,
		data: {"empnoArr":empnoArr},
		dataType:"json",
		success:function(json){
			
			console.log(JSON.stringify(json));
			
			if(json.n < 1){
				$(".deleteFail").fadeIn("fast");
				setTimeout(function(){
					$(".deleteFail").fadeOut("fast");
				}, 1500);
			} else {
				location.reload();
				alert("해당 구성원의 계정이 중지되었습니다. 일주일 후 해당 구성원의 정보가 모두 삭제됩니다.");
			}
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
	
}//end of goDelete()


function goUpdate(){
	
	var chxArr = $("input[name='pnum']:checked");
	if(chxArr.length != 1) {
		$(".updateFail").fadeIn("fast");
		setTimeout(function(){
			$(".updateFail").fadeOut("fast");
		}, 1500);
		return;
	}
	
	var empno = $("input[name='pnum']:checked").parent().parent().attr("id");
	location.href="<%=ctxPath%>/admin_memberUpdate.up?empno="+empno;
	
	
}//end of goUpdate();



// 엑셀 다운로드
function getExcelEmp(status){
	
	if(status == "chx"){
		var chxArr = $("input[name='pnum']:checked");
		if(chxArr.length < 1) {
			$(".excelFail").fadeIn("fast");
			setTimeout(function(){
				$(".excelFail").fadeOut("fast");
			}, 1500);
			return;
		}
		
		
		var str_empnoArr = "";
		chxArr.each(function(index, item){
			var empno = $(item).parent().parent().attr("id");
			if(index == 0) str_empnoArr += empno;
			else str_empnoArr += "," + empno;
		});
		$("#str_empnoArr").val(str_empnoArr);
	}
	
	const frm = document.memform;
	frm.method = "post";
	frm.action = "<%= ctxPath%>/getExcelEmp.up";
	frm.submit();
	
	$("#str_empnoArr").val("");
	
}//end of getExcelEmp


</script>

<nav id="admin_mainList" class="margin-container">
	<a id="admin_memberList" class="header-nonsub">구성원 관리</a>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div class="admin_container">
	<div style="margin-bottom: 15px; float: left; color: #4d4f53; font-weight: 600; ">
		<span>전체&nbsp; <span style="color:#4285f4;" id="memberCnt">${requestScope.totalCount}</span>명</span>
	</div>
	<div class="contentsmargin" style="clear: both;">
		<div style="float:left;">
			<div style="display: inline-block;">
			    <a href="<%= request.getContextPath()%>/admin_memberAdd.up" id="memberadd" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#4d4f53; font-weight: 600;">
			       	<span><i class="fas fa-plus"></i></span>
			       	<span>구성원추가</span>
		       	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a id="memberdelete" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#4d4f53; font-weight: 600;">
			       	<span><i class="fas fa-times"></i></span>
			       	<span>계정중지</span>
	      	 	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a id="memberupdate" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#4d4f53; font-weight: 600;">
			       	<span><i class="fas fa-pencil-alt"></i></span>
			       	<span>정보수정</span>
	      	 	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a id="listdownload" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid #d9d9d9; border-radius:5px; background-color:white; color:#4d4f53; margin-left: 3px; font-weight: 600;">
			       	<span><i class="fa-solid fa-download"></i></span>
			       	<span>선택 다운로드</span>
	      	 	</a>
	      	 </div>
			<div style="display: inline-block;">
	      	 	<a id="listdownloadAll" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid #d9d9d9; border-radius:5px; background-color:white; color:#4d4f53; margin-left: 3px; font-weight: 600;">
			       	<span><i class="fa-solid fa-download"></i></span>
			       	<span>모두 다운로드</span>
	      	 	</a>
	      	 </div>
		</div>
		<%-- 검색 --%>
		<form name="memform" class="booking-form ml-3">
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
							<input id="searchVal" type="text" class="form-control" name="sv" placeholder="검색" style="width:105%; font-size: 9pt; padding:6px 6px;">
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
		              <th class="boardth" width="11%" scope="col" id="namearray"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">이름<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></button></th>
		              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
						  <div id="department_name" class="dropdown-menu">
					  			<a id="" class="dropdown-item" href="#">전체</a>
						  		<c:forEach var="dvo" items="${requestScope.dvoList}">
						  			<a id="${dvo.department_name}" class="dropdown-item" href="#">${dvo.department_name}</a>
						  		</c:forEach>
					  			<a id="none" class="dropdown-item" href="#">미지정</a>
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
						  		<a id="" class="dropdown-item" href="#">전체</a>
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
						  <div id="employmenttype" class="dropdown-menu">
						  		<a id="" class="dropdown-item" href="#">전체</a>
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
						      <a id="" class="dropdown-item" href="#">전체</a>
						      <a id="1" class="dropdown-item" href="#">일반</a>
						      <a id="0" class="dropdown-item" href="#">관리</a>
						  </div>
		              </th>  
		              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">계정상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
						  <div id="status" class="dropdown-menu">
						      <a id="" class="dropdown-item" href="#">전체</a>
						      <a id="1" class="dropdown-item" href="#">정상</a>
						      <a id="0" class="dropdown-item" href="#">중지</a>
						  </div>
		              </th>  
		            </tr> 
				</thead>
				<tbody>
					<c:if test="${not empty requestScope.evoList }">
					<c:forEach var="emp" items="${requestScope.evoList}" varStatus="status">
						 <tr id="${emp.employee_no}"> 
			              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
			              <td>${emp.name_kr}</td>
			              <c:if test="${not empty emp.department_name}">
				              <td>${emp.department_name}</td>
			              </c:if>
			              <c:if test="${empty emp.department_name}">
				              <td>미지정</td>
			              </c:if>
			              <td>${emp.position}</td>
			              <td>${emp.employmenttype}</td>
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
			              <c:if test="${emp.delete_status == 1}">
				              <td>정상</td>
			              </c:if>
			              <c:if test="${emp.delete_status == 0}">
				              <td>중지</td>
			              </c:if>
			            </tr> 
					</c:forEach>
					</c:if>
					<c:if test="${empty requestScope.evoList}">
						<tr>
							<td colspan="9" style="color: #9c9c9c;">조회된 구성원이 없습니다.</td>
						</tr>
					</c:if>
		    	</tbody>        
			</table>
			<div style="text-align: center;">
				${requestScope.pageBar}
			</div>
		</div>
		
		<input id="dc" type="hidden" name="dc" value=""/>
		<input id="dv" type="hidden" name="dv" value=""/>
		<input id="str_empnoArr" type="hidden" name="str_empnoArr"/>
		</form>
		<div id="alert" class="deleteAlert">
	         <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	         <span id="alertText" style="position: relative; bottom: 2px;">삭제할 구성원을 선택해주세요.</span>
	    </div>
	    
	    <div id="alert" class="deleteFail">
	         <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	         <span id="alertText" style="position: relative; bottom: 2px;">이미 계정중지된 구성원입니다.</span>
	    </div>
	    
	    <div id="alert" class="updateFail">
	         <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	         <span id="alertText" style="position: relative; bottom: 2px;">수정할 구성원을 한 명만 선택해주세요.</span>
	    </div>
	    
	    <div id="alert" class="excelFail">
	         <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	         <span id="alertText" style="position: relative; bottom: 2px;">구성원을 선택해주세요.</span>
	    </div>
	    
	</div>
</div>
