<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/board.css?after">
<style type="text/css">
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
	<a class="header-main list_notcurrent" id="freeboard" href="<%= request.getContextPath()%>/freeboard.up">자유게시판</a>
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