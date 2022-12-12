<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
    
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script> -->
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
/*     margin: 0 auto;    */
    padding-top: 3%;  
    font-size: 11pt;   
/*     margin-right: 348px; */
	margin-left: 5%;
    float: left;
    width: 70%;
 
  }   
  a { 
     color: black;
	 text-decoration: none; 
	}
	.workadd{ 
  	width: 238px;    
    height: 429px;
    background-color: #f3f3f3b3; 
/*     position: absolute;   */
    top: 194px;   
    left: 1195px; 
    border-radius: 22px;
  } 
         
  .calendar-side{
  	width: 238px;     
    background-color: #f3f3f3b3; 
    margin-top: 3%; 
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
 	float: right; 
    margin-right: 5%;
 }
 
 #selboxDirect{  
   border: 1.5px solid #cccccc;
    border-radius: 3.5px;
    width: auto; 
/*     padding: 10px 17px; */
/*     margin: 7px 0 18px 0; */
    opacity: 0.85; 
    font-size: 10pt;
    line-height: 20px;
    margin-left: 10px;
    margin-top: 13px; 
 }
 
 
   
   
   
 .fa-solid, .fa-regular{
 	opacity: 50%;   
 
 }
 .search-period-wr .filter-input-box {
    /* overflow: hidden; */
    display: inline-block;
    /* margin: 10px 0 0 0; */
    /* padding: 7px 44px 0 10px; */
    height: 30px;
    width: auto;
} 
.filter-input-box {
    position: relative;
    height: 40px;
    /* margin-top: 10px; */
    /* padding: 10px 15px 10px 6px; */
    background: #fff;
    /* border: 1px solid #ddd; */
    width: 100%;
    font-size: 11px;
}
 
/* calendar-dateSelector */
.calendar-dateSelector {
    height: 36px;  
    width: 85%; 
    display: inline-block;
    border: solid 1px rgba(0, 0, 0, .1);
    border-radius: 5px;
    margin: 0;
    width: 206px !important;
    color: rgba(0,0,0,0.7);
    font-weight: 500;
    padding: 0 15px;
} 
 
