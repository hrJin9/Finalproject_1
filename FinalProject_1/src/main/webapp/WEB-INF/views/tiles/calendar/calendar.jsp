<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   
  
  
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
	



	body {
/*     margin: 40px 10px; */ 
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;  
    padding-top: 3%;  
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
	    font-weight: inherit;
	    font-style: inherit;
	    font-size: 100%;
	    font-family: inherit;
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
	    font-family: 'Source Sans Pro', sans-serif;
	/*     background: #eee; */
	    color: #666;
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
      initialDate: '2020-09-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2020-09-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-09-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-09-18',
          end: '2020-09-20'
        },
        {
          title: 'Party',
          start: '2020-09-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-09-11T10:00:00',
          end: '2020-09-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-09-13T10:00:00',
          end: '2020-09-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-09-24',
          end: '2020-09-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-09-06',
          end: '2020-09-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
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


<nav id="list">
	<a class="list_iscurrent">캘린더</a>
	<a>할 일</a>
	<div class="list_underline"></div>
</nav>

<hr style="margin-top: 0px;"/>



<div id='calendar'></div>


<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		  <div class="offcanvas-body">
		  	<div> 
	  			
	  			<!-- 캘린더 시작 -->
				  	<div class="info anim04c">
			        <li class="dribbble anim04c">
			            <span>I need to be a
			                <em> dribbble </em>player?!.</span>
			        </li>
			        <li class="hover anim04c">
			            <span>hover!</span>
			        </li>
			        <li class="click anim04c">
			            <span>click!</span>
			        </li>
			        <li class="yeaa anim04c">
			            <span>- yeaa! -</span>
			        </li>
			    </div>
			
			
			    <!-- main codes start --> 
			    <div class="signboard outer" style="margin-top: 17%;">
			        <div class="signboard front inner anim04c">
			            <li class="year anim04c">
			                <span></span>
			            </li>
			            <ul class="calendarMain anim04c">
			                <li class="month anim04c">
			                    <span></span>
			                </li>
			                <li class="date anim04c">
			                    <span></span>
			                </li>
			                <li class="day anim04c">
			                    <span></span>
			                </li>
			            </ul>
			            <li class="clock minute anim04c">
			                <span></span>
			            </li>
			            <li class="calendarNormal date2 anim04c">
			                <span></span>
			            </li>
			        </div>
			        <div class="signboard left inner anim04c">
			            <li class="clock hour anim04c">
			                <span></span>
			            </li>
			            <li class="calendarNormal day2 anim04c">
			                <span></span>
			            </li>
			        </div>
			        <div class="signboard right inner anim04c">
			            <li class="clock second anim04c">
			                <span></span>
			            </li>
			            <li class="calendarNormal month2 anim04c">
			                <span></span>
			            </li>
			        </div>
			    </div>
			    <!-- main codes end -->
			
			 
	  			<!-- 캘린더 끝 --> 
	  			  
	  			 
	  			<div class="workadd">
		  			<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt; margin-top: 20%;">일정 생성</span></div>
	  			</div>
	  			
	  			  
	  			<!-- 검색 -->  
	  			<div class="row" style="margin-bottom: 13px;">   
					<div>    
						<div class="form-group" style="margin-top: 5%;"> 
							<div class="form-field" style="padding-left:15px; margin-right: -130%;">
								<input type="text" class="form-control" placeholder="검색" style="width:90%; font-size: 9pt; padding:6px 12px;">
							</div>
						</div>
					</div>
					<div class="align-items-end mt-1 mr-4"> 
						<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
							<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 10.5%; top: 44.5%;"></a>
						</div>
					</div>
				</div>  
	  			<!-- 검색 끝 -->      
	  			   
	  			<div>  
		  			<hr style="margin: 30px 0; background-color: none;">  	    
		  			<i class="fa-solid fa-user"></i>   
		  			<button type="button" class="btn" data-toggle="collapse" data-target="#demo" style="width: 94%; text-align: inherit;">나의 캘린더  
		  			<i class="fa-solid fa-circle-plus" type="button" style="color: #5E9FF2; float: right;"></i> </button>
		  			
		  			<div id="demo" class="collapse"> 
		  			<div style="margin-left: 20px; margin-top: 10px;">	
			  			<input type="checkbox" /> 
					    <label><span></span>내일정</label> 
					    <div class="count"><button type="button" class="count-save">수정</button> </div>   
					    <p>  
					    <input type="checkbox" />
					    <label><span></span>팀일정</label>  
					    <div class="count"><button type="button" class="count-save">수정</button> </div>
					    <p> 
					    <input type="checkbox" /> 
					    <label><span></span>부서일정</label>	
					    <p> 
					    <input type="checkbox" />
					    <label><span></span>전사일정</label>	 
			  	   </div>	 
			  	 </div>   
	  			</div>    
	  			  
	  			<hr style="margin: 30px 0;">   
   
				<button type="button" class="btn-wt"><i class="fa-solid fa-star" style="margin-right: 5%;"></i>중요일정 보기</button> 
				<button type="button" class="btn-wt"><i class="fa-solid fa-trash-can"></i>삭제된 일정 보기</button> 

	  			
	  			<div class="workstatus-buttoncontainer">
		  			<button type="button" class="workstatus-save">저장하기</button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
	  			</div>
		  	</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->

 
