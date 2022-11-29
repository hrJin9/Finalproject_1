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
		top: -2px;
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
	th{
		top: 0px !important;
	}
	.button {
		font-weight: bold;
		width: 44px;
		height: 28px;
		padding: 3.5px 8px;
		font-size: 10pt;
	}
	
</style>

<script type="text/javascript">

	$(document).ready(function(){ 
		
		
		/* 북마크 표시 */
		  $('.bookmark').click(function(e) {
			  	const $this = $(this);

			  	if ( $this.hasClass('icon-star-empty') ) {
			  		$this.removeClass('icon-star-empty');
			  		$this.addClass('icon-star-full');
			  	} else {
			  		$this.removeClass('icon-star-full');
			  		$this.addClass('icon-star-empty');
			  	}
			  	/* e.preventDefault(); */
		});
		
		
		/* 체크 모두선택, 모두해제 */ 
	  $('.js-check-all').on('click', function() {
		  	if ( $(this).prop('checked') ) {
			  	$('td input[type="checkbox"]').each(function() {
			  		$(this).prop('checked', true);
			  	})
		  	} else {
		  		$('td input[type="checkbox"]').each(function() {
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
 

 
  

<div class="mt-5 container" >
	<div class="row">
		 
		
		
		<form action="#" class="booking-form ml-3 mb-3"  style="float: left;">
			<div class="row" >
				<div class="search-period-wr" style="text-align: center;">
                	<div class="js-search-pickr-layer" data-code="unlimit">
	                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box"style="display: inline-block;">
		                	<div class="datebox margin-container">
		                		<span class="control-label"style="display: block; margin-bottom: 4px;font-size: 9px;line-height: 1.43;color:#9e9e9e;right: 65px;">시작일</span>
								<span><input id="datepick"class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;width: 200px !important;font-size: 29px !important;background-color: white !important;border: 0px !important;"/></span>
							</div>
					</div>
                    <span class="dash-swung" style="position: relative;bottom: 10px;right: 2px;">~</span>
	                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box" style="display: inline-block;">
		                	<div class="datebox margin-container">
		                		<span class="control-label"style="display: block; margin-bottom: 4px;font-size: 9px;line-height: 1.43;color:#9e9e9e;right: 65px;">종료일</span>
								<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;width: 200px !important;font-size: 29px !important;background-color: white !important;border: 0px !important;"/></span>
							</div>
						</div>
                	</div>
                	<a href="#" class="btn icon icon-search" style="color: #959ca7;background-color: white;font-size: 1.3rem;position: relative;left: 213px;top: -38px;"></a>
	            </div>
				
				<div>
					<a href="#" class="icon icon-spinner11" style="font-size: 10pt;float: right;top: 3px;position: relative;color: #bababa;"></a>
					<a href="#" style="color:#4285f4;font-size: 10pt;float: right;margin-right: 15px;">북마크보기</a>
				</div>		
				
				
			</div>
		
					

    
		
		</form>
		 
		    
		 
		 
		    
     
        <table class="table custom-table">   
          <thead>   
            <tr>
              <th class="boardth" width="3%"scope="col">
              
              	<label class="control control--checkbox">
                  <input type="checkbox" class="js-check-all"/>
                  <div class="control__indicator icon icon-checkmark" style="color:white;font-size: 8pt;top: 6px;"></div>
                 </label>
              </th>
              <th class="boardth" width="6%"scope="col">북마크</th>
              <th class="boardth" width="8%"scope="col"><button type="button" data-bs-toggle="dropdown"style="color: #4c4e54;font-weight: bold;border: none; background-color: #ffff;">종류<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
              	<div class="dropdown-menu">
				      <h5 class="dropdown-header">문서종류</h5>
				      <a class="dropdown-item" href="#">전체</a>
				      <a class="dropdown-item" href="#">근태</a>
				      <a class="dropdown-item" href="#">근무</a>
				      <a class="dropdown-item" href="#">비용</a>
				      <a class="dropdown-item" href="#">증명서</a>
				      <a class="dropdown-item" href="#">일반</a>
				 </div>
			</th>	       
              <th class="boardth" width="17%" scope="col">문서번호</th>  
              <th class="boardth" width="17%"scope="col">제목</th>
              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="color: #4c4e54;font-weight: bold;border: none; background-color: #ffff;">상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
				  <div class="dropdown-menu">
				      <h5 class="dropdown-header">진행상태</h5>
				      <a class="dropdown-item" href="#">전체</a>
				      <a class="dropdown-item" href="#">진행</a>
				      <a class="dropdown-item" href="#">완료</a>
				      <a class="dropdown-item" href="#">반려</a>
				  </div>
			  </th>
              <th class="boardth" width="7%"scope="col">첨부파일</th> 
              <th class="boardth" width="6%"scope="col">의견</th> 
              <th class="boardth" width="15%"scope="col">작성일</th>
            </tr> 
          </thead>
          <tbody>
            <tr> 
              <td> 
              	<label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator icon icon-checkmark" style="color:white;font-size: 8pt;"></div>
                </label>
              </td>
              <td><a href="#" class="bookmark icon icon-star-empty"></a></td>
              <td><span style="margin-top: 5px;">일반</span></td>
              <td>2022-11-23-1282450</td>
              <td>지출결의서-법인카드</td>
              <td>
              	<button type="button" class="btn btn-sm button" style="font-weight: bold !important;border-radius: 2em !important;background-color: #07B4191F; color: #034C0B; ">승인</button>
              </td>
              <td>O</td>
              <td>1개</td>
              <td>2022-11-23 11:21</td>
            </tr> 
             <tr>
              <td> 
              	<label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator icon icon-checkmark" style="color:white;font-size: 8pt;"></div>
                </label>
              </td> 
              <td><a href="#" class="bookmark icon icon-star-empty"></a></td>
              <td>일반</td>
              <td>2022-11-23-1282450</td>
              <td>지출결의서-법인카드</td>
              <td>
              	<button type="button" class="btn btn-sm button" style="font-weight: bold !important;border-radius: 2em !important;background-color: #F24B171F; color: #661400; ">반려</button>
			  </td>
              <td>O</td>
              <td>1개</td>
              <td>2022-11-23 11:21</td>
            </tr> 
             <tr>
              <td> 
              	<label class="control control--checkbox">
                  <input type="checkbox"/>
                  <div class="control__indicator icon icon-checkmark" style="color:white;font-size: 8pt;"></div>
                </label>
              </td> 
              <td><a href="#" class="bookmark icon icon-star-empty"></a></td>
              <td>일반</td>
              <td>2022-11-23-1282450</td>
              <td>지출결의서-법인카드</td>
              <td>
              	<button type="button" class="btn btn-sm button" style="font-weight: bold;border-radius: 2em;background-color: #17a6f21f;color: #06689c; ">진행중</button>
			  </td>
              <td>O</td>
              <td>1개</td>
              <td>2022-11-23 11:21</td>
            </tr> 
             
          </tbody>  
        </table>
        
        	<h2 class="mt-3"style="text-align: center;">페이징처리</h2>
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