.form-select, .form-control{
	border: 1px solid #ced4da9e;
	font-size: 14px;
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

$(document).ready(function(){  
	  
	
	 
	//offcanvas
		$(".workadd").click(function(e){ 
			$('.offcanvas').offcanvas('show');
			
			
		});
		   
	 
		// 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d",
			defaultDate: new Date(),
			local: 'ko'
		});
		 
		  
		// 직접입력 
		$("#selboxDirect").hide();  // 소속 직접작성란 숨기고 시작한다.
		
		// 소속 입력
		$("#team").change(function() {
			//직접입력을 누를 때 나타남
			if($("#team").val() == "direct") {
				/* $("select#team").hide(); */
				$("#selboxDirect").show();
				$("select#team").css('margin-bottom','0px');    
			}  else {
				$("#selboxDirect").hide();
				$("select#team").css('margin-bottom','18px');
			}
		
		}); 
		
		 
		
		// === 내일정에 내일정 소분류 보여주기 ===
		showmyCal();
		 
		// === 내캘린더 에 속한 특정 체크박스를 클릭할 경우 === 
		$(document).on("click","input:checkbox[name=my_smcatgono]",function(){	
			var bool = $(this).prop("checked");
			
			if(bool){ // 체크박스에 클릭한 것이 체크된 것이라면 
				
				var flag=false;
				
				$("input:checkbox[name=my_smcatgono]").each(function(index, item){
					var bChecked = $(item).prop("checked");
					
					if(!bChecked){    // 체크되지 않았다면 
						flag=true;    // flag 를 true 로 변경
						return false; // 반복을 빠져 나옴.
					}
				}); // end of $("input:checkbox[name=my_smcatgono]").each(function(index, item){})---------

				if(!flag){	// 내캘린더 에 속한 서브캘린더의 체크박스가 모두 체크가 되어진 경우라면 	
	                $("input#allMyCal").prop("checked",true); // 내캘린더 체크박스에 체크를 한다.
				}
				
				var my_smcatgonoArr = document.querySelectorAll("input.my_smcatgono");
			      
				my_smcatgonoArr.forEach(function(item) {
					item.addEventListener("change", function() {   // "change" 대신에 "click" 을 해도 무방함.
					 // console.log(item); 
						calendar.refetchEvents();  // 모든 소스의 이벤트를 다시 가져와 화면에 다시 표시합니다.
			        });
			    });// end of my_smcatgonoArr.forEach(function(item) {})---------------------

			}
			
			else {
				   $("input#allMyCal").prop("checked",false);
			}
			
		});// end of $(document).on("click","input:checkbox[name=my_smcatgono]",function(){})--------		
 
		
		
		 
		
}); //end of ready
 
      
<%--    
document.addEventListener('DOMContentLoaded', function () {
    $(function () {
        var request = $.ajax({
            url: '<%= ctxPath%>/calendar.up', 
            method: "GET", 
            dataType: "json"
        });

        request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기.

            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialDate: '2022-02-07',
                initialView: 'timeGridWeek',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                locale: 'ko', 
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: true,
                selectable: true,
                droppable: true, // this allows things to be dropped onto the calendar
                drop: function (arg) {
                    // is the "remove after drop" checkbox checked?
                    if (document.getElementById('drop-remove').checked) {
                        // if so, remove the element from the "Draggable Events" list
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                },
                /**
                 * data 로 값이 넘어온다. log 값 전달.
                 */
                events: data
            }); 

            calendar.render();
        });

        request.fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus );
        });
    });
 --%>
  

 document.addEventListener('DOMContentLoaded', function() {
 	
     var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, { 
      
       initialView: 'dayGridMonth',
       locale: 'ko',
       selectable: true,
 	   editable: false,
 	   navLinks: true, // can click day/week names to navigate views
 	   businessHours: true, // display business hours
 	   headerToolbar: {
 	         left: 'prev,next today', 
 	         center: 'title',
 	         right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
 	       },
 	    dayMaxEventRows: true, // for all non-TimeGrid views
 	    views: {
 	      timeGrid: {
 	        dayMaxEventRows: 3 // adjust to 6 only for timeGridWeek/timeGridDay
 	      }
 	    },
         
 /*       select: function(arg) {
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
  */
 //===================== DB 와 연동하는 법 시작 ===================== // 
 	events:function(info, successCallback, failureCallback) { 
    
  	 $.ajax({ 
           url: '<%= ctxPath%>/calendar.up',
           data:{"fk_employee_no":$('input#fk_employee_no').val()},
           dataType: "json",
           success:function(json) {
          	 /*
          	    json 의 값 예
          	    [{"enddate":"2021-11-26 18:00:00.0","fk_lgcatgono":"2","color":"#009900","scheduleno":"1","fk_smcatgono":"4","subject":"파이널 프로젝트 코딩","startdate":"2021-11-08 09:00:00.0","fk_userid":"seoyh"},{"enddate":"2021-11-29 13:50:00.0","fk_lgcatgono":"1","color":"#990008","scheduleno":"2","fk_smcatgono":"7","subject":"팀원들 점심식사","joinuser":"leess,eomjh","startdate":"2021-11-29 12:50:00.0","fk_userid":"seoyh"},{"enddate":"2021-12-02 20:00:00.0","fk_lgcatgono":"1","color":"#300bea","scheduleno":"3","fk_smcatgono":"11","subject":"팀원들 뒤풀이 여행","joinuser":"leess,eomjh","startdate":"2021-12-01 09:00:00.0","fk_userid":"seoyh"}]
          	 */
          	 var events = [];
               if(json.length > 0){
                   
                       $.each(json, function(index, item) {
                              var startdate = moment(item.startdate).format('YYYY-MM-DD HH:mm:ss');
                              var enddate = moment(item.enddate).format('YYYY-MM-DD HH:mm:ss');
                              var subject = item.subject;
                         
                             // 나의 캘린더로 등록된 일정을 풀캘린더 달력에 보여주기  
                             // 일정등록시 나의 캘린더에서 선택한 소분류에 등록된 일정을 풀캘린더 달력 날짜에 나타내어지게 한다.
                             if( $("input:checkbox[name=com_smcatgono]:checked").length <= $("input:checkbox[name=com_smcatgono]").length ){
                                 
                                 for(var i=0; i<$("input:checkbox[name=com_smcatgono]:checked").length; i++){
                              	  
                              		   if($("input:checkbox[name=com_smcatgono]:checked").eq(i).val() == item.fk_smcatgono){
 			                               //  alert("캘린더 소분류 번호 : " + $("input:checkbox[name=com_smcatgono]:checked").eq(i).val());
                              			   events.push({
 			                                	            id: item.calno, 
 			                                                title: item.subject,
 			                                                start: startdate, 
 			                                                end: enddate, 
 			                                        	    url: "<%= ctxPath%>/calendar.up?calno="+item.calno,
 			                                                cid: item.fk_smcatgono  // 사내캘린더 내의 서브캘린더 체크박스의 value값과 일치하도록 만들어야 한다. 그래야만 서브캘린더의 체크박스와 cid 값이 연결되어 체크시 풀캘린더에서 일정이 보여지고 체크해제시 풀캘린더에서 일정이 숨겨져 안보이게 된다. 
 			                                   }); // end of events.push({})---------
 		                                   }
                              	   
                                 }// end of for-------------------------------------
                               
                             }// end of if-------------------------------------------
                              
                          
                       }); // end of $.each(json, function(index, item) {})-----------------------
                   }                             
                   
                // console.log(events);                       
                   successCallback(events);                               
            },
 			  error: function(request, status, error){
 		            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
 		      }	
                                      
    }); // end of $.ajax()--------------------------------
  
  }, // end of events:function(info, successCallback, failureCallback) {}---------
  // ===================== DB 와 연동하는 법 끝 ===================== //
        
       
     });

    calendar.render();
    
    
    
    
  }); 
   
    
	   
   

