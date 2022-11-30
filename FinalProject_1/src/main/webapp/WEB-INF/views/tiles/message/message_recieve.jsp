<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="message_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.mg-current{ font-weight: bold; }
	.check-star > i {
		font-size: 15pt;
		color: rgba(0,0,0,0.1);
		position: relative;
		top: 3px;
	}
	
	.check-star > i:hover{
		cursor: pointer;
		color: #ffc107;
		transition: 0.2s;
	}
	
	
</style>
<script>

$(document).ready(function(){
	
	$("#mg-recieve").css("color","#4d4f53");
	$("span#all").css("font-weight","bold");
	// 첫로딩시 전체 보여주기
	var tab = "all";
	getMglist(tab,1);
	
	
	// 전체, 안읽음, 중요 목록 읽어오기
	$("span#all").click(function(e){
		$("span#all").css("font-weight","bold");
		checkall_reset();
		var tab = "all";
		getMglist(tab,1);
	});
	
	$("span#unread").click(function(e){
		$("span#unread").css("font-weight","bold");
		checkall_reset();
		var tab = "unread";
		getMglist(tab,1);
	});
	
	$("span#scrap").click(function(){
		$("span#unread").css("font-weight","bold");
		checkall_reset();
		var tab = "scrap";
		getMglist(tab,1);
	});
	
	//메시지 목록 클릭 이벤트 => 해당 페이지로 이동.
	$(document).on("click",".mgList-contents tr",function(e){
		$(this).parent().find("tr").css("background-color","white");
		if($(e.target).is("td:first-child *") || $(e.target).is("td:nth-child(2) *")) return; //중요표시나 체크박스 클릭시 함수 종료
		const mno = $(this).attr("id");
		
		// 클릭한 tr 색깔 변경하기
		$("tr#"+mno).css("background-color","rgba(230,230,230,0.6)");
		
		// 클릭한 메시지 정보를 알아오는 ajax
		selectonemg(mno);
	});
	

	

	
	// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
	$(document).on('change','#mg-selectchx-all',function(){
		var total = $("input[name='mg-selectchx']").length;
		if($("#mg-selectchx-all").is(":checked")){
			$("input[name='mg-selectchx']").prop("checked",true);
			show_checkmenu();
			$("#check_ctn").text(total);
			
		} else {
			$("input[name='mg-selectchx']").prop("checked",false);
			show_noncheckmenu();
		}
	});
	
	$(document).on("change","input[name='mg-selectchx']",function() {
		// 체크박스 개수
		var total = $("input[name='mg-selectchx']").length;
		var checked = $("input[name='mg-selectchx']:checked").length;
		show_checkmenu();
		
		if(checked<=0)
			show_noncheckmenu();
		$("#check_ctn").text(checked);
		
		if(total != checked)
			$("#mg-selectchx-all").prop("checked", false);
		else
			$("#mg-selectchx-all").prop("checked", true); 
	});
	
	
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	
	// 중요표시 별표
	$(document).on("click",".check-star",function(){
		const itag = $(this).find("i");
		if ( itag.hasClass('icon-star-empty') ) {
			itag.removeClass('icon-star-empty');
			itag.addClass('icon-star-full');
			itag.css("color","#ffc107");  	
		} else {
	  		itag.removeClass('icon-star-full');
	  		itag.addClass('icon-star-empty');
	  		itag.css("color",""); 
	  	}
	});
	
	
	
	
	
	
});//end of ready

//체크했을 때 보이는 메뉴
function show_checkmenu(){
	$(".mg-noncheckmenu").hide();
	$(".mg-checkmenu").fadeIn("fast");
	$(".fa-check").css("visibility","visible");
}

// 체크안할 때 보이는 메뉴
function show_noncheckmenu(){
	$(".mg-checkmenu").hide();
	$(".mg-noncheckmenu").fadeIn("fast");
	$(".fa-check").css("visibility","hidden");
}

