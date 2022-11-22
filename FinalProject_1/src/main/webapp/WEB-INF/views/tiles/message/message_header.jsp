<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	
	.currentPage{color:black;}
	#message{color:black !important;}
	
	#mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
	}
		
	#mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#mainList a {
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
	
	#subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 11pt;
		font-weight: bold;
	}
	
	#subList a {
		display: block;
		width: 10%;
		padding: .9em 0;
		color: #333;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
		margin-right: 3%;
	}
	
	.subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 10%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-right: 5%;
	}
	
	#subList a:nth-child(1).iscurrent ~ .subList_underline {
		left: 0%;
	}
	#subList a:nth-child(2).iscurrent ~ .subList_underline {
		left: 13%; /* width랑 margin-left랑 합친거 */
	}
	#subList a:nth-child(3).iscurrent ~ .subList_underline {
		left: 26%; 	
	}
	/* 
	#subList a:nth-child(1):hover ~ .subList_underline {
		left: 0;
	}
	#subList a:nth-child(2):hover ~ .subList_underline {
		left: 20%;
		width: 16%;
	}
 */
</style>

<nav id="mainList" class="margin-container">
	<a id="message" href="<%= request.getContextPath()%>/message.up">메시지</a>
	<div class="list_underline"></div>
</nav>

<nav id="subList" class="margin-container">
	<a id="mg-recieve" href="<%= request.getContextPath()%>/message/recieve.up">받은메시지</a>
	<a id="mg-send" href="<%= request.getContextPath()%>/message/send.up">보낸메시지</a>
	<a id="mg-temp" href="<%= request.getContextPath()%>/message/temp.up">임시보관함</a>
	<div class="subList_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px; margin-bottom: 0px;"/>
