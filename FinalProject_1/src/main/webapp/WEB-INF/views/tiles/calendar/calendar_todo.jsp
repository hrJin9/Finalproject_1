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
		width: 70%;   
		font-size: small;   
	}    
	
	.more{ 
		height: 50px;
		text-align: center;
		color: #404040;
		background-color: #f2f2f2; 
		width: 70%;  
		display: grid;
		align-content: center; 
		margin: auto; 
		cursor: pointer; 
	}   
	
	button:focus {
	  background-color: red;
	}

	.rounded {
    	border-radius: 2.25rem!important;
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


<div class="dropdown" style="display:flex; flex-direction: row-reverse; margin-right: 250px; margin-bottom: 20px;">      
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


   
<div class="container rounded">  
	  <div style="padding-left: 20px;">
		  <p style="font-size: small; float: left; margin-right: 5px;">진행률 : </p>    
		  <p style="font-size: small;">25%</p>  
	  </div> 
	  <h6 style="font-weight: bold; color: #404040; padding-left: 20px;">신규 프로젝트 기획안 작성</h6>   
	  <h6 style="padding-left: 20px;">신규 프로젝트 기획안 작성하기 ...</h6>   
	  <hr>    
	  <h6 style="padding-left: 20px;">일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h6>    
</div>

<div class="container rounded"> 
	  <div style="padding-left: 20px;">
		  <p style="font-size: small; float: left; margin-right: 5px;">진행률 : </p>    
		  <p style="font-size: small;">25%</p>  
	  </div> 
	  <h6 style="font-weight: bold; color: #404040; padding-left: 20px;">신규 프로젝트 기획안 작성</h6>   
	  <h6 style="padding-left: 20px;">신규 프로젝트 기획안 작성하기 ...</h6>   
	  <hr>
	  <h6 style="padding-left: 20px;">일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h6>  
</div>
 
<div class="container rounded"> 
	  <div style="padding-left: 20px;">
		  <p style="font-size: small; float: left; margin-right: 5px;">진행률 : </p>    
		  <p style="font-size: small;">25%</p>  
	  </div>  
	  <h6 style="font-weight: bold; color: #404040; padding-left: 20px;">신규 프로젝트 기획안 작성</h6>  
	  <h6 style="padding-left: 20px;">신규 프로젝트 기획안 작성하기 ...</h6>  
	  <hr> 
	  <h6 style="color: #ff0000; padding-left: 20px;">일정: 2022/09/01 15:00 ~ 2022/09/10 12:00</h6>        
</div>  

<!-- <button id="searchMoreNotify" class="btn btn-outline-primary btn-block col-sm-10 mx-auto">더 보기</button>  -->

<div class="more rounded">    
	<button type="button" class="btn" data-toggle="dropdown" style="color: #a6a6a6;"> 
         + 더보기
    </button>    
</div>   
    
      
