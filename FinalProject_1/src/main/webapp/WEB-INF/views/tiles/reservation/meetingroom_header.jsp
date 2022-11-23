<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	
	.currentPage{color:black;}
	
	#meetingroom_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#meetingroom_subList a:hover{
		background-color: rgba(200,200,200, .2);
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
	
	
	.iscurrent{
		color: black;
	}
	
	#meetingroom_subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 10pt;
		font-weight: bold;
	}
	
	#meetingroom_subList a {
		display: block;
		width: 10%;
		padding: .9em 0;
		color: #333;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
	}
	
	.meetingroom_subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 9%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-left: 1%;
	}
	
	#meetingroom_subList a:nth-child(1).iscurrent ~ .meetingroom_subList_underline {
		left: 0%;
	}
	#meetingroom_subList a:nth-child(2).iscurrent ~ .meetingroom_subList_underline {
		left: 10.5%; /* width랑 margin-left랑 합친거 */
	}
	/* 
	#meetingroom_subList a:nth-child(1):hover ~ .meetingroom_subList_underline {
		left: 0;
	}
	#meetingroom_subList a:nth-child(2):hover ~ .meetingroom_subList_underline {
		left: 20%;
		width: 16%;
	}
 */
</style>

<nav id="meetingroom_mainList" class="margin-container">
	<a id="attendance" href="<%= request.getContextPath()%>/support/meetingroom-1.up" class="header-main">회의실 예약</a>
	<div class="list_underline"></div>
</nav>

<nav id="meetingroom_subList" class="margin-container">
	<a id="mettingroom-1" href="<%= request.getContextPath()%>/support/meetingroom-1.up" class="header-sub">1층</a>
	<a id="meetingroom-3" href="<%= request.getContextPath()%>/support/meetingroom-3.up" class="header-sub">3층</a>
	<div class="meetingroom_subList_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px;"/>