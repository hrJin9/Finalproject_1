<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="approval_header.jsp"%> 
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/mdb.min.css"> --%>
<!-- MDB -->
<!-- <link href="https://dashboard.wantedspace.ai/css/common.css?version=2020.06.16" rel="stylesheet"/> -->
<!-- <link href="https://dashboard.wantedspace.ai/css/bootstrap.min.css?__WB_REVISION__=64bbf58572732583d4b3e9a5e65725b8" rel="stylesheet"/>
<link href="https://dashboard.wantedspace.ai/css/bootstrap-select.min.css?__WB_REVISION__=7551bdcaa335fbd51d4c6095dba2a7bf" rel="stylesheet"/> -->
<!-- MDB -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.js"></script> -->

<style type="text/css">

	
		
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
	


	.control-label {
    display: block;
    margin-bottom: 4px;
    font-size: 9px;
    line-height: 1.43;
    color:#9e9e9e;
}
#datepick {
    width: 200px !important;
    font-size: 29px !important;
    background-color: white !important;
    border: 0px !important;
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
		
		
		
		
		$(".dropdown-toggle").click(function(){
			$(".dropdown-menu").addClass("show");
		})
		
		
		
		
		 // 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d",
			defaultDate: new Date(),
			local: 'ko'
		});
	}); //end of ready	

</script>
 

<div class="container">
 
  

