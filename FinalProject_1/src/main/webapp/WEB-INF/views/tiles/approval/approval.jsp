<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="approval_header.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/plugins/monthSelect/style.css" />
<script src="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/plugins/monthSelect/index.js"></script>

<style type="text/css">

	
		
	.custom-table {
		min-width: 900px;
		thead {
			tr, th {
				border-top: none;
				border-bottom: none!important;
			}
		}
	}
	
	.table>:not(:first-child) {
	    border-top: 1px solid #cfcfcf54;
	}
	 tbody{
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
	  height: 13px;
      width: 13px;
      color: white;
      font-size: 1pt;
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
	.table th {
		font-size: 10pt;
	    /* border-top: 1px solid #eef2f6; */
	}
	/* .table {
	    color: #4c4e54;
	} */
	table td{
		font-size: 10.3pt;
		text-align: center;
		color:#3c3c3c; 
		
	}
	.table>:not(caption)>*>* {
		border-bottom-width: 0px !important;
	}
	th{
		color: #7d7d7d;
	}
	td>*{
		margin-top: 4px;
	    display: flex;
    	justify-content: space-around;
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
	
	
	button#daysearch{
		color: #2e87cd;
		
	}
	#text{
	 	visibility: hidden;
	}
</style>

<script type="text/javascript">

	$(document).ready(function(){ 
		//console.log($("input#searchStartday").val());
		
		
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
		// 체크박스 개수	
		var total = $("input[name='ap-selectchx']").length;
	  $('.ap-selctchx-all').on('click', function() {
		  	if ( $(this).prop('checked') ) {
			  	$("input[name='ap-selectchx']").each(function() {
			  		$(this).prop('checked', true);
			  	})
			  	show_checkmenu();
				$("#check_ctn").text(total);
		  	} else {
		  		$("input[name='ap-selectchx']").each(function() {
			  		$(this).prop('checked', false);
			  	})
			  	show_noncheckmenu();
		  	}
	  });
	
		
	  $("input[name='ap-selectchx']").change(function() {
			var checked = $("input[name='ap-selectchx']:checked").length;
			show_checkmenu();
			
			if(checked<=0)
				show_noncheckmenu();
			$("#check_ctn").text(checked);
			
			if(total != checked)
				$(".ap-selctchx-all").prop("checked", false);
			else
				$(".ap-selctchx-all").prop("checked", true); 
			
		});
	  
	  
		
		
		$(".dropdown-toggle").click(function(){
			$(".dropdown-menu").addClass("show");
		})
		
		//툴팁 사용
		var tooltipel = $(".tp").tooltip();
		
		
		 // 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d",
			defaultDate: new Date(),
			local: 'ko'
		});
		
		$(".dateSelector").change(function(){
			const startday = $("input#searchStartday").val();
			const endday = $("input#searchEndday").val();
			
			let startdayarr = startday.split("-");
			let enddayarr = endday.split("-");
			
			let flag = true;
			
			if( startdayarr[0]<enddayarr[0] ){// 년도 비교 .시작날짜 년도가 더 작음     
				flag = false;
			}
			else if(startdayarr[0] == enddayarr[0]){ // 년도 같음 
				
				if( startdayarr[1]<enddayarr[1] ){// 월수 비교 .시작날짜 월수가 더 작음
					flag = false;
				}
				else if(startdayarr[1]==enddayarr[1] ){// 월수 같음 

					if( startdayarr[2]<=enddayarr[2] ){// 월수 비교 .시작날짜 일수가 더 작음
						flag = false;
					}
				}
			}
				
			
			if(!flag){
				$("#daysearch").prop("disabled",false);		
				$("#daysearch").css("color","#2e87cd");		
			}
			else{
				$("#daysearch").prop("disabled",true);		
				$("#daysearch").css("color","#c3c3c3");		
			}
			
		})
		
		$("#daysearch").click(function(){
			showList();
		})
		
		/* $("input#searchWord").keyup(function(e){
			if(e.keyCode == 13) {
				// 검색어에 엔터를 했을 경우
				goSearch();
			}
		}); */

	}); //end of ready	

	
	
	// 체크했을 때 보이는 메뉴
	function show_checkmenu(){
		$(".ap-noncheckmenu").hide();
		$(".ap-checkmenu").fadeIn("fast");
		$(".fa-check").css("visibility","visible");
	}
	
	// 체크안할 때 보이는 메뉴
	function show_noncheckmenu(){
		$(".ap-checkmenu").hide();
		$(".ap-noncheckmenu").fadeIn("fast");
		$(".fa-check").css("visibility","hidden");
	}
	
	function showList(){
		$.ajax({
			url:"<%= ctxPath%>/approval/myList.up",
			type:"GET",
			data:{"searchStartday":$("input#searchStartday").val()
				, "searchEndday":$("input#searchStartday").val()},
				 /* ,"searchType":$("select#searchType").val()
				 ,"searchWord":$("input#searchWord").val()} */
			dataType:"json",
			success:function(json){
				console.log(json.length);
                if(json.length > 0) {
                   let html = "";
                   let html2 = "";
                   $.each(json, function(index, item) {
	               	   html += '<tr><td><div style="justify-content: unset;margin-top: 6px;"><label class="control control--checkbox">'
		                 	+'<input type="checkbox" name="ap-selectchx" /><div class="control__indicator icon icon-checkmark" ></div>'
		   	            	+'</label></div></td>'
		                	+'<td><div style="margin-top: 6px;"><a href="#" class="bookmark icon icon-star-empty"></a></div></td>'
		                 	+'<td><div>'+item.ap_type+'</div></td>'
		                 	+'<td><div>'+item.ano+'</div></td>'
		                 	+'<td><div>'+item.title+'</div></td><td><div>';
		                 	
		               if(item.final_signyn == "승인"){
		              		html += '<button type="button" class="btn btn-badge" style="cursor: default;font-weight: bold !important;border-radius: 1.2em;font-size: .675rem;padding: 0.15rem 0.5rem;background-color: #07B4191F; color: #034C0B; ">승인</button>'
		               }
		               else if(item.final_signyn == "반려"){
		            	   html += '<button type="button" class="btn btn-sm button" style="font-weight: bold !important;border-radius: 2em !important;background-color: #F24B171F; color: #661400; ">반려</button>'
		               }
		               else if(item.final_signyn == "진행중"){
		            	   html +=  '<button type="button" class="btn btn-sm button" style="font-weight: bold;border-radius: 2em;background-color: #17a6f21f;color: #06689c; ">진행중</button>'
		               }
		               
		               html += '</div></td>';
		               
		               if(item.ap_systemFileName==0){ // 파일이 없으면 
		            	   html += '<td><div>X</div></td>';
		               }
		               else{
		            	   html += '<td><div>O</div></td>';
		               }
	              	
	               	   html += '<button type="button" class="btn btn-badge" style="cursor: default;font-weight: bold !important;border-radius: 1.2em;font-size: .675rem;padding: 0.15rem 0.5rem;background-color: #07B4191F; color: #034C0B; ">'+item.final_signyn+'</button></div></td>'
		                 	+'<td><div>'+item.ap_systemFileName+'</div></td>'
		                 	+'<td><div>'+item.feedbackcnt+'개</div></td>'
		                 	+'<td><div>'+item.writeday+'</div></td></tr>';
		               
		               if(item.pageBar != "0"){
		            	   html2 = item.pageBar;
		               }
                   });
                   
                   $("#tabledata").html(html);
				   $("div#pageBar").html(html2);
				   // console.log(html2);
                     
               }
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		}); 
	}
	
	
</script>
 

 
  

<div class="mt-5 container" style="max-width:100%;">
		
	<form action="#" class="booking-form ml-3 mb-3"  style="float: left;">
		<div class="row" style="padding:0">
			<div class="search-period-wr" style="text-align: center;">
               	<div class="js-search-pickr-layer" data-code="unlimit">
                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box"style="display: inline-block;">
	                	<div class="datebox margin-container">
	                		<span class="control-label"style="display: block; margin-bottom: 4px;font-size: 9px;line-height: 1.43;color:#9e9e9e;right: 65px;">시작일</span>
							<span><input id="searchStartday"class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;width: 200px !important;font-size: 29px !important;background-color: white !important;border: 0px !important;"/></span>
						</div>
				</div>
                   <span class="dash-swung" style="position: relative;bottom: 10px;right: 2px;">~</span>
                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box" style="display: inline-block;">
	                	<div class="datebox margin-container">
	                		<span class="control-label"style="display: block; margin-bottom: 4px;font-size: 9px;line-height: 1.43;color:#9e9e9e;right: 65px;">종료일</span>
							<span><input id="searchEndday" class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;width: 200px !important;font-size: 29px !important;background-color: white !important;border: 0px !important;"/></span>
						</div>
					</div>
               	</div>
               	<button id="daysearch"class="btn icon icon-search" style="color: rgb(46, 135, 205);background-color: transparent;font-size: 1rem;top: -34px;left: 212px;position: relative;"></button>
            </div>
			
		<div style="display: flex;margin-bottom: 10px;height: 30px;font-size: 11pt;justify-content: space-between;">
			<div style="display: flex;align-items: center;">
				<div class="ap-noncheckmenu">
					<span style="color: rgba(0,0,0,0.7);">전체 <span style="font-weight: bold;">10</span></span>
				</div> 
				<div class="ap-checkmenu" style="display: none;align-items: center;">
					<button id="all-read" class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="문서 다운로드"><i style="color: #959ca7;background-color: white;"class="icon icon-folder-plus"></i></button> <!-- 읽은상태로표시 -->
					<button class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽지 않음 표시"><i style="color: #959ca7;background-color: white;" class="icon icon-folder-download"></i></button> <!-- 읽지않은상태로표시 -->
					<button class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="승인/합의"><i style="color: #959ca7;background-color: white;" class="icon icon-user-check" style="right: 4px; color: #F29F05;"></i></button> <!-- 중요표시 -->
					<button class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="참조자추가"><i style="color: #959ca7;background-color: white;" class="icon icon-user-plus"></i></button> <!-- 삭제 -->
					<span><span id="check_ctn" style="color:#4285f4;"></span>개 선택</span>
					<span>/</span>
					<span style="color: rgba(0,0,0,0.7);">전체 <span style="font-weight: bold;">10</span></span>
				</div>
			</div>
		
			
			<div style="display: flex;align-items: center;">
				<a style="color:#d0d0d0;font-size: 0.9em;font-size: bold;"class="dropdown-link btn" href="#" id="dropdownMenuButton" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20">10개씩 보기</a>
		           <div  class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="color:#d0d0d0;min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton" >
		             <a class="dropdown-item" href="#">10개씩 보기</a>
		             <a class="dropdown-item" href="#">30개씩 보기</a>
		             <a class="dropdown-item" href="#">50개씩 보기</a>
		           </div> 
				<a href="#" style="color: #0775ff;;font-weight: bold;font-size: 9pt;float: right;margin-right: 15px;">북마크</a> <!-- 내가북마크한 문서  -->
				<a href="#" class="icon icon-spinner11" style="font-size: 10pt;position: relative;color: #bababa;" onclick="showList()"></a> <!-- 문서 새로고침 --> 
			</div>		
		
		</div>
	
	</form>
        <table class="table custom-table" >   
          <thead>   
            <tr>
              <th class="boardth" width="3%"scope="col" style="top: 5px;">
              
              	<label class="control control--checkbox">
                  <input type="checkbox" class="ap-selctchx-all"/><div class="control__indicator icon icon-checkmark" ></div>
                 </label>
              </th>
              <th class="boardth" width="6%"scope="col">북마크</th>
              <th class="boardth" width="8%"scope="col"><button type="button" data-bs-toggle="dropdown"style="color: #7d7d7d;font-weight: bold;border: none; background-color: #ffff;">종류<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
              	<div class="dropdown-menu">
				      <h5 class="dropdown-header">문서종류</h5>
				      <a class="dropdown-item" href="#">전체</a>
				      <a class="dropdown-item" href="#">일반</a>
				      <a class="dropdown-item" href="#">연차</a>
				      <a class="dropdown-item" href="#">업무</a>
				      <a class="dropdown-item" href="#">지출결의서</a>
				      <a class="dropdown-item" href="#">증명서</a>
				 </div>
			</th>	       
              <th class="boardth" width="17%" scope="col">문서번호</th>  
              <th class="boardth" width="17%"scope="col">제목</th>
              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="color: #7d7d7d;font-weight: bold;border: none; background-color: #ffff;">상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
				  <div class="dropdown-menu">
				      <h5 class="dropdown-header">진행상태</h5>
				      <a class="dropdown-item" href="#">전체</a>
				      <a class="dropdown-item" href="#">진행</a>
				      <a class="dropdown-item" href="#">완료</a>
				      <a class="dropdown-item" href="#">반려</a>
				      <a class="dropdown-item" href="#">취소</a>
				  </div>
			  </th>
              <th class="boardth" width="7%"scope="col">첨부파일</th> 
              <th class="boardth" width="6%"scope="col">의견</th> 
              <th class="boardth" width="15%"scope="col">작성일</th>
            </tr> 
          </thead>
          <tbody id="tabledata">
          
          	<c:forEach var="approvalvo" items="${requestScope.approvalList}" >
	            <<tr> 
	              <td>
	              	<div  style="justify-content: unset;margin-top: 6px;">
	              	<label class="control control--checkbox">
	              	<input type="checkbox" name="ap-selectchx" /><div class="control__indicator icon icon-checkmark" ></div>
		            </label>
		            </div>
	              </td>
	              <td><div style="margin-top: 6px;"><a href="#" class="bookmark icon icon-star-empty"></a></div></td>
	              <td><div>${approvalvo.ap_type}</div></td>
	              <td><div>${approvalvo.ano}</div></td>
	              <td><div>${approvalvo.title}</div></td>
	              <td>
	              	<div>
	              		<c:if test="${approvalvo.final_signyn=='승인'}">
		              		<button type="button" class="btn btn-badge" style="cursor: default;font-weight: bold !important;border-radius: 1.2em;font-size: .675rem;padding: 0.15rem 0.5rem;background-color: #07B4191F; color: #034C0B; ">승인</button>
	              		</c:if>
	              		<c:if test="${approvalvo.final_signyn=='반려'}">
		              		<button type="button" class="btn btn-sm button" style="font-weight: bold !important;border-radius: 2em !important;background-color: #F24B171F; color: #661400; ">반려</button> 
	              		</c:if>
	              		<c:if test="${approvalvo.final_signyn=='진행중'}">
		              		<button type="button" class="btn btn-sm button" style="font-weight: bold;border-radius: 2em;background-color: #17a6f21f;color: #06689c; ">진행중</button>
	              		</c:if>
	              	</div>
	              </td>
	              <td>
	              	<div>
		              	<c:if test="${approvalvo.ap_systemFileName==0}">X</c:if>
		              	<c:if test="${approvalvo.ap_systemFileName==1}">O</c:if>
	              	</div>
	              </td>
	              <td><div>${approvalvo.feedbackcnt}개</div></td>
	              <td><div>${approvalvo.writeday}</div></td>
	            </tr>  
          	</c:forEach>
          </tbody>  
        </table>
        	
        	 <div id="pageBar" align="center" style="width:70%; margin:20px auto;">${requestScope.pageBar}</div>
        	 
        	 
 
	</div>
	
 


