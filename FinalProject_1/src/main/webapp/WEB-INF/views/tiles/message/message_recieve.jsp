<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="message_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
</style>
<script>

var oncecnt = 0;
$(document).ready(function(){
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	$("#mg-recieve").css("color","#4d4f53");
	// 첫로딩시 전체 보여주기
	getMgCnt("all");
	getMglist("all",1);
 
	// 전체, 안읽음, 중요 목록 읽어오기
	$(".mgcatgo").click(function(){
		$(".mgcatgo").removeClass("tab-now");
		$(this).addClass("tab-now");
		var tab = $(this).attr("id");
		checkall_reset();
		getMgCnt(tab,"n");
		getMglist(tab,1);
	});
	
	
	//메시지 목록 클릭 이벤트 => 해당 페이지로 이동.
	$(document).on("click",".mgList-contents tr",function(e){
		if($(e.target).is("td:first-child *") || $(e.target).is("td:nth-child(2) *") || $(e.target).is("#nonmgList")) return; //중요표시나 체크박스 클릭시 함수 종료
		
		$(".mgList-contents tr").css("background-color","inherit");
		const mno = $(this).attr("id");
		// 메시지 읽음상태로 변경
		changeStatus(mno);
		// 메시지 개수 갱신
		getMgCnt();
		// 클릭한 메시지 정보를 알아오는 ajax
		selectonemg(mno);
		
		// 클릭한 tr 색깔 변경하기
		$(this).css({"background-color":"rgba(230,230,230,0.4)","color":"#D2D6D9"});
		
	});
	
	
	
	// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
	$(document).on('change','#mg-selectchx-all',function(){
		var total = $("input[name='mg-selectchx']").length;
		const itag = $("input[name='mg-selectchx']").next().find("i");
		
		if($("#mg-selectchx-all").is(":checked")){
			$("input[name='mg-selectchx']").prop("checked",true);
			ms_check(itag); ms_check($(this).next().find("i"));
			show_checkmenu();
			$("#check_ctn").text(total);
			
		} else {
			$("input[name='mg-selectchx']").prop("checked",false);
			ms_uncheck(itag); ms_uncheck($(this).next().find("i"));
			show_noncheckmenu();
		}
	});
	
	
	//체크박스 하나 선택 이벤트
	$(document).on("change","input[name='mg-selectchx']",function(e) {
		var total = $("input[name='mg-selectchx']").length;
		const itag = $(e.target).next().find("i");
		// 체크박스 개수
		var checked = $("input[name='mg-selectchx']:checked").length;
		
		ms_check(itag);
		show_checkmenu($(this));
		if(!$(e.target).is(":checked")){
			ms_uncheck(itag);
		}
		
		if(checked<=0) // 체크된 개수가 0개 이하라면
			show_noncheckmenu($(this));
		$("#check_ctn").text(checked);
		
		if(total != checked){
			$("#mg-selectchx-all").prop("checked", false);
			ms_uncheck($("#mg-selectchx-all").next().find("i"));
		}
		else{
			$("#mg-selectchx-all").prop("checked", true);
			ms_check($("#mg-selectchx-all").next().find("i"));
		}
	});
	
	
	// 중요표시 (스크랩) 별표기능 (하나하나)
	$(document).on("change",".check-star, .mc-star",function(){
		const itag = $(this).next().find("i");
		const citag = $(".mc-star").next().find("i");
		
		var mno = $(this).parent().parent().attr("id");
		var mcno = $(".mgc-subject").attr("id");
		if ( $(this).is(":checked") ) { //중요표시로 체크한 경우
			itag.removeClass('icon-star-empty'); itag.addClass('icon-star-full'); itag.css("color","#ffc107");
			chxStatus("scrap",mno);
			
		} else { //체크를 해제한 경우
	  		itag.removeClass('icon-star-full'); itag.addClass('icon-star-empty'); itag.css("color","rgba(0,0,0,0.1)");
	  		chxStatus("unscrap",mno);
	  		
	  	}
		
		getMglist();
		//selectonemg(mcno);
	});
	
	
	// 답장하기 버튼 클릭이벤트
	$(document).on('click',".mgc-writebtn",function(){
		var mgroup = "";
		const depthno = $(this).parent().attr("id");
		if(depthno != "0"){ // 이전 mgroup이 있는 경우
			mgroup = $(this).find("span:first-child").attr("id");
		}
		var reno = $(this).attr("id");
		var re_subject = $("#mc-subject").text().substr(0,14)+"...";
		var to = $(this).find("span:nth-child(2)").attr("id");
		//var toname = $(this).find("span:nth-child(3)").attr("id");
		var mgroup = $(".mgc-header-left").attr("id");
		
		location.href="<%=ctxPath%>/message/write.up?to="+to+"&mgroup="+mgroup+"&reno="+reno+"&depthno="+depthno+"&re_subject="+re_subject;
	});
	
	// 검색input 엔터 이벤트
	$("#searchVal").keyup(function(e){
		if(event.keyCode==13){
			getMglist(null, 1);
			checkall_reset();
		}
	});
	
	
	//첨부파일 클릭 이벤트
	$(document).on("click",".mfname",function(e){
		var mfno = $(this).attr("id");
		location.href = "<%= ctxPath%>/mfDownload.up?mfno="+mfno;
	});
	
	
	//상태(모두읽음등) 툴팁 클릭 이벤트
	$(".tp").click(function(e){
		var condition = $(this).attr("id");
		
		if (condition == "delete"){
			var chxed = $("input[name='mg-selectchx']:checked").length;
			var result = confirm(chxed+"개의 메시지를 삭제하시겠습니까?");
			if(!result)
				return;
		}
		
		chxStatus(condition);
		checkall_reset();
		getMglist(null, 1);
		selectonemg($("#curmno").val());
	});
	
	//관련 메시지 클릭시 해당 메시지로 이동
	$(document).on("click",".mgroup",function(){
		var mno = $(this).attr("id");
		// 메시지 읽음상태로 변경
		changeStatus(mno);
		// 메시지 개수 갱신
		getMgCnt();
		// 클릭한 메시지 정보를 알아오는 ajax
		selectonemg(mno);
	});
	
});//end of ready

