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
	</style>
	
	<script>
		$(document).ready(function(){
			
			
			
			$(".ss-table tr").hover(function(){
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
		</table>
	</div>

</body>
</html>