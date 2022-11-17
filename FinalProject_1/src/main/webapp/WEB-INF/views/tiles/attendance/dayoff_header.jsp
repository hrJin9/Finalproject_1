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
		margin: 4px 0 0 70px;
	}
	
	#attendance_mainList a {
		display: block;
		width: 11%;
		padding: 0.7em 0 0.3em 0;
		color: #333;
		text-decoration: none;
		margin-left: 4%;
		color: #D2D6D9;
	}
	
	
	.iscurrent{
		color: black;
	}
	
	#dayoff_subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 10pt;
		font-weight: bold;
		margin: 4px 0 0 60px;
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
	}
	
	.dayoff_subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 9%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-left: 5%;
	}
	
	#dayoff_subList a:nth-child(1).iscurrent ~ .dayoff_subList_underline {
		left: 0%;
	}
	#dayoff_subList a:nth-child(2).iscurrent ~ .dayoff_subList_underline {
		left: 10.5%; /* width랑 margin-left랑 합친거 */
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

<nav id="attendance_mainList">
	<a id="attendance" href="<%= request.getContextPath()%>/attendance.up">내 근무</a>
	<a id="dayoff" href="<%= request.getContextPath()%>/dayoff.up">내 연차</a>
	<div class="list_underline"></div>
</nav>

<nav id="dayoff_subList">
	<a id="dayoff-index" href="<%= request.getContextPath()%>/dayoff/index.up" style="margin-left: 4%;">휴가 개요</a>
	<a id="dayoff-detail" href="<%= request.getContextPath()%>/dayoff/detail.up" style="margin-left: 1%;">연차 상세</a>
	<div class="dayoff_subList_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px;"/>