//=== 내 캘린더에서 내캘린더 소분류 보여주기  === //
function showmyCal(){
	$.ajax({
		 url:"<%= ctxPath%>/calendar.up",
		 type:"get", 
		 data:{"fk_employee_no":"fk_employee_no"},
		 dataType:"json",
		 success:function(json){
			 var html = "";
			 if(json.length > 0){
				 html += "<table style='width:80%;'>";	 
				 
				 $.each(json, function(index, item){
					 html += "<tr style='font-size: 11pt;'>";
					 html += "<td style='width:60%; padding: 3px 0px;'><input type='checkbox' name='my_smcatgono' class='calendar_checkbox my_smcatgono' style='margin-right: 3px;' value='"+item.smcatgono+"' checked id='my_smcatgono_"+index+"' checked/><label for='my_smcatgono_"+index+"'>"+item.smcatgoname+"</label></td>";   
					 html += "<td style='width:20%; padding: 3px 0px;'><button class='btn_edit editCal' data-target='editCal' onclick='editMyCalendar("+item.smcatgono+",\""+item.smcatgoname+"\")'><i class='fas fa-edit'></i></button></td>"; 
					 html += "<td style='width:20%; padding: 3px 0px;'><button class='btn_edit delCal' onclick='delCalendar("+item.smcatgono+",\""+item.smcatgoname+"\")'><i class='fas fa-trash'></i></button></td>";
				     html += "</tr>";
				 });
				 
				 html += "</table>";
			 }
			 
			 $("div#myCal").html(html); 
		 },
		 error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	     }	 	
	});

}// end of function showmyCal()---------------------		
	     
	 
   
      
</script>  
       
       
<div id='calendar' style="margin-bottom: 5%;"></div>   

