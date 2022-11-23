<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="message_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.mgList-contents::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	
	.mgList-contents::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
		background-color: rgba(0,0,0, 0.3);  /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	
	.mgList-contents::-webkit-scrollbar-track {
		background-color: rgba(242, 242, 242); /*스크롤바 뒷 배경 색상*/
	}
	
</style>
<script>
	$(document).ready(function(){
		//헤더 css
		$("#mg-recieve").addClass("iscurrent");
		$("#mg-recieve").css("color","black");
		
		// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
		$("#mg-selectchx-all").change(function(){
			if($("#mg-selectchx-all").is(":checked")){
				$("input[name='mg-selectchx']").prop("checked",true);
				show_checkmenu();
				var total = $("input[name='mg-selectchx']").length;
				$("#check_ctn").text(total);
				
			}
			else {
				$("input[name='mg-selectchx']").prop("checked",false);
				show_noncheckmenu();
			}
		});
		
		$("input[name='mg-selectchx']").change(function() {
			var total = $("input[name='mg-selectchx']").length;
			var checked = $("input[name='mg-selectchx']:checked").length;
			show_checkmenu();
			if(checked<=0) show_noncheckmenu();
			$("#check_ctn").text(checked);
			
			if(total != checked) {
				$("#mg-selectchx-all").prop("checked", false);
			}
			else {
				$("#mg-selectchx-all").prop("checked", true); 
			}
		});
		
		//툴팁 사용
		var tooltipel = $(".tp").tooltip();
		
		
	}); //end of ready
	
	function show_checkmenu(){
		$(".mg-noncheckmenu").hide();
		$(".mg-checkmenu").fadeIn("fast");
		$(".fa-check").css("visibility","visible");
	}
	
	function show_noncheckmenu(){
		$(".mg-checkmenu").hide();
		$(".mg-noncheckmenu").fadeIn("fast");
		$(".fa-check").css("visibility","hidden");
	}
	
</script>

<div class="message-container">
	<div class="mg-left-container">
		<div class="mgList-info">
			<span>전체<span>10</span></span>
			<span>안읽음<span>5</span></span>
			<span>중요<span>2</span></span>
			<span id="mg-filter"><i class="fas fa-filter" style="margin-right: 5px; color:rgba(0,0,0,0.3);"></i>필터</span>
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
					<!-- 안읽은 메시지 -->
					<tr class="mg-unread">
						<td width="3%"><input id="mg-selectchx0" name="mg-selectchx" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx0"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999; visibility:hidden;"></i></label></td>
						<td width="3%">
							<input id="check-star" type="checkbox" style="display:none;"/><label for="check-star"><i class="far fa-star"></i></label>
						</td>
						<td width="72%">
							<div>
								<span>메시지 제목</span>
								<span><i class="fas fa-paperclip"></i></span> <!-- 첨부파일 있을 때만 -->
							</div>
							<div><span>진혜린</span>·<span>마케팅</span></div>
						</td>
						<td width="22%">
							<div>2022. 11. 13</div>
							<div><span>10</span>MB</div>
						</td>
					</tr>
					
					<!-- 읽은 메시지 -->
					<c:forEach var="i" begin="1" end="9">
						<tr class="mg-read">
							<td width="3%"><input id="mg-selectchx${i}" name="mg-selectchx" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx${i}"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999; visibility:hidden;"></i></label></td>
							<td width="3%">
								<input id="check-star" type="checkbox" style="display:none;"/><label for="check-star"><i class="far fa-star"></i></label>
							</td>
							<td width="72%">
								<div><span>메시지 제목</span><span><i class="fas fa-paperclip"></i></span></div>
								<div><span>진혜린</span>·<span>마케팅</span></div>
							</td>
							<td width="22%">
								<div>2022. 11. 13</div>
								<div><span>10</span>MB</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="mg-paging">
				페이징할거..
			</div>
		</div>
	</div>
	
	<div class="mg-right-container">
		<%@ include file="message_content.jsp"%>
	</div>

</div>