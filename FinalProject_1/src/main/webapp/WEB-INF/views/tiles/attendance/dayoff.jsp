<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="attendance_header.jsp"%> 
<script>
	$(document).ready(function(){
	 	$("a#attendance").removeClass("list_iscurrent");
		$("a#dayoff").addClass("list_iscurrent");
	});
</script>

<div class="dayoff-container">
	<div class="dayoff-sum">
		<div><div class="dayoff-year">발생연차</div><div class="dayoff-yearcnt">0</div></div>
		<div><div class="dayoff-mon">발생월차</div><div class="dayoff-moncnt">0</div></div>
		<div><div>이월월차</div><div class="dayoff-cnt">0</div></div>
		<div><div>조정연차</div><div class="dayoff-cnt">0</div></div>
		<div class=""></div>
		<div><div>총연차</div><div class="dayoff-cnt">0</div></div>
		<div><div>사용연차</div><div class="dayoff-cnt">0</div></div>
		<div><div>잔여연차</div><div class="dayoff-cnt">0</div></div>
	</div>
	<div class="">
	
	</div>

</div>	