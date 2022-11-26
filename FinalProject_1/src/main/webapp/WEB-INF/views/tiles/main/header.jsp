<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	#list a:hover{
		color: #000000;
		cursor: pointer;
	}
		
	#list {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#list a {
		display: block;
		width: 17%;
		padding: .75em 0;
		color: #333;
		text-decoration: none;
		text-align: center;
		color: #D2D6D9;
	}
	
	.list_underline {
	    position: absolute;
	    bottom: -1px;
	    width: 17%;
	    height: 2px;
	    background: #333;
	    transition: all .3s ease-in-out;
	    margin-left: 0.5%;
	}
	
	#list a:nth-child(1).header-nonsub ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2).header-nonsub ~ .list_underline {
		left: 15%; /* width랑 margin-left랑 합친거 */
	}
	#list a:nth-child(1):hover ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2):hover ~ .list_underline {
		left: 16%;
		width: 17%;
	}

</style>

<nav id="list" class="margin-container">
	<a id="main" href="<%= request.getContextPath()%>/" class="header-nonsub">내 피드</a>
	<a id="main_todo" href="<%= request.getContextPath()%>/main_todo.up" class="header-nonsub">요청사항</a>
	<div class="list_underline"></div>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/>

