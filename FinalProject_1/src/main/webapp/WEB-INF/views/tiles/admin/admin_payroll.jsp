<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/plugins/monthSelect/style.css" />
<script src="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/plugins/monthSelect/index.js"></script>


<style type="text/css">
	
	.offcanvas-body::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	
	.offcanvas-body::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
		background-color: rgba(0,0,0, 0.3);  /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	
	.offcanvas-body::-webkit-scrollbar-track {
		background-color: rgba(242, 242, 242); /*스크롤바 뒷 배경 색상*/
	}
	
	.payroll-save{
		border: none;
		color: white;
		font-weight: 700;
		font-size: 10pt;
		border-radius: 10px;
		padding: 5px 15px;
	}
	
	.contentsmargin > table > tbody > tr:hover {
		background-color: rgba(230,230,230, 0.4);
		cursor: pointer;
	}
	
	.payroll-detail-table tr td:first-child {
		text-align: left;
	}
	
	
	.dateSelector{
		border: solid 1px #ced4da;
		width: 150px;
		border-radius: 5px;
		height: 30px;
		padding: 5px 10px;
		font-size: 11pt;
	}
	
	.dateSelector + span{
		position: relative;
		right: 25px;
	}
	
	.p-input{
		width: 170px; height: 35px;
		border: solid 1px #ced4da;
		border-radius: 5px;
		font-size: 11pt;
		padding: 5px;
	}
	
	
	td[rowspan] + td{
		text-align: left;
	}
	
	/* 상단 nav바 */
	#memberInfo_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
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
	 
	 
	
	/* Custom Checkbox */
	.control {
	  display: block;
	  position: relative;
	  margin-bottom: 25px;
	  cursor: pointer; }
	
	.control input {
	  position: absolute;
	  z-index: -1;
	  opacity: 0; }
	
	.control__indicator {
	  position: absolute;
	  top: 2px;
	  left: 0;
	  height: 15px;
	  width: 15px;
	  border-radius: 3px;
	  border: 2px solid #ccc;
	  background: transparent; }
	
	.control--radio .control__indicator {
	  border-radius: 50%; }
	
	.control:hover input ~ .control__indicator,
	.control input:focus ~ .control__indicator {
	  border: 2px solid #007bff; }
	
	.control input:checked ~ .control__indicator {
	  border: 2px solid #007bff;
	  background: #007bff; }
	
	.control input:disabled ~ .control__indicator {
	  background: #e6e6e6;
	  opacity: 0.6;
	  pointer-events: none;
	  border: 2px solid #ccc; }
	
	
	.control input:checked ~ .control__indicator:after {
	  display: block;
	  color: #fff; }
	
	.control--checkbox .control__indicator:after {
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -52%);
	  -ms-transform: translate(-50%, -52%);
	  transform: translate(-50%, -52%); 
	  }
	
	.control--checkbox input:disabled ~ .control__indicator:after {
	  border-color: #7b7b7b; }
	
	.control--checkbox input:disabled:checked ~ .control__indicator {
	  background-color: #007bff;
	  opacity: .2;
	  border: 2px solid #007bff; }
	
	.table thead th {
		border-bottom: none;
		text-align: center; 
	}
	.boardth{
		position: relative;
		top: -6px;
	}
	.table td, .table th {
		font-size: 11pt;
	    border-top: 1px solid #eef2f6;
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
	
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		//플랫피커
		flatpickr.localize(flatpickr.l10ns.ko);
		flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			//maxDate: Date.now(),
			plugins: [
		        new monthSelectPlugin({
				  shorthand: true, //defaults to false
				  defaultDate: new Date(),
				  dateFormat: "Y. m", //defaults to "F Y"
				  altFormat: "F Y", //defaults to "F Y"
				  theme: "material_blue", // defaults to "light"
				})
		    ],
			local: 'ko',
			defaultDate: new Date(),
		});
		
		
		
		// 모든 체크박스가 체크가 되었다가 그 중 하나만 이라도 체크를 해제하면 전체선택 체크박스에도 체크를 해제하도록 한다.
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
	      
		
		//클릭시 오프캔버스 나타남
		$(".ap-table tbody tr").click(function(e){
			if($(e.target).is("input:checkbox")) return;
			$('.offcanvas').offcanvas('show');
		});
		
		
		
		
	});// end of$(document).ready(function(){})--------------------------
	   
	      
	   // Function declaration
	   // 전체선택 체크박스 클릭시
	   function allCheckBox() {
	   
	      var bool = $("#memberAll").is(":checked");
	      
	      $(".chkboxpnum").prop("checked", bool);  // 전체선택 체크박스 체크여부에 따라 개별 선택박스 모두 체크 or 모두 해제
	   }// end of function allCheckBox()-------------------------

	   
</script>

<div class="container">
	<nav id="memberInfo_mainList" class="">
		<div id="attendance" style="color: black;" class="header-nonsub">급여정산</div>
	</nav>
	<hr class="HRhr" style="margin-top: 0px; width: 113%; position:relative; right: 85px;"/><br>
	
	<div class="contentsmargin" style="clear: both;">
		<div style="margin-bottom: 15px; float: left; display: flex;">
			<span style="font-weight: 700;">귀속월</span>
			<div style="margin-left: 10px;">
				<input class="dateSelector"/>
				<span><i class="fas fa-chevron-down" style="font-size: 9pt;"></i></span>
			</div>
		</div>
		<%-- 검색 --%>
		<form action="#" class="booking-form ml-3" style="float: right;">
			<div class="row" style="padding-bottom: 20px;">
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 12px;">
								<option value="">이름</option>
								<option value="">이메일</option>
								<option value="">연락처</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: 14px;">
							<input type="text" class="form-control" placeholder="검색" style="width:105%; font-size: 9pt; padding:6px 6px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 10%;"></a>
					</div>
				</div>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field" style="padding-right:10px;">
							<select name="cntselect" id="cntselect" style="font-size: 9pt; padding:6.7px 12px;">
								<option value="">20</option>
								<option value="">40</option>
								<option value="">80</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		
		<%-- 전체 구성원 --%>
		<div style="margin-bottom: 15px; float: left;">
			<%-- 테이블 상단 버튼 만들기 --%>
		</div>
		<table class="table custom-table ap-table">   
	    	<thead>   
	            <tr>
	              <th width="5%"><input type="checkbox" id="memberAll" onClick="allCheckBox();" /></th>
	              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">이름<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></button></th>
	              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
					  <div class="dropdown-menu">
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
					  </div>
				  </th>
	              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">직위<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button> 
					  <div class="dropdown-menu">
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
					  </div>
				  </th>
	              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">고용형태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
					  <div class="dropdown-menu">
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
					  </div>
	              </th>  
	              <th class="boardth" width="12%"scope="col">이메일</th> 
	              <th class="boardth" width="12%"scope="col">연락처</th> 
	            </tr> 
			</thead>
			<tbody>
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>김지은</td>
	              <td>영업</td>
	              <td>대리</td>
	              <td>정직원</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	            </tr> 
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>이예은</td>
	              <td>기획</td>
	              <td>부장</td>
	              <td>정직원</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	            </tr> 
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>강채영</td>
	              <td>디자이너</td>
	              <td>과장</td>
	              <td>정직원</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	            </tr> 
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>진혜린</td>
	              <td>IT</td>
	              <td>차장</td>
	              <td>계약직</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	            </tr> 
	    	</tbody>        
		</table>
	
	</div>
	
	<!-- 오프캔버스 시작 -->
	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel" style="width: 45%;">
	  <div class="offcanvas-header">
	    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
	    <div class="do-oc-header">
	    	<div class="payroll-index" style="width: 600px; height: 31px;">
				<div>2022. 11</div>
				<div></div>
				<div>
					<div>급여지급일</div>
					<div>2022년 12월 26일</div>
				</div>
				<div style="float:right;"><button class="payroll-save gradientbtn">저장</button></div>
			</div>
	    </div>
	    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	  </div>
	  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
	  <div class="offcanvas-body">
	  	<div class="payroll-exist">
			<div class="payroll-detail">
				<div class="payroll-payment">
					<div class="payroll-member" style="margin-bottom: 30px; display: inline-block;">
						<div style="display: flex; width: 100px;">
							<div style="display: inline-block;"><span class="pic"><span>지은</span></span></div>
							<div style="margin-left: 10px;"><div style="font-size: 11pt; font-weight: 700;">김지은</div><div style="font-size: 9pt; color: rgba(0,0,0,0.7);"><span>개발자</span>·<span>IT</span></div></div>
						</div>
					</div>
					<div style="width: 50%; left: 25px;"><hr class="HRhr"/></div>
					<div class="payroll-subject" style="width: 175px; right:10px; top:0;">
						<div style="font-weight: 500; font-size: 9pt; color: rgba(0,0,0,0.7);">실지급액</div>
						<div style="float:right;"><input type="text" id="actual-p" class="p-input"/></div>
					</div>
				</div>
				<div class="payroll-payment2">
					<div>
						<div class="payroll-subject">급여<div class="subject-underline" style="background-color: #F29F05; width: 35px;"></div></div>
						<div style="width: 50%; position:relative; left: 20px;"><hr class="HRhr"/></div>
						<div style="float:right; width: 175px; position: relative; right:10px; top:-10px;">
							<div class="payroll-sub">지급총합</div>
							<div class="payroll-subject"><input type="text" id="total-p" class="p-input"/></div>
						</div>
					</div>
					<div>
						<table class="payroll-detail-table" style="width: 100%;">
							<tr><td rowspan="3" width="10%">고정급여</td><td>기본급</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>초과근무수량(고정)</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>식비</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td rowspan="2">변동급여</td><td>연구보조비</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>선지급금</td><td><input type="text" id="" class="p-input"/></td></tr>
						</table>
					</div>
				</div>
				<div class="payroll-deduction">
					<div>
						<div class="payroll-subject">공제<div class="subject-underline" style="background-color: #F29F05; width: 35px;"></div></div>
						<div style="width: 50%;"><hr class="HRhr"/></div>
						<div style="width: 175px; float:right; position: relative; right: 10px; top: -10px;"><div class="payroll-sub">공제총합</div><div class="payroll-subject"><input type="text" id="" class="p-input"/></div></div>
					</div>
					<div>
						<table class="payroll-detail-table" style="width: 100%">
							<tr><td rowspan="6">필수공제</td><td>소득세</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>지방소득세</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>건강보험</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>국민연금</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>장기요양보험</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>고용보험</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td rowspan="2">기타공제</td><td>동호회비</td><td><input type="text" id="" class="p-input"/></td></tr>
							<tr><td>선지급금</td><td><input type="text" id="" class="p-input"/></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	  </div>
	</div>
	<!-- 오프캔버스 끝 -->
	
	
	
	
</div>
