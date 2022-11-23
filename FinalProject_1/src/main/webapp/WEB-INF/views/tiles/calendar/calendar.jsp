<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
    
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   
<%@ include file="calendar_header.jsp"%>   
   
<style type="text/css">




	body {
/*     margin: 40px 10px; */  
    padding: 0; 
    font-size: 11px; 
  }  
 
  #calendar {
    max-width: 1100px;
    margin: 0 auto;   
    padding-top: 3%; 
    font-size: 11pt;  
/*     margin-bottom: 5%;  */
  } 
   
   
   
   /* 미니캘린더 시작 */
	
	html,
	body,
	div,
	span,
	object,
	iframe,
	h1,
	h2,
	h3,
	h4,
	h5,
	h6,
	p,
	blockquote,
	pre,
	a,
	abbr,
	acronym,
	address,
	code,
	del,
	dfn,
	em,
	img,
	q,
	dl,
	dt,
	dd,
	ol,
	ul,
	li,
	fieldset,
	form,
	label,
	legend,
	table,
	caption,
	tbody,
	tfoot,
	thead,
	tr,
	th,
	td,
	article,
	aside,
	dialog,
	figure,
	footer,
	header,
	hgroup,
	nav,
	section {
	    margin: 0;
	    padding: 0;
	    border: 0;
/* 	    font-weight: inherit; */
/* 	    font-style: inherit; */
/* 	    font-size: 100%; */
/* 	    font-family: inherit; */
	    vertical-align: baseline;
	    text-decoration: none; 
	    list-style: none;
	}
	img {
	    width: 100%
	}
	.anim04c {
	    -webkit-transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
	    transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
	}
	
	html,
	body { 
	    width: 100%;
	    height: 100%; 
/* 	    font-family: 'Source Sans Pro', sans-serif; */
	/*     background: #eee; */
	}
	body {
	    overflow-x: hidden;
	    overflow-y: auto;
	}
	/*-----*/
	
	.outer {
	    position: relative;
	    top: 50%;
	    z-index: 1;
	    -webkit-transform: translateY(-50%);
	    -moz-transform: translateY(-50%);
	    -ms-transform: translateY(-50%);
	    -o-transform: translateY(-50%);
	    transform: translateY(-50%);
	    cursor: pointer;
	}
	/*-----*/
	
	.signboard {
	    width: 100px;
	    height: 100px;
	    margin: auto;
	    color: #fff;
	    border-radius: 10px;
	}
	/*-----*/
	
	.front {
	    position: absolute;
	    top: 0;
	    left: 0;
	    z-index: 3;
	    background: #ff726b;
	    text-align: center;
	}
	.right {
	    position: absolute;
	    right: : 0;
	    z-index: 2;
	    -webkit-transform: rotate(-10deg) translate(7px, 8px);
	    -moz-transform: rotate(-10deg) translate(7px, 8px);
	    -ms-transform: rotate(-10deg) translate(7px, 8px);
	    -o-transform: rotate(-10deg) translate(7px, 8px);
	    transform: rotate(-10deg) translate(7px, 8px);
	    background: #EFC94C;
	}
	.left {
	    position: absolute;
	    left: 0;
	    z-index: 1;
	    -webkit-transform: rotate(5deg) translate(-4px, 4px);
	    -moz-transform: rotate(5deg) translate(-4px, 4px);
	    -ms-transform: rotate(5deg) translate(-4px, 4px);
	    -o-transform: rotate(5deg) translate(-4px, 4px);
	    transform: rotate(5deg) translate(-4px, 4px);
	    background: #3498DB;
	}
	/*-----*/
	
	.outer:hover .inner {
	    -webkit-transform: rotate(0) translate(0);
	    -moz-transform: rotate(0) translate(0);
	    -ms-transform: rotate(0) translate(0);
	    -o-transform: rotate(0) translate(0);
	    transform: rotate(0) translate(0);
	}
	/*-----*/
	
	.outer:active .inner {
	    -webkit-transform: rotate(0) translate(0) scale(0.9);
	    -moz-transform: rotate(0) translate(0) scale(0.9);
	    -ms-transform: rotate(0) translate(0) scale(0.9);
	    -o-transform: rotate(0) translate(0) scale(0.9);
	    transform: rotate(0) translate(0) scale(0.9);
	}
	.outer:active .front .date {
	    -webkit-transform: scale(2);
	}
	.outer:active .front .day,
	.outer:active .front .month {
	    visibility: hidden;
	    opacity: 0;
	    -webkit-transform: scale(0);
	    -moz-transform: scale(0);
	    -ms-transform: scale(0);
	    -o-transform: scale(0);
	    transform: scale(0);
	}
	.outer:active .right {
	    -webkit-transform: rotate(-5deg) translateX(80px) scale(0.9);
	    -moz-transform: rotate(-5deg) translateX(80px) scale(0.9);
	    -ms-transform: rotate(-5deg) translateX(80px) scale(0.9);
	    -o-transform: rotate(-5deg) translateX(80px) scale(0.9);
	    transform: rotate(-5deg) translateX(80px) scale(0.9);
	}
	.outer:active .left {
	    -webkit-transform: rotate(5deg) translateX(-80px) scale(0.9);
	    -moz-transform: rotate(5deg) translateX(-80px) scale(0.9);
	    -ms-transform: rotate(5deg) translateX(-80px) scale(0.9);
	    -o-transform: rotate(5deg) translateX(-80px) scale(0.9);
	    transform: rotate(5deg) translateX(-80px) scale(0.9);
	}
	/*-----*/
	
	.outer:active .calendarMain {
	    -webkit-transform: scale(1.8);
	    opacity: 0;
	    visibility: hidden;
	}
	.outer:active .clock {
	    -webkit-transform: scale(1.4);
	    opacity: 1;
	    visibility: visible;
	}
	.outer:active .calendarNormal {
	    bottom: -30px;
	    opacity: 1;
	    visibility: visible;
	}
	.outer:active .year {
	    top: -30px;
	    opacity: 1;
	    visibility: visible;
	    letter-spacing: 3px;
	}
	/*-----*/
	
	.calendarMain {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    opacity: 1;
	}
	.month,
	.day {
	    font-size: 10px;
	    line-height: 30px;
	    font-weight: 600;
	    text-transform: uppercase;
	    letter-spacing: 3px;
	}
	.date {
	    font-size: 40px;
	    line-height: 40px;
	    font-weight: 300;
	    text-transform: uppercase;
	    letter-spacing: 3px;
	}
	/*-----*/
	
	.clock {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    font-size: 40px;
	    line-height: 100px;
	    font-weight: 300;
	    text-transform: uppercase;
	    letter-spacing: 3px;
	    text-align: center;
	    opacity: 0;
	    visibility: hidden;
	}
	/*-----*/
	
	.year {
	    width: 100%;
	    position: absolute;
	    top: 0;
	    font-size: 14px;
	    line-height: 30px;
	    font-weight: 300;
	    text-transform: uppercase;
	    letter-spacing: 0;
	    text-align: center;
	    opacity: 0;
	    visibility: hidden;
	    color: #ff726b;
	}
	.calendarNormal {
	    width: 100%;
	    position: absolute;
	    bottom: 0;
	    font-size: 14px;
	    line-height: 30px;
	    font-weight: 600;
	    text-transform: uppercase;
	    letter-spacing: 3px;
	    text-align: center;
	    opacity: 0;
	    visibility: hidden;
	}
	.date2 {
	    color: #ff726b;
	}
	.day2 {
	    color: #3498DB;
	}
	.month2 {
	    color: #EFC94C;
	}
	/* -- usable codes end -- */
	
	/* -- unusable codes (text, logo, etc.) -- */
	
	.info {
	    width: 100%;
	    height: 25%;
	    position: absolute;
	    top: 15%;
	    text-align: center;
	    opacity: 0;
	}
	.info li {
	    width: 100%;
	}
	.hover,
	.click,
	.yeaa {
	    font-size: 14px;
	    line-height: 25px;
	    font-weight: 600;
	    text-transform: uppercase;
	    letter-spacing: 2px;
	    text-align: center;
	    bottom: 0;
	    opacity: 1;
	}
	.dribbble {
	    position: absolute;
	    top: -60px;
	    font-size: 14px;
	    opacity: 0;
	}
	em {
	    color: #ed4988;
	}
	.designer {
	    width: 100%;
	    height: 50%;
	    position: absolute;
	    bottom: 0;
	    text-align: center;
	    opacity: 0;
	}
	.designer li {
	    width: 100%;
	    position: absolute;
	    bottom: 30%;
	}
	.designer a {
	    width: 30px;
	    height: 30px;
	    display: block;
	    position: relative;
	    border-radius: 100%;
	    margin: auto;
	    color: rgba(46, 204, 113, 0.55);
	}
	.designer a:after {
	    content: "see designs";
	    position: absolute;
	    top: 0;
	    left: 40px;
	    font-size: 14px;
	    line-height: 33px;
	    font-weight: 600;
	    text-transform: uppercase;
	    letter-spacing: 2px;
	    white-space: nowrap;
	}
	.designer a:hover:after {
	    color: #2ecc71;
	}
	.designer img {
	    display: block;
	    border-radius: 100%;
	}
	body:hover .info,
	body:hover .designer {
	    opacity: 1;
	}
	::selection {
	    background: transparent;
	}
	::-moz-selection {
	    background: transparent;
	}   
   /* 미니캘린더 끝 */
   
   
   
   /* 검색  */
	.row >*{
		width: auto;
		padding: 0;
	}
	.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0; 
	}

   /* 검색 끝 */
    
 
 
 
 
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
			$("#fc-dom-1").click(function(e){ 
				$('.offcanvas').offcanvas('show');
				
				
			});
			  
		 
		 
		 // 미니캘린더
			var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
			var dayNames= [ "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" ];
		
			var newDate = new Date();
			newDate.setDate(newDate.getDate());
			  
			setInterval( function() {
			  var hours = new Date().getHours();
			  $(".hour").html(( hours < 10 ? "0" : "" ) + hours);
			    var seconds = new Date().getSeconds();
			  $(".second").html(( seconds < 10 ? "0" : "" ) + seconds);
			    var minutes = new Date().getMinutes();
			  $(".minute").html(( minutes < 10 ? "0" : "" ) + minutes);
			    
			    $(".month span,.month2 span").text(monthNames[newDate.getMonth()]);
			    $(".date span,.date2 span").text(newDate.getDate());
			    $(".day span,.day2 span").text(dayNames[newDate.getDay()]);
			    $(".year span").html(newDate.getFullYear());
			}, 1000); 
		
		
		
			$(".outer").on({
			    mousedown:function(){
			        $(".dribbble").css("opacity","1");
			    },
			    mouseup:function(){
			        $(".dribbble").css("opacity","0");
			    }
			});
	 
	 		
			
			
			$(".count").hide();
			$(".thumbnail").mouseover(function () {
			    $(this).children().slideDown("slow");
			    $(this).siblings().children(".count").slideUp('fast');
			});
			 
			
			
	 
	}); //end of ready

	 
	
 
    
</script>  
 
 
<div id='calendar' style="margin-bottom: 5%;"></div> 


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
		  	
	  			<div class="workstatus-buttoncontainer">
		  			<button type="button" class="workstatus-save">저장하기</button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
	  			</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->

 
