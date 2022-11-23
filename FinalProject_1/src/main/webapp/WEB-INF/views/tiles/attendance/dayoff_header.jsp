<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	
	.currentPage{color:black;}
	
	#attendance_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#dayoff_subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
	}
		
	#attendance_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#attendance_mainList a {
		display: block;
		width: 11%;
		padding: 0.7em 0 0.3em 0;
		color: #333;
		text-decoration: none;
		margin-right: 4%;
		color: #D2D6D9;
	}
	
	
	.iscurrent{
		color: black;
	}
	
	#dayoff_subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 11pt;
		font-weight: bold;
	}
	
	#dayoff_subList a {
		display: block;
		width: 10%;
		padding: .9em 0;
		color: #333;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
		margin-right: 2%
	}
	
	.dayoff_subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 9%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-right: 5%;
		margin-left: 5px;
	}
	
	#dayoff_subList a:nth-child(1).iscurrent ~ .dayoff_subList_underline {
		left: 0%;
	}
	#dayoff_subList a:nth-child(2).iscurrent ~ .dayoff_subList_underline {
		left: 12%; /* width랑 margin-left랑 합친거 */
	}
	/* 
	#dayoff_subList a:nth-child(1):hover ~ .dayoff_subList_underline {
		left: 0;
	}
	#dayoff_subList a:nth-child(2):hover ~ .dayoff_subList_underline {
		left: 20%;
		width: 16%;
	}
 */
</style>

<nav id="attendance_mainList" class="margin-container">
	<a id="attendance" href="<%= request.getContextPath()%>/attendance.up" class="header-main">내 근무</a>
	<a id="dayoff" href="<%= request.getContextPath()%>/dayoff.up" class="header-main">내 휴가</a>
	<div class="list_underline"></div>
</nav>

<nav id="dayoff_subList" class="margin-container">
	<a id="dayoff-index" href="<%= request.getContextPath()%>/dayoff/index.up" class="header-sub">휴가 개요</a>
	<a id="dayoff-detail" href="<%= request.getContextPath()%>/dayoff/detail.up" class="header-sub">연차 상세</a>
	<div class="dayoff_subList_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px; margin-bottom: 0px;"/>