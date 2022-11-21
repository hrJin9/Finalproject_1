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
	
  
   
</style>
  
<script type="text/javascript">

	$(document).ready(function(){
	
		
	   
	});// end of $(document).ready(function(){})-----------------------------	

</script> 

 

<nav id="list">
	<a class="list_iscurrent" style="color: #000000;">일정 생성</a>
</nav>
  
<hr style="margin-top: 0px;"/>
     
    
<div style="display: flex; width: 60%; margin-left: 15%;">       
  <fieldset style="width: 900px; ">
    <div class="form-group" style=" margin-top: 20px"> 
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력하세요(필수)">
    </div>
    
    <hr style="margin-top: 5%;">   
       
    <div class="form-group"  style="display: flex;"> 
      <i class="fa-solid fa-calendar-days fa-2x"></i>  
      <select class="form-select" id="exampleSelect1" style="margin-left: 20px;">   
        <option>팀일정</option>
        <option>내일정</option> 
        <option>부서일정</option> 
        <option>전사일정</option>  
      </select>
    </div>     
     
    <div class="form-group"   style="display: flex; margin-top: 5%;">     
	    <i class="fa-regular fa-clock fa-2x" style=""></i>     
<!-- 	    <form  name="dateFrm" style="float: left;">   -->
			<input type="date" id="date1" name="date1" class="form-select" style="margin: 0 20px;">
			~
			<input type="date" id="date2" name="date2"  class="form-select"  style="margin-left: 20px;">  
			<input type="hidden" name="userid" value=""/>
<!-- 		</form> -->  
		<div style="position: absolute; top: 46%;right: 78%;">   
	        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked="">
	        <label class="form-check-label" for="flexCheckChecked">   
	       	   종일 
	        </label> 
        </div> 
    </div>  
      
      
    <div class="form-group"   style="display: flex; margin-top: 5%;">   
   		 <i class="fa-solid fa-user fa-2x"></i> 
   		 <input class="form-control" style="margin-left: 20px;"  placeholder="초대할 멤버를 검색하세요">     
   		 <button style="border: none; margin-left: 5px;"> 
   		 	<i class="fa-solid fa-user-plus"></i>   
   		 </button> 
    </div>     
            
          
    <div class="form-group"   style="display: flex; margin-top: 3%;">   
   		 <i class="fa-solid fa-location-dot fa-2x"></i>
   		 <input class="form-control" style="margin-left: 20px;"  placeholder="장소를 입력하세요">      
    </div>    
    
    
    <div class="form-group"  style="display: flex; margin-top: 3%;">  
      <i class="fa-solid fa-rotate-right fa-2x"></i>
      <select class="form-select" id="exampleSelect1" style="margin-left: 20px;">   
        <option>반복 안 함 </option>    
        <option>매일</option> 
        <option>매주</option>   
        <option>매월</option>       
        <option>매년</option>   
      </select>
    </div>     
       
     
    <div class="form-group"   style="display: flex; margin-top: 3%;">    
   		 <i class="fa-solid fa-location-dot fa-2x"></i>
  		 <textarea class="form-control" rows="5" id="comment" style="margin-left: 20px; resize: none;" placeholder="설명을 입력하세요"></textarea>          
    </div> 
    
     
    <div class="form-group"  style="display: flex; margin-top: 3%;">  
      <i class="fa-solid fa-lock fa-2x"></i> 
      <select class="form-select" id="exampleSelect1" style="margin-left: 20px;">   
        <option>일정 공개</option>    
        <option>일정 유무 공개</option> 
      </select> 
    </div>   
       
        
         
    <div style="display: flex; margin: 20px 0 20px 20px; float: right;">    
    <button type="submit" class="btn btn-primary" style="background-color: gray; border: none;">취소</button>   
    <button type="submit" class="btn btn-primary" style="margin-left: 5px;">저장하기</button> 
    </div>  
     
  </fieldset>
  
  
  
</div>   