<div class="workadd" style="margin-top: 7%;border-radius: 23px;background-color: #f7f7f7;height: 60px;float: right;margin-right: 5%;">
	<div><i class="fa-solid fa-circle-plus" style="color: #5E9FF2;"></i><span style="color:#5E9FF2; margin-left: 5pt; margin-top: 20%;">일정 생성</span></div>
</div>
    
        
<div style="float: right;margin-right: 5%;">  
	<div class="calendar-side">         
  			                         
  			<div style="">           
	  			<div class="form-group seachIcon" style="font-size: 10pt;margin-right: 13%;margin-top: 3px;">   
				</div>
	  			<button type="button" class="btn collapsed" data-toggle="collapse" data-target="#demo" style="width: 88%; text-align: inherit; margin-left: 18px;">내일정     
	  			<i class="fa-solid fa-user" style=""></i> </button>   
	  			  
	  			<div id="myCal" class="accordion-collapse collapse show">       
	  			<div style="margin-left: 20px; margin-top: 10px;font-size: 10pt;">	   
		  			<p>   
		  			<div style="margin-bottom: 2%;">   
		  				<input type="checkbox" />      
				   		<label><span></span>개인 프로젝트</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
		  			</div>  
		  			<div style="margin-bottom: 2%;">   
		  				<input type="checkbox" />      
				   		<label><span></span>개인 프로젝트</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
		  			</div>  
		  			<div style="margin-bottom: 2%;">   
		  				<input type="checkbox" />      
				   		<label><span></span>개인 프로젝트</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
		  			</div>  
		  			
		  	   </div>	 
		  	 </div>    
  			</div>       
	</div>   
	<div class="calendar-side" style="top: 390px;">          
  			                       
  			<div style="margin-top: 10px;">         
	  			<div class="form-group seachIcon" style="font-size: 10pt;margin-right: 13%;margin-top: 3px;">    
				</div>
	  			<a type="button" class="btn collapsed" data-toggle="collapse" data-target="#demo2" style="width: 88%; text-align: inherit; margin-left: 18px;">팀일정     
	  			<i class="fa-solid fa-user" style="position: absolute;left: 11px; top: 28px;"></i> </a>  
	  			 
	  			<div id="demo2" class="accordion-collapse collapse">       
	  			<div style="margin-left: 20px; margin-top: 10px;font-size: 10pt;">	   
		  			<p>   
		  			<div style="margin-bottom: 2%;">   
		  				<input type="checkbox" />      
				   		<label><span></span>개인 프로젝트</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
		  			</div>  
		  	   </div>	 
		  	 </div>   
  			</div>      
	</div>
	<div class="calendar-side" style="top: 519px;">          
  			                       
  			<div style="margin-top: 10px;">         
	  			<div class="form-group seachIcon" style="font-size: 10pt;margin-right: 13%;margin-top: 3px;">   
				</div>
	  			<button type="button" class="btn collapsed" data-toggle="collapse" data-target="#demo3" style="width: 88%; text-align: inherit; margin-left: 18px;">부서일정    
	  			<i class="fa-solid fa-user" style="position: absolute;left: 11px; top: 28px;"></i> </button>  
	  			 
	  			<div id="demo3" class="accordion-collapse collapse">       
	  			<div style="margin-left: 20px; margin-top: 10px;font-size: 10pt;">	   
		  	   </div>	 
		  	 </div>   
  			</div>      
	</div>
	<div class="calendar-side" >            
  			                       
  			<div style="">         
	  			<div class="form-group seachIcon" style="font-size: 10pt;margin-right: 13%;margin-top: 3px;">   
				</div>
	  			<button type="button" class="btn collapsed" data-toggle="collapse" data-target="#demo4" style="width: 88%; text-align: inherit; margin-left: 18px;">전사일정     
	  			<i class="fa-solid fa-user" style="position: absolute;left: 11px; top: 28px;"></i> </button>  
	  			 
	  			<div id="demo4" class="accordion-collapse collapse">       
	  			<div style="margin-left: 20px; margin-top: 10px;font-size: 10pt;">	   
		  			<p>   
		  			<div style="margin-bottom: 2%;">   
		  				<input type="checkbox" />      
				   		<label><span></span>개인 프로젝트</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
		  			</div>  
		  	   </div>	 
		  	 </div>    
  			</div>      
	</div> 
	<div class="calendar-side" style="top: 781px;">            
  			                       
  			<div style="margin-top: 10px;">         
	  			<div class="form-group seachIcon" style="font-size: 10pt;margin-right: 13%;margin-top: 3px;">   
				</div>
	  			<button type="button" class="btn collapsed" data-toggle="collapse" data-target="#demo5" style="width: 88%; text-align: inherit; margin-left: 18px;">공유받은 일정      
	  			<i class="fa-solid fa-user" style="position: absolute;left: 11px; top: 28px;"></i> </button>  
	  			 
	  			<div id="demo5" class="accordion-collapse collapse">       
	  			<div style="margin-left: 20px; margin-top: 10px;font-size: 10pt;">	   
		  			<p>   
		  			<div style="margin-bottom: 2%;">   
		  				<input type="checkbox" />      
				   		<label><span></span>개인 프로젝트</label><span class="button-ab"><button type="button" class="edit">수정</button> <button type="button" class="delete">삭제</button></span>
		  			</div>  
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
			      <select class="form-select" style="margin-left: 20px;">  
			        <option>팀일정</option>
			        <option>내일정</option> 
			        <option>부서일정</option>     
			        <option>전사일정</option>   
			        <option>공유받은 일정</option> 
