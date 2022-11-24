<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	
	.currentPage{color:black;}
	
	#meetingroom_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#meetingroom_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#meetingroom_mainList a {
		display: block;
		width: 24%;
		padding: 0.7em 0 0.3em 0;
		color: #333;
		text-decoration: none;
		margin-right: 4%;
		color: black;
	}
	
	
</style>

<nav id="meetingroom_mainList" class="margin-container">
	<a id="attendance" href="<%= request.getContextPath()%>/support/meetingroom.up" class="header-nonsub">회의실 예약</a>
	<div class="list_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px;"/>