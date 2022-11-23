<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    
<%@ include file="calendar_header.jsp"%>    


<style type="text/css">
	 
	
	 
	.container2{ 
		background-color: #f2f2f2b0;   
		height: 200px;    
		color: #a6a6a6;  
		display: grid; 
		align-content: center; 
		margin-bottom: 20px;  
		width: 40%;     
		font-size: small;    
	}    
	
	.more{ 
		height: 50px;
		text-align: center;
		color: #404040;
		background-color: #f2f2f2; 
		width: 90%;   
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

 <div class="todo-container" style="margin-left: 5%;"> 

<div class="dropdown" style="display:flex; flex-direction: row-reverse; margin-right: 250px; margin-bottom: 20px;">      
    <button type="button" class="btn" style="color: #ffffff; background-color: #404040;">  
         할 일 일정 
    </button>   
    
    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" style="color: #a6a6a6;"> 
         모든 할 일
    </button> 
    <div class="dropdown-menu"> 
      <a class="dropdown-item" href="#">모든 할 일</a> 
      <a class="dropdown-item" href="#">진행중인 할 일</a>
      <a class="dropdown-item" href="#">완료된 할 일</a>
    </div>
     
    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" style="color: #a6a6a6;"> 
         생성 순
    </button>
    <div class="dropdown-menu">  
      <a class="dropdown-item" href="#">생성 순</a>
      <a class="dropdown-item" href="#">시작일 순</a>
      <a class="dropdown-item" href="#">종료일 순</a>
    </div>
</div>  

 
   
<div class="container2 rounded" style="float: left; margin-right: 2%;">   
	  <div style="padding-left: 20px;">
		  <p style="font-size: small; float: left; margin-right: 5px;">진행률 : </p>    
		  <p style="font-size: small;">25%</p>  
	  </div> 
	  <h6 style="font-weight: bold; color: #404040; padding-left: 20px;">신규 프로젝트 기획안 작성</h6>   
	  <h6 style="padding-left: 20px;">신규 프로젝트 기획안 작성하기 ...</h6>   
	  <hr>    
	  <h6 style="padding-left: 20px;">일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h6>    
</div>

<div class="container2 rounded"> 
	  <div style="padding-left: 20px;">
		  <p style="font-size: small; float: left; margin-right: 5px;">진행률 : </p>    
		  <p style="font-size: small;">25%</p>  
	  </div> 
	  <h6 style="font-weight: bold; color: #404040; padding-left: 20px;">신규 프로젝트 기획안 작성</h6>   
	  <h6 style="padding-left: 20px;">신규 프로젝트 기획안 작성하기 ...</h6>   
	  <hr>
	  <h6 style="padding-left: 20px;">일정: 2022/11/08 15:00 ~ 2022/11/10 12:00</h6>  
</div>
 


<!-- <button id="searchMoreNotify" class="btn btn-outline-primary btn-block col-sm-10 mx-auto">더 보기</button>  -->

<div class="more rounded">    
	<button type="button" class="btn" data-toggle="dropdown" style="color: #a6a6a6;"> 
         + 더보기
    </button>    
</div>   
    
</div>      
