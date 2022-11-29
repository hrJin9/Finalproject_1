<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="message_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	//mno값을 읽어와서 페이지 넘기기
	let mno = "${requestScope.paraMap.mno}";
	if(mno == ""){
		mno = $(".mgList-contents tr:first-child").attr("id");
		location.href="<%=ctxPath%>/message.up?mno="+mno;
	}
		
	// 중요, 안읽음 클릭시 굵기주기 
	const tab = "${requestScope.paraMap.tab}";
	if(tab == "all")
		$("span#all").css("font-weight","bold");
	else if (tab == "unread")
		$("span#unread").css("font-weight","bold");
	else
		$("span#scrap").css("font-weight","bold");
	
	
	
	// 체크박스 개수
	var total = $("input[name='mg-selectchx']").length;
	// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
	$("#mg-selectchx-all").change(function(){
		if($("#mg-selectchx-all").is(":checked")){
			$("input[name='mg-selectchx']").prop("checked",true);
			show_checkmenu();
			$("#check_ctn").text(total);
			
		} else {
			$("input[name='mg-selectchx']").prop("checked",false);
			show_noncheckmenu();
		}
	});
	
	$("input[name='mg-selectchx']").change(function() {
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
	$(".check-star").click(function(){
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
	
	
	//메시지 목록 클릭 이벤트 => 해당 페이지로 이동.
	$(".mgList-contents tr").click(function(e){
		if($(e.target).is("td:first-child *") || $(e.target).is("td:nth-child(2) *")) return; //중요표시나 체크박스 클릭시 함수 종료
		const mno = $(this).attr("id");
		location.href="<%=ctxPath%>/message.up?mno="+mno;
	});
	
	
	
	$("span#all").click(function(e){
		$("span#all").css("font-weight","bold");
		location.href="<%= ctxPath%>/message.up";
	});
	$("span#unread").click(function(e){
		$("span#unread").css("font-weight","bold");
		location.href="<%= ctxPath%>/message.up?tab=unread";
	});
	
	$("span#scrap").click(function(){
		$("span#unread").css("font-weight","bold");
		location.href="<%= ctxPath%>/message.up?tab=scrap";
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
	
</script>




<div class="message-container">
	<div class="mg-left-container">
		<div class="mgList-info">
			<span id="all" >전체<span>10</span></span>
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
					<c:if test="${not empty requestScope.mvoList}">
						<c:forEach var="mvo" items="${requestScope.mvoList}" varStatus="status">
							<c:if test="${empty mvo.ms_checktime}">
								<tr id="${mvo.mno}" class="mg-unread">
							</c:if>
							<c:if test="${not empty mvo.ms_checktime}">
								<tr id="${mvo.mno}" class="mg-read">
							</c:if>
								<td width="3%"><input id="mg-selectchx${status.index}" name="mg-selectchx" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx${status.index}"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999; visibility:hidden;"></i></label></td>
								<td width="3%">
									<input id="check-star${status.index}" type="checkbox" name="check-star" style="display: none;"/>
									<label for="check-star${status.index}" class="check-star">
										<i class="icon icon-star-empty"></i>
									</label>
								</td>
								<td width="72%">
									<div>
										<span id="mg-subject">${mvo.subject}</span>
										<c:if test="${not empty mvo.file_size}">
											<span><i class="fas fa-paperclip"></i></span> <!-- 첨부파일 있을 때만 -->
										</c:if>
									</div>
									<div><span>${mvo.w_name}</span>·<span>${mvo.w_deptname}</span></div>
								</td>
								<td width="22%">
									<div>${mvo.ms_sendtime}</div>
									<c:if test="${not empty mvo.file_size}">
										<div><span>${mvo.file_size}</span>MB</div>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty requestScope.mvoList}">
						<tr>
							<td width="100%">조회된 메시지가 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div class="mg-paging">
				페이징할거..
			</div>
		</div>
	</div>
	
	<div class="mg-right-container">
		<div class="mgc-container">
			<div class="mgc-header">
				<div class="mgc-header-left">
					<div class="mgc-subject">
						<span>
							<input type="checkbox" id="mc-star" name="mc-star" style="display: none;"/>
							<label for="mc-star"><i class="icon icon-star-empty"></i></label>
						</span>
						<span id="mc-subject">메시지 제목ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴ</span> <!-- 20자 이내로 제한줘야됨 -->
						<span class="mgc-header-attach"><i class="fas fa-paperclip"></i></span> <!-- 첨부파일 있을 때만 -->
					</div>
					<div class="mgc-from mgc-people">
						<div>보낸 사람</div>
						<div>
							<span class="pic" style="height: 25px; width: 25px; margin-right: 5px;">
								<span style="font-size: 7pt;">지은</span>
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
	</div>

</div>