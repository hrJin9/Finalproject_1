<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script>

<style type="text/css">
	.admin_container {
		width: 90%;
		margin: 0 auto;
	}

	/* 상단 nav바  */	
	#admin_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#dayoff_subList a:hover{
		background-color: rgba(200,200,200, .2);
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
		text-decoration: none;
		margin-right: 4%;
		color: #D2D6D9;
	}
	
	#dayoff_subList a:nth-child(1).iscurrent ~ .dayoff_subList_underline {
		left: 0%;
	}
	#dayoff_subList a:nth-child(2).iscurrent ~ .dayoff_subList_underline {
		left: 15%; /* width랑 margin-left랑 합친거 */
	}
		
	
	/* 검색 */
	#searchCondition, #cntselect {
	    display: block;
	    width: 100%;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #212529;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: 0.25rem;
	}

	.form-control{
		font-size: 12pt;
	}
	.row >*{
		width: auto;
		padding: 0;
	}
	
	.custom-table {
		min-width: 900px;
		thead {
			tr, th {
				border-top: none;
				border-bottom: none!important;
			    }
		      }
		tbody {
		    td {
				color: #777;
				font-weight: 400;
			    }
		      }
	}
	
	.table>:not(:first-child) {
	       border-top: 1.5px solid #cfcfcf;
	}
	 
	 
	
	.table thead th {
		border-bottom: none;
		text-align: center; 
		padding: 8px 0 10px 0;
	}
	
	th > div {
		cursor: pointer;
	}
	
	.table td, .table th {
		font-size: 11pt;
	    border-top: 1px solid #eef2f6;
	}
	
	.table th {
		border-top: 1px solid #cccccc;
	}
	
	.table {
	    color: #4c4e54;
	}
	table td{
		font-size: 11pt;
		text-align: center; 
	}
	
	.custom-dropdown {
	border: none!important;
	> a {
		color: $black;
		.arrow {
			display: inline-block;
			position: relative;
			transition: .3s transform ease;
		}
	}
	&.show {
		> a {
			.arrow {
				transform: rotate(-180deg);
			}
		}
	}
	
	.btn {
		&:active, &:focus {
			box-shadow: none!important;
			outline: none;
		}	
		&.btn-custom {
			border: 1px solid #efefef;	
		}
	}
	
	.dropdown-menu {
		border: 1px solid transparent!important;
		box-shadow: 0 15px 30px 0 rgba($black, .2);
		margin-top: -10px!important;
		padding: 20px 0;
		opacity: 0;
		border-radius: 0;
		background: $white;
		// right: auto!important;
		// left: auto!important;
		transition: .3s margin-top ease, .3s opacity ease, .3s visibility ease;
		visibility: hidden;
		&.active {
			opacity: 1;
			visibility: visible;
			margin-top: 0px!important;
		}
	
		a {
			// border-bottom: 1px solid rgba($black, .1);
			font-size: 14px;
			padding: 8px 20px;
			position: relative;
			color: $black;
			&:last-child {
				border-bottom: none;
			}
			.icon {
				margin-right: 15px;
				display: inline-block;
			}
			&:hover, &:active, &:focus {
				background: $light;
				color: $black;
				.number {
					color: $white;
				}
			}
	
			.number {
				padding: 2px 6px;
				font-size: 11px;
				background: $orange;
				position: absolute;
				top: 50%;
				transform: translateY(-50%);
				right: 15px;
				border-radius: 4px;
				color: $white;
			}
		}		
	
	}
	
	
.dateSelector{
    border: solid 1px #cccccc;
    border-radius: 5px;
    padding: 5px 10px;
    font-size: 11pt;
    color: rgb(77, 79, 83);
    width: 90px;
    cursor: pointer;
}

.dateDown{
	cursor:pointer;
}
	
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	var sv = "${requestScope.paraMap.searchVal}";
	var dc = "${requestScope.paraMap.dropCondition}";
	var dv = "${requestScope.paraMap.dropVal}";
	var sp = "${requestScope.paraMap.sizePerPage}";
	
	if(sv != "") 
		$("input[name='sv']").val(sv);
	if(dc != "")
		$("#dc").val(dc);
	if(dv != "")
		$("#dv").val(dv);
	if(sp != "")
		$("#cntselect").val(sp);
	
	// 데이트피커
	$(".dateSelector").datepicker({
	    format: "yyyy",
	    viewMode: "years", 
	    minViewMode: "years",
	    autoclose:true //to close picker once year is selected
	});
	/* 
	flatpickr.localize(flatpickr.l10ns.ko);
 	flatpickr($(".dateSelector"));
	$(".dateSelector").flatpickr({
		dateFormat: "Y년",
		defaultDate: new Date(),
		local: 'ko'
	});
	
	 */
	
	$(".dateDown").click(function(){
		$(".dateSelector").trigger("click");
	});
	
	
	$(".dropdown-menu > a").click(function(){
		var dc = $(this).parent().attr("id");
		var dv = $(this).attr("id");
		
		$("#dc").val(dc);
		$("#dv").val(dv);
		
		var frm = document.adHolding;
		frm.action = "<%=ctxPath%>/admin_attendanceList_holding.up";
		frm.submit();
	});
	
});// end of$(document).ready(function(){})--------------------------

