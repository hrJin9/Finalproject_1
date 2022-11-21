<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	
	.currentPage{color:black;}
	
	#payroll_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#payroll_subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
	}
		
	#payroll_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#payroll_mainList a {
		display: block;
		width: 11%;
		padding: 0.7em 0 0.3em 0;
		color: black !important;
		text-decoration: none;
		margin-right: 4%;
		color: #D2D6D9;
	}
	
	
	.iscurrent{
		color: black;
	}
	
	#payroll_subList{
		position: relative;
		display: flex;
		font-size: 11pt;
		font-weight: bold;
	}
	
	#payroll_subList a {
		display: block;
		width: 100px;
		padding: .9em 0;
		color: black !important;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
	}
	
	.payroll_subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 96px;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-right: 5%;
		margin-left: 4px;
	}
	
	#payroll_subList a:nth-child(1).iscurrent ~ .payroll_subList_underline {
		left: 0%;
	}
	#payroll_subList a:nth-child(2).iscurrent ~ .payroll_subList_underline {
		left: 10.5%; /* width랑 margin-left랑 합친거 */
	}
	/* 
	#payroll_subList a:nth-child(1):hover ~ .payroll_subList_underline {
		left: 0;
	}
	#payroll_subList a:nth-child(2):hover ~ .payroll_subList_underline {
		left: 20%;
		width: 16%;
	}
 */
</style>

<nav id="payroll_mainList" class="margin-container">
	<a id="payroll" href="<%= request.getContextPath()%>/payroll.up">급여</a>
	<div class="list_underline"></div>
</nav>

<nav id="payroll_subList" class="margin-container">
	<a id="payroll-list" href="<%= request.getContextPath()%>/payroll.up">급여명세서 목록</a>
	<div class="payroll_subList_underline"></div>
</nav>
<div class="payroll-dateSelect">
	<input type="text"/>
	<div><i class="fa-solid fa-angle-left"></i></div>
	<div><i class="fa-solid fa-angle-right"></i></div>
</div>

<hr class="HRhr" style="margin-top: 0px;"/>