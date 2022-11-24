<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/message_memberList.css?after">
	
	<!-- pretendard-font -->
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
	
	<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
	
	<style type="text/css">
		.mbbox {
			font-size: 11pt;
			font-weight: 500;
			width: 100%;
		}
		
		.mbtb{
			width: 100%;
		}
		
		.mbtb td {
			padding: 10px 20px;
		}
		
		.mbtb tr:last-child{
			text-align: center;
		}
		
		#mb-cancel {
			border: solid 1px rgba(0,0,0,0.1);
			color: rgba(0,0,0,0.7);
			background-color: white;
			padding: 10px 15px;
			font-size: 10pt;
			font-weight: 700;
			border-radius: 10px;
			margin-right: 10px;
		}
		
		#mb-submit{
			border: none;
			color: white;
			padding: 10px 15px;
			font-size: 10pt;
			font-weight: 700;
			border-radius: 10px;
		}
		
		#book-date{
			border: solid 1px rgba(0,0,0,0.1);
			border-radius: 10px;
			height: 40px;
			padding: 5px 10px;
			width: 100%; 
		}
		
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 플랫피커
		 	flatpickr.localize(flatpickr.l10ns.ko);
		 	flatpickr($(".dateSelector"));
			$(".dateSelector").flatpickr({
				dateFormat: "Y-m-d H:i",
				defaultDate: new Date(),
				enableTime: true,
				minuteIncrement: 30,
				local: 'ko'
			});
		
			
		}); //end of ready
	</script>
	
	</head>
	<body>
		<div class="mbbox">
			<table class="mbtb">
				<tr>
					<td style="font-weight: 700;">예약날짜 및 시각</td>
					<td><input type="text" id="book-date" class="dateSelector"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="reset" id="mb-cancel">취소</button>
						<button type="button" id="mb-submit" class="gradientbtn">확인</button>
					</td>				
				</tr>
			</table>
		</div>
	</body>
</html>
