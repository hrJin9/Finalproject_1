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
		
		
		
	}); //end of ready
</script>

<div class="message-container margin-container">
	<div class="mg-left-container">
		<div class="mgList-info">
			<span>전체<span>10</span></span>
			<span>안읽음<span>5</span></span>
			<span>중요<span>2</span></span>
			<span><i class="fas fa-filter"></i>필터</span>
		</div>
		<hr class="HRhr" style="margin: 0;"/>
		
	
	</div>
	<div class="mg-right-container">
	
	
	</div>




</div>