<div class="container mt-5" style="padding-right: 5%;">
	<div class="row">
		 
		
		
		<form action="#" class="booking-form ml-3"  style="float: left;margin-bottom: 0;">
			<div class="row" >
				<div class="search-period-wr" style="text-align: center;">
	                <div class="js-search-pickr-layer" data-code="unlimit">
		                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box"style="display: inline-block;">
		                	<div class="datebox margin-container">
		                		<span class="control-label">시작일</span>
								<span><input id="datepick"class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;width: 200px !important;font-size: 29px !important;background-color: white !important;border: 0px !important;"/></span>
							</div>
						</div>
	                    <span class="dash-swung" style="position: relative;bottom: 10px;right: 2px;">~</span>
		                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box" style="display: inline-block;">
		                	<div class="datebox margin-container">
		                		<span class="control-label">종료일</span>
								<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;width: 200px !important;font-size: 29px !important;background-color: white !important;border: 0px !important;"/></span>
							</div>
						</div>
	                </div>
	            </div>
				<div class="dropdown bootstrap-select -xs"><select class="selectpicker selectpicker-xs" name="" tabindex="-98"><option value="ALL">전체</option><option value="WORK_EVENT">근태</option><option value="WORK_TIME">근무</option><option value="BILL">비용</option><option value="STATEMENT">증명서</option><option value="NORMAL">일반</option></select><button type="button" class="btn dropdown-toggle btn-light" data-toggle="dropdown" role="button" title="전체" aria-expanded="false"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div></button><div class="dropdown-menu" role="combobox" x-placement="bottom-start" style="max-height: 504.969px; overflow: hidden; min-height: 153px; position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 32px, 0px);"><div class="inner show" role="listbox" aria-expanded="false" tabindex="-1" style="max-height: 488.969px; overflow-y: auto; min-height: 137px;"><ul class="dropdown-menu inner show"><li class="selected active"><a role="option" class="dropdown-item selected active" aria-disabled="false" tabindex="0" aria-selected="true"><span class=" bs-ok-default check-mark"></span><span class="text">전체</span></a></li><li><a role="option" class="dropdown-item" aria-disabled="false" tabindex="0" aria-selected="false"><span class=" bs-ok-default check-mark"></span><span class="text">근태</span></a></li><li><a role="option" class="dropdown-item" aria-disabled="false" tabindex="0" aria-selected="false"><span class=" bs-ok-default check-mark"></span><span class="text">근무</span></a></li><li><a role="option" class="dropdown-item" aria-disabled="false" tabindex="0" aria-selected="false"><span class=" bs-ok-default check-mark"></span><span class="text">비용</span></a></li><li><a role="option" class="dropdown-item" aria-disabled="false" tabindex="0" aria-selected="false"><span class=" bs-ok-default check-mark"></span><span class="text">증명서</span></a></li><li><a role="option" class="dropdown-item" aria-disabled="false" tabindex="0" aria-selected="false"><span class=" bs-ok-default check-mark"></span><span class="text">일반</span></a></li></ul></div></div></div>

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
<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" style="font-weight: 1000;font-size: 16pt;"id="offcanvasScrollingLabel">공지사항</div>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		  <div class="offcanvas-body">
	    		
    		<form>
	    		<div class="d-flex-space mb-3">
	    			<div class="mb-1">
	    				<div class="dropdown bootstrap-select">
	    					<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
	    						<input type="checkbox" class="checkbox-disable custom-control-input" id="ntPriority" name="ntPriority">
	    						<label class="custom-control-label" for="ntPriority">이 글을 상단에 고정합니다</label>
	    					</div>
	    				</div>
						<div class="d-flex-space mb-1">
							<div class="dropdown bootstrap-select">
								<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
									<input type="checkbox" class="checkbox-disable custom-control-input" id="ntAlwReply" name="ntAlwReply">
									<label class="custom-control-label" for="ntAlwReply">이 글에 댓글달기를 허용합니다</label>
								</div>
							</div>
						</div>
						<div class="d-flex-space" id="ntRplAnonDiv">
							<div class="dropdown bootstrap-select">
								<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
									<input type="checkbox" class="checkbox-disable custom-control-input" id="ntRplAnon" name="ntRplAnon">
									<label class="custom-control-label" for="ntRplAnon">이 글의 댓글은 익명으로 작성됩니다</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			<hr class="HRhr  mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
			<div class="form-group"style="width:30%">
				<div class="form-field mb-2">
					<div class="select-wrap">
						<select name="selectTag" id="selectTag" class="form-control" style="font-size: 10pt;padding: 6px 12px;height:36px;" onchange="changetagname(this)">
						<option>태그선택</option>
						<option value="">전체공지</option>
						<option value="">일반공지</option>
						<option value="">사내공지</option>
						<option value="">이벤트공지</option>
						<option value="">문진표공유</option>
						<option value="plus">태그추가</option>
						</select>
					</div>
				</div>
				  <div id="divPlusTag1"></div><!-- <span class="error">태그명을 입력해주세요</span> -->
				  <div id="divPlusTag2"></div>
			</div>
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">제목</span>
				<div class="position-relative">
					<input type="text" id="title" class="form-control" title="" placeholder="제목을 입력해주세요" name="title" value="">
				</div>
			</div>
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">파일첨부</span>
				<div class="position-relative">
					<input type="file" id="file" class="form-control"  name="file" >
				</div>
			</div>
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">내용</span>
				<div class="position-relative">
					<div id="editor"></div>
					<!-- <textarea  class="" title="" placeholder="내용을 입력해주세요" name="content" value=""></textarea> -->
				</div>
			</div>
	    	<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
	    	
	    	<div class="form-group" style="margin-top: 10px;">
				<div class="control-label" style="float: left;">공개범위</div>
	            <div class="condition-cell">
	                <input type="radio" class="custom-control-radio2" id="entire" name="showrange">
	                <label for="entire" class="js-period-type radio-label-checkbox2" data-code="unlimit">전체공개</label>
	                <input type="radio" class="custom-control-radio2" id="dept" name="showrange">
	                <label for="dept" class="js-period-type radio-label-checkbox2" data-code="unlimit">부서공개</label>
	                <input type="radio" class="custom-control-radio2" id="manager" name="showrange">
	                <label for="manager" class="js-period-type radio-label-checkbox2" data-code="unlimit">관리자공개</label>
				</div>
			</div>
	    	<div class="form-group" style="margin-top: 5px;">
				<div class="control-label" style="float: left;">알림설정</div>
	            <div class="condition-cell">
	                <!-- <input type="radio" class="custom-control-radio2" id="mail" name="boardalarm">
	                <label for="mail" class="js-period-type radio-label-checkbox2" data-code="unlimit">메일알림</label> -->
	                <input type="radio" class="custom-control-radio2" id="popup" name="boardalarm">
	                <label for="popup" class="js-period-type radio-label-checkbox2" data-code="unlimit">팝업알림</label>
	                <input type="radio" class="custom-control-radio2" id="none" name="boardalarm">
	                <label for="none" class="js-period-type radio-label-checkbox2" data-code="unlimit">미설정</label>
				</div>
			</div>
    	</form>
			
    		<div class="workstatus-buttoncontainer">
	  				<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
		  			<button type="button" style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;"class="workstatus-save">임시저장</button>
		  			<button type="button" class="workstatus-save">저장하기</button>
	  			</div>
    	
		  	</div>
		  </div>
		<!-- 오프캔버스 끝 -->