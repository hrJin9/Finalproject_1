<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>    

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/48a76cd849.js" crossorigin="anonymous"></script>
<!-- 폰트 목록 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- jQueryUI CSS 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
	

<%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>
<!-- 혜린style.css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/hyerin.css?after">

<!-- pretendard-font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />

<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<style>
	body{font-family: 'Pretendard'; font-weight: 500; }
	.cursno:hover{
		background-color: transparent;
	}
	.hi-container td{
		 padding: 10px 15px;
		color: #797979;
   		font-size: 10pt;
		 /* font-size: 8pt; */
	}
	.hi-container tr:nth-child(1)~ :hover{
		 background-color:#f5f5f5;
		 cursor: pointer;
		 /* font-size: 8pt;  */
	}
	.hi-container td:last-child, .hi-container td:last-child > i {
	    color: #cdcdcd;
	    font-size: 8pt;
	    /* display: none; */
	}
	.hi-container th{
		 padding: 10px 15px;
	}
	#alldel{
		border-radius: 5px;
		cursor: pointer;
		border-radius: 5px;
	}
	#alldel :hover{
		background-color:#f5f5f5;
	}
</style>

<script>
var searchVal = '';
var type = '';
	$(document).ready(function(){
		$("td:last-child").hide();
		$("div.sse-container").hide();
		$("div.sse-container table").hide();
		
		$(".ss-table tr").hover(function(){
			$(this).find("td:last-child").show();
		}, function(){
			$(this).find("td:last-child").hide();
		});
		
		$(".hi-container tr").hover(function(){
			$(this).find("td:last-child").show();
		}, function(){
			$(this).find("td:last-child").hide();
		});
		
		console.log(searchVal);
		
		
	});//end of ready
	
	$(document).on('click',".ss-table > tr",function(e){
		type = $(this).attr("id");
		$("div.ss-container").show();
		$("table.sse-"+type).show();
	});
	////////////////////////////////////////////////////////////
	// function declaration
	
	function memberSearch(){
		location.href="<%= ctxPath%>/side/searchEnd.up?searchVal="+searchVal";
	}//end of goMemberSearch()
	
	function approvalSearch(){
		location.href="<%= ctxPath%>/side/searchEnd.up?searchVal="+searchVal;
	}//end of goApprovalSearch()
	
	function messageSearch(){
		location.href="<%= ctxPath%>/side/searchEnd.up?searchVal="+searchVal;
	}//end of messageSearch()
	
	function boardSearch(){
		location.href="<%= ctxPath%>/side/searchEnd.up?searchVal="+searchVal;
	}//end of boardSearch()
	
</script>
<div class="modal-header" style="position: sticky;top: 0px;z-index: 2;background-color: white;">
	<span id="se-icon-outer" style="margin: 4px 0 0 10px; color: rgba(0,0,0,0.7); padding: 5px 10px; border-radius: 10px;"><i id="se-searchicon" class="icon icon-search"></i></span>
	<div style="display: inline-block;">
		<input id="ss-input" type="text" placeholder="검색어 입력"/>
	</div>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
<div class="ss-container">
	<table class="ss-table">
		<tr id="member" >
			<td width="5%"><i class="icon icon-users"></i></td>
			<td width="90%">구성원 검색</td>
			<td width="5%"><i class="fas fa-angle-right"></i></td>
		</tr>
		<tr id="approval">
			<td><i class="icon icon-file-text2"></i></td>
			<td>결재문서 검색</td>
			<td><i class="fas fa-angle-right"></i></td>
		</tr>
		<tr id="message">
			<td><i class="icon icon-envelop"></i></td>
			<td>메시지 검색</td>
			<td><i class="fas fa-angle-right"></i></td>
		</tr>
		<tr id="board">
			<td><i class="icon icon-pencil2"></i></td>
			<td>게시판 검색</td>
			<td><i class="fas fa-angle-right"></i></td>
		</tr>
		<!-- <tr class="cursno">
			<td></td>
			<td></td>
			<td></td>
		</tr> -->
	</table>
	<!-- <br> -->
	<table class="hi-container mt-3">			
		<th style="font-weight: 500;font-size:5pt;cursor: default;"colspan="3" height="15px">
			<span style="color: rgb(85, 99, 114);float: left;cursor: default;">최근 검색</span>
			<span id="alldel"style="float: right;color: #d4d4d4;cursor: pointer;">전체 삭제</span>
		</th>
		<tr>
			<td width="5%"><i style="color: #cdcdcd;"class="icon icon-search"></i></td>
			<td width="90%">게시판 검색</td>
			<td width="5%"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 18px; height: 18px; flex-shrink: 0;"><path d="M12 13.2728L17.0205 18.2933L18.2932 17.0205L13.2728 12L18.2932 6.97954L17.0205 5.70675L12 10.7272L6.97954 5.70675L5.70675 6.97954L10.7272 12L5.70675 17.0205L6.97954 18.2932L12 13.2728Z" fill="#cdd2d6"></path></svg></td>
		</tr>
	</table>
</div>


<div class="sse-container">
	<!-- 구성원 검색 -->
	<table class="sse-member">
	</table>
	
	<!-- 전자결재 검색 -->
	<table class="sse-approval">
		<tr class="not-active"><td colspan="3">결재문서</td></tr>
		<c:forEach var="i" begin="1" end="5" >
			<tr>
				<td width="10%">
					<div style="display: flex; padding:6px; border-radius: 10px; border: solid 1px rgba(0,0,0,0.3); background-color: #FAF2E1;">
						<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/spiral-notepad_1f5d2-fe0f.png" width="15px" style="margin: 5px; margin:auto;"/>
					</div>
				</td>
				<td width="85%">
					<div><span>진혜린</span>·<span>업무기안</span></div>
					<div>2022. 11. 24(목)</div>
				</td>
				<td width="5%"><i class="fas fa-angle-right"></i></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 메시지 검색 -->
	<table class="sse-message">
		<tr class="not-active"><td colspan="3">메시지</td></tr>
		<c:forEach var="i" begin="1" end="5">
			<tr>
				<td width="10%">
					<div style="display: flex; padding:6px; border-radius: 10px; border: solid 1px rgba(0,0,0,0.3); background-color: rgba(66, 133, 244, 0.2);">
						<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="15px" style="margin: 5px; margin:auto;"/>
					</div>
				</td>
				<td width="85%">
					<div><span>이예은</span>·<span>메시지제목</span></div>
					<div>2022. 11. 24(목)</div>
				</td>
				<td width="5%"><i class="fas fa-angle-right"></i></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 게시판 검색 -->
	<table class="sse-board">
		<tr class="not-active"><td colspan="3">게시판</td></tr>
		<c:forEach var="i" begin="1" end="5">
			<tr>
				<td width="10%">
					<div style="display: flex; padding:6px; border-radius: 10px; border: solid 1px rgba(0,0,0,0.3); background-color: rgba(55, 166, 82, 0.2);">
						<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/pencil_270f-fe0f.png" width="15px" style="margin: 5px; margin:auto;"/>
					</div>
				</td>
				<td width="85%">
					<div><span>강채영</span>·<span>제목</span></div>
					<div>2022. 11. 24(목)</div>
				</td>
				<td width="5%"><i class="fas fa-angle-right"></i></td>
			</tr>
		</c:forEach>
	
	
	</table>
</div>
</div>
