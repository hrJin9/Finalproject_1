<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	*{
		font-family: Pretendard-Regular;		
	}
	
	#list a:hover{
		color: #000000;
		cursor: pointer;
	}
		
	#list {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 14pt;
		font-weight: bold;
		margin: 4px 0 0 100px;
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
		left: 0;
		bottom: -1px;
		width: 16%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-left: 2.5%;
	}
	
	#list a:nth-child(1).list_iscurrent ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2).list_iscurrent ~ .list_underline {
		left: 15%; /* width랑 margin-left랑 합친거 */
	}
	#list a:nth-child(1):hover ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2):hover ~ .list_underline {
		left: 16%;
		width: 15.5%;
	}

</style>
<div class="row">
	<nav id="list" class="col-10">
		<a href="<%= request.getContextPath()%>/" class="list_iscurrent">내 피드</a>
		<a href="<%= request.getContextPath()%>/main_todo.up">요청사항</a>
		<div class="list_underline"></div>
	</nav>
</div>
<hr style="margin-top: 0px;"/>