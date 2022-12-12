<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<style type="text/css">
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
		width: 700px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#attendance_mainList a {
		display: block;
		width: 11%;
		padding: 0.7em 0 0.9em 0;
		color: #333;
		text-decoration: none;
		margin-right: 4%;
		color: #D2D6D9;
	}
	
	#dayoff_subList a:nth-child(1).iscurrent ~ .dayoff_subList_underline {
		left: 0%;
	}
	#dayoff_subList a:nth-child(2).iscurrent ~ .dayoff_subList_underline {
		left: 15%; /* width랑 margin-left랑 합친거 */
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
	<a id="attendance" href="<%= request.getContextPath()%>/schedule/scheduleManagement.up" style="color: black;">캘린더</a> 
	<a id="dayoff" href="<%= request.getContextPath()%>/calendar_todo.up" class="iscurrent">TO DO</a>
	<div class="list_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px;"/>