//전체체크 상태 리셋하는 함수
function checkall_reset(){
	$("#mg-selectchx-all").prop("checked", false);
	$("input[name='mg-selectchx']").prop("checked",false);
	show_noncheckmenu();
}//end of checkall_change


//메시지 목록을 가져오는 ajax 
function getMglist(tab, curpage){
	$.ajax({
		url: "<%= ctxPath%>/mglist.up",
		type: "post",
		data: {"tab":tab,
				"curpage":curpage},
		dataType:"json",
		success:function(json){
			let html = '';
			
			if(json.length > 0 ){ // 가져올 메시지목록이 있는 경우
				$.each(json, function(index, item){
					if(item.ms_checktime == null)
						html += '<tr id="'+item.mno+'" class="mg-unread">'
					else
						html += '<tr id="'+item.mno+'" class="mg-read">'
					
					html += '<td width="3%"><input id="mg-selectchx'+index+'" name="mg-selectchx" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx'+index+'"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999; visibility:hidden;"></i></label></td>' + 
							'<td width="3%">'+
								'<input id="check-star'+index+'" type="checkbox" name="check-star" style="display: none;"/>'+
								'<label for="check-star'+index+'" class="check-star">'+
									'<i class="icon icon-star-empty"></i>'+
								'</label>'+
							'</td>'+
							'<td width="72%">'+
								'<div>'+
									'<span id="mg-subject">'+item.subject+'</span>';
					if(item.file_size != null) // 첨부파일이 있을 경우
						html += '<span><i class="fas fa-paperclip"></i></span>';
					
					html += '</div>'+
							'<div><span>'+item.w_name+'</span>·<span>'+item.w_deptname+'</span></div>'+
							'</td>'+
							'<td width="22%">'+
								'<div>'+item.ms_sendtime+'</div>';
					if(item.file_zie != null) //첨부파일이 있을 경우
						html += '<div><span>'+item.file_size+'</span>MB</div>';
					
					html += '</td>'+
							'</tr>';
				});//end of $.each
				
			} else { //가져올 메시지목록이 없는 경우
				html += '<tr>'+
						'<td width="100%">조회된 메시지가 없습니다.</td>'+
						'</tr>';
			}
			
			$(".mgList-contents > table").html(html);
			//페이지바 함수 호출
			pgbar(tab, curpage);
			
			// 첫로딩시 첫번째 메시지 보여주기
			var firstmno = $(".mgList-contents table tr:first-child").attr("id");
			selectonemg(firstmno);	
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
	}); //end of ajax
	
	
}//end of getMglist

function pgbar(tab, curpage){
	$.ajax({
		url: "<%= ctxPath%>/mgtotal.up",
		data: {"tab":tab,
				"sizePerPage":2},
		type: "post",
		dataType:"json",
		success:function(json){
			if(json.mgtotal > 0){ // 메시지목록이 있는 경우
				const mgtotal = json.mgtotal;
				const blockSize = 2;
				let loop = 1;
				if(typeof curpage == "string"){
					curpage = Number(curpage);
				}
				let pageNo = Math.floor((curpage - 1)/blockSize) * blockSize + 1;
				let pageBarHTML = '<nav><ul class="pagination mg-pagebar">';
				
				// [맨처음][이전] 만들기
				if(pageNo != 1) {
					pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='처음' href='javascript:getMglist(\""+tab+"\", 1)'><span aria-hidden='true'>&laquo;</span></a></li>";
					pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='이전' href='javascript:getMglist(\""+tab+"\", "+(pageNo-1)+")'><span aria-hidden='true'>&lt;</span></a></li>";
				}
				while( !(loop > blockSize || pageNo > mgtotal) ) {
					if(pageNo == curpage) {
						pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #37A652; color: white;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
					}
					else {
						pageBarHTML += "<li class='page-item'><a class='page-link' href='javascript:getMglist(\""+tab+"\", "+pageNo+")'>"+pageNo+"</a></li>";
					}
					
					loop++;
					pageNo++;
				}//end of while
				// [다음][마지막] 만들기
				if(pageNo <= mgtotal) {
					pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='다음' href='javascript:getMglist(\""+tab+"\", "+pageNo+")'><span aria-hidden='true'>&gt;</span></a></li>";
					pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='마지막' href='javascript:getMglist(\""+tab+"\", "+mgtotal+")'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
				
				pageBarHTML += "</ul></nav>";
				
				$(".mg-paging").html(pageBarHTML);
				
			}//end of if
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}//end of pgbar

// 메시지 하나 읽어오는 ajax 함수
function selectonemg(mno){
	
	$.ajax({
		url: "<%= ctxPath%>/selectOnemg.up",
		data: {"mno":mno},
		type: "post",
		async: false,
		dataType:"json",
		success:function(json){
			
			let html = '';
			html += '<div class="mgc-container">'+
					'<div class="mgc-header">'+
					'<div class="mgc-header-left">'+
					'<div class="mgc-subject">'+
					'<span>'+
						'<input type="checkbox" id="mc-star" name="mc-star" style="display: none;"/>'+
						'<label for="mc-star"><i class="icon icon-star-empty"></i></label>'+
					'</span>'+
					'<span id="mc-subject">'+json.subject+'</span>';
			if(json.filesize != null) html += '<span class="mgc-header-attach"><i class="fas fa-paperclip"></i></span>';
			html += '</div>'+
								'<div class="mgc-from mgc-people">'+
									'<div>보낸 사람</div>'+
									'<div>';
			if(json.profile_orginfilename == null ){
				html += '<span class="pic" style="height: 25px; width: 25px; margin-right: 5px;">'+
							'<span style="font-size: 7pt;">'+json.w_name.substr(1,2)+'</span>'+
						'</span>';
			}
			else{ // 프로필 사진이 따로 등록되어있는 경우
				
			}
										
			html += '</div>'+
					'<div><span>'+json.w_name+'</span>·<span>'+json.w_dept+'</span></div>'+
					'</div>'+
					'<div class="mgc-to mgc-people">'+
						'<div>받는 사람</div>'+
						'<div id="mgc-toList"></div>'+
					'</div>'+
							'</div>'+
							'<div class="mgc-header-right">'+
								'<button type="button" class="mgc-writebtn button gradientbtn btn">'+
									'<span><i class="fas fa-reply"></i></span>'+
									'<span>답장하기</span>'+
								'</button>'+
								'<div id="mgc-date">2022. 11. 13(화) 오후 1:45</div>'+
							'</div>'+
						'</div>'+
						'<hr class="HRhr" style="margin:0px;"/>'+
						'<div class="mgc-body">'+
							'<div class="mgc-content">'+json.content+'</div>'+
							'<div class="accordion mgc-ac" id="accordionPanelsStayOpenExample">'+
							  '<div class="accordion-item">'+
							    '<h2 class="accordion-header" id="panelsStayOpen-headingOne">'+
							      '<button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">'+
										'<div><i class="fas fa-paperclip"></i></div>'+
										'<div>첨부파일 <span>1</span></div>'+
							      '</button>'+
							    '</h2>'+
							    '<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">'+
							      '<div class="accordion-body mgc-attach mgc-ac-content">'+
							      	'<div>'+
								      	'<span><i class="fas fa-download"></i></span>'+
								      	'<span>첨부파일명</span>'+
								      	'<span>(10MB)</span>'+
							      	'</div>'+
							      	'<div>'+
								      	'<span><i class="fas fa-download"></i></span>'+
								      	'<span>첨부파일명</span>'+
								      	'<span>(10MB)</span>'+
							      	'</div>'+
							      '</div>'+
							    '</div>'+
							  '</div>'+
							  '<div class="accordion-item">'+
							    '<h2 class="accordion-header" id="panelsStayOpen-headingTwo">'+
							      '<button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">'+
									'<div><i class="fas fa-envelope-open-text"></i></div>'+
									'<div>주고받은 메시지 <span>1</span></div>'+
							      '</button>'+
							    '</h2>'+
							    '<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">'+
							      '<div class="accordion-body mgc-ac-content mgc-ac-ref">'+
							      		'<div class="mg-read mg-now">'+
							      			'<span><i class="fas fa-envelope-open"></i></span>'+
							      			'<span>메시지 제목</span>'+
							      			'<span>2022. 11. 13(화) 오후  1:00</span>'+
							      		'</div>'+
							      		'<div class="mg-read">'+
							      			'<span><i class="fas fa-envelope-open"></i></span>'+
							      			'<span>메시지 제목</span>'+
							      			'<span>2022. 11. 13(화) 오후  1:00</span>'+
							      		'</div>'+
							      		'<div class="mg-unread">'+
							      			'<span><i class="fas fa-envelope"></i></span>'+
							      			'<span>메시지 제목</span>'+
							      			'<span>2022. 11. 13(화) 오후  1:00</span>'+
							      		'</div>'+
							      '</div>'+
							    '</div>'+
							  '</div>'+
							'</div>'+
						'</div>'+
					'</div>';
			
			$(".mg-right-container").html(html);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
	});//end of ajax
	
	// 수신자 정보를 알아오는 ajax
	$.ajax({
		url: "<%= ctxPath%>/selectOnemgReceivers.up",
		data: {"mno":mno},
		type: "post",
		async: false,
		dataType:"json",
		success:function(json2){
			let rhtml = '';
			$.each(json2, function(index, item){
				rhtml += '<div style="display: inline-block; margin-right: 10px;"><span>'+item.r_name+'</span>·<span>'+item.r_dept+'</span></div>';
			}); //end of each
			$("#mgc-toList").html(rhtml);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
			
	// 송신시간을 알아오는 ajax
	$.ajax({
		url: "<%= ctxPath%>/getmstime.up",
		data: {"mno":mno},
		type: "post",
		async: false,
		dataType:"json",
		success:function(json3){
			let dtext = json3.ms_sendtime;
			$("#mgc-date").text(dtext);
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
			
	
	
}//end of selectonemg




</script>




<div class="message-container">
	<div class="mg-left-container">
		<div class="mgList-info">
			<span id="all" >전체</span>
			<span id="unread">안읽음<span>5</span></span>
			<span id="scrap">중요<span>2</span></span>
			<div class="mg-search">
				<form action="#" class="mg-form">
				<%-- 검색 --%>
				<div>
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 6px; border-radius: 5px; border:1px solid #ced4da;">
								<option value="" selected>전체</option>
								<option value="">보낸이</option>
								<option value="">제목</option>
								<option value="">내용</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: -9px;">
							<input type="text" class="form-control" placeholder="검색" style="width:90%; font-size: 9pt; padding:6px 12px;">
						</div>
					</div>
				</div>
				<div>
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: relative; right: 147%; top:2px;"></a>
					</div>
				</div>
				</form>
			</div>
			<!-- 
			<span id="mg-filter"><i class="fas fa-filter" style="margin-right: 5px; color:rgba(0,0,0,0.3);"></i>필터</span>
			 -->
		</div>
		<hr class="HRhr" style="margin: 0;"/>
		<div class="mgList">
			<div class="mgList-menu">
				<input id="mg-selectchx-all" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx-all"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999;"></i></label>
				<div class="mg-menucontainer" style="height: 40px;">
					<div class="mg-noncheckmenu">
						<span>1</span>	<!-- 지금 보고있는 메시지 -->
						<span>/</span>
						<span>10</span>	<!-- 전체수량 -->
					</div>
					<div class="mg-checkmenu" style="display: none;">
						<button id="all-read" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽음 표시"><i class="fas fa-envelope-open"></i></button> <!-- 읽은상태로표시 -->
						<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽지 않음 표시"><i class="fas fa-envelope"></i></button> <!-- 읽지않은상태로표시 -->
						<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="중요 표시"><i class="fas fa-star" style="right: 4px; color: #F29F05;"></i></button> <!-- 중요표시 -->
						<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="fas fa-trash"></i></button> <!-- 삭제 -->
						<span><span id="check_ctn"></span>개 선택</span>
					</div>
				</div>
			</div>
			<div class="mgList-contents">
				<table>
				</table>
			</div>
			<div class="mg-paging">
			</div>
		</div>
	</div>
	
	<div class="mg-right-container">
	<%-- 
		<div class="mgc-container">
			<div class="mgc-header">
				<div class="mgc-header-left">
					<div class="mgc-subject">
						<span>
							<input type="checkbox" id="mc-star" name="mc-star" style="display: none;"/>
							<label for="mc-star"><i class="icon icon-star-empty"></i></label>
						</span>
						<span id="mc-subject"></span> <!-- 20자 이내로 제한줘야됨 -->
						<span class="mgc-header-attach"><i class="fas fa-paperclip"></i></span> <!-- 첨부파일 있을 때만 -->
					</div>
					<div class="mgc-from mgc-people">
						<div>보낸 사람</div>
						<div>
							<span class="pic" style="height: 25px; width: 25px; margin-right: 5px;">
								<!-- 파일이 없을때만 -->
								<span style="font-size: 7pt;">${fn:substring(requestScope.mvo.name_kr,1,3)}</span>
							</span>
						</div>
						<div><span>김지은</span>·<span>마케팅</span></div>
					</div>
					<div class="mgc-to mgc-people">
						<div>받는 사람</div>
						<div><span>김지은</span>·<span>마케팅</span></div>
						<div>, <span>김지은</span>·<span>마케팅</span></div>
						<div>, <span>김지은</span>·<span>마케팅</span></div>
						<div>, <span>김지은</span>·<span>마케팅</span></div>
						<div> 외 7명</div>
					</div>
				</div>
				<div class="mgc-header-right">
					<button type="button" class="mgc-writebtn button gradientbtn btn"> <!-- 메시지 보낸사람이 본인이라면 이 버튼이 뜨면 안됨! -->
						<span><i class="fas fa-reply"></i></span>
						<span>답장하기</span>
					</button>
					<div id="mgc-date">2022. 11. 13(화) 오후 1:45</div>
				</div>
			</div>
			<hr class="HRhr" style="margin:0px;"/>
			<div class="mgc-body">
				<div class="mgc-content">어쩌구저쩌구.....메시지 내용</div>
				<!-- 첨부파일, 관련메시지 아코디언 시작 -->
				<div class="accordion mgc-ac" id="accordionPanelsStayOpenExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
				      <button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
							<div><i class="fas fa-paperclip"></i></div>
							<div>첨부파일 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
				      <div class="accordion-body mgc-attach mgc-ac-content">
				      	<div>
					      	<span><i class="fas fa-download"></i></span>
					      	<span>첨부파일명</span>
					      	<span>(10MB)</span>
				      	</div>
				      	<div>
					      	<span><i class="fas fa-download"></i></span>
					      	<span>첨부파일명</span>
					      	<span>(10MB)</span>
				      	</div>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
				      <button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
						<div><i class="fas fa-envelope-open-text"></i></div>
						<div>주고받은 메시지 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
				      <div class="accordion-body mgc-ac-content mgc-ac-ref">
				      		<div class="mg-read mg-now"> <!-- 현재 보고있는 파일인 경우 mg-now 추가  -->
				      			<span><i class="fas fa-envelope-open"></i></span>
				      			<span>메시지 제목</span>
				      			<span>2022. 11. 13(화) 오후  1:00</span>
				      		</div>
				      		<!-- 읽은 메시지 -->
				      		<div class="mg-read">
				      			<span><i class="fas fa-envelope-open"></i></span>
				      			<span>메시지 제목</span>
				      			<span>2022. 11. 13(화) 오후  1:00</span>
				      		</div>
				      		<!-- 안읽은 메시지 -->
				      		<div class="mg-unread">
				      			<span><i class="fas fa-envelope"></i></span>
				      			<span>메시지 제목</span>
				      			<span>2022. 11. 13(화) 오후  1:00</span>
				      		</div>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 첨부파일, 관련메시지 아코디언 끝 -->
			</div>
		</div>
		 --%>
	</div>

</div>