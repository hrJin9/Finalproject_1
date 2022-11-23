<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

<!-- 텍스트에디터 -->
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css" />




<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
 <!-- Editor -->

<!-- Color Picker -->
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
<!-- Editor -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- Editor's Plugin -->
<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
  

<style type="text/css">
	
	#board_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#freeboard_subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
		color: #4d4f53;
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
		padding: 0.8em 0 0.8em 0;
		text-decoration: none;
		margin-right: 4%;
		text-align: center;
	}
	
	.list_iscurrent{
		color: #4d4f53;
	}
	.list_notcurrent{
		color: #D2D6D9;
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
		/* color: #333; */
		text-align: center;
		text-decoration: none;
		/* color: #D2D6D9; */
		border-radius: 12px;
	}
	
	.freeboard_subList_underline {
		position: absolute;
		left: -3px;
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
	  margin-right: 14px;
	}
	.titlefirst{
		font-weight: 600;
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
	  margin-right: 5px;
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
	a.icon-star-empty:hover {
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
/* 	div.toastui-editor-mode-switch{
		display: none !important;
	} */
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
	
	#writebtn{
		font-size: 11pt;
		padding: 10px 25px;
		border-color: white;
		font-weight: 600;
		color: white;
		border-radius: 10px;	
	}
</style>
<script>
	$(document).ready(function(){
		
		$("a.mainlist").click(function(){
			if($(this).hasClass('list_iscurrent') != true){// 현재 페이지가아닐경우 
				$(this).removeClass('list_notcurrent');
				$(this).addClass('list_iscurrent');
				$(this).siblings().removeClass('list_iscurrent');
			}
		});
		
		
	});
</script>
<nav id="board_mainList">
	<a class="header-nav mainlist list_notcurrent" id="notice" href="<%= request.getContextPath()%>/board.up">공지사항</a>
	<a class="header-nav mainlist list_iscurrent" id="freeboard" href="<%= request.getContextPath()%>/board/freeboard.up">자유게시판</a>
	<a class="header-nav mainlist list_notcurrent" id="myboard" href="<%= request.getContextPath()%>/board/myboard.up">내 게시물</a><!-- 작성한 게시물, 북마크, 임시저장 -->
	<!-- <div class="list_underline"></div> -->
</nav>
<div style="display: inline-block;position: relative;float: right;right: 90px;top: -49px;">
  	<a href="#" id="writebtn"class="btn gradientbtn"><i class="icon icon-quill" style="margin-right: 5px;"></i>글쓰기</a>
</div>

<hr class="HRhr"/> <!-- style="margin-top: 0px;" -->