<!-- 			        <option value="direct">직접 입력</option>    -->
			      </select> 
<!-- 			      <input input type="text" id="selboxDirect" name="selboxDirect" />  -->
			    </div>     
			          
			     <div class="form-group"  style="display: flex;">  
			      <select id="team"  name="team" class="form-select" style="margin-left: 40px;margin-top: 13px;">  
			        <option>개인 프로젝트</option>
			        <option value="direct">직접 입력</option>    
			      </select>  
			      <input input type="text" id="selboxDirect" name="selboxDirect" /> 
			    </div> 
			         
			          
			    <div class="search-period-wr" > 
			    
		                <div class="js-search-pickr-layer" data-code="unlimit" style="position: relative;left: 36px;">   
		                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
			                	<div class="datebox margin-container">
									<span><span class="icon icon-calendar" style="position: relative;top: 29px;z-index: 1;"></span><input class="dateSelector calendar-dateSelector" style="padding: 0 4px 2px 34px;"/></span>
								</div> 
							</div>   
		                    <span class="dash-swung" style="position: relative;bottom: 0px;right: 15px;top: -3px;">~</span>
		                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box" >
			                	<div class="datebox margin-container">
									<span><span class="icon icon-calendar" style="position: relative;top: 29px;z-index: 1;"></span><input class="dateSelector calendar-dateSelector" style="padding: 0 4px 2px 34px;"/></span>
								</div> 
							</div> 
							
							<div style="font-size: larger;margin: -19px 40px 0 25px; float: right;">     
					        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked="">
					        <label class="form-check-label" for="flexCheckChecked">   
					       	   종일 
					        </label> 
				         </div>  
							  
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
			    
			     
			  </fieldset>
			  
			   
			       
			</div>    
		  	
	  			<div class="workstatus-buttoncontainer" style="margin-bottom: 12%;">
		  			<button type="button" class="workstatus-save gradientbtn">저장하기</button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
	  			</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->

 