////////////////////////////////////////////////////////////////////////////////////////
//체크박스  css변경 이벤트
function ms_check(itag){
	itag.removeClass("icon-checkbox-unchecked");
	itag.addClass("icon-checkbox-checked");
	itag.css({"color":"#37A652","transition":"all .2s"});
}

function ms_uncheck(itag){
	itag.removeClass("icon-checkbox-checked");
	itag.addClass("icon-checkbox-unchecked");
	itag.css({"color":"rgba(0,0,0,0.1)","transition":"all .2s"});  
}

//체크했을 때 보이는 메뉴
function show_checkmenu(){
	$(".mg-noncheckmenu").hide();
	$(".mg-checkmenu").fadeIn("fast");
}

// 체크안할 때 보이는 메뉴
function show_noncheckmenu(){
	$(".mg-checkmenu").hide();
	$(".mg-noncheckmenu").fadeIn("fast");
}



//전체체크 상태 리셋하는 함수
function checkall_reset(){
	$("#mg-selectchx-all").prop("checked", false);
	$("input[name='mg-selectchx']").prop("checked",false);
	$("#mg-selectchx-all + label > i").css({"color":"rgba(0,0,0,0.1)","transition":"all .2s"});
	$("#mg-selectchx-all + label > i").removeClass("icon-checkbox-checked");
	$("#mg-selectchx-all + label > i").addClass("icon-checkbox-unchecked");
	
	show_noncheckmenu();
}//end of checkall_change


// 중요표시한 게시글 라벨 css 변경해주기
function changeStarLabel(){
	
	$(".star").each(function(index, item){
		if($(item).is(":checked")){ //체크되었으면
			$(item).next().find("i").removeClass("icon-star-empty");
			$(item).next().find("i").addClass("icon-star-full");
			$(item).next().find("i").css("color","#ffc107");
		} else{
			$(item).next().find("i").removeClass("icon-star-full");
			$(item).next().find("i").addClass("icon-star-empty");
			$(item).next().find("i").css("color","rgba(0,0,0,0.1)");
		}
	});
}


