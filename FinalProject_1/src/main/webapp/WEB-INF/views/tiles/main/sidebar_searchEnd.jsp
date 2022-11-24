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
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/hyerin.css?after">
	
	<!-- pretendard-font -->
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
	
	<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
	
	<style>
		body {
			font-family: 'Pretendard';
			font-weight: 500;
		}
		
		.pic {
			height: 32px;
			width: 32px;
			font-size: 9pt;
			position: relative;
			display: flex;
			align-items: center;
			justify-content: center;
			flex-shrink: 0;
			isolation: isolate;
			color: #fbfbfb;
			-webkit-mask-image:
				url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxwYXRoIGQ9Ik0wLjUgMTAwQzAuNSA3OS40MjM5IDEuNjAzMTcgNjIuOTIzNSA0LjUzMjYyIDQ5Ljc0MjFDNy40NjA4MiAzNi41NjY0IDEyLjIwNzEgMjYuNzM3NSAxOS40NzIzIDE5LjQ3MjNDMjYuNzM3NSAxMi4yMDcxIDM2LjU2NjQgNy40NjA4MiA0OS43NDIxIDQuNTMyNjJDNjIuOTIzNSAxLjYwMzE3IDc5LjQyMzkgMC41IDEwMCAwLjVDMTIwLjU3NiAwLjUgMTM3LjA3NyAxLjYwMzE3IDE1MC4yNTggNC41MzI2MkMxNjMuNDM0IDcuNDYwODIgMTczLjI2MiAxMi4yMDcxIDE4MC41MjggMTkuNDcyM0MxODcuNzkzIDI2LjczNzUgMTkyLjUzOSAzNi41NjY0IDE5NS40NjcgNDkuNzQyMUMxOTguMzk3IDYyLjkyMzUgMTk5LjUgNzkuNDIzOSAxOTkuNSAxMDBDMTk5LjUgMTIwLjU3NiAxOTguMzk3IDEzNy4wNzcgMTk1LjQ2NyAxNTAuMjU4QzE5Mi41MzkgMTYzLjQzNCAxODcuNzkzIDE3My4yNjIgMTgwLjUyOCAxODAuNTI4QzE3My4yNjIgMTg3Ljc5MyAxNjMuNDM0IDE5Mi41MzkgMTUwLjI1OCAxOTUuNDY3QzEzNy4wNzcgMTk4LjM5NyAxMjAuNTc2IDE5OS41IDEwMCAxOTkuNUM3OS40MjM5IDE5OS41IDYyLjkyMzUgMTk4LjM5NyA0OS43NDIxIDE5NS40NjdDMzYuNTY2NCAxOTIuNTM5IDI2LjczNzUgMTg3Ljc5MyAxOS40NzIzIDE4MC41MjhDMTIuMjA3MSAxNzMuMjYyIDcuNDYwODIgMTYzLjQzNCA0LjUzMjYyIDE1MC4yNThDMS42MDMxNyAxMzcuMDc3IDAuNSAxMjAuNTc2IDAuNSAxMDBaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K);
			-webkit-mask-size: contain;
			background-color: #4285f4;
		}
			
	</style>
	
	<script>
		$(document).ready(function() {
			
			//아이콘 바꿈. sse_changeIcon()은 부모창(sidebar.jsp) 함수
			window.parent.sse_changeIcon();
			
			$(".sse-container tr").hover(function(){
				$(this).find("td:last-child > i").show();
			}, function(){
				$(this).find("td:last-child > i").hide();
			});
			
			// < 버튼 클릭시 이전페이지로 이동, #se-icon-outer는 부모창(sidebar.jsp) 선택자 
			$('#se-icon-outer', parent.document).click(function(){
				location.href="<%= request.getContextPath()%>/side/search.up";
				window.parent.sse_originIcon();
			});
			
			
			
			
		});//end of ready
	</script>
</head>
<body>
	<div class="sse-container">
		<!-- 구성원 검색 -->
		<table class="sse-member">
			<tr class="not-active"><td colspan="3">구성원</td></tr>
			<c:forEach var="i" begin="1" end="5">
				<tr>
					<td width="10%">
						<span class="pic"><span>지은</span></span>
					</td>
					<td width="85%">
						<div>김지은</div>
						<div><span>개발자</span>·<span>차장</span></div>
					</td>
					<td width="5%"><i class="fas fa-angle-right"></i></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 전자결재 검색 -->
		<table class="sse-approval">
			<tr class="not-active"><td colspan="3">결재문서</td></tr>
			<c:forEach var="i" begin="1" end="5">
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
</body>
</html>