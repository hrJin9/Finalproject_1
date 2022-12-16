<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
  
<style type="text/css">
	/* === 헤더 css === */
	#mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	#subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
		color: #4d4f53;
	}
		
	#mainList {
		position: relative;
	    display: flex;
	    width: 640px;
	    font-size: 18pt;
	}
	
	.header-main {
	    font-weight: 800 !important;
	    padding: 0.9em 0 0.3em 0 !important;
	    font-size: 18pt !important;
	}
	#mainList a {
		display: block;
    	width: 17%;
    	text-align: center;
		text-decoration: none;
		margin-right: 4%;
	}
	
	.list_iscurrent{
		color: #4d4f53;
	}
	.list_notcurrent{
		color: #D2D6D9;
	}
	
	#subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 11pt;
		font-weight: bold;
		/* margin: 4px 0 0 60px; */
	}
	
	#subList a {
		display: block;
		width: 10%;
		padding: .9em 0;
		/* color: #333; */
		text-align: center;
		text-decoration: none;
		/* color: #D2D6D9; */
		border-radius: 12px;
	}
	
	.subList_underline {
	    position: absolute;
	    left: 2%;
	    bottom: -1px;
	    width: 10%;
	    height: 2px;
	    background: #333;
	    transition: all .3s ease-in-out;
	    margin-right: 5%;
	}
	#subList {
	    position: relative;
	    display: flex;
	    width: 640px;
	    font-size: 11pt;
	    font-weight: bold;
	}
	#subList a:nth-child(1).list_iscurrent ~ .subList_underline {
		left: 2%;
	}
	#subList a:nth-child(2).list_iscurrent ~ .subList_underline {
		left: 16.2%; /* width랑 margin-left랑 합친거 */
		width: 8%;
	}
	
	.titlefirst{
		font-weight: 600;
		font-size:11.5pt;
		padding-top:5px;
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
	  color:white;
	}
	.teamname{ /* 작성자  */
	  color:#6d7077;
	  font-weight: 600;
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
	
	/* 	북마크 아이콘  */
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
	a.icon-star-empty:hover {
		color: #ffc107;
    }
	
	/* 좋아요 아이콘  */
	a#empty-heart:hover, a#full-heart:hover {
		color: #f53e50;
    }
	a.icon-star-empty:hover, a.icon-star-full:hover {
		color: #ffc107;
	}
	a, a:hover {
    	text-decoration: none !important;
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
	
	/* 글쓰기 에디터 */ 
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
	ul{
		list-style: none;
	}
</style>
<script type="text/javascript">
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
<nav id="mainList" class="margin-container header-nav">
	<a class="header-main list_iscurrent" id="notice" href="<%= request.getContextPath()%>/board_all.up">공지사항</a>
	<a class="header-main list_notcurrent" id="freeboard" href="<%= request.getContextPath()%>/board/freeboard.up">자유게시판</a>
	<%-- <a class="header-main list_notcurrent" id="myboard" href="<%= request.getContextPath()%>/board/myboard.up">내 게시물</a> --%><!-- 작성한 게시물, 북마크, 임시저장 -->
</nav>

<!-- 권한부여받은사람만 글쓰기버튼 뜨기 -->
 <div style="display: inline-block;position: relative;float: right;right: 90px;top: -49px;">
  	<a href="#" id="writebtn"class="btn gradientbtn"><i class="icon icon-quill" style="margin-right: 5px;"></i>글쓰기</a>
</div>



<nav id="subList" class="margin-container">
	<a id="noticeboard-total" class="header-sub list_iscurrent" href="<%= request.getContextPath()%>/board_all.up" style="margin-left: 2%;">전사공지</a>
	<a id="noticeboard-team" class="header-sub list_notcurrent" href="<%= request.getContextPath()%>/board_team.up" style="margin-left: 3%;">팀공지</a>
	<div class="subList_underline"></div>
</nav>


<hr class="HRhr" style="margin-top: 0px;"/>