// 탭별 메시지 개수 알아오기
function getMgCnt(tab){
	
	var curtab = "";
	for (var i=0; i<3; i++){
		if($(".mgcatgo").eq(i).hasClass("tab-now"))
			curtab = $(".mgcatgo").eq(i).attr("id");
	}
	
	var tabstatus = false;
	if (tab == null){
		tab = ["all","unread","scrap"];
		tabstatus = true;
	}
	
	$.ajax({
		url: "<%= ctxPath%>/getMgCnt.up",
		traditional: true,
		data: {"receiver":"${sessionScope.loginuser.employee_no}",
				"tab":tab},
		dataType:"json",
		success:function(json){
			
			if(tabstatus){ //tab이 null값으로 들어왔을때, 즉 모든 메뉴의 개수를 갱신해야 할 때
				var cntArr = new Array();
				$.each(json,function(index,item){
					cntArr.push(item.mgCnt);
				});
				$("span#all").children().text(cntArr[0]);
				$("span#unread").children().text(cntArr[1]);
				$("span#scrap").children().text(cntArr[2]);
				
			} else {
				$("#totalcnt").text(json[0].mgCnt);
			}
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
	}); //end of ajax
}//end of getUnreadCnt()


//메시지 목록을 가져오는 ajax 
function getMglist(tab, curpage){
	var selectedNoArr = getcheckedmno();

	if(tab == null){
		for (var i=0; i<3; i++){
			if($(".mgcatgo").eq(i).hasClass("tab-now")){
				tab = $(".mgcatgo").eq(i).attr("id");
			}
		}
	}
	
	if(curpage == null)
		curpage = $("#curpage").val();
		
	const searchCondition = $("#searchCondition").val();
	const searchVal = $("#searchVal").val();
	
	$.ajax({
		url: "<%= ctxPath%>/mglist.up",
		type: "post",
		data: {"tab":tab,
				"curpage":curpage,
				"searchCondition":searchCondition,
				"searchVal":searchVal},
		dataType:"json",
		success:function(json){
			let html = '';
			if(json.length > 0 ){ // 가져올 메시지목록이 있는 경우
				$.each(json, function(index, item){
					
					// 보낸시간 가공하기
					var timeindex = item.sendtime.indexOf("오");
					var senddate = item.sendtime.substring(0,timeindex);
					var sendtime = item.sendtime.substring(timeindex);
					
					if(item.ms_checktime == null)
						html += '<tr id="'+item.mno+'" class="mg-unread">';
					else
						html += '<tr id="'+item.mno+'" class="mg-read">';
					html += '<td width="3%">'+
								'<input id="mg-selectchx'+index+'" name="mg-selectchx" class="mg-selectchx" type="checkbox" style="display:none;"/>'+
									'<label for="mg-selectchx'+index+'">'+
									'<i class="icon icon-checkbox-unchecked chxi"></i>'+
							'</label></td>' + 
							'<td width="3%">';
					if(item.scrapstatus == 1) {
						html += '<input id="check-star'+index+'" type="checkbox" name="check-star" class="check-star star" style="display:none;" checked/>'+
								'<label for="check-star'+index+'">'+
									'<i class="icon icon-star-full" style="color: rgb(255, 193, 7);"></i>'+
								'</label>';
					}
					else{
						html += '<input id="check-star'+index+'" type="checkbox" name="check-star" class="check-star star" style="display:none;"/>'+
								'<label for="check-star'+index+'">'+
									'<i class="icon icon-star-empty"></i>'+
								'</label>';
					}
					
					html += '</td>'+
							'<td width="70%">'+
								'<div id="mg-subjectcontainer">'+
									'<span id="mg-subject">'+item.subject+'</span>';
					if(item.filecnt != null) // 첨부파일이 있을 경우
						html += '<span><i class="fas fa-paperclip"></i></span>';
					html += '</div>'+
							'<div><span>'+item.w_name+'</span>·<span>'+item.w_deptname+'</span></div>'+
							'</td>'+
							'<td width="24%">'+
								'<div>'+senddate+'<div>'+sendtime+'</div></div>'+
							'</td>'+
							'</tr>';
							
				});//end of $.each
				
				$(".mgList-contents > table").html(html);
				//페이지바 함수 호출
				pgbar(curpage);
				
				// 전체 개수 보여주기
				getMgCnt();
				
				// 첫로딩시 첫번째 메시지 보여주기
				if(oncecnt > 0) return;
				else {
					var firstmno = $(".mgList-contents table tr:first-child").attr("id");
					selectonemg(firstmno);
					oncecnt++;
				}
				
				
			} else { //가져올 메시지목록이 없는 경우
				html += '<tr>'+
						'<td width="100%" id="nonmgList" >조회된 메시지가 없습니다.</td>'+
						'</tr>';
				$(".mgList-contents > table").html(html);
				// 페이지 바 없애기
				$(".mg-paging").html("");
				
			}
			
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
	}); //end of ajax
	
	// 전체 체크상태 리셋
	checkall_reset();
	
}//end of getMglist


//페이지바 가져오는 함수
function pgbar(curpage){
	const searchCondition = $("#searchCondition").val();
	const searchVal = $("#searchVal").val();
	var tab = "";
	for (var i=0; i<3; i++){
		if($(".mgcatgo").eq(i).hasClass("tab-now"))
			tab = $(".mgcatgo").eq(i).attr("id");
	}
	
	$.ajax({
		url: "<%= ctxPath%>/mgtotal.up",
		data: {"tab":tab,
				"sizePerPage":10,
				"searchCondition":searchCondition,
				"searchVal":searchVal},
		type: "post",
		dataType:"json",
		success:function(json){
			if(json.mgtotal > 0){ // 메시지목록이 있는 경우
				const mgtotal = json.mgtotal;
				const blockSize = 10;
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
						pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
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
				$("#curpage").val(curpage); //페이지 클릭할때마다 값 저장하기
				
			}//end of if
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}//end of pgbar



// 메시지 상태 읽음으로  처리하는 ajax
function changeStatus(mno){
	$.ajax({
		url: "<%= ctxPath%>/changeMgStatus.up",
		data: {"fk_mno":mno,
				"receiver":"${sessionScope.loginuser.employee_no}"},
		async: false,
		dataType:"json",
		success:function(json){
			// 메시지 리스트 갱신
			getMglist(null, $("#curpage").val());
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	}); //end of ajax
	
}//end of changeStatus()



// 메시지 하나 읽어오는 ajax 함수
function selectonemg(mno){
	
	var mnostatus = false;
	$.ajax({
		url: "<%= ctxPath%>/selectOnemg.up",
		data: {"mno":mno,
				"receiver":"${sessionScope.loginuser.employee_no}"},
		type: "post",
		async: false,
		dataType:"json",
		success:function(json){
			
			if(json.mno == null) {
				mnostatus = true;
				return;
			}
			
			let html = '';
			html += '<div class="mgc-container">'+
					'<div class="mgc-header">'+
					'<div id="'+json.mgroup+'" class="mgc-header-left">'+
					'<div id="'+json.mno+'" class="mgc-subject">'+
					'<span>';
			if(json.scrapstatus == 1) {
				console.log(json.scrapstatus);
				html += '<input type="checkbox" id="mc-star" name="mc-star" class="mc-star star" style="display:none;" checked/>'+
						'<label for="mc-star"><i class="icon icon-star-full" style="color: rgb(255, 193, 7);"></i></label>';		
				
			}
			else{
				html += '<input type="checkbox" id="mc-star" name="mc-star" class="mc-star star" style="display:none;" />'+
				'<label for="mc-star"><i class="icon icon-star-empty"></i></label>';
			}
			
			html += '</span>'+
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
							'<div id="'+json.depthno+'" class="mgc-header-right">'+
								'<button type="button" id="'+json.mno+'" class="mgc-writebtn button gradientbtn btn">'+
									'<span id="'+json.mgroup+'"><i class="fas fa-reply"></i></span>'+
									'<span id="'+json.writer+'">답장하기</span>'+
									'<span id="'+json.w_name+'·'+json.w_dept+'"></span>'+
								'</button>'+
								'<div id="mgc-date">'+json.sendtime+'</div>'+
							'</div>'+
						'</div>'+
						'<hr class="HRhr" style="margin:0px;"/>'+
						'<div class="mgc-body">'+
							'<div class="mgc-content">'+json.content+'</div>'+
							'<div class="accordion mgc-ac" id="accordionPanelsStayOpenExample">'+
							'</div>'+
						'</div>'+
					'</div>';
			
			$(".mg-right-container").html(html);
			$("#curmno").val(mno);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
	});//end of ajax
	
	
	// 자기가쓴일 경우 함수 또는 별체크 등일 경우종료
	if(mnostatus) return;
	
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
			
	
	// 첨부파일을 알아오는 ajax
	$.ajax({
		url: "<%= ctxPath%>/getmfile.up",
		data: {"mno":mno},
		type: "post",
		async: false,
		dataType:"json",
		success:function(json4){
			var filecnt = json4.length;
			
			if(json4.length > 0){ // 첨부파일이 있는 경우
				var html = '<div class="accordion-item">'+
							'<h2 class="accordion-header" id="panelsStayOpen-headingOne">'+
						      '<button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">'+
									'<div><i class="fas fa-paperclip"></i></div>'+
									'<div>첨부파일 <span id="filecnt">'+filecnt+'</span></div>'+
						      '</button>'+
						    '</h2>'+
						    '<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">'+
						      '<div class="accordion-body mgc-attach mgc-ac-content">';
				$.each(json4, function(index, item){
					html += '<div>'+
						      	'<span><i class="fas fa-download"></i></span>'+
						      	'<span id="'+item.mfno+'" class="mfname">'+item.m_originfilename+'</span>'+
						      	'<span style="color: #999999; font-weight: 500;"> ('+item.file_size+'bytes)</span>'+
					      	'</div>';
				});
				html +=  '</div>'+
						'</div>'+
					  '</div>';
			
				$("#accordionPanelsStayOpenExample").append(html);
			}
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
	
	
	// 관련메시지 3개를 알아오는 ajax
	$.ajax({
		url: "<%= ctxPath%>/getmgroupList.up",
		data: {"mno":mno,
				"receiver":"${sessionScope.loginuser.employee_no}"},
		type: "post",
		async: false,
		dataType:"json",
		success:function(json5){
			if(json5.n_mno != null || json5.b_mno != null){ //관련메시지가 있을 때
				var html = '<div id="mgroup" class="accordion-item">'+
						    '<h2 class="accordion-header" id="panelsStayOpen-headingTwo">'+
						      '<button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">'+
								'<div><i class="fas fa-envelope-open-text"></i></div>'+
								'<div>주고받은 메시지 <span>'+'</span></div>'+
						      '</button>'+
						    '</h2>'+
						    '<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">'+
						      '<div class="accordion-body mgc-ac-content mgc-ac-ref">';
				if(json5.b_mno != null){
					html += '<div id="'+json5.b_mno+'" class="mg-unread mgroup">'+
									'<span><i class="fas fa-envelope-open-text"></i></span>'+
									'<span>'+json5.b_subject+'</span>'+
									'<span style="position:relative; right: 20px;">'+json5.b_writer+'</span>'+
					      			'<span style="font-size:9pt;">'+json5.b_sendtime+'</span>'+
			      			'</div>';
				}
					html+=			'<div id="'+json5.mno+'" class="mg-unread mg-now mgroup">'+
											'<span><i class="fas fa-envelope-open-text"></i></span>'+
											'<span>'+json5.subject+'</span>'+
											'<span style="position:relative; right: 20px;">'+json5.writer+'</span>'+
							      			'<span style="font-size:9pt;">'+json5.sendtime+'</span>'+
					      			'</div>';
				if(json5.n_mno != null){
					html +=	'<div id="'+json5.n_mno+'" class="mg-unread mgroup">'+
								'<span><i class="fas fa-envelope-open-text"></i></span>'+
								'<span>'+json5.n_subject+'</span>'+
								'<span style="position:relative; right: 20px;">'+json5.n_writer+'</span>'+
				      			'<span style="font-size:9pt;">'+json5.n_sendtime+'</span>'+
		      			'</div>';
				}
				html += '</div>'+
						    '</div>'+
						  '</div>';
						  
				$("#accordionPanelsStayOpenExample").append(html);
			}//end of if
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
	
	
	
}//end of selectonemg


// 선택된 mno 읽어오기
function getcheckedmno(){
	var checkedArr = $("input[name='mg-selectchx']:checked");
	
	//체크된 mno 읽어오기
	var checkednoArr = new Array();
	checkedArr.each(function(index, item){
		var checkedno = $(item).parent().parent().attr("id");
		checkednoArr.push(checkedno);
	});
	
	return checkednoArr;
}//end of getcheckedmno

// 선택한것 표시 변경 하기
function chxStatus(condition,checkednoArr){
	
	if(checkednoArr == null)
		checkednoArr = getcheckedmno();
	
	console.log(condition);
	console.log(checkednoArr);
	
	// 선택한것 표시 변경하는 ajax
	$.ajax({
		url: "<%= ctxPath%>/chxStatus.up",
		traditional: true, //배열 넘기기 옵션
		data: {"mnoArr":checkednoArr,
				"receiver":"${sessionScope.loginuser.employee_no}",
				"condition":condition},
		dataType:"json",
		success:function(json){
			if(json.n == 1){
				// 목록 갱신
				getMglist();
				selectonemg($("#curmno").val());
			}
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
		
		
	});//end of ajax
	
}//end of chxStatus()

</script>




<div class="message-container">
	<div class="mg-left-container">
		<div class="mgList-info">
			<span id="all" class="mgcatgo tab-now">전체<span></span></span>
			<span id="unread" class="mgcatgo">안읽음<span></span></span>
			<span id="scrap" class="mgcatgo">중요<span></span></span>
			<div class="mg-search">
				<form action="#" class="mg-form" onsubmit="return false">
				<%-- 검색 --%>
				<div>
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 6px; border-radius: 5px; border:1px solid #ced4da;">
								<option value="all" selected>전체</option>
								<option value="writer">보낸이</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: -9px;">
							<input id="searchVal" type="text" class="form-control" placeholder="검색" style="width:90%; font-size: 9pt; padding:6px 12px;">
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
				<input id="mg-selectchx-all" class="mg-selectchx" type="checkbox" style="display:none;"/>
				<label for="mg-selectchx-all">
					<!-- <i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999;"></i> -->
					<i class="icon icon-checkbox-unchecked chxi" style="font-size: 12pt; position: relative; top: 6px; color: rgba(0,0,0,0.1);"></i>
				</label>
				<div class="mg-menucontainer" style="height: 40px;">
					<div class="mg-noncheckmenu">
						<span>1</span>	<!-- 지금 보고있는 메시지 -->
						<span>/</span>
						<span id="totalcnt"></span>	<!-- 전체수량 -->
					</div>
					<div class="mg-checkmenu" style="display: none;">
						<button id="read" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽음 표시"><i class="fas fa-envelope-open"></i></button> <!-- 읽은상태로표시 -->
						<button id="unread" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽지 않음 표시"><i class="fas fa-envelope"></i></button> <!-- 읽지않은상태로표시 -->
						<button id="scrap" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="중요 표시"><i class="fas fa-star" style="color: #F29F05; right: 4px;"></i></button> <!-- 중요표시 -->
						<button id="unscrap" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="중요 표시 해제"><i class="icon icon-star-empty" style="right: 5px; color: rgba(0,0,0,0.1); font-size: 14pt; bottom:4px;"></i></button> <!-- 중요표시 -->
						<button id="delete" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="fas fa-trash" style="right: 2px;"></i></button> <!-- 삭제 -->
						<span><span id="check_ctn"></span>개 선택</span>
					</div>
				</div>
			</div>
			<div class="mgList-contents">
				<table>
				</table>
			</div>
			<div class="mg-paging" style="margin-top: 10px;">
			</div>
		</div>
	</div>
	
	<div class="mg-right-container">
	</div>
	
	<input id="curpage" type="hidden" value=""/>	
	<input id="allcnt" type="hidden" value=""/>
	<input id="unreadcnt" type="hidden" value=""/>
	<input id="scrapcnt" type="hidden" value=""/>
	<input id="curmno" type="hidden" value=""/>

</div>