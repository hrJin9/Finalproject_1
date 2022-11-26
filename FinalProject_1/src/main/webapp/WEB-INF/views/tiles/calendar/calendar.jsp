<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
    
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   
<%@ include file="calendar_header.jsp"%>   
   
<style type="text/css">
  

 

	body {
    padding: 0; 
    font-size: 11px; 
  }    
  
  #calendar { 
    max-width: 1024px; 
    margin: 0 auto;   
    padding-top: 3%;  
    font-size: 11pt;   
    margin-right: 348px;
 
  }   
  a { 
     color: black;
	 text-decoration: none; 
	}
	.workadd{ 
  	width: 238px;    
    height: 429px;
    background-color: #f3f3f3b3; 
    position: absolute;  
    top: 194px;  
    left: 1195px;
    border-radius: 22px;
  } 
       
  .calendar-side{
  	width: 238px;     
    height: auto;
    background-color: #f3f3f3b3; 
    position: absolute;   
    top: 261px;  
    left: 1195px; 
    border-radius: 22px;  
    padding: 7px 0 18px 0;
  }    
    
/*    button:hover {  
	color: white;    
	opacity: 50%; 
	}  */
	 
    .delete:hover {   
	color: #ed0000;   
	opacity: 50%; 
	}
	  
	.edit:hover {  
	color: white;    
	opacity: 50%; 
	}
	  
	
	  
	.edit{ 
   font-size: 8pt;  
   border: none;   
   border-radius: 10px;
   width: 44px; 
   height: 17px;
   background-color: #5F98F6;
   color: white; 
   margin-right: 2px;  
 }
   
 .delete{  
   font-size: 8pt;
   border: none; 
   border-radius: 10px;
   width: 44px;  
   height: 17px;  
   background-color: #b4b4b4;
   color: white;
  
 } 
 .button-ab{
 	position: absolute;
    right: 8%;
 }
 
 
 
 
   /* 나의 캘린더 */	 
 	.thumbnail, .count {
	    width:300px;
	} 	
   
   .count-save{
   		font-size: 9pt;
	    border: none;
	    border-radius: 10px;
	    width: 54px; 
	    height: 26px;
	    background-color: #5F98F6;
	    color: white;
	    float: right;   
	    
   }
   
   /* 나의 캘린더 끝 */	
   
   
   .btn-wt{
   	    border: none;
	    background-color: #fffe;
   
   }
   
    
    
    
 
</style>

<script type="text/javascript">



document.addEventListener('DOMContentLoaded', function() {
	
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, { 
      headerToolbar: {
        left: 'prev,next today', 
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
     
      locale: 'ko', 
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      select: function(arg) {
          var title = prompt('일정 추가','입력해주세요..');
          if (title) { 
              calendar.addEvent({ 
                  title: title,
                  start: arg.start,
                  end: arg.end,
                  allDay: arg.allDay
              })
          }
          calendar.unselect()
      },
      eventClick: function(arg) { 
          if (confirm('일정을 삭제하시겠습니까?')) {
              arg.event.remove()
          }
      }

	
    });

    calendar.render();
    
    
    
    
  }); 
   
  
	 
  
	$(document).ready(function(){  
		  
		
		 
		//offcanvas
			$(".workadd").click(function(e){ 
				$('.offcanvas').offcanvas('show');
				
				
			});
			  
		 
		 
			 
			
			
	 
	}); //end of ready

	   
	 
   
      
</script>  
   
     
<div id='calendar' style="margin-bottom: 5%;"></div>   

<div class="workadd" style="margin-top: 0pt;border-radius: 23px;background-color: #f7f7f7;width: 15.5%;height: 60px;">
	<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt; margin-top: 20%;">일정 생성</span></div>
</div>
 
   
<div> 
	<div class="calendar-side">      
  			                    
  			<div style="margin-top: 10px;">         
	  			<div class="form-group seachIcon" style="font-size: 10pt;margin-right: 13%;margin-top: 3px;">   
					<a href="#" class="btn fa-solid fa-circle-plus fa-lg"  style="color: #5E9FF2; margin-top: 6px; position: absolute; top: 22px; left: 188px;"></a>
				</div>
	  			<button type="button" class="btn" data-toggle="collapse" data-target="#demo" style="width: 88%; text-align: inherit; margin-left: 18px;">나의 캘린더    
	  			<i class="fa-solid fa-user" style="position: absolute;left: 11px; top: 28px;"></i> </button>  
	  			 
	  			<div id="demo" class="collapse show">       
	  			<div style="margin-left: 20px; margin-top: 10px;font-size: 10pt;">	   
		  			<p> 
		  			<input type="checkbox" />     
				    <label><span></span>내일정</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
				    
				    <p>   
				    <input type="checkbox" />    
				    <label><span></span>팀일정</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
				      
				    <p> 
				    <input type="checkbox" />     
				    <label><span></span>부서일정</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
				      
				    <p> 
				    <input type="checkbox" />    
				    <label><span></span>전사일정</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
				    	 
		  	   </div>	 
		  	 </div>   
  			</div>     
	</div>
</div> 




<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel" style="width: 40%;">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		  <div class="offcanvas-body">
		  	 
		  	
		  	<div style="display: flex; width: 100%;">        
			  <fieldset style="width: 900px; "> 
			    <div class="form-group" style=" margin-top: 20px;"> 
			      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력하세요(필수)" style="border: none;">
			    </div>
			      
			    <hr style="margin-bottom: 7%;">   
			       
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
					  
			    </div>  
			     <div style="font-size: small;margin: 2% 0 0 8%;">     
			        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked="">
			        <label class="form-check-label" for="flexCheckChecked">   
			       	   종일 
			        </label> 
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
			        
			     
			  </fieldset>
			  
			   
			       
			</div>    
		  	
	  			<div class="workstatus-buttoncontainer" style="margin-bottom: 12%;">
		  			<button type="button" class="workstatus-save gradientbtn">저장하기</button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
	  			</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->

 
