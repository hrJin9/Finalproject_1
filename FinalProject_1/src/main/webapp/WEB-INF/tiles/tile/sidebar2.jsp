<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<style type="text/css">

.sidebar2 {
	padding: 0;
	margin: 30px;
	position: fixed;
	bottom: 55%;
	right: -0.8%;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.bookmark a {
	border: solid 1px #e6e6e6; 
	width: 38px; 
	height: 45px;
	padding-top: 13px;
}

.sidebar2 .list-group-item {
	
}

.sidebar2 i {
	color: #8c8c8c;
}

</style>

<div class="sidebar2">
	<div id="list-example" class="list-group bookmark">
	  <a class="list-group-item list-group-item-action" href="<%= ctxPath%>/calendar_todo.up" style="padding-left: 10px; font-size: 18px;"><i class="icon icon-clipboard"></i></a>
	  <a class="list-group-item list-group-item-action" href="<%= ctxPath%>/approval/writing.up" style="padding-left: 10px; font-size: 18px;"><i class="icon icon-file-text2"></i></a>
	  <a class="list-group-item list-group-item-action" href="<%= ctxPath%>/message/write.up" style="padding-left: 10px; font-size: 18px;"><i class="far fa-envelope"></i></a>
	  <a class="list-group-item list-group-item-action" href="<%= ctxPath%>/freeboard.up" style="padding-left: 10px; font-size: 18px;"><i class="icon icon-pencil2"></i></a>
 	</div>
</div>



    