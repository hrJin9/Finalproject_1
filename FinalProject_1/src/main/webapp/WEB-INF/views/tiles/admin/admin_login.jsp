<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
  
  
<style type="text/css">

	
	#memberInfo_mainList {
		position: relative;
		display: flex;
		width: 11%;
		font-size: 18pt;
		font-weight: bold;
		margin: 4px 0 0 70px;
		padding: 0.7em 0 0.9em 0;
		color: #333;
	}

	hr.memberInfohr{
		width: 100%;
		background-color: rgba(0,0,0, .3) !important;
		border: none; 
		height: 1px;
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
			th, td {
				color: #777;
				font-weight: 400;
	      font-weight: 300;
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
	
	
	.menu-heading {
		font-size: 14px;
		color: lighten($black, 70%);
		padding-left: 20px;
		padding-right: 20px;
	}
	hr {
		display: block; height: 1px;
	   border: 0; border-top: 1px solid darken($light, 5%);
	   margin: .5em 0; padding: 0;
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
	

		$('.js-check-all').on('click', function() {

		  	if ( $(this).prop('checked') ) {
			  	$('th input[type="checkbox"]').each(function() {
			  		$(this).prop('checked', true);
			  	})
		  	} else {
		  		$('th input[type="checkbox"]').each(function() {
			  		$(this).prop('checked', false);
			  	})
		  	}
		  });
		
		
	}); //end of ready	

</script>
 

<div class="container">
<div id="memberInfo_mainList">멤버 접근 로그</div>
<hr class="memberInfohr" style="margin-top: 0px;"/>
 
  

<div class="container mt-5" style="padding-right: 5%;">
	<div class="row">
		 
		
		
		<form action="#" class="booking-form ml-3"  style="float: left;margin-bottom: 0;">
			<div class="row" >
				<div class="">
					<div class="form-group">
						<div class="form-field">
							<!-- <div class="icon"><span class="fa fa-search"></span></div> --> 
							<input type="text" class="form-control" placeholder="제목/작성자/팀으로 검색" style="width:193%; font-size: 9pt; padding:6px 12px;padding-left: 45px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 8pt;margin-bottom:0;">
						<a id="searchoption"href="#" class="btn" style="color:#0a58caa1; padding: 0.2rem 0.4rem;border-radius:0px; background-color: white;font-size: 0.7rem;position: relative;left: -183px;border-right: 1px solid #ced4da;">옵션</a>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 10pt;margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white;font-size: 0.8rem;position: relative;left: 100px;"></a>
					</div>
				</div>
			</div>
		
				
		   <div class="option" style="display:none;">
		      <div style="font-size: 11pt; color: #595959; font-weight: bold; padding-bottom: 20px;">검색 옵션
		      	 <!-- <label class="filter-date-label"><i class="icon icon-redo"></i></label> -->
		         <button style="margin-left: 90px; border: none; font-size: 8pt; font-weight:bold; border-radius: 3px; background-color:#3B86C812; color: #2E5E87; padding: 5px 8px;float: right;">초기화</button>
		      </div>
		      <div class="detail-search-conditions">
			    <ul class="conditions-group">
			        <li class="js-project-name-search-filter" style="display: block;">
						<div class="condition-cell title">프로젝트</div>
			            <div class="condition-cell">
			                <input id="ctgy"class="form-control" onClick="multiSelect('OPEN')" style="box-shadow: none;font-size:9pt; border-radius: 0px;border-top: none;border-radius: none;border-left: none;border-right: none;"type="text" placeholder="프로젝트명을 입력하세요">
							 <div id="categorydiv" >
							  <ul>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk1"value="전체공지"><label for="chk1" class="label-checkbox" data-code="unlimit">전체공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk2"value="일반공지"><label for="chk2" class="label-checkbox" data-code="unlimit">일반공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk3"value="이벤트공지"><label for="chk3" class="label-checkbox" data-code="unlimit">이벤트공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk4"value="문진표공유"><label for="chk4" class="label-checkbox" data-code="unlimit">문진표공유</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk5"value="사내공지"><label for="chk5" class="label-checkbox" data-code="unlimit">사내공지</label></li>
							    </ul>
							    <div style="padding-top:3px;text-align:right">
							    	<!-- <button type="reset" class="workstatus-cancel">취소</button> -->
							    	<input type="button" class="workstatus-cancel"value="확인" onClick="multiSelect('CLOSE')" style="width:50%">
							    </div>
				   			</div>
			   			</div>
			        </li>
			        <!-- <li class="js-project-name-search-filter" style="display: block;">
			            <div class="condition-cell title">프로젝트</div>
			            <div class="condition-cell">
			                <input class="form-control" style="box-shadow: none;font-size:9pt; border-radius: 0px;border-top: none;border-radius: none;border-left: none;border-right: none;"type="text" placeholder="프로젝트명을 입력하세요">
			            </div>
			        </li> -->
			        <li class="js-register-name-search-filter" style="display: block;">
			            <div class="condition-cell title">작성자</div>
			            <div class="condition-cell">
			            	<input class="form-control" style="box-shadow: none;font-size:9pt; border-radius: 0px;border-top: none;border-radius: none;border-left: none;border-right: none;"type="text" placeholder="작성자명 입력 (여러명 입력시, 콤마로 구분)">
			            </div>
			        </li>
			        <li class="js-period-type-search-filter" data-code="unlimit" style="display: block;">
			            <div class="condition-cell title" style="top: 14px;position: relative;float: left;">검색기간</div>
			            <div class="condition-cell">
		              <ul class="target-select-group">
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_total" name="period-type">
			                <label for="date_total" class="js-period-type radio-label-checkbox" data-code="unlimit">전체</label>
			            </li>
			        
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_today" name="period-type">
			                <label for="date_today" class="js-period-type radio-label-checkbox" data-code="today">오늘</label>
			            </li>
			        
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_week" name="period-type">
			                <label for="date_week" class="js-period-type radio-label-checkbox" data-code="week">7일</label>
			            </li>
			        
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_month" name="period-type">
			                <label for="date_month" class="js-period-type radio-label-checkbox" data-code="month">1개월</label>
			            </li>
			        
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_3month" name="period-type">
			                <label for="date_3month" class="js-period-type radio-label-checkbox" data-code="thirdMonth">3개월</label>
			            </li>
			        
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_6month" name="period-type">
			                <label for="date_6month" class="js-period-type radio-label-checkbox" data-code="sixthMonth">6개월</label>
			            </li>
			        
			            <li>
			                <input type="radio" class="custom-control-radio" id="date_year" name="period-type">
			                <label for="date_year" class="js-period-type radio-label-checkbox" data-code="year">1년</label>
			            </li>
			        
			            <li>
			            	<input type="radio" class="custom-control-radio" id="date_select" name="period-type" data-code="select" >
			                <label for="date_select" class="js-period-type radio-label-checkbox" data-code="select">기간선택</label>
				            <div class="search-period-wr" >
				                <div class="js-search-pickr-layer" data-code="unlimit">
				                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
				                        <span>2012-11-20</span>
				                        <!-- <input type="hidden" value="20121120000000"> -->
				                        <label class="filter-date-label"><i class="icon icon-calendar"></i></label>
				                    </div>
				                    <span class="dash-swung" style="position: relative;bottom: 10px;right: 14px;">~</span>
				                    <div class="js-date-type js-pickr-layer js-end-flatpickr filter-input-box">
				                        <span>2022-11-20</span>
				                        <!-- <input type="hidden" value="20221120235959"> -->
				                        <label class="filter-date-label"><i class="icon icon-calendar"></i></label>
				                    </div>
				                </div>
				            </div>
			        
							            </li>
						        </ul>
				            </div>
				        </li>
				    </ul>
				    <div class="condition-button-area">
				        <!-- <div class="condition-left">
				            <button type="button" class="js-filter-reset condition-reset">초기화</button>
				        </div> -->
				        <div class="condition-right">
				            <button type="reset" class="workstatus-cancel">취소</button>
				            <button type="button" class="workstatus-save">검색</button>
				        </div>
				    </div>
				</div>
		   </div>
    
		
		</form>
		 
		    
		 
		 
		    
     
        <table class="table custom-table">   
          <thead>   
            <tr>
              <th class="boardth" width="15%"scope="col"><button type="button" style="border: none; background-color: #ffff;">시간<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button></th>     
              <th class="boardth" width="12%" scope="col"><button type="button" style="border: none; background-color: #ffff;">이름<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button></th>  
              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
				  <div class="dropdown-menu">
					      <h5 class="dropdown-header">소속</h5>
					      <a class="dropdown-item" href="#">인사·총무</a>
					      <a class="dropdown-item" href="#">회계·재무</a>
					      <a class="dropdown-item" href="#">법무</a>
					      <a class="dropdown-item" href="#">감사</a> 
					      <a class="dropdown-item" href="#">업무지원</a>
					      <a class="dropdown-item" href="#">경영지원</a> 
				  </div>
			  </th>
              <th class="boardth" width="12%" scope="col"><button type="button" style="border: none; background-color: #ffff;">상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button></th>  
              <th class="boardth" width="12%"scope="col">유형</th>
              <th class="boardth" width="12%"scope="col">IP</th> 
              <th class="boardth" width="12%"scope="col">디바이스</th> 
              <th class="boardth" width="12%"scope="col">브라우저</th>
            </tr> 
          </thead>
          <tbody>
            <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
             <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
             
          </tbody>  
        </table>
      </div>
		
 
	</div>
	
 





</div>