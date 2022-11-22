<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
    
<style type="text/css">
	
	.currentPage{color:black;}
	#board_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#freeboard_subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
	}
		
	#board_mainList {
		position: relative;
		display: flex;
		width: 581px;
		font-size: 18pt;
		font-weight: bold;
    	margin: 1px 0 0 70px;
	}
	
	
	#board_mainList a {
		display: block;
		width: 18%;
		padding: 0.7em 0 0.3em 0;
		text-decoration: none;
		margin-left: 4%;
	}
	
	.list_iscurrent{
		color: #4d4f53;
	}
	.list_notcurrent{
		color: #D2D6D9;
	}
	.iscurrent{
		color: black;
	}
	
	#freeboard_subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 10pt;
		font-weight: bold;
		margin: 4px 0 0 60px;
	}
	
	#freeboard_subList a {
		display: block;
		width: 10%;
		padding: .9em 0;
		color: #333;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
	}
	
	.freeboard_subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 9%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-left: 5%;
	}
	
	#freeboard_subList a:nth-child(1).iscurrent ~ .freeboard_subList_underline {
		left: 0%;
	}
	#freeboard_subList a:nth-child(2).iscurrent ~ .freeboard_subList_underline {
		left: 10.5%; /* width랑 margin-left랑 합친거 */
	}
	.newbadge{
	  background-color: #dc3545;
	  width: 12px;
	  height: 12px;
	  display:inline-block;
	  border-radius: 4px;
	  position: relative;
	  left:10px; 
	  color:white;
	  font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center;
	  position: relative;
	  top: 3px;
	  margin-right: 20px;
	}
	.titlefirst{
		font-weight: 800;
		font-size:11.5pt;
		padding-top:5px;
		/* padding-bottom: 9px; */
	}
	.categorybadge{
	  background-color: #30353f;
	  padding: 1px 15px;
	  padding-top:3px;
	  font-size:7pt;
	  font-weight:bold;
	  width: auto;
	  height: 21px;
	  display:inline-block;
	  border-radius: 10px;
	  position: relative;
	  margin-right: 15px;
	  top: 0.5px;
	  /* top:-2px;
	  left:10px; */ 
	  color:white;
	  /* font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center; */
	}
	.teamname{
	  color:#6d7077;
	  font-weight:bold;
	  position: relative;
	  top:2px;
	  margin-right: 15px;
	  margin-left: 6px;
	}
	.writedate{
	  position: relative;
	  top:2px;
	  color:#bfbfbf;
	}
	.icon-star-full{
		color:#ffc107;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
		top:12px;
	}
	.icon-star-empty{
		color:#bfbfbf;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
		top:12px;
	}
	a.icon-star-empty:hover, a.icon-star-full:hover {
		color: #ffc107;
	}
	a, a:hover {
    	text-decoration: none !important;
	}
	a:hover {
		color: #ffc107;
    }
	.title:hover{
		cursor: pointer; 
		text-decoration: underline;
	}
	img.boardprofile{
		border: 0px;
		border-radius: 17.5px;
		background-color: #D2D6D9;
	}
	select {
    word-wrap: normal;
	}
	
	button, select {
	    text-transform: none;
	}
	.toastui-editor-defaultUI-toolbar {
		background-color: #ffffff;
	}
	div.toastui-editor-mode-switch{
		display: none !important;
	}
	.toastui-editor-defaultUI {
		width: 95%;
	    float: right;
    }
   .custom-control-input:checked~.custom-control-label::before {
	    color: #fff;
	    border-color: #007bff;
	    background-color: #007bff;
	}
	.custom-checkbox .custom-control-label::before {
	    border-radius: 0.25rem;
	}
	.custom-control-label::before, .custom-file-label, .custom-select {
    	transition: background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.custom-control-label::before {
	    position: absolute;
	    top: 0.25rem;
	    left: -1.5rem;
	    display: block;
	    width: 1rem;
	    height: 1rem;
	    pointer-events: none;
	    content: "";
	    background-color: #fff;
	    border: #adb5bd solid 1px;
	}
	.custom-checkbox .custom-control-input:checked~.custom-control-label::after {
    	background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath fill='%23fff' d='M6.564.75l-3.59 3.612-1.538-1.55L0 4.26l2.974 2.99L8 2.193z'/%3e%3c/svg%3e");
	}
	.custom-control-label::after {
	    position: absolute;
	    top: 0.25rem;
	    left: -1.5rem;
	    display: block;
	    width: 1rem;
	    height: 1rem;
	    content: "";
	    background: 50%/50% 50% no-repeat;
	}
	.custom-control-input {
	    position: absolute;
	    left: 0;
	    z-index: -1;
	    width: 1rem;
	    height: 1.25rem;
	    opacity: 0;
	}
	.custom-control {
	    position: relative;
	    z-index: 1;
	    display: block;
	    min-height: 1.5rem;
	    padding-left: 1.5rem;
	    -webkit-print-color-adjust: exact;
	    color-adjust: exact;
	}
	.custom-control-label {
	    position: relative;
	    margin-bottom: 0;
	    vertical-align: top;
	}
</style>

<nav id="board_mainList">
	<a class="mainlist list_notcurrent" id="notice" href="<%= request.getContextPath()%>/board/notice.up">공지사항</a>
	<a class="mainlist list_iscurrent" id="freeboard" href="<%= request.getContextPath()%>/board/freeboard.up">자유게시판</a>
	<!-- <div class="list_underline"></div> -->
</nav>

<nav id="freeboard_subList">
	<a id="freeboard-total" <%-- href="<%= request.getContextPath()%>/dayoff/index.up"  --%>style="margin-left: 4%;">전체</a>
	<a id="freeboard-dept" <%-- href="<%= request.getContextPath()%>/dayoff/detail.up"  --%>style="margin-left: 1%;">부서</a>
	<div class="freeboard_subList_underline"></div>
</nav>

<hr class="HRhr" style="margin-top: 0px;"/>