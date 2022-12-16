<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- FinalprojectController에 매핑해놓음 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>   
	<title>Thumbs up</title>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
		$(document).ready(function(){
			$("td:last-child").hide();
			
			
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
			
			
		});//end of ready
		
		////////////////////////////////////////////////////////////
		// function declaration
		
		function memberSearch(){
			location.href="<%= ctxPath%>/side/searchEnd.up";
		}//end of goMemberSearch()
		
		function approvalSearch(){
			location.href="<%= ctxPath%>/side/searchEnd.up";
		}//end of goApprovalSearch()
		
		function messageSearch(){
			location.href="<%= ctxPath%>/side/searchEnd.up";
		}//end of messageSearch()
		
		function boardSearch(){
			location.href="<%= ctxPath%>/side/searchEnd.up";
		}//end of boardSearch()
		
	</script>
</head>
<body>
	<div class="ss-container">
		<table class="ss-table">
			<tr onclick="memberSearch()">
				<td width="5%"><i class="icon icon-users"></i></td>
				<td width="90%">구성원 검색</td>
				<td width="5%"><i class="fas fa-angle-right"></i></td>
			</tr>
			<tr onclick="approvalSearch()">
				<td><i class="icon icon-file-text2"></i></td>
				<td>결재문서 검색</td>
				<td><i class="fas fa-angle-right"></i></td>
			</tr>
			<tr onclick="messageSearch()">
				<td><i class="icon icon-envelop"></i></td>
				<td>메시지 검색</td>
				<td><i class="fas fa-angle-right"></i></td>
			</tr>
			<tr onclick="boardSearch()">
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

</body>
</html>