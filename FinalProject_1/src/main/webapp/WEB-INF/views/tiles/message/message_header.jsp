<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/message.css?after">
    
<style type="text/css">

	.btn:hover{color: white;}
	.currentPage{color:#4d4f53;}
	#message{color:#4d4f53 !important;}
	
	#mainList a:hover{
		color: #4d4f53;
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
	}
	
	#mainList a {
		display: block;
		width: 11%;
		padding: 0.7em 0 0.3em 0;
		text-decoration: none;
		margin-right: 4%;
		color: #4d4f53;
	}
	
	
	.iscurrent{
		color: #4d4f53;
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
		width: 12%;
		padding: .9em 0;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
		margin-right: 1%;
	}
	
	.subList_underline {
		position: absolute;
		left: 0.5%;
		bottom: -1px;
		width: 11%;
		height: 3px;
		background: #4285f4;
		transition: all .3s ease-in-out;
		margin-right: 5%;
	}
	
	#subList a:nth-child(1).iscurrent ~ .subList_underline {
		left: 0.5%;
	}
	#subList a:nth-child(2).iscurrent ~ .subList_underline {
		left: 13.5%; /* width랑 margin-left랑 합친거 */
	}
	#subList a:nth-child(1):hover ~ .subList_underline {
		left: 0.5%;
	}
	#subList a:nth-child(2):hover ~ .subList_underline {
		left: 13.5%;
	}
</style>

<nav id="mainList" class="margin-container header-nav">
	<a id="message" href="<%= request.getContextPath()%>/message.up" class="header-main">메시지</a>
	<div class="list_underline"></div>
</nav>

<nav id="subList" class="margin-container">
	<a id="mg-recieve" href="<%= request.getContextPath()%>/message.up" class="header-sub">받은메시지</a>
	<a id="mg-send" href="<%= request.getContextPath()%>/message/send.up" class="header-sub">보낸메시지</a>
	<div class="subList_underline"></div>
</nav>

<div class="mg-write">
	<button type="button" class="mg-writebtn gradientbtn btn" onclick="location.href='<%= request.getContextPath()%>/message/write.up'">
		<span><i class="icon icon-pencil"></i></span>
		<span>메시지 보내기</span>
	</button>	
</div>

<hr class="HRhr" style="margin-top: 0px; margin-bottom: 0px;"/>
