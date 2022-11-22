<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="message_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
</style>
<script>
	$(document).ready(function(){
		//헤더 css
		$("#mg-recieve").addClass("iscurrent");
		$("#mg-recieve").css("color","black");
		
		// 체크박스 메뉴
		$(".mg-selectchx + label").click(function(){
			if($(".mg-selectchx").prop("checked")){
				$(".mg-checkmenu").hide();
				$(".mg-noncheckmenu").fadeIn("fast");
			}
			else{
				$(".mg-noncheckmenu").hide();
				$(".mg-checkmenu").fadeIn("fast");
			}
		});
		
		//툴팁 사용
		var tooltipel = $(".tp").tooltip();
		
	}); //end of ready
	
	
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
				<div class="mg-noncheckmenu">
					<span>1</span>	<!-- 지금 보고있는 메시지 -->
					<span>/</span>
					<span>10</span>	<!-- 전체수량 -->
				</div>
				<div class="mg-checkmenu" style="display: none;">
					<button id="all-read" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽음 표시"><i class="fas fa-envelope-open"></i></button> <!-- 읽은상태로표시 -->
					<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="읽지 않음 표시"><i class="fas fa-envelope"></i></button> <!-- 읽지않은상태로표시 -->
					<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="중요 표시"><i class="fas fa-star" style="right: 4px;"></i></button> <!-- 중요표시 -->
					<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="fas fa-trash"></i></button> <!-- 삭제 -->
				</div>
			</div>
			<div>
				<table>
					<tr>
						<td><input id="mg-selectchx1" class="mg-selectchx" type="checkbox" style="display: none;"/><label for="mg-selectchx2"><i class="fas fa-check" style="color: white; font-weight: bold; font-size: 9pt; z-index: 999;"></i></label></td>
						<td>
							<div><span>진혜린</span>·<span>마케팅</span><span><i class="fas fa-paperclip"></i></span></div>
							
						</td>
					</tr>
				
				
				
				
				</table>
			
			
			
			
			</div>
		
		
		</div>
		
	
	</div>
	<div class="mg-right-container">
	
	
	</div>




</div>