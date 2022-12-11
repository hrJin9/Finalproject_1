<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="approval_header.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/plugins/monthSelect/style.css" />
<script src="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/plugins/monthSelect/index.js"></script>
<!--#include virtual="dbcon.asp"-->
<style type="text/css">
.ap_type{
		font-size: 9.5pt;
    	color: #858585;
    	font-weight: 400;
	}
	a.bookmark{
		box-shadow: rgb(0 0 0 / 2%) 0px 2px 6px, rgb(0 0 0 / 6%) 0px -1px 0px inset, rgb(0 0 0 / 8%) 0px 0px 0px 1px inset;
    	border-radius: 5px;
    	padding: 7px;
	}
    modal{
        background: rgba(0, 0, 0, 0.5);
    }
    
		
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
	     border-width: 1px 0px;
    	border-style: solid;
    	border-color: rgba(36, 42, 48, 0.02);
	}
	 tr td{
	     background-color: transparent !important;
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
	  height: 18px;
      width: 18px;
      color: white;
      font-size: 1pt;
	  border-radius: 3px;
	  border: 1px solid #e2e2e2;
	  background: transparent; }
	
	.control--radio .control__indicator {
	  border-radius: 50%; }
	
	.control:hover input ~ .control__indicator,
	.control input:focus ~ .control__indicator {
	  border: 2px solid #007bff; }
	
	.control input:checked ~ .control__indicator {
	  border: 2px solid #007bff;
	  background: #007bff;
	  font-size: 10pt; 
	  }
	
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
	
	.table thead th, th button {
		border-bottom: none;
		text-align: center; 
		font-weight: 400;
		font-size: 10.3pt;
		text-align: center;
		color:#8d96a1;
		border: none;
    	background-color: transparent;
		
	}
	.boardth{
		position: relative;
		top: -2px;
	}
	/* .table {
	    color: #4c4e54;
	} */
	table tbody tr{
		line-height: 46px;
	}
	.table>:not(caption)>*>* {
		border-bottom-width: 0px !important;
	}
	th{
		color: #b1b1b1;
	}
	td>*{
		margin-top: 4px;
	    display: flex;
    	justify-content: space-around;
	}
	tbody{
		font-size: 10pt;
		color: rgb(85, 99, 114);
		border-width: 1px 0px;
    	border-style: solid;
    	border-color: rgba(36, 42, 48, 0.02);
	}
	
	/* 상태뱃지  */
	.btn-badge{
		color: #a8a7a7;
	    font-weight: 400;
	    font-size: 10pt;
	    padding: 0.1rem 0.5rem !important;
  	    font-size: .675rem !important;
  	    cursor: default;
  	    font-weight: bold !important;
  	    /* border-radius: 1.3em; */
  	    margin-top: 12px;
  	    border-radius: 0.8em;
  	    padding: 0.15rem 0.5rem;
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
	
	
	
	.modal-dialog {
	    max-width: 90%;
	    min-height: 90%;
	    max-height: 90%;
	}
	
	
	
</style>

<script type="text/javascript">

let ap_type = "";
let signyn = "";
let bookmark = "";
let startDate = "";
let endDate = "";
let searchType = "";
let searchWord = "";

$(document).ready(function(){
	$(".search-period-wr").hide();
	$("#searchbar").css("display","none");
	$(".dropselchx").css("display","none");
	
	if(!$("a#send").hasClass('list_iscurrent')){// 현재 페이지가아닐경우 
		$("a#send").removeClass('list_notcurrent');
		$("a#send").addClass('list_iscurrent');
		$("a#send").siblings().removeClass('list_iscurrent');
	}
	
	
	//console.log($("input#searchStartday").val())
	//console.log($("input#searchStartday").val());
	
	// 검색시 검색조건 및 검색어 값 유지시키기
	 if( ${not empty requestScope.paraMap} ) {
		$("select#searchType").val("${requestScope.paraMap.searchType}");
		$("input#searchWord").val("${requestScope.paraMap.searchWord}");
	}else{
		$("select#searchType").val("");
		$("input#searchWord").val("");
	}

	
	// 검색시 검색조건 및 검색어 값 유지시키기
	if( ${not empty requestScope.searchStartday} ) {
		$("input#searchStartday").val("${requestScope.searchStartday}")
	}
	if( ${not empty requestScope.searchEndday} ) {
		$("input#searchEndday").val("${requestScope.searchEndday}")
	}
	
	
	$("#ap_typemenu a").click(function(e){
		ap_type = $(e.target).text();
		//console.log("ap_type => "+ap_type);
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord,signyn);
	})
	$("#signynmenu a").click(function(e){
		signyn = $(e.target).text();
		//console.log("signynval => "+signyn);
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord,signyn);
	})
	
	// 북마크만보기 체크유무 
	$("input.bkList").change(function(){
		if($(this).is(":checked")){
			bookmark = "1";
		}
		else{
			bookmark = "0";
		}
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord,signyn);
	})
	
	
		
		/* 체크 모두선택, 모두해제 */ 
		// 체크박스 개수	
		var total = $("input[name='ap-selectchx']").length;
	  $('.ap-selctchx-all').on('click', function() {
		  let anoval = '';
		  	if ( $(this).prop('checked') ) {// 모두선택이 체크됐으면 
			  	$("input[name='ap-selectchx']").each(function() {
			  		$(this).prop('checked', true);
			  		anoval += (anoval!='')? ','+$(this).parent().next().val():$(this).parent().next().val() 
			  	})
			  	show_checkmenu();
				$("#check_ctn").text(total);
				$("input#appendchx").val(anoval)
		  	} else {// 모두선택을 해제했으면 
		  		$("input[name='ap-selectchx']").each(function() {
			  		$(this).prop('checked', false);
			  		$("input#appendchx").val('');
			  	})
			  	show_noncheckmenu();
		  	}
	  });
	  $("input[name='ap-selectchx']").change(function(e) { 
		  const inputval = $("input#appendchx").val();
		  const $this = $(this).parent().next().val();
		  //console.log('inputval =>'+inputval)
		  
		  if($(this).prop('checked')){ // 체크됐으면 
			  if(inputval.length == 0){
				  $("input#appendchx").val($this);
			  }else{
				  $("input#appendchx").val(inputval+','+$this);
			  }
		  }else{ //해제했으면
			  //console.log('$this =>'+$this);
			  let reinputval = "";
			  reinputval= (inputval.indexOf($this)==0)? inputval.replace($this,'') : inputval.replace(','+$this,'');
			  //console.log('reinputval =>'+reinputval)
			  $("input#appendchx").val(reinputval);
		  }
		  
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
	
	  
	  
	  // 드롭다운 
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
		
		/* $("input#searchWord").keyup(function(e){
			if(e.keyCode == 13) {
				// 검색어에 엔터를 했을 경우
				goSearch();
			}
		}); */


		
		/* 행호버효과 */
		$(document).on({
			mouseenter: function(){
				$(this).css('background-color','#fafafa');
				$(this).siblings().css('background-color','#fafafa');
			},
			mouseleave: function(){
				$(this).css('background-color','transparent');
				$(this).siblings().css('background-color','transparent');
			}
		}, 'tr>td');

		
		/* *** 클릭하면 문서상세정보 보여주기  */
		$("tr>td:nth-child(3)~").click(function() {
			const anoval = $(this).parent().find(".anoval").val();
			const ap_type = $(this).parent().find(".ap_type").text();
			//console.log("anoval => "+anoval);
			//console.log("ap_type => "+ap_type);
 			
			//$('#modalcontent').text($(this).data("content"));
			$.ajax({
				url:"<%= ctxPath%>/approval/view.up",
				type:"GET",
				data:{"ano":anoval
					, "ap_type":ap_type},
				dataType:"json",
				success: function(json) {
					let content="";// 연차 비교해서 넣기
					let filecontent="";
					let doccontent="";
					let badgecontent="";
					badgecontent+='<button type="button" class="btn btn-badge statebadge" style="background-color: #FAE2D3; color: #EAA77F; ">승인 필요</button>'
					  //<button type="button" class="Apv-button is-danger" style="color:red">반려</button><button type="button" class="Apv-button is-danger" style="color:rgb(0, 60, 255)">승인</button>
					let writedayarr = [];
					writedayarr = json.writeday.split('-');
					let writeday =writedayarr[1]+'월 '+writedayarr[2].substr(0,2)+'일'+writedayarr[2].substr(2)
					
					if(json.bookmark == '0'){
						badgecontent += '<button data-bs-toggle="tooltip" data-bs-placement="top" title="북마크" class="tp btn bookmark icon icon-star-empty"  aria-label="북마크"></button><input hidden="hidden" type="text" value="'+json.ano+'">'
	   	            }else if(json.bookmark == '1'){
	   	            	badgecontent += '<button data-bs-toggle="tooltip" data-bs-placement="top" title="북마크" class="tp btn bookmark icon icon-star-full" aria-label="북마크"></button><input hidden="hidden" type="text" value="'+json.ano+'">'
	   	            }	
					// ** 문서세부내용 **//
					content += '<div class="sc-bCfvAP cstQxy"><h4 class="ApvHeader-title">'+json.title+'</h4>'
							  +'<div class="sc-cOxWqc ft-16 StyledApv"><div class="ApvDl-item"style="font-weight:500;"><span class="ApvDl-dd"><i class="icon icon-file-text2"> </i>'+json.ano+'・'+writeday+' 작성</span>'
							  +'</div><div class="ApvDl-item"><span class="ApvDl-dt">보존연한:</span><span class="ApvDl-dd">'+json.preserveperiod+'</span>'
							  +'</div><div class="ApvDl-item"><span class="ApvDl-dt">템플릿:</span><span class="ApvDl-dd">'+json.ap_type+'</span>'
							  +'</div><div class="ApvDl-item"><span class="ApvDl-dt">작성자:</span><span class="ApvDl-dd">'+json.name_kr+'</span>'
							  +'</div></div></div>';
							  /* '</div><div class="ApvDl-item"><span class="ApvDl-dt">작성일:</span><span class="ApvDl-dd">'+json.writeday+'</span> */
					// ** 첨부파일  **//
	                if( json.ap_systemFileName == "" || json.ap_systemFileName == null){ // 첨부파일이 없을경우  
		                filecontent += '<div style="padding: 16px;border-radius: 4px;background-color: rgb(246, 246, 246);text-align: center;color: rgb(153, 153, 153);">첨부된 파일이 없습니다</div>'
	                }else{
	                	filecontent += '<div style="padding: 16px;border-radius: 4px;background-color: rgb(246, 246, 246);text-align: center;color: rgb(153, 153, 153);">'
						  			+'<div class="ApvFile-item" style="display: flex;-webkit-box-pack: justify;justify-content: space-between;color: rgb(17, 17, 17);">'
					  				+'<div><button style="align-items: center;height: 36px;padding: 8px 12px;display: inline-flex;font-size: 15px;cursor: pointer;border: 0px;background: transparent;"class="Apv-button is-text ApvFile-item_link" id="85240">'+json.ap_originFileName+'</button><span>'+json.filesize+'</span></div>'
						  			+'<button style="display: inline-flex;-webkit-box-align: center;font-size: 15px;cursor: pointer;align-items: center;height: 36px;padding: 8px 12px;color: rgb(153, 153, 153);border: 0px;background: transparent;"class="Apv-button is-text ApvFile-item_delete"><span class="material-icons">delete</span></button></div></div>'
	                }
	             	
	             	// ** 관련문서  **//
	                if( json.fk_ano_refer == "" || json.fk_ano_refer == null){ // 참조문서파일이 없을경우  
		                doccontent += '<div style="padding: 16px;border-radius: 4px;background-color: rgb(246, 246, 246);text-align: center;color: rgb(153, 153, 153);">등록된 관련문서가 없습니다</div>'
	                }else{
	                	doccontent += '<div style="padding: 16px;border-radius: 4px;background-color: rgb(246, 246, 246);text-align: center;color: rgb(153, 153, 153);">'
							  		+'<div class="ApvFile-item" style="display: flex;-webkit-box-pack: justify;justify-content: space-between;color: rgb(17, 17, 17);">'
					  				+'<div><button style="align-items: center;height: 36px;padding: 8px 12px;display: inline-flex;font-size: 15px;cursor: pointer;border: 0px;background: transparent;"class="Apv-button is-text ApvFile-item_link">'+json.fk_ano_refer+'</button></div>'
									+'<button style="display: inline-flex;-webkit-box-align: center;font-size: 15px;cursor: pointer;align-items: center;height: 36px;padding: 8px 12px;color: rgb(153, 153, 153);border: 0px;background: transparent;"class="Apv-button is-text ApvFile-item_delete">'
									+'<span class="material-icons">delete</span></button></div></div>'
	                }
	             	
	                const inputano ='<input id="footerano"hidden="hidden" type="text" value="'+json.ano+'">';
	                $("#footercss").append(inputano);
	                $("#badgesection").html(badgecontent);
	                $("#datasection").html(content);
	                $("#contentsection").html(json.content);
	                $("#filesection").html(filecontent);
	                $("#docsection").html(doccontent);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    }
			});
			
			$.ajax({
				url:"<%= ctxPath%>/approval/view_sign.up",
				type:"GET",
				data:{"ano":anoval},
				dataType:"json",
				success: function(json) {
					let linecontent=""; 
					let fbcontent=""; 
					let btncontent="";
					// 연차 비교해서 넣기 
					if(json.length > 0) { // 현재 결재라인에 하이라이트 표시. 아직 결재안한사원 배경색 흐리게, 
						$.each(json, function(index, item) {
							
							 if(index ==0){
								
								btncontent += `<button class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="문서 공유"><i style="color: #959ca7;background-color: white;" class="icon icon-share"></i></button>`
											+`<button class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="히스토리"><i style="color: #959ca7;background-color: white;" class="icon icon-history"></i></button>`
											+`<a style="margin-left: 5px;color: #c2c2c2;font-size: 0.5em;cursor: pointer;"class="dropdown-link icon icon-flickr" id="dropdownMenuButton2" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20"></a>`
							           		+`<div class="dropdown-menu" style="color:#d0d0d0;min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton2" >`
							             	+`<a onclick="modifymyapp('`+item.signyn+`','`+item.ano+`')" class="dropdown-item" >문서 수정</a>`
							             	+`<a class="dropdown-item" >인쇄하기</a>`
							             	+`<a onclick="cancelmyapp('`+item.signyn+`','`+item.ano+`')"  class="dropdown-item" style="color:red;">문서 취소</a></div>`
								} 
							
							// 승인일경우 // 반려일경우 // 아직대기중일경우 
							if(item.signyn == "진행중"){
								linecontent += '<li class="signli"><header class="signheader"><span class="signspan" style="color: rgb(141, 150, 161);">'
								  			+'<span>'+item.signstep+'단계</span><span> 진행중</span></span><div class="separator" aria-orientation="horizontal" ></div></header>'
											+'<ul class="signul"><li class="signli-prof"><div class="signdiv-prof"><div style="line-height: 1;display: inline-block;width:80%;">'
										  	+'<span><div class="profile" href="#" style="padding: 1px;"><span class="pic"><span>'+item.name_kr.substr(1)+'</span></span>'
										  	+'<span class="my"style="top:0px;display: flex;align-items: center;"><span class="name" style="font-weight: 600;color:#454a4e;font-size: 11.8pt;">'+item.name_kr+'</span></span></div></span></div>'
								  			+'<button type="button" class="btn btn-badge statebadge" style="margin:auto;background-color: #e7dfd9;color: #b2a9a4; ">대기중</button></div></li></ul></li>'
							}else if(item.signyn == "승인"){
								linecontent += '<li class="signli"><header class="signheader"><span class="signspan" style="color: rgb(19 133 255 / 86%);">'
								  			+'<span>'+item.signstep+'단계</span><span> 완료</span></span><div class="separator" aria-orientation="horizontal" ></div></header>'
											+'<ul class="signul"><li class="signli-prof"><div class="signdiv-prof"><div style="line-height: 1;display: inline-block;width:80%;">'
										  	+'<span><div class="profile" href="#" style="padding: 1px;"><span class="pic"><span>'+item.name_kr.substr(1)+'</span></span>'
										  	+'<span class="my"style="top:0px;display: flex;align-items: center;"><span class="name" style="font-weight: 600;color:rgb(36, 42, 48);font-size: 11.8pt;">'+item.name_kr+'</span></span></div></span></div>'
								  			+'<button class="tp btn btn-badge statebadge" data-bs-toggle="tooltip" data-bs-placement="top" title="'+item.signdate+'"style="margin: auto;background-color: #D5FAF1;color: #65BAA5;">승인</button></div></li></ul></li>'
							}else if(item.signyn == "반려"){
								linecontent += '<li class="signli"><header class="signheader"><span class="signspan" style="color: rgb(19 133 255 / 86%);">'
								  			+'<span>'+item.signstep+'단계</span><span> 완료</span></span><div class="separator" aria-orientation="horizontal" ></div></header>'
											+'<ul class="signul"><li class="signli-prof"><div class="signdiv-prof"><div style="line-height: 1;display: inline-block;width:80%;">'
										  	+'<span><div class="profile" href="#" style="padding: 1px;"><span class="pic"><span>'+item.name_kr.substr(1)+'</span></span>'
										  	+'<span class="my"style="top:0px;display: flex;align-items: center;"><span class="name" style="font-weight: 600;color:rgb(36, 42, 48);font-size: 11.8pt;">'+item.name_kr+'</span></span></div></span></div>'
										  	+'<button type="button" class="btn btn-badge statebadge tp" data-bs-toggle="tooltip" data-bs-placement="top" title="'+item.signdate+'"style="margin:auto;background-color: #FFD4D5;color: #D97881;">반려</button></div></li></ul></li>'
							}
													
							/* linecontent += '</div><div class="cell" style="padding-right: 16px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">결재자 / '+item.signemp_position+'('+item.signemp_deptname+')</div></div></div>'; */
                   		});
					
						//console.log(json(json.length));
						let fbcnt = 0;
						$.each(json, function(index, item) {
							if(index+1 == json.length){//마지막배열 
								fbcnt = item.fbcnt;
							}
							else return;
						});// end of $.each(json, function(index, item) --------------------

						if(fbcnt==0){ // 작성된 의견이 없는경우 
							fbcontent+='<div class="ApvSection-header"><h2 class="ApvSection-title">의견</h2></div>'
							  		 +'<div class="ApvSection-body"><div style="padding: 16px;border-radius: 4px;background-color: rgb(246, 246, 246);text-align: center;color: rgb(153, 153, 153);">작성된 댓글이 없습니다</div>';
						}else{ // 작성된 의견이 있는경우
							
							$.each(json, function(index, item) {
								
									if(index==0){ // 한번만 나올거 
										fbcontent+='<div class="ApvSection-header"><h2 class="ApvSection-title">의견('+fbcnt+')</h2></div>'
										  		 +'<div class="ApvSection-body">'
									}
									if(typeof item.feedback !="undefined" ){
										console.log('item.feedback ->'+item.feedback);
										fbcontent+='<div class="sc-iOeugr krRGcH"><div class="ApvComment" style="margin-bottom: 10px;display: flex;padding: 16px;border-radius: 4px;background-color: rgb(246, 246, 246);font-size: 16px;">'
							  					+'<div class="ApvComment-meta" style="min-width: 180px;padding-right: 16px;border-right: 1px solid rgb(225, 226, 227);margin-right: 16px;">'
							  					+'<div class="ApvComment-name">'+item.name_kr+'</div><div class="ApvComment-date">'+item.signdate+'</div></div>'
							  					+'<div class="ApvComment-body" style="flex: 1 1 0%;line-height: 1.88;white-space: pre-line;">'+item.feedback+'<form class="sc-jfvxQR bzoEDp StyledApvCommentForm">'
									  			+'<div class="ApvCommentForm-footer" style="padding: 8px;display: flex;-webkit-box-pack: end;justify-content: flex-end;margin-top: 10px;">'
										  		+'<button id="fixmycmt"type="button" style="border: 0px;background: transparent;font-size: 14px;display: inline-flex;-webkit-box-align: center;align-items: center;height: 32px;padding-right: 0px;padding-left: 0px;margin-right: 0px;color: rgb(104, 104, 104);">수정</button>'
										  		+'<button id="delmycmt"type="button" style="border: 0px;background: transparent;font-size: 14px;display: inline-flex;-webkit-box-align: center;align-items: center;height: 32px;padding-right: 0px;padding-left: 0px;margin-right: 0px;color: rgb(104, 104, 104);">삭제</button>'
										  		+'</div></form></div></div></div>';	
									}
								
									  		 
							});// end of $.each(json, function(index, item) --------------------
						}
				  		fbcontent+='</div>'; 
							
                  	}
					$("#btnsection").html(btncontent);
					$("#linebody").html(linecontent);
					$("#fbsection").html(fbcontent);
					showmodal();
					var tooltipel = $(".tp").tooltip();
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			    }
			}); 
			
			
		});
		
		
						
						

    
	 // 검색시 검색조건 및 검색어 값 유지시키기
		if( ${not empty requestScope.paraMap} ) {
			$("select#searchType").val("${requestScope.paraMap.searchType}");
			$("input#searchWord").val("${requestScope.paraMap.searchWord}");
		}
	 
		<%-- 검색어 입력시 자동 리스트검색  --%>
		$("div#displayList").hide();
		
		$("input#searchWord").keyup(function(e){ 
			const wordLength = $(e.target).val().trim().length;// 검색어에서 공백을 제거한 길이를 알아온다.
			
			if(wordLength != 0) {
				searchType = $("select#searchType").val()
				searchWord = $("input#searchWord").val()
			}
			else{
				searchType = ""
				searchWord = ""
			}
				showList(ap_type,bookmark,startDate,endDate,searchType,searchWord);	
		}); // end of $("input#searchWord").keyup()---------------
	    				
						
		  
	  // 결재하기버튼 
	  $("button#approvebtn").click(function(){
		  if(confirm("선택하신 문서들을 승인하시겠습니까?")){
			  goapprove($('input#appendchx').val());
		  };
	  })
	  $("button#aprdoc").click(function(){
		  const thisano = $(this).next().val();
		  //console.log("thisano => "+thisano);
		  if(confirm("현재 문서를 승인하시겠습니까?")){
			  goapprove(thisano);
		  };
	  })
	  $("button#rejdoc").click(function(){
		  const thisano = $(this).next().next().val();
		  //console.log("thisano => "+thisano);
		  if(confirm("현재 문서를 반려하시겠습니까?")){
			  goreject(thisano);
		  };
	  })  
	  
	  
	  
	}); //end of ready ------------------------------------------

	// ajax 검색필터 적용 
	function showList(ap_type,bookmark,startDate,endDate,searchType,searchWord){
		$.ajax({
			url:"<%= ctxPath%>/approval/apList.up",
			type:"GET",
			data:{"ap_type":ap_type
				, "bookmark":bookmark
				, "searchStartday":startDate
				, "searchEndday":endDate
				, "searchType":searchType
				, "searchWord":searchWord
				, "signyn":'0'},
				 /* ,"searchType":$("select#searchType").val()
				 ,"searchWord":$("input#searchWord").val()} */
			dataType:"json",
			success:function(json){
				console.log(json.length);
                let html = "";
                let html2 = "";
                if(json.length > 0) {
                   $.each(json, function(index, item) {
                	   
                	   html+= '<tr><td><input class="anoval" hidden="hidden" value="'+item.ano+'"></td><td>'
      	              	 	+ '<div  style="justify-content: unset;margin-top: 14px;"><label class="control control--checkbox" style="top: 1px;">'
      	              		+ '<input type="checkbox" name="ap-selectchx" /><div class="control__indicator icon icon-checkmark" ></div>'
      		            	+ '</label></div></td>'
      	              		+ '<td class="title"><div id="writername">'+item.name_kr+'</div>'
      	              		+ '<div id="writerday">'+item.writeday+'</div>'
      		              	+ '<div id="writertitle">'+item.title+'</div></td>'
      	              		+ '<td class="ap_type"><div>'+item.ap_type+'</div></td><td><div>'
      	              if(item.final_signyn == "승인"){
 		              		html += '<button type="button" class="btn btn-badge" style="background-color: #D1FCF1; color: #4dc6ad; ">승인</button>'
 		               }
 		               else if(item.final_signyn == "반려"){
 		            	   html += '<button type="button" class="btn btn-badge" style="background-color: #FBD8D7; color: #D2737F; ">반려</button>'
 		               }
 		               else if(item.final_signyn == "진행"){
 		            	   html +=  '<button type="button" class="btn btn-badge" style="background-color: #17a6f21f;color: #06689c; ">진행중</button>'
 		               }
 		               else if(item.final_signyn == "취소"){
 		            	   html +=  '<button type="button" class="btn btn-badge" style="background-color: #E9E9EB;color: #747378; ">취소</button>'
 		               }
      	              	html += '</div></td><td>'
      	              	
      	              	if(item.bookmark == '0'){
			   	            html += `<div style="margin-top:12px;"><a class="bookmark icon icon-star-empty" onclick="addbookmark('`+item.ano+`',event)"></a></div>`
		   	            }else if(item.bookmark == '1'){
			   	            html += `<div style="margin-top: 12px;"><a class="bookmark icon icon-star-full" onclick="addbookmark('`+item.ano+`',event)"></a></div>`
		   	            }
      	              	
                    	html+= '</td><td></td></tr>'
                    	
		               if(item.pageBar != "0"){
		            	   html2 = item.pageBar;
		               }
                   }); 
                   
               }else{
            	   html = "<td colspan='7' style='text-align: center;'><div style='margin-top: 150px;display: flex;justify-content: flex-start;flex-direction: column;'>"
            	   		 +'<svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin: 0 auto;width: 48px; height: 48px; flex-shrink: 0;"><path d="M10.5956 3C6.40068 3 3 6.40068 3 10.5956C3 14.7906 6.40068 18.1913 10.5956 18.1913C12.3602 18.1913 13.9842 17.5896 15.2737 16.5801L19.6936 21L21 19.6936L16.5801 15.2737C17.5896 13.9842 18.1913 12.3602 18.1913 10.5956C18.1913 6.40068 14.7906 3 10.5956 3ZM4.84759 10.5956C4.84759 7.42107 7.42107 4.84759 10.5956 4.84759C13.7702 4.84759 16.3437 7.42107 16.3437 10.5956C16.3437 13.7702 13.7702 16.3437 10.5956 16.3437C7.42107 16.3437 4.84759 13.7702 4.84759 10.5956Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd"></path></svg>'
            	   		 +"<div style='font-weight: 700;font-size: 16px;line-height: 26px;color: #242a30;margin-top: 10px;'>"+searchWord+"에 대한 검색결과가 없어요.</div>"
            	   		 +"<div style='font-weight: 400;font-size: 13px;line-height: 21px;color: #556372;'>다른 검색어를 입력해주세요.</div></div>"
            	   		 +"<button onclick='emptysearchbar()'style='color: rgb(85, 99, 114);position: relative;cursor: pointer;display: inline-flex;align-items: center;justify-content: center;font-weight: 700;outline: none;border: none;font-size: 13px;border-radius: 6px;background: transparent;box-shadow: none;padding-left: 10px;padding-right: 10px; margin-top: 15px;'><span>검색어 지우기</span></button></td>";
            	   html2 = ""; 
               }
                   $("#tabledata").html(html);
				   $("div#pageBar").html(html2);
				   // console.log(html2);
                     
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		}); 
	}
	
	// 검색어 비우기
	function emptysearchbar(){
		$("input#searchWord").val('');
		searchWord = '';
		$("input#searchWord").focus();
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord);
	}
	


	// 날짜필터 => 일, 주, 월, 년 날짜 자동 입력 (오늘날짜 기준)
	function getDate(val,e){
		$(".dropselchx").each(function(){
			$(this).css("display","none");
		})
		$(e.target).find(".dropselchx").css("display","block");
		
		var today = new Date();
		//오늘 년, 월, 일
		var day = today.getDate();
		var month = today.getMonth();
		var year = today.getFullYear();
		var today = new Date().toLocaleDateString();
		//일주일 전
		var Aweek = new Date(new Date().setDate(day-7)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		//한달 전
		var Amonth = new Date(new Date().setMonth(month-1)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		//세달 전
		var Amonth = new Date(new Date().setMonth(month-3)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		//일년 전
		var Ayear = new Date(new Date().setYear(year-1)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		startDate = "";
		endDate = today;
		if(val == '1') {
			startDate = today;
		} else if(val == '2') {
			startDate = Aweek;
		} else if(val == '3') {
			startDate = Amonth;
		} else if(val == '4') {
			startDate = Ayear;
		} else if(val == '5') {
			startDate = Ayear;
		}
		//yyyy-mm-dd
		let [y1,m1,d1] = startDate.split('.');
		startDate = [y1,m1,d1].join('-');
		let [y2,m2,d2] = endDate.split('.');
		endDate = [y2,m2,d2].join('-');
		
		startDate = startDate.replaceAll(' ','');
		endDate = endDate.replaceAll(' ','');
		
		//
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord);
	}
	
	
	
	
	
	
	
	// 내가쓴 문서 결재취소하기 (첫결재단계가 아직 결재를안했을경우만 )
	function cancelmyapp(signyn,ano){
		//console.log('cancelmyapp(signyn) =>'+signyn)
		//console.log('cancelmyapp(ano) =>'+ano)
		if(signyn!="진행중"){ // 첫번째 결재라인이 결재내렸으면 취소못하게 
			alert("결재진행중이므로 취소불가합니다!");
		}else{
			if(confirm("정말 결재를 취소하시겠습니까?")){
				location.href="<%= ctxPath%>/approval/mycancel.up?ano="+ano;
			}
		}  
	}
	
	// 내가쓴 문서 수정하기 (첫결재단계가 아직 결재를안했을경우만 )
	function modifymyapp(signyn,ano){
		//console.log('cancelmyapp(signyn) =>'+signyn)
		//console.log('cancelmyapp(ano) =>'+ano)
		//console.log('modifymyapp(signyn,ano) =>'+signyn+', '+ano)
		if(signyn!="진행중"){ // 첫번째 결재라인이 결재내렸으면 취소못하게 
			alert("결재진행중이므로 수정불가합니다!");
		}else{
			<%-- location.href="<%= ctxPath%>/approval/mycancel.up?ano="+ano; --%>
		}
	}
	
	
	/* 북마크 표시 */
	function addbookmark(anoval,e){
	  	//const $this = $(this);
		let yn = "";
		$(e.target).hasClass('icon-star-empty')? yn = 'y': yn = 'n'; 
	  	//console.log($(e.target));
	  	
	  	/* 북마크 추가하기&해제하기  find(".anoval").text()*/
  		$.ajax({
			url:"<%= ctxPath%>/approval/addscrap.up",
			type:"GET",
			data:{"ano":anoval
			     ,"yn":yn},
			dataType:"json",
			success:function(json){
				if(json.result = 1){
				  	if ( $(e.target).hasClass('icon-star-empty') ) {
				  		$(e.target).removeClass('icon-star-empty');
				  		$(e.target).addClass('icon-star-full');
				  	} else {
				  		$(e.target).removeClass('icon-star-full');
				  		$(e.target).addClass('icon-star-empty');
				  	}
				}

			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		}); 
	}
	
	// 모달 보이기 
	function showmodal(){
		$('#writemodal').modal('show');
	};
	function modalclose(){
		$('#onemodal').modal('hide');
	}
	
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
	
	// 검색창보이기 
	function showsearch(){
		if($("#searchbar").is(':visible'))
			$("#searchbar").css("display","none");
		else{
			$("#searchbar").css("display","block");
			$("input#searchWord").focus();
			$("select#searchType option:eq(0)").prop("selected",true); // selected 되게하기
		}
	}
	
	// 문서 승인하기 
	function goapprove(ano){
		  location.href="<%= ctxPath%>/approval/goapprove.up?ano="+ano;
	}
	
	// 문서 반려하기 
	function goreject(ano){
		  location.href="<%= ctxPath%>/approval/goreject.up?ano="+ano;
	}
	
	
</script>
 
 
<nav id="subList" class="margin-container appreqsublist">
	<div style="display: contents;">
		<a  class="header-sub list_iscurrent" href="<%= request.getContextPath()%>/approval/requested.up">결재대기<span style="color: rgb(41 170 236);font-weight: 500;margin-left: 4px;">${requestScope.totalCount}</span></a>
		<a  class="header-sub list_notcurrent" href="<%= request.getContextPath()%>/approval/requested/will.up" style="margin-left: 1%;">결재예정</a>
		<a  class="header-sub list_notcurrent" href="<%= request.getContextPath()%>/approval/requested/processing.up" style="margin-left: 1%;">결재진행중</a>
		<a  class="header-sub list_notcurrent" href="<%= request.getContextPath()%>/approval/requested/refered.up" style="margin-left: 1%;">참조문서</a>
	</div>
	<div class="subList_underline"></div>
	<div style="display: inline-flex;position: relative;align-items: center;margin-top: 10px;margin-left: auto;">
	<!-- **** 검색필터 **** --> 
		<form id="searchbar" name="searchFrm" style="display: flex;">
			<div class="form-group" style="position: fixed;">
					<div class="form-field">
						<select name="searchType" id="searchType" style="background-color:transparent;font-weight: 500;color: rgb(85 99 114);font-size: 8pt;padding: 7px 0px;border: 0px solid #ced4da;margin-top: 1px;margin-left: 10px;color: rgb(85, 99, 114);">
							<!-- <option value="all" selected="">전체</option> -->
							<!-- <option selected disabled>분류</option> -->
							<option value="title">제목</option>
							<option value="ano">문서번호</option>
							<option value="name_kr">작성자</option>
							<option value="signemp_name_kr">승인자</option>
							<option value="referemp_name_kr">참조자</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="form-field" style="padding-left:5px; margin-right: -9px;">
						<input name="searchWord" id="searchWord"  type="text" class="form-control" placeholder="검색어 입력" style="background-color:rgba(36, 42, 48, 0.02);box-shadow:inset 0px 0px 0px 1px rgba(0, 0, 0, 0.04); border-radius: 0.4rem;width: 112%;font-size: 9pt;padding: 6px 12px 6px 70px;color:#556372"autocomplete="off" />
					</div>
				</div>
	   		</form>
		<!-- **** 검색필터 **** --> 
		
		
		<a  class="headersearch icon icon-search" onclick="showsearch()"></a> <!-- 검색버튼 -->
		<a  class="headersearch icon icon-spinner11"onclick="showList('','','','','','')"></a> <!-- 문서 새로고침 -->
		 
		 <!-- 날짜 필터  -->
		<a class="headersearch dropdown-link icon icon-sort-amount-asc" id="dropdownMenuButton" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20"></a>
	          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="color:#d0d0d0;min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton" >
	            <!-- <a class="dropdown-item" >업데이트 일</a>
	            <a class="dropdown-item" >작성일</a>
	            <div class="dropdown-divider"></div> -->
	            <a class="dropdown-item" onclick="getDate(1,event)">오늘<span class="icon icon-checkmark dropselchx"></span></a>
	            <a class="dropdown-item" onclick="getDate(2,event)">지난 1주일<span class="icon icon-checkmark dropselchx"></span></a>
	            <a class="dropdown-item" onclick="getDate(3,event)">지난 1개월<span class="icon icon-checkmark dropselchx"></span></a>
	            <a class="dropdown-item" onclick="getDate(4,event)">지난 3개월<span class="icon icon-checkmark dropselchx"></span></a>
	            <a class="dropdown-item" onclick="getDate(5,event)">지난 1년<span class="icon icon-checkmark dropselchx"></span></a>
	            <a class="dropdown-item">직접 입력<span class="icon icon-checkmark dropselchx"></span></a>
	            <a class="dropdown-item">
		            <div class="search-period-wr" >
		                <div class="js-search-pickr-layer" data-code="unlimit">
		                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
			                	<div class="datebox margin-container">
									<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;"/></span>
								</div>
							</div>
		                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
		                	<div class="datebox margin-container">
								<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;"/></span>
							</div>
						</div>
					</div>
	            </div>
	          	</a> 
	</div>	
	</div>	
</nav>

 

<hr class="HRhr" style="margin-top: 0px;"/>
 <div style="width: 100%; background-color: #fdfdfd;">
<div class="" style="max-width:100%;">
	<div id="datenav"class="booking-form ml-3"  >
			
				
		</div>
	</div>
        <table class="table custom-table" >   
          <thead style="background-color: rgb(253, 253, 253);">    
            <tr style="line-height: 2.2;">
              <th class="boardth" width="5%" scope="col" style=""></th>
              <th class="boardth" width="4.5%"scope="col" style="">
              
              	<label class="control control--checkbox" style="top: 3px;">
                  <input type="checkbox" class="ap-selctchx-all"/><div class="control__indicator icon icon-checkmark" ></div>
                 </label>
              </th>
              <th class="boardth" width="60%" scope="col" style="padding-left:0;padding-bottom: 0;">
	              	<div style="margin-bottom: 4px;display: flex;font-size: 11pt;justify-content: space-between;">
						<div style="display: flex;align-items: center;">
					<div class="ap-checkmenu" style="display: none;align-items: center;">
						<button style="padding:0.175rem 0.75rem"id="all-read" class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="문서 다운로드"><i style="color: #959ca7;background-color: white;"class="icon icon-folder-plus"></i></button> <!-- 읽은상태로표시 -->
						<button style="padding:0.175rem 0.75rem"class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽지 않음 표시"><i style="color: #959ca7;background-color: white;" class="icon icon-folder-download"></i></button> <!-- 읽지않은상태로표시 -->
						<button style="padding:0.175rem 0.75rem"class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="승인/합의"><i style="color: #959ca7;background-color: white;" class="icon icon-user-check" style="right: 4px; color: #F29F05;"></i></button> <!-- 중요표시 -->
						<button style="padding:0.175rem 0.75rem"class="btn tp" data-bs-toggle="tooltip" data-bs-placement="top" title="참조자추가"><i style="color: #959ca7;background-color: white;" class="icon icon-user-plus"></i></button> <!-- 삭제 -->
						<span><span id="check_ctn" style="color:#4285f4;"></span>개 선택</span>
						<span>/</span>
						<span style="color: rgba(0,0,0,0.7);">전체 <span style="font-weight: bold;">${fn:length(requestScope.approvalList)}</span></span>
					</div>
				</div>
              </th>  
              <th class="boardth" width="7%"scope="col"><button id="ap_type_sel"type="button" data-bs-toggle="dropdown">종류<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>
              	<div id="ap_typemenu" class="dropdown-menu" style="font-size: 10pt;">
				      <h5 class="dropdown-header">문서종류</h5>
				      <a class="dropdown-item" href="#">전체</a>
				      <a class="dropdown-item" href="#">일반</a>
				      <a class="dropdown-item" href="#">연차</a>
				      <a class="dropdown-item" href="#">업무</a>
				      <a class="dropdown-item" href="#">지출</a>
				      <a class="dropdown-item" href="#">증명서</a>
				 </div>
			</th>
              <th class="boardth" width="7%" scope="col"><button id="signyn_sel" type="button" data-bs-toggle="dropdown">상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
				  <div id="signynmenu" class="dropdown-menu"style="font-size: 10pt;">
				      <h5 class="dropdown-header">진행상태</h5>
				      <a class="dropdown-item" href="#">전체</a>
				      <a class="dropdown-item" href="#">진행</a>
				      <a class="dropdown-item" href="#">승인</a>
				      <a class="dropdown-item" href="#">반려</a>
				      <a class="dropdown-item" href="#">취소</a>
				  </div>
			  </th>
              <th class="boardth" width="8%"scope="col">
              	<input class="bkList" type="checkbox" id="toggle" hidden>
				 <label style="margin: 0 auto;margin-bottom: 6px;"for="toggle" class="toggleSwitch tp" data-bs-toggle="tooltip" data-bs-placement="top" title="즐겨찾기만">
				  <span class="toggleButton"></span>
				</label>
              </th>
              <th width="5%" class="boardth"></th>
            </tr> 
          </thead>
          <tbody id="tabledata">
          
          	<c:forEach var="approvalvo" items="${requestScope.approvalList}" >
	            <tr> 
	            	<td><input class="anoval" hidden="hidden" value="${approvalvo.ano}"></td>
	              <td>
	              	<div  style="justify-content: unset;margin-top: 14px;">
	              	<label class="control control--checkbox" style="top: 1px;">
	              	<input type="checkbox" name="ap-selectchx" /><div class="control__indicator icon icon-checkmark" ></div>
		            </label>
		            </div>
	              </td>
	              <td class="title"><div id="writername">${approvalvo.name_kr}</div>
		              <div id="writerday">${approvalvo.writeday}</div>
		              <div id="writertitle">${approvalvo.title}</div></td>
	              <td class="ap_type"><div>${approvalvo.ap_type}</div></td>
	              <td>
	              	<div>
	              		<c:if test="${approvalvo.final_signyn=='승인'}">
		              		<button type="button" class="btn btn-badge" style="background-color: #D1FCF1; color: #4dc6ad; ">승인</button>
	              		</c:if>
	              		<c:if test="${approvalvo.final_signyn=='반려'}">
		              		<button type="button" class="btn btn-badge" style="background-color: #FBD8D7; color: #D2737F; ">반려</button> 
	              		</c:if>
	              		<c:if test="${approvalvo.final_signyn=='진행'}">
		              		<button type="button" class="btn btn-badge" style="background-color: #17a6f21f;color: #06689c; ">진행중</button>
	              		</c:if>
	              		<c:if test="${approvalvo.final_signyn=='취소'}">
		              		<button type="button" class="btn btn-badge" style="background-color: #E9E9EB;color: #747378; ">취소</button>
	              		</c:if>
	              	</div>
	              </td>
	              <td>
              		<c:if test="${approvalvo.bookmark=='0'}">
	            		<div style="margin-top:12px;"><a class="bookmark icon icon-star-empty" onclick="addbookmark('${approvalvo.ano}',event)"></a></div>
              		</c:if>
              		<c:if test="${approvalvo.bookmark=='1'}">
	            		<div style="margin-top: 12px;"><a class="bookmark icon icon-star-full" onclick="addbookmark('${approvalvo.ano}',event)"></a></div>
              		</c:if>
              	  </td>
	              <td></td>
	            </tr>  
          	</c:forEach>
          </tbody>  
        </table>
        	
        	 <div id="pageBar" align="center" style="width:70%; margin:20px auto;">${requestScope.pageBar}</div>
	</div>
	
 	
 	<input id="appendchx" type="text" hidden="hidden" value="">
 	
 	
 	
 	<%-- ****************** 결재 문서 상세보기 모달창 시작 ********************* --%>
<div class="modal fade" id="writemodal" tabindex="-1" aria-hidden="true" style="border-radius: 0.5rem;background-color: rgba(240, 240, 240, 0.85);">
 <div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable" style="    border-radius: 0.5rem;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 4%), 0px 24px 72px rgb(36 42 48 / 30%);min-width:50% !important;max-width: 75% !important;align-items: normal !important;">
   <div class="modal-content" style="border:none">
		<div class="modal-body-header" style="position: absolute;top: 0px;display: flex;-webkit-box-pack: justify;justify-content: space-between;-webkit-box-align: center;align-items: center;right: 0px;background-color: transparent;z-index: 10;padding: 20px 30px;">
		  <button type="button" class="btn-close" onclick="modalclose()"></button><!-- data-bs-dismiss="modal" -->
		</div>
		<div class="modal-body" style="padding: 0px;">
			<div style="float: left;width: 70%;justify-content: flex-start;align-items: stretch;flex-direction: row;display: flex;">
				<div style="width:100%;'">
					  <!-- 문서 헤더버튼  -->
					  <div class="head-btnsection" >
						  <div class="ApvHeader-footer">
							  <div class="ApvHeader-footer_column" id="badgesection"></div><!-- 문서상태뱃지 -->
							  <div class="ApvHeader-footer_column" id="btnsection"></div>
						  </div>
		  	     	  </div>
					  <!-- 문서 헤더정보  -->			  
					  <div id="datasection" style="border-bottom: 1px solid rgba(36, 42, 48, 0.06);"></div>
					  
					  
					  
					  <!-- 문서내용  -->
					  <div class="pad-part"> 
					  	<!-- <div class="ApvSection-header"><h2 class="ApvSection-title">내용</h2></div> -->
						  <div class="ApvSection-body">
						  	<div style="color: rgb(17, 17, 17);font-size: 16px;line-height: 1.63;">
						  		<div id="contentsection" style="padding: 20px 0px;white-space: pre-line;">
						  		</div>
						  	</div>
				  		</div>
				  	  </div>
					  
					  <!-- 첨부파일  -->
					  <div class="pad-part">
					  	<div class="ApvSection-header"><h2 class="ApvSection-title">첨부파일</h2></div>
						  <div class="ApvSection-body" id ="filesection">
				  		</div>
				  	  </div>
					  
					  <!-- 관련문서  -->
					  <div class="pad-part">
					  	<div class="ApvSection-header"><h2 class="ApvSection-title">관련문서</h2></div>
						  <div class="ApvSection-body" id="docsection">
				  		</div>
				  	  </div>
					  
					  <!-- 문서의견  -->
					  <div class="pad-part">
					  	<div id="fbsection"></div>
				  	  </div>
			  	</div>
			  </div>
			  <aside style="float: right;width: 30%;background: #fafafa;height: 207%;">
				  <!-- 문서 결재라인 --> 
				  <div data-radix-scroll-area-viewport dir="ltr" class="pad-part" style="box-shadow: inset 1px 0px 0px rgba(0, 0, 0, 0.08);isolation: isolate;position: relative;padding: 26px 24px;height: 100%;">
					  <div class="ApvSection-header" style="display: flex;flex-direction: row;justify-content: flex-start;">
					  	<h2 class="ApvSection-title"style="margin: auto 0;" >승인・참조</h2>
					  	<button class="btn tp" style="display: flex;font-size: small;"data-bs-toggle="tooltip" data-bs-placement="top" title="참조자추가"><i style="color: rgb(78 111 215);background-color: transparent;" class="icon icon-user-plus"></i></button> <!-- 삭제 -->
					  </div>
					  <div class="ApvSection-body">
					  	<ol class="signol"></ol>
						<div class="tbody" id="linebody"style="margin-top: 16px;font-size: 16px;"></div>
					  </div>
				  </div>
			  </aside>
		</div>
    </div>
  </div>

</div>
