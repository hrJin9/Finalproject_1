<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<style type="text/css">
	.admin_container {
		width: 88%;
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
		color: #333;
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
	 
	 
	
	/* Custom Checkbox */
	.control {
	  display: block;
	  position: relative;
	  margin-bottom: 25px;
	  cursor: pointer; 
	}
	
	.control input {
	  position: absolute;
	  z-index: -1;
	  opacity: 0; 
	}
	
	.control__indicator {
	  position: absolute;
	  top: 2px;
	  left: 0;
	  height: 15px;
	  width: 15px;
	  border-radius: 3px;
	  border: 2px solid #ccc;
	  background: transparent; 
	}
	
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
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
    	// 기간 데이트피커
		flatpickr.localize(flatpickr.l10ns.ko);
        flatpickr($(".daterangeSelector"));
        $(".daterangeSelector").flatpickr({
        	mode: "range",
            local: 'ko'
        });
		
		$('#searchCondition').change(function() {
		    var state = $('#searchCondition option:selected').val();
		    if(state == 'period') {
		    	$("#username").css('display','none');
		    	$("#period").css('display','block');
		    } else {
		    	$("#period").css('display','none');
		    	$("#username").css('display','block');
		     }
		});
		
	});// end of $(".period").click(function(){})-------------------
	
	
</script>

<nav id="admin_mainList" class="margin-container">
	<a id="admin_attendance_holding" href="<%= request.getContextPath()%>/admin_attendanceList_holding.up" style="color: black;" class="header-nonsub">휴가 보유 현황</a>
	<a id="admin_attendance_usage" href="<%= request.getContextPath()%>/admin_attendanceList_usage.up" class="header-nonsub">휴가 사용 내역</a>
	<div class="list_underline"></div>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>


<div class="admin_container">	
	<div class="contentsmargin">
		<div style="display: inline-block;">
      	 	<a href="#" id="write" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid #cccccc; border-radius:5px; background-color:white; color:#212529; margin-left: 3px;">
		       	<span><i class="fa-solid fa-download"></i></span>
		       	<span>목록 다운로드</span>
      	 	</a>
      	 </div>
		
		<%-- 검색 --%>
		<form action="#" class="booking-form ml-3" style="float: right;">
			<div class="row" style="padding-bottom: 20px;">
			    <div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 12px;">
								<option value="username" class="username">이름</option>
								<option value="period" class="period">기간</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: 14px;">
							<input type="text" class="form-control" id="username" placeholder="검색" style="width:105%; font-size: 9pt; padding:6px 6px;">
							<input type="text" class="form-control daterangeSelector" id="period" placeholder="검색" style="display:none; width:105%; font-size: 9pt; padding:6px 6px; background-color: #fff;">
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
		<table class="table custom-table">   
	    	<thead>   
	            <tr>
	              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">이름<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">오름차순</a>
					      <a class="dropdown-item" href="#">내림차순</a>
					  </div>
				  </th>
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
	              <th class="boardth" width="16%" scope="col">기간</th>
	              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">항목<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button> 
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">연차</a>
					      <a class="dropdown-item" href="#">병가</a>
					      <a class="dropdown-item" href="#">기타</a>
					  </div>
				  </th>
	              <th class="boardth" width="13%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">세부 항목<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button> 
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">연차</a>
					      <a class="dropdown-item" href="#">반차</a>
					      <a class="dropdown-item" href="#">병가</a>
					      <a class="dropdown-item" href="#">조의</a>
					      <a class="dropdown-item" href="#">결혼</a>
					      <a class="dropdown-item" href="#">배우자출산</a>
					      <a class="dropdown-item" href="#">군소집훈련</a>
					      <a class="dropdown-item" href="#">여름휴가</a>
					      <a class="dropdown-item" href="#">기타 사유</a>
					  </div>
				  </th>
	              <th class="boardth" width="11%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">승인 여부<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button> 
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">승인</a>
					      <a class="dropdown-item" href="#">반려</a>
					  </div>
				  </th>
	            </tr> 
			</thead>
			<tbody>
	            <tr> 
	              <td>김지은</td>
	              <td>영업</td>
	              <td>대리</td>
	              <td>2022-11-11&nbsp;~&nbsp;2022-11-13</td>
	              <td>연차</td>
	              <td>연차</td>
	              <td><button type="button" class="btn btn-sm button" style="background-color: #07B4191F; color: #034C0B; border-radius: 2em; font-weight: bold;">승인</button></td>
	            </tr> 
	            <tr> 
	              <td>이예은</td>
	              <td>기획</td>
	              <td>부장</td>
	              <td>2022-11-11&nbsp;~&nbsp;2022-11-13</td>
	              <td>연차</td>
	              <td>반차</td>
	              <td><button type="button" class="btn btn-sm button" style="background-color: #F24B171F; color: #661400; border-radius: 2em; font-weight: bold;">반려</button></td>
	            </tr> 
	            <tr> 
	              <td>강채영</td>
	              <td>디자이너</td>
	              <td>과장</td>
	              <td>2022-11-11&nbsp;~&nbsp;2022-11-13</td>
	              <td>병가</td>
	              <td>병가</td>
	              <td><button type="button" class="btn btn-sm button" style="background-color: #07B4191F; color: #034C0B; border-radius: 2em; font-weight: bold;">승인</button></td>
	            </tr> 
	            <tr> 
	              <td>진혜린</td>
	              <td>IT</td>
	              <td>차장</td>
	              <td>2022-11-11&nbsp;~&nbsp;2022-11-13</td>
	              <td>기타</td>
	              <td>기타 사유</td>
	              <td><button type="button" class="btn btn-sm button" style="background-color: #F24B171F; color: #661400; border-radius: 2em; font-weight: bold;">반려</button></td>
	            </tr> 
	    	</tbody>            
		</table>
	
	</div>
</div>
