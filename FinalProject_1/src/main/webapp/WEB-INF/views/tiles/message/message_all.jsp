<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>   
<!DOCTYPE html>
<html>
<head>
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

<%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

<!-- 혜린style.css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/hyerin.css?after">

<!-- calendar CSS, js -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/calendar.css">

<script src='<%= ctxPath%>/resources/js/calendar.js'></script>

<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- pretendard-font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />

<!-- 텍스트에디터 시작-->
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css" />
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
 <!-- Editor -->
<!-- Color Picker -->
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
<!-- Editor -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- Editor's Plugin -->
<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
<!-- 텍스트에디터 끝 -->


<style type="text/css">
	.margin-container{margin-left: 5%;}
	.container{width: 90% !important;}
	body{font-family: 'Pretendard'; font-weight: 500;}
	/* 서브메뉴 없는 헤더 */
	.header-nonsub{font-weight: 800 !important; padding: 0.9em 0 !important; font-size: 18pt !important;}
	/* 서브메뉴 있는 헤더 */
	.header-main{font-weight: 800 !important; padding: 0.9em 0 0.3em 0 !important; font-size: 18pt !important; }
	.header-sub{font-weight: 700 !important;  padding: 0.9em 0 !important; font-size: 12pt !important;}
	.gradientbtn{background-image:linear-gradient(57deg,#003fe9 28.04%,#59d0ffd6 100%);}
</style>



<script>
	$(document).ready(function(){
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
			alert("페이지이동");
		});
		
	});//end of ready
	
	// 체크했을 때 보이는 메뉴
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

</head>
<body>
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
				<c:forEach var="mvo" items="${requestScope.mvoList}">
					<c:if test="${empty mvo.ms_checktime}">
						<tr class="mg-unread">
					</c:if>
					<c:if test="${not empty mvo.ms_checktime}">
						<tr class="mg-read">
					</c:if>
						<td width="3%"><input id="mg-selectchx0" name="mg-selectchx" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx0"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999; visibility:hidden;"></i></label></td>
						<td width="3%">
							<input id="check-star0" type="checkbox" name="check-star" style="display: none;"/>
							<label for="check-star0" class="check-star">
								<i class="icon icon-star-empty"></i>
							</label>
						</td>
						<td width="72%">
							<div>
								<span>${mvo.subject}</span>
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
			</table>
		</div>
	<div class="mg-paging">
		페이징할거..
	</div>
</body>
</html>