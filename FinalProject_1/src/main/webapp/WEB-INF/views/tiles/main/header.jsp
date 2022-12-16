<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	#list a:hover{
		color: #4d4f53;
		transition: all 0.2s;
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
		text-decoration: none;
		color: #4d4f53;
	}
	
	
	#list a:nth-child(1).header-nonsub ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2).header-nonsub ~ .list_underline {
		left: 15%; /* width랑 margin-left랑 합친거 */
	}
	#list a:nth-child(1):hover ~ .list_underline {
		left: 0;R
	}
	#list a:nth-child(2):hover ~ .list_underline {
		left: 16%;
		width: 17%;
	}

</style>

<nav id="list" class="margin-container">
	<a id="main" href="<%= request.getContextPath()%>/" class="header-nonsub">내 피드</a>
	<%-- 
	<a id="main_todo" href="<%= request.getContextPath()%>/main_todo.up" class="header-nonsub">요청사항</a>
	 --%>
	<div class="list_underline"></div>
</nav>
<hr class="HRhr" style="margin-top: 0px; margin-bottom: 0;"/>

