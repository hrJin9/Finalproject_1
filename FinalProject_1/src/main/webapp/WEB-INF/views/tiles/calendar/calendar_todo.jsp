<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    
<% String ctxPath = request.getContextPath(); %>    

<link href='calendar.css' rel='stylesheet' />
<script src='calendar.js'></script>
    
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/48a76cd849.js" crossorigin="anonymous"></script>
<!-- 폰트 목록 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%=ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>

<!-- jQueryUI CSS 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="fonts/icomoon/style.css">      

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
	
	hr{
		border-top: solid 1px #949DA6 !important;
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
		margin: 4px 0 0 180px;
	}
	
	#list a {
		display: block;
		width: 17%;
		padding: .75em 0;
		color: #333;
		text-decoration: none;
		text-align: center;
		margin-left: 4%;
		color: #D2D6D9;
	}
	
	.list_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 15%;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-left: 5%;
	}
	
	#list a:nth-child(1).list_iscurrent ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2).list_iscurrent ~ .list_underline {
		left: 20%; /* width랑 margin-left랑 합친거 */
	}
	#list a:nth-child(1):hover ~ .list_underline {
		left: 0;
	}
	#list a:nth-child(2):hover ~ .list_underline {
		left: 20%;
		width: 16%;
	}




	
	
	
	.container{
		background-color: #f2f2f2; 
		height: 200px;    
		color: #a6a6a6;  
		display: grid;
		align-content: center; 
		margin-bottom: 20px;    
	} 
	
	.more{
		height: 50px;
		text-align: center;
		color: #404040;
		background-color: #f2f2f2; 
		width: 75%;  
		display: grid;
		align-content: center; 
		margin: auto;  
	}      
	   
       
   
</style>
  
<script type="text/javascript">

	$(document).ready(function(){
	
		
	   
	});// end of $(document).ready(function(){})-----------------------------	

</script>



<nav id="list">
	<a class="list_iscurrent">캘린더</a>
	<a>할 일</a>
	<div class="list_underline"></div>
</nav>

<hr style="margin-top: 0px;"/>


<div class="dropdown" style="display:flex; flex-direction: row-reverse; margin-right: 190px; margin-bottom: 20px;">    
    <button type="button" class="btn" style="color: #ffffff; background-color: #404040;">  
         할 일 일정 
    </button>   
    
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="color: #a6a6a6;"> 
         모든 할 일
    </button> 
    <div class="dropdown-menu"> 
      <a class="dropdown-item" href="#">모든 할 일</a>
      <a class="dropdown-item" href="#">진행중인 할 일</a>
      <a class="dropdown-item" href="#">완료된 할 일</a>
    </div>
     
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="color: #a6a6a6;"> 
         생성 순
    </button>
    <div class="dropdown-menu"> 
      <a class="dropdown-item" href="#">생성 순</a>
      <a class="dropdown-item" href="#">시작일 순</a>
      <a class="dropdown-item" href="#">종료일 순</a>
    </div>
</div>



<div class="container"> 
	  <h6>진행률 : 25%</h6>  
	  <h5 style="font-weight: bold; color: #404040;">신규 프로젝트 기획안 작성</h5>  
	  <h5>신규 프로젝트 기획안 작성하기 ...</h5>  
	  <hr>
	  <h5>일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h5>   
</div>

<div class="container"> 
	  <h6>진행률 : 25%</h6>  
	  <h5 style="font-weight: bold; color: #404040;">신규 프로젝트 기획안 작성</h5>  
	  <h5>신규 프로젝트 기획안 작성하기 ...</h5>  
	  <hr>
	  <h5>일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h5>   
</div>

<div class="container"> 
	  <h6>진행률 : 25%</h6>  
	  <h5 style="font-weight: bold; color: #404040;">신규 프로젝트 기획안 작성</h5>  
	  <h5>신규 프로젝트 기획안 작성하기 ...</h5>  
	  <hr>
	  <h5 style="color: #ff0000;">일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h5>     
</div> 

<!-- <button id="searchMoreNotify" class="btn btn-outline-primary btn-block col-sm-10 mx-auto">더 보기</button>  -->

<div class="more">  
	<button type="button" class="btn" data-toggle="dropdown" style="color: #a6a6a6;"> 
         + 
    </button>    
</div>   
    
  
