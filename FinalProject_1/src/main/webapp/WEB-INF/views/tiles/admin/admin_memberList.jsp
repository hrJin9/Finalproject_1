<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<style type="text/css">
	/* 페이지 전체 레이아웃 */
	.admin_container {
		width: 88%;
		margin: 0 auto;
	}
	
	#admin_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#admin_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#admin_mainList a {
		display: block;
		width: 24%;
		padding: 0.7em 0 0.3em 0;
		color: #333;
		text-decoration: none;
		margin-right: 4%;
		color: black;
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
	
	/* 테이블 */
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
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
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
	      
		// 목록 전체개수
		const allCnt = $("input:checkbox[name='pnum']").length;  // 체크여부 상관없는 모든 체크박스개수
		document.getElementById("memberCnt").textContent = allCnt;

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
		<span>전체 구성원 &nbsp; <span style="color:#4285f4;" id="memberCnt"></span>명</span>
	</div>
	<div class="contentsmargin" style="clear: both;">
		<div style="display: inline-block;">
		    <a href="<%= request.getContextPath()%>/admin_memberAdd_hr.up" id="memberadd" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#212529;">
		       	<span><i class="fas fa-plus"></i></span>
		       	<span>멤버생성</span>
	       	</a>
      	 </div>
		<div style="display: inline-block;">
      	 	<a href="#" id="memberdelete" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 18px; border-color:white; background-color:#f5f5f5; color:#212529;">
		       	<span><i class="fas fa-times"></i></span>
		       	<span>멤버삭제</span>
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
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 10.5%;"></a>
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
		</div>
		<table class="table custom-table" id="memberList">   
	    	<thead>   
	            <tr >
	              <th><input type="checkbox" id="memberAll" onClick="allCheckBox();" /></th> 
	              <th onclick="sortTable()" class="boardth" width="11%" scope="col" id="namearray"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">이름<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></button></th>
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
	              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">직위<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button> 
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
	              <th class="boardth" width="10%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">고용형태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
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
	              <th class="boardth" width="16%"scope="col">이메일</th> 
	              <th class="boardth" width="14%"scope="col">연락처</th> 
	              <th class="boardth" width="10%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">권한<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">일반</a>
					      <a class="dropdown-item" href="#">관리</a>
					  </div>
	              </th>  
	              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">계정상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">정상</a>
					      <a class="dropdown-item" href="#">중지</a>
					  </div>
	              </th>  
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
	              <td>일반</td>
	              <td>정상</td>
	            </tr> 
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>이예은</td>
	              <td>기획</td>
	              <td>부장</td>
	              <td>정직원</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	              <td>관리</td>
	              <td>정상</td>
	            </tr> 
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>강채영</td>
	              <td>디자이너</td>
	              <td>과장</td>
	              <td>정직원</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	              <td>일반</td>
	              <td>중지</td>
	            </tr> 
	            <tr> 
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>
	              <td>진혜린</td>
	              <td>IT</td>
	              <td>차장</td>
	              <td>계약직</td>
	              <td>thumbs_up@gmail.com</td>
	              <td>010-4532-5678</td>
	              <td>일반</td>
	              <td>정상</td>
	            </tr> 
	    	</tbody>        
		</table>
	</div>
</div>