//////////////////////////////////////////////////////////////////////////////////////

// 엑셀 다운로드
function getAdExcel(){
	
		
		
}//end getAdExcel()
	
	
	
	


	   
</script>

<nav id="admin_mainList" class="margin-container">
	<a id="admin_attendance_holding" href="<%= request.getContextPath()%>/admin_attendanceList_holding.up" style="color: rgb(77, 79, 83);" class="header-nonsub">휴가 보유 현황</a>
	<a id="admin_attendance_usage" href="<%= request.getContextPath()%>/admin_attendanceList_usage.up" class="header-nonsub">휴가 사용 내역</a>
	<div class="list_underline"></div>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<form id="adHolding" name="adHolding">
<div class="admin_container">
	<div class="contentsmargin">
		<div style="display: inline-block;">
			<input type="text" class="dateSelector"/>
			<i class="fa-solid fa-angle-down dateDown" style="position:relative; right:26px; top:1px; color: #d4d4d4;"></i>
		</div>
		<div style="display: inline-block;">
      	 	<a href="#" id="write" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid #cccccc; border-radius:5px; background-color:white; color:#212529; margin-left: 3px;">
		       	<span><i class="fa-solid fa-download"></i></span>
		       	<span>목록 다운로드</span>
      	 	</a>
      	 </div>
		
		<%-- 검색 --%>
		<div class="row" style="padding-bottom: 20px; float:right;">
			<div>
				<div class="form-group">
					<div class="form-field" style="padding-left:5px; margin-right: 14px;">
						<input type="text" class="form-control" name="sv" placeholder="이름 검색" style="width:105%; font-size: 9pt; padding:6px 6px;">
					</div>
				</div>
			</div>
			<div class="align-items-end mt-1 mr-4">
				<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
					<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 10.2%;"></a>
				</div>
			</div>
			<div class=" mr-2">
				<div class="form-group">
					<div class="form-field" style="padding-right:10px;">
						<select name="sp" id="cntselect" style="font-size: 9pt; padding:6.7px 12px;">
							<option>20</option>
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
		<table class="table custom-table">   
	    	<thead>   
	            <tr>
	              <th class="boardth" width="11%" scope="col"><div data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">이름<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></div></th>
	              <th class="boardth" width="12%" scope="col"><div data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div>  
					  <div id="department_name" class="dropdown-menu">
					     <a id="" class="dropdown-item" href="#">전체</a>
					  		<c:forEach var="dvo" items="${requestScope.dvoList}">
					  			<a id="${dvo.department_name}" class="dropdown-item" href="#">${dvo.department_name}</a>
					  		</c:forEach>
				  			<a id="none" class="dropdown-item" href="#">미지정</a>
					  </div>
				  </th>
	              <th class="boardth" width="12%" scope="col"><div data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">직위<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div> 
					  <div id="position" class="dropdown-menu">
						<a id="" class="dropdown-item" href="#">전체</a>
						<c:forEach var="position" items="${requestScope.pList}">
						<a id="${position}" class="dropdown-item" href="#">${position}</a>
						</c:forEach>
					  </div>
				  </th>
	              <th class="boardth" width="12%" scope="col">총 연차</th>
	              <th class="boardth" width="12%" scope="col">사용 연차</th>
	              <th class="boardth" width="12%" scope="col">잔여 연차</th>
	            </tr> 
			</thead>
			<tbody>
				<c:if test="${not empty requestScope.evoList }">
					<c:forEach var="evo" items="${requestScope.evoList}">
						<tr>
							<td>${evo.name_kr}</td>
							<td>${evo.department_name}</td>
							<td>${evo.position }</td>
							<td>
								<c:set var="total" value="${evo.useCnt + evo.dayoff_cnt}"/>
								${total}
							</td>
							<td>${evo.useCnt}</td>
							<td>${evo.dayoff_cnt}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ empty requestScope.evoList }">
					<tr><td colspan="6" style="color: #9c9c9c;">조회된 구성원이 없습니다.</td></tr>
				</c:if>
	    	</tbody>            
		</table>
		<div style="text-align: center;">
			${requestScope.pageBar}
		</div>
  	</div>
  </div>
  
	<input id="dc" type="hidden" name="dc" value=""/>
	<input id="dv" type="hidden" name="dv" value=""/>
  
</form>
