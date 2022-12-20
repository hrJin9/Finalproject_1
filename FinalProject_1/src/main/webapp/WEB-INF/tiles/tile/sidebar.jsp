<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>  
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/sidebar.css?after">
    
<style type="text/css">
	.sidebar{
		border-right: solid 1px rgba(235,235,235);
	}
	
	
   /* 실시간알림 */
   div#alert_side {
	   display:none;
       width: 273px;
       height: 35px;
       background-color: #4d4d4d;
       color: white;
       font-weight: bold;
       font-size: 10pt;
       border-radius: 2em;
       padding-left: 26px;
       position: fixed;
       top: 15px;
       right: 38%;
       box-shadow: 1px 1px 1px 1.3px rgb(0 0 0 / 20%);
   }
   .newala{
		border-radius: 10px;
	    background-color: #fffcf2;
	    padding: 10px 12px;
	    position: relative;
	    cursor: pointer;
	    display: inline-flex;
	    margin-bottom: 10px;
   }
   .lastala{
   		display: inline-flex;
		border-radius: 10px;
	    padding: 10px 12px;
	    position: relative;
	    cursor: pointer;
   }
   .lastala:hover, .newala :hover{
   	    background-color: rgb(36 42 48 / 2%);
   }
   #allreadbtn{
	   float: right; 
	   border: none; 
	   font-size: 8pt; 
	   font-weight:bold; 
	   border-radius: 3px; 
	   background-color:#3B86C812; 
	   color: #2E5E87; 
	   padding: 5px 8px;
   }
   .newAlarm{
	   font-size: 11.5pt;
	   color: #373737;
	   font-weight: 600;
	   padding: 10px 12px;
	   padding-bottom: 20px;
	   display:none;
   }
   .readAlarm{
	   font-size: 11.5pt; 
	   color: #373737;
	   font-weight: 600; 
	   padding: 10px 12px;
	   padding-bottom: 30px;
	   display:none;
   }
   .news{
	   display:none; 
	   box-shadow: 0px 15px 20px 0px rgba(0,0,0,0.1);
	   z-index:100 !important;
	   height: 300px !important;
       overflow-y: auto !important;
       padding: 10px 5px !important;
   }
   .newsIcon:hover{
   	  background-color: #a4c1df !important;
   } 
   
   /* 전체검색창  */
   .cursno:hover{
		background-color: transparent;
	}
	.hi-container tr{
	    line-height: 17px;
	}
	.hi-container td{
		padding: 8px 10px;
		color: #797979;
   		font-size: 10pt;
		 /* font-size: 8pt; */
	}
	.hi-container tr:nth-child(1)~ :hover{
		 background-color:#f5f5f5;
		 cursor: pointer;
		 /* font-size: 8pt;  */
	}
	.hi-container td:last-child, .hi-container td:last-child > i {
	    color: #cdcdcd;
	    font-size: 8pt;
	    /* display: none; */
	}
	.hi-container th{
		 padding: 10px 15px;
	}
	#alldel{
		border-radius: 5px;
		cursor: pointer;
		border-radius: 5px;
	}
	#alldel :hover{
		background-color:#f5f5f5;
	}
	
	.ss-table td {
    	padding: 8px 10px !important;
	}
	.ss-table tbody tr {
	    overflow: hidden;
	    border-radius: 8px;
	    margin-left: 10px;
	    margin-right: 10px;
	    font-size: 14px !important;
	    font-weight: 500;
	    line-height: 17px;
	     color: #242a30 !important;
	}
	
	.ss-table {
	    width: 100%;
	    font-weight: 600;
	    font-size: 10pt;
	    color: #242a30 !important;
    }
	.ss-table tr td:nth-child(1), .hi-container tr td:nth-child(1),.sse-container tr td:nth-child(1){
		border-top-left-radius: 10px;
    	border-bottom-left-radius: 10px;
	}
	.ss-table tr td:nth-child(3), .hi-container tr td:nth-child(3), .sse-container tr td:nth-child(3){
		border-top-right-radius: 10px;
    	border-bottom-right-radius: 10px;
	}
	
	
	#se-searchicon{
	    margin: 4px 0px 0px 10px;
	    color: rgba(0, 0, 0, 0.7);
	    padding: 2px;
	    border-radius: 10px;
	    display: flex;
	    background-color: rgba(36, 42, 48, 0.03);
	    cursor: pointer;
	}
	table.sse-member td:nth-child(2) >* {
	    display: block !important;
	}
</style>
<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">

//전역변수 설정
let socket  = null;

var searchWord_side = '';
var type = '';
$(document).ready(function(){
	//$("td:last-child").hide();
	$(".news").css('display','none'); 
	$("div.sse-container").css('display','none'); // 검색 div 숨기기 
	$("div.sse-container table").css('display','none');;
	
	$(".ss-table tr").hover(function(){
		$(this).find("td:last-child").show();
	}, function(){
		$(this).find("td:last-child").hide();
	});
	
	$(".hi-container tr").hover(function(){
		$(this).find("td:last-child").show();
	}, function(){
		$(this).find("td:last-child").hide();
	});
	


	/* 행마다 마지막열 화살표 호버 */
	$(document).on({
		mouseenter: function(){
			$(this).find("td:last-child").show();
			$(this).find("td:last-child i").show();
		},
		mouseleave: function(){
			$(this).find("td:last-child").hide();
			$(this).find("td:last-child i").hide();
		}
	}, '.sse-container table tr:nth-child(2)~');
	
	$("#se-searchicon").css('display','none');		
	
	
	
	
	$("span.newred").hide();
	$("div.news").css('display','none');
	$("#alert_side").css('display','none');
	$(".newAlarm").css('display','none');
	alarmList(); // 알람리스트 
	
	//사이드바 체크여부검사
	if(localStorage.getItem("sidebar_yn") != null){
		$("#side-expandcx").prop("checked",true);
		$("#menuicon").prop("checked",true);
		$("div#mycontent").css({'width':'88%','margin':'0 auto'});
		$(".sidebar *").css({"transition":"all 0s !important"});
		$("#side-expand").css({"background-color":"#4285f4"});
	}
   
	
	$(".profile2").click(function(){  // 내프로필 클릭시
		if($(".myprofile").css('display') == 'none' || $(".myprofile").css('display') == '') {
		  $(".myprofile").fadeIn(100);
		  $(".news").fadeOut(100);
		} else {
		  $(".myprofile").fadeOut(100);
		}
	});
	
	$("li#newsIcon").click(function(){ // 새로운 소식 클릭시
		if($(".news").css('display') == 'none' || $(".news").css('display') == '') {
		  $(".news").fadeIn(100);  // 보이기
		  $(".myprofile").fadeOut(100);  // 숨기기
		} else {
		  $(".news").fadeOut(100);
		}
	});

     
	// 비밀번호 변경창 닫기 버튼 클릭 시
	$("button.pwdChangeClose").click(function() {
	   const iframe_pwdChange = document.getElementById("iframe_pwdChange"); // 대상 아이프레임 선택
	   const iframe_window = iframe_pwdChange.contentWindow;
	
	   iframe_window.func_form_reset_empty();
	});
     
     
	<%-- 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기 --%>
	$("input#menuicon").change(function(){
	    if($("#menuicon").is(":checked")){
	        $("div#mycontent").css({'transition':'all 0.5s','width':'88%','margin':'0 auto'});
	    }else{
	        $("div#mycontent").css({'width':'94.6%','transition':'all 0.5s'});
	    }
	});
     
 
       
	//넓게보기 클릭 이벤트
	$("#side-expand-a").click(function(){
	
		if($("#side-expandcx").is(":checked")){
			$("#side-expandcx").prop("checked",false);
			$("#menuicon").prop("checked",false);
			$("div#mycontent").css({'width':'94.6%','transition':'all 0.5s'});
			$("#side-expand").css({"background-color":"","transition":"all 0.5s"});
			localStorage.removeItem("sidebar_yn");
		} else {
			$("#side-expandcx").prop("checked",true);
			$("#menuicon").prop("checked",true);
			$("div#mycontent").css({'transition':'all 0.5s','width':'88%','margin':'0 auto'});
			$("#side-expand").css({"background-color":"#4285f4","transition":"all 0.5s"});
			localStorage.setItem("sidebar_yn","1");
		}
       	
       	
       	
       	<%-- 
       	//입력값을 session에 저장하기
   		$.ajax({
   			url: "<%=ctxPath%>/sbcheck.up",
   			type:"post",
   			data:{"sidebar_yn":sidebar_yn},
   			dataType:"json",
   			success:function(json){
   			},
   			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
   			
   		});//end of ajax
   		 --%>
	});
       
	
	// 모두읽음 버튼을 클릭했을경우 
	$("#allreadbtn").click(()=>{
		$(".newala").each(function(){
			const amno = this.id
			console.log(amno)
	    	newreadY(amno);
			alarmList();
		})
	})
	
	
	// < 버튼 클릭시 이전페이지로 이동 
	 $('#se-searchicon').click(function(){
		sse_originIcon();
	}); 
	
    
	// 서치모달 닫힐 때 초기화
	$('#sideSearch').on('hidden.bs.modal', function () {
		 sse_originIcon();
	});
     
	
	/* 검색 해당 tr클릭시 url 이동  */
	// 한 줄 클릭시 해당 결재문서 상세보기로 이동
	
	
	
	// 한 줄 클릭시 해당 팀원의 상세보기로 이동
	<%-- $(".mem-tr").click(function(e){
		//if($(e.target).is("td:first-child, td:first-child *,td:last-child, td:last-child *")) return;
		var empno = $(this).attr("id");
		console.log(empno);
		location.href= "<%= ctxPath%>/memberInfo_hr.up?empno="+empno;
	}); --%>
	// 한 줄 클릭시 해당 메시지의 상세보기로 이동
	$(".msg-tr").click(function(e){
		//if($(e.target).is("td:first-child, td:first-child *,td:last-child, td:last-child *")) return;
		var mno = $(this).attr("id");
		console.log(mno);
		location.href= "<%= ctxPath%>/message.up?mno="+mno;
	});
	
	
	/* $(document).on({
		click: function(){
			
		}
	}, '.app-tr'); */
	
	
	
	 /* === 실시간알림 받아오기 === */
	   sock = new SockJS('<c:url value="/echo"/>');
	   	socket = sock;
	    // 데이터를 전달 받았을때 
	    sock.onmessage = onMessage; // toast 생성
	    
	});// end of $(document).ready(function(){})---------------
	
	// toast생성 및 추가
	function onMessage(evt){
	    let data = evt.data;
	    // toast
	    
		$("#alertText").html(data)
    	$("#alert_side").css('display','block');
	     setTimeout(function(){
	    	$("#alert_side").css('display','none');
	    }, 5000); 
		 
	    alarmList();
	};	
	
	
	
	
	
	// 알람리스트 불러오기 함수 
	function alarmList(){
		const empno = "${sessionScope.loginuser.employee_no}"; // 로그인 유저 
    	
    	// 안읽은 메시지 불러오기
		$.ajax({
			url : '<%= ctxPath%>/alarmList.up',
			type:"GET",
			data:{"empno":empno},
			dataType:"json",
			success : function(json){
				let html ='';
				let html2 ='';
				let text ='';
				let url = '';
				let cnt = 0;
				if(json.length > 0) { // 알림이 있는경우 새로운 알림마크 넣기
					$(".readAlarm").css('display','none');
					$(".newAlarm").css('display','none');
					$.each(json, function(index, item) {
						
						switch (item.ctgy) {
						case "1-1":
							text = item.from_empname + "님이 새로운 공지글을 게시했어요.";
							url = "<%= ctxPath%>/board?nbno="+item.linkno
							break;
						case "1-2":
							text = item.from_empname + "님이 댓글을 달았어요.";
							url = "<%= ctxPath%>/board?fbno="+item.linkno
							break;
						case "1-3":
							text = item.from_empname + "님이 대댓글을 달았어요.";
							url = "<%= ctxPath%>/board?fbno="+item.linkno
							break;
						case "2-1":
							text = item.from_empname + "님이 '"+ item.ctnt +"'의 승인을 요청했어요.";
							url = "<%= ctxPath%>/approval.up?ano="+item.linkno
							break;
						case "2-2":
							text = "'"+ item.ctnt + "'이 승인이 완료되었어요.";
							url = "<%= ctxPath%>/approval.up?ano="+item.linkno
							break;
						case "2-3":
							text = "'" + item.ctnt + "'이 반려되었어요.";
							url = "<%= ctxPath%>/approval.up?ano="+item.linkno
							break;
						case "3-1":
							text = item.from_empname + "님이 메시지를 남겼어요.";
							url = "<%= ctxPath%>/message.up?mno="+item.linkno
							break;
						}
						const registerdate = timeForToday(item.registerdate);
						if(item.readyn =="0"){ // 안읽은 알림 
							$(".newAlarm").css('display','block');
							$("span.newred").show();
							html += `<div class="newala" id="`+item.amno+`" onclick="alarmRead('`+url+`','`+item.amno+`');">`
							
						    html += '<span class="newsIcon" style="font-size: 9pt; position: relative; display: inline-block;">'
								 +'<span class="newred2"></span>'
						         +'<span class="icon icon-bell" style="color: #ffffff; position: absolute; left: 0px; bottom: 9px; font-size: 9pt;"></span>'
						         +'</span>'
						         +'<span id="news" style="padding-left:15px; position:relative; top:1px;">'
					            +'<span style="font-size: 9pt;font-weight: 500;color:#595959; display: inline-block;">'+text+'<br>'
					            +'<span style="font-size:6pt; font-weight:bold; color: #a6a6a6;">'+registerdate+'</span></span>'
					         	+'</span>'
						      	+'</div>'
						      	cnt++;
						}
						else{ // 읽은 알림 
							$(".readAlarm").css('display','block');
						
							html2 += `<div class="lastala" id="`+item.amno+`" onclick="alarmRead('`+url+`',event);">`
							html2 +='<span class="newsIcon" style="font-size: 9pt; position: relative; display: inline-block;">'
						         +'<span class="icon icon-bell" style="color: #ffffff; position: absolute; left: 0px; bottom: 9px; font-size: 9pt;"></span>'
						         +'</span>'
						         +'<span id="news" style="padding-left:15px; position:relative; top:1px;">'
					            +'<span style="font-size: 9pt;font-weight: 500;color:#595959; display: inline-block;">'+text+'<br>'
					            +'<span style="font-size:6pt; font-weight:bold; color: #a6a6a6;">'+registerdate+'</span></span>'
					         	+'</span>'
					      		+'</div>'
						}
						
					});
				}else{
					$(".newAlarm").css('display','block');
					html ="<div style='text-align:center'>알림이 없습니다.</div>";
				}
				    $("#newAlarmDiv").html(html)
				    $("#readAlarmDiv").html(html2)
				    $(".newCnt").text(cnt);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
	}
	
	// 알림 클릭시 함수(페이지이동, 새로운소식일경우 지난알림으로-> db에서 읽음처리 ) 
	function alarmRead(url,amno){
    	//console.log($("#"+amno).hasClass("newala"))
    	//console.log($("#"+amno).html())
//    	console.log($(this).hasClass("newala"))
//    	if($("#"+amno).hasClass("newala")==true){// 새로운 소식 분류일경우 읽음처리 해주기 
    	if($(this).hasClass("newala")==true){// 새로운 소식 분류일경우 읽음처리 해주기 
    		let n=newreadY(amno);
    		console.log(n);
    		//alarmList()
	    	location.href=url;
    	}else{// 지난알림일경우 페이지이동만 
    		location.href=url;
    	}
	}

	// 알림 읽음표시로 업데이트 해주는 ajax
	function newreadY(no){
		$.ajax({
			url : '<%= ctxPath%>/alarmRead.up',
			type:"GET",
			data:{"amno":no},
			dataType:"json",
			success : function(json){
				return json.result;
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
	}
	
	
	// 현재기준 알림 시간 구하기 함수  
	function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);
        //console.log("today => "+today)
        //console.log("timeValue => "+timeValue)
        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금 전';
        if (betweenTime < 60) {
            return betweenTime+'분 전';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+'시간 전';
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+'일 전';
        }
		
        return Math.floor(betweenTimeDay / 365)+'년 전';
 }
	
	
	$(document).mouseup(function(e){
		if( !(($(".news").has(e.target).length))){
		    $(".news").fadeOut(100);
		}
		if( !(($(".myprofile").has(e.target).length))){
		     $(".myprofile").fadeOut(100);
		}
		
	});
	

	
	// sidebar_searchEnd.jsp 에서 아이콘을 바꾸기 위한 함수
	function sse_changeIcon(){
		$(".ss-container").css('display','none');
		$("div.sse-container").css('display','block'); // 검색 div 보이기  
	   $("#se-icon-outer").css('display','none')
	   $("#se-searchicon").css('display','flex');
		/* $("#se-searchicon").removeClass("icon"); $("#se-searchicon").removeClass("icon-search");
		$("#se-searchicon").addClass("fas"); $("#se-searchicon").addClass("fa-chevron-left");
		 */
		$("#se-searchicon").hover(function(){
		 $("#se-icon-outer").css({"background-color":"rgba(230,230,230,0.4)","cursor":"pointer"});
		},function(){
		 $("#se-icon-outer").css({"background-color":"","cursor":""});  
		});
	}
   
   // 원래 아이콘으로 바꾸는 함수
   function sse_originIcon(){
	   $("#ss-input").val(""); //검색어 비우기
	   $("div.sse-container").css('display','none'); // 검색 div 숨기기 
		 $("div.sse-container table").css('display','none');;
		$("div.ss-container").css('display','block'); // 검색 카테고리 div보이기 
	   $("#se-icon-outer").css('display','flex')
	   $("#se-searchicon").css('display','none');
   }
   
	
	/*  === 실시간 검색 === */
	
	//구성원을 구하는 ajax
	function showEmpList(){
		const searchWord_side = $("#ss-input").val();
		$.ajax({
			url: "<%= ctxPath%>/searchEmpList.up",
			data: {"searchWord_side":searchWord_side},
			type: "get",
			dataType:"json",
			success:function(json){
				let html = '';
				if(json.length > 0 ){ //불러올 구성원목록이 있는 경우
					html+='<tr ><td colspan="3">구성원</td></tr>';
				
					$.each(json,function(index,item){
						
						html += '<tr id="'+item.employee_no+'" class="mem-tr">'
									+'<td width="10%">';
										/* '<div class="profile"  style="padding: 1px;">'; */
						if(item.profile_systemfilename != null){ // 프로필사진이 있는 경우
			                  html += '<span class="sbpics">'+
			                              '<img src="<%=ctxPath%>/resources/files/'+item.profile_systemfilename+'" width="38px" height="38px" style="border-radius: 13px; border: solid 1px rgba(0,0,0,0.1);">'+
			                           '</span>';
		               } else { // 프로필사진이 없는 경우
		                  html += '<span class="pic"><span>'+item.name_kr.substr(1,2)+'</span></span>';
		               }

						/* html += '<span class="pic"><span style="font-size:8pt">'+item.name_kr.substr(1)+'</span></span>'; */
						html += '</td>'			
						html +=	'<td width="85%">'+
											'<div>'+item.name_kr+'</div>'+
											'<div><span>'+item.role+'</span><span> '+item.position+'</span></div>'+
										'</span>'+
									'</td>'+
									'<td width="5%"><i class="fas fa-angle-right"></i></td></tr>';
					});//end of each
					
				} else {
					html = "<td colspan='5' style='text-align: center;display: block;margin-top: 60px;'><div style='display: flex;justify-content: flex-start;flex-direction: column;'>"
            	   		 +'<svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin: 0 auto;width: 48px; height: 48px; flex-shrink: 0;"><path d="M10.5956 3C6.40068 3 3 6.40068 3 10.5956C3 14.7906 6.40068 18.1913 10.5956 18.1913C12.3602 18.1913 13.9842 17.5896 15.2737 16.5801L19.6936 21L21 19.6936L16.5801 15.2737C17.5896 13.9842 18.1913 12.3602 18.1913 10.5956C18.1913 6.40068 14.7906 3 10.5956 3ZM4.84759 10.5956C4.84759 7.42107 7.42107 4.84759 10.5956 4.84759C13.7702 4.84759 16.3437 7.42107 16.3437 10.5956C16.3437 13.7702 13.7702 16.3437 10.5956 16.3437C7.42107 16.3437 4.84759 13.7702 4.84759 10.5956Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd"></path></svg>'
            	   		 +"<div style='font-weight: 700;font-size: 16px;line-height: 26px;color: #242a30;margin-top: 10px;'>"+searchWord_side+"에 대한 검색결과가 없어요.</div>"
            	   		 +"<div style='font-weight: 400;font-size: 13px;line-height: 21px;color: #556372;'>다른 검색어를 입력해주세요.</div></div>"
            	   		 +"<button onclick='emptysearchbar(event)'style='color: rgb(85, 99, 114);position: relative;cursor: pointer;display: inline-flex;align-items: center;justify-content: center;font-weight: 700;outline: none;border: none;font-size: 13px;border-radius: 6px;background: transparent;box-shadow: none;padding-left: 10px;padding-right: 10px; margin-top: 15px;'>검색어 지우기</button></td>";
				}
				
				$(".sse-member").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}//end of showEmpList
	//결재문서목록을 구하는 ajax
	function showAppList(){ /* 보낸사람, 받는사람 결재신청서종류, 제목  */
		const searchWord_side = $("#ss-input").val();
		$.ajax({
			url: "<%= ctxPath%>/searchAppList.up",
			data: {"searchWord_side":searchWord_side},
			type: "get",
			dataType:"json",
			success:function(json){
				let html = '';
				let writeday_d = '';
				if(json.length > 0 ){
					html+='<tr><td colspan="3">결재문서</td></tr>';
					$.each(json,function(index,item){
						writeday_d = getDayOfWeek(item.writeday_d);			
						html += '<tr id="'+item.ano+'" class="app-tr"><td width="10%">'
							+'<div style="display: flex; padding:6px; border-radius: 10px; border: solid 1px rgba(0,0,0,0.3); background-color: #FAF2E1;">'
							+'<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/spiral-notepad_1f5d2-fe0f.png" width="15px" style="margin: 5px; margin:auto;"/>'
							+'</div></td>'
							+'<td width="85%">'
							+'<div><span>'+item.name_kr+'</span>·<span>'+item.ap_type+'</span></div>'
							+'<div>'+item.writeday_d+' '+writeday_d+'</div>'
							+'</td><td width="5%"><i class="fas fa-angle-right"></i></td></tr>';
					});//end of each
					
				} else {
					html = "<td colspan='5' style='text-align: center;display: block;margin-top: 60px;'><div style='display: flex;justify-content: flex-start;flex-direction: column;'>"
            	   		 +'<svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin: 0 auto;width: 48px; height: 48px; flex-shrink: 0;"><path d="M10.5956 3C6.40068 3 3 6.40068 3 10.5956C3 14.7906 6.40068 18.1913 10.5956 18.1913C12.3602 18.1913 13.9842 17.5896 15.2737 16.5801L19.6936 21L21 19.6936L16.5801 15.2737C17.5896 13.9842 18.1913 12.3602 18.1913 10.5956C18.1913 6.40068 14.7906 3 10.5956 3ZM4.84759 10.5956C4.84759 7.42107 7.42107 4.84759 10.5956 4.84759C13.7702 4.84759 16.3437 7.42107 16.3437 10.5956C16.3437 13.7702 13.7702 16.3437 10.5956 16.3437C7.42107 16.3437 4.84759 13.7702 4.84759 10.5956Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd"></path></svg>'
            	   		 +"<div style='font-weight: 700;font-size: 16px;line-height: 26px;color: #242a30;margin-top: 10px;'>"+searchWord_side+"에 대한 검색결과가 없어요.</div>"
            	   		 +"<div style='font-weight: 400;font-size: 13px;line-height: 21px;color: #556372;'>다른 검색어를 입력해주세요.</div></div>"
            	   		 +"<button onclick='emptysearchbar(event)'style='color: rgb(85, 99, 114);position: relative;cursor: pointer;display: inline-flex;align-items: center;justify-content: center;font-weight: 700;outline: none;border: none;font-size: 13px;border-radius: 6px;background: transparent;box-shadow: none;padding-left: 10px;padding-right: 10px; margin-top: 15px;'>검색어 지우기</button></td>";
				}
				
				$(".sse-approval").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}//end of showAppList(){
	//메시지목록을 구하는 ajax
	function showMsgList(){ /*  작성자이름, 제목 , 보낸사람이름 */
		const searchWord_side = $("#ss-input").val();
		$.ajax({
			url: "<%= ctxPath%>/searchMsgList.up",
			data: {"searchWord_side":searchWord_side},
			type: "get",
			dataType:"json",
			success:function(json){
				let html = '';
				let sendtime_d = ''
				if(json.length > 0 ){
					html+='<tr class="not-active"><td colspan="3">메시지</td></tr>';
					$.each(json,function(index,item){
						sendtime_d = getDayOfWeek(item.sendtime_d);
						html += '<tr id="'+item.mno+'" class="msg-tr"><td width="10%">'
							 +'<div style="display: flex; padding:6px; border-radius: 10px; border: solid 1px rgba(0,0,0,0.3); background-color: rgba(66, 133, 244, 0.2);">'
									+'<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="15px" style="margin: 5px; margin:auto;"/>'
								+'</div></td>'
							+'<td width="85%">'
								+'<div><span>'+item.w_name+'</span> · <span>'+item.subject+'</span></div>'
								+'<div>'+item.sendtime_d+' '+sendtime_d+'</div></td>'
							+'<td width="5%"><i class="fas fa-angle-right"></i></td></tr>'
					});//end of each
					
				} else {
					html = "<td colspan='5' style='text-align: center;display: block;margin-top: 60px;'><div style='display: flex;justify-content: flex-start;flex-direction: column;'>"
            	   		 +'<svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin: 0 auto;width: 48px; height: 48px; flex-shrink: 0;"><path d="M10.5956 3C6.40068 3 3 6.40068 3 10.5956C3 14.7906 6.40068 18.1913 10.5956 18.1913C12.3602 18.1913 13.9842 17.5896 15.2737 16.5801L19.6936 21L21 19.6936L16.5801 15.2737C17.5896 13.9842 18.1913 12.3602 18.1913 10.5956C18.1913 6.40068 14.7906 3 10.5956 3ZM4.84759 10.5956C4.84759 7.42107 7.42107 4.84759 10.5956 4.84759C13.7702 4.84759 16.3437 7.42107 16.3437 10.5956C16.3437 13.7702 13.7702 16.3437 10.5956 16.3437C7.42107 16.3437 4.84759 13.7702 4.84759 10.5956Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd"></path></svg>'
            	   		 +"<div style='font-weight: 700;font-size: 16px;line-height: 26px;color: #242a30;margin-top: 10px;'>"+searchWord_side+"에 대한 검색결과가 없어요.</div>"
            	   		 +"<div style='font-weight: 400;font-size: 13px;line-height: 21px;color: #556372;'>다른 검색어를 입력해주세요.</div></div>"
            	   		 +"<button onclick='emptysearchbar(event)'style='color: rgb(85, 99, 114);position: relative;cursor: pointer;display: inline-flex;align-items: center;justify-content: center;font-weight: 700;outline: none;border: none;font-size: 13px;border-radius: 6px;background: transparent;box-shadow: none;padding-left: 10px;padding-right: 10px; margin-top: 15px;'>검색어 지우기</button></td>";
				}
				
				$(".sse-message").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});//end of ajax
	}//end of showAppList(){

	// 검색어 비우는 함수 
	function emptysearchbar(e){
		$("#ss-input").val(""); //검색어 비우기
		const category = $(e.target).parent().parent().attr("class");
		//console.log("category => "+category)
		
		switch (category) { // 재검색 
		case "sse-memeber":
			showEmpList();
			break;
		case "sse-approval":
			showAppList();
			break;
		case "sse-message":
			showMsgList();
			break;
		default:
			break;
		}
	}
	// 요일 구하는 함수 
	function getDayOfWeek(date){ //ex) getDayOfWeek('2022-06-13')
	    const week = ['일', '월', '화', '수', '목', '금', '토'];
	    const dayOfWeek = week[new Date(date).getDay()];
	    return dayOfWeek;
	}
	
	
	

	
	// 한 줄 클릭시 해당 문서 메시지 팀원의 상세보기로 url 이동
	$(document).on({
		//if($(e.target).is("td:first-child, td:first-child *,td:last-child, td:last-child *")) return;
		click: function(){
			var empno = $(this).attr("id");
			console.log(empno);
			location.href= "<%= ctxPath%>/memberInfo_hr.up?empno="+empno;
		}
	},".mem-tr");
	
	$(document).on({
		//if($(e.target).is("td:first-child, td:first-child *,td:last-child, td:last-child *")) return;
		click: function(){
			var appno = $(this).attr("id");
			console.log(appno);
			location.href= "<%= ctxPath%>/approval.up?ano="+appno;
		}
	},".app-tr");
	
	$(document).on({
		//if($(e.target).is("td:first-child, td:first-child *,td:last-child, td:last-child *")) return;
		click: function(){
			var msgno = $(this).attr("id");
			console.log(msgno);
			location.href= "<%= ctxPath%>/message.up?mno="+msgno;
		}
	},".msg-tr"); 
	
	
	
	
	
	function memberSearch(){
		// 구성원 정보 불러오기
		sse_changeIcon();
		$("div.sse-container table").css('display','none');;
		$(".sse-member").css('display','block');
		showEmpList();
		
		//검색어 입력할때마다 구성원정보 가져오기
		$("#ss-input").keyup(function(e){
			showEmpList();
		});//end of keyup
		
	}//end of goMemberSearch()
	
	function approvalSearch(){
		sse_changeIcon();
		$("div.sse-container table").css('display','none');
		$(".sse-approval").css('display','block');
		showAppList()
		
		//검색어 입력할때마다 구성원정보 가져오기
		$("#ss-input").keyup(function(e){
			showAppList()
		});//end of keyup
		
	}//end of goApprovalSearch()
	
	function messageSearch(){
		sse_changeIcon();
		$("div.sse-container table").css('display','none');
		$(".sse-message").css('display','block');
		showMsgList()
		
		//검색어 입력할때마다 구성원정보 가져오기
		$("#ss-input").keyup(function(e){
			showMsgList()
		});//end of keyup
		
	}//end of messageSearch()
	
</script>

 <div id="alert_side">
   <i class="fas fa-check-circle" style="color: #29a329; margin-right: 5px;margin-top: 10px;font-size: 11pt;"></i>
   <span id="alertText" style="bottom: 1px;font-size: 8.3pt;font-weight: 400;"></span>
</div>
<!-- <div id="msgStack"></div> -->
<input type="checkbox" id="menuicon">
  <label for="menuicon">
    <span></span>
    <span></span>
    <span></span>
  </label>
  <div class="sidebar" style="z-index: 100;">
    <div class="profile profile2" href="#" style="margin-top: 29px; margin-bottom:30px;">
      	<c:if test="${empty sessionScope.loginuser.profile_systemfilename }">
	      <span class="pic sbpics">
      		<span>${fn:substring(sessionScope.loginuser.name_kr,1,3)}</span>
	      </span>
      	</c:if>
      	<c:if test="${not empty sessionScope.loginuser.profile_systemfilename}">
      		<span class="pic sbpics" style="background-color: inherit; -webkit-mask-image: inherit; -webkit-mask-size: unset;">
      			<img src="<%=ctxPath%>/resources/files/${sessionScope.loginuser.profile_systemfilename}" width="38px" height="38px" style="border-radius: 13px; border: solid 1px rgba(0,0,0,0.1);">
      		</span>
      	</c:if>
      <span class="my"><span class="name">${sessionScope.loginuser.name_kr}</span><br>
      <span class="role">${sessionScope.loginuser.role}</span>
      </span>
    </div>

    <div class="nav-menu">
      <ul>
        <li class="home" data-bs-toggle="modal" data-bs-target="#sideSearch" data-bs-dismiss="modal" data-bs-backdrop="static"><a href="#" ><span class="icon icon-search"></span><span class="menu-text">검색</span></a></li>
        <li class="home" id="newsIcon"><a href="#" ><span class="icon icon-bell"></span><span class="menu-text">새로운 소식</span>
          <span class="newred"></span>
          <span class="badge" style="border-radius: 6.25rem;"><span class="newCnt">1</span></span></a></li>

        <div style="border: 0.1px solid #f2f2f2; margin:20px;width:120%;position:relative;left:-40px;"></div>
		<div class="sidebar_content">
	                   <li onclick="javascript:location.href='<%= request.getContextPath()%>/'"><a><span class="icon icon-home"></span><span class="menu-text">홈</span></a></li>
           <li onclick="javascript:location.href='<%=request.getContextPath()%>/memberList.up'"><a><span class="icon icon-users"></span><span class="menu-text">구성원</span></a></li>
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/schedule/scheduleManagement.up'"><a><span class="icon icon-calendar"></span><span class="menu-text">캘린더</span></a></li>
           <%-- <li onclick="javascript:location.href='<%= request.getContextPath()%>/support/meetingroom.up'"><a><span class="far fa-handshake" style="margin-left: 10px;"></span><span class="menu-text" style="margin-left: 5px;">회의실예약</span></a></li> --%>
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/message.up'"><a><span class="icon icon-envelop"></span><span class="menu-text">메시지</span></a></li>
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/attendance.up'"><a><span class="icon icon-alarm"></span><span class="menu-text">근무</span></a></li>
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/board_all.up'"><a><span class="icon icon-pencil2"></span><span class="menu-text">게시판</span></a></li>
           
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/approval.up'"><a><span class="icon icon-file-text2"></span><span class="menu-text">결재</span></a></li>
           <%-- 
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/payroll.up'"><a><span class="icon icon-coin-dollar"></span><span class="menu-text">급여</span></a></li>
            --%>
           
           <%-- 관리자로 로그인했을경우에만 --%>
           <c:set var="logat" value="${sessionScope.loginuser.authority}"/>
           <c:if test="${logat==3 || logat==6 || logat==12 || logat==15 || logat==21 || logat==24 || logat==30 || logat==42 || logat==60 || logat==84 || logat==105 || logat==120 || logat==210 || logat==420 || logat==840 || logat==99}">
              <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_memberList.up'"><a><span class="icon icon-user-tie"></span><span class="menu-text">구성원관리</span></a></li>
           </c:if>
           <c:if test="${logat==7 || logat==14 || logat==20 || logat==21 || logat==28 || logat==35 || logat==42 || logat==56 || logat==70 || logat==84 || logat==105 || logat==140 || logat==210 || logat==280 || logat==420 || logat==840 || logat==99}">
              <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_attendanceList_holding.up'"><a><span class="icon icon-briefcase"></span><span class="menu-text">근태관리</span></a></li>
           </c:if>
           <%-- 
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_insight.up'"><a><span class="icon icon-stats-dots"></span><span class="menu-text">인사이트</span></a></li>
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_login.up'"><a><span class="icon icon-history"></span><span class="menu-text">로그관리</span></a></li>
           <li onclick="javascript:location.href='<%= request.getContextPath()%>/admin_payroll.up'"><a><span class="icon icon-magic-wand"></span><span class="menu-text">급여정산</span></a></li>
            --%>
     	</div>
      </ul> 
    </div>
  </div>
  
  <div id="list-example" class="list-group myprofile" style="display:none; width: 200px; border-radius: 10px; position: fixed; top: 13.5%; left: 1%; z-index: 100; box-shadow: 0px 15px 20px 0px rgba(0,0,0,0.1);">
     <a class="list-group-item list-group-item-action" href="<%= request.getContextPath()%>/memberInfo_hr.up?empno=${sessionScope.loginuser.employee_no}" style="font-size: 14px; cursor: pointer;">
        <i class="far fa-user-circle" style="padding-right: 8px; font-size: 11pt;"></i>
        <span style="font-weight: bold; font-size: 9pt; margin-bottom: 3.5px;">내 프로필</span><br>
        <span style="font-size: 8.5pt; color: #737373;">${sessionScope.loginuser.email}</span><br>
        <span style="font-size: 8.5pt; color: #737373; padding-bottom: 3px; ">${sessionScope.loginuser.role}</span><br>
     </a>
     <a id="side-expand-a" class="list-group-item list-group-item-action" style="font-size: 9pt; cursor: pointer;">
        <i class="icon icon-enlarge" style="color: #666666; padding-right: 8px; font-size: 10pt; position:relative; top:1px;"></i>넓게보기
        <div id="side-expand"><input type="checkbox" id="side-expandcx" style="display: none;"/><label for="side-expandcx"></label></div>
     </a>
     <a class="list-group-item list-group-item-action" style="font-size: 9pt; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#userPwdChange" data-bs-dismiss="modal" data-bs-backdrop="static">
        <i class="fas fa-key" style="color: #666666; padding-right: 8px; font-size: 10pt;"></i>비밀번호 변경
     </a>
     <a class="list-group-item list-group-item-action" href="<%= ctxPath%>/logout.up" style="font-size: 9pt; color: #F24B17; cursor: pointer;"><i class="fas fa-sign-out-alt" style="transform: scaleX(-1); transition: .3s; padding-left: 8px; font-size: 10pt;"></i>로그아웃</a>
  </div>
    
    
   <div class="news" style="overflow-y: auto">
      <div  class="newAlarm">새로운 소식
         <button id="allreadbtn" >모두읽음</button>
	     <div id="newAlarmDiv" style="margin-top: 20px;"></div>
      </div>
      <div class="readAlarm">지난 알림
      	  <div id="readAlarmDiv" style="margin-top: 20px;"></div>
      </div>
      
   </div>
    
    
    
    <%-- **** 비밀번호 변경 Modal **** --%>
    <div class="modal fade" id="userPwdChange" style="background-color: rgba(240, 240, 240, 0.85);" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> <%-- 아이디찾기 a 태그의 data-target="#userPwdFind" data-dismiss="modal" 와 매핑됨. --%>
     <div class="modal-dialog">
       <div class="modal-content" style="border:none;border-radius: 15px;height: 380px;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 4%), 0px 24px 72px rgb(36 42 48 / 30%);">
         <!-- Modal header -->
         <div class="modal-header" >
	         <h4 class="modal-title" id="modarTitle" style="font-weight: bold; color: #595959; margin: 6px 0 0 70px;">비밀번호 변경</h4><br>
	         <button id="pwdFindClose" type="button"  class="pwdFindClose btn" data-bs-dismiss="modal" style="transition: transform 0.1s ease 0s;border: none;background-color: transparent;">
			<svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 26px; height: 26px; flex-shrink: 0;">
			<path d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21ZM15.5303 15.5303C15.2374 15.8232 14.7626 15.8232 14.4697 15.5303L12.0001 13.0607L9.53033 15.5304C9.23744 15.8233 8.76256 15.8233 8.46967 15.5304C8.17678 15.2376 8.17678 14.7627 8.46967 14.4698L10.9394 12.0001L8.46968 9.53033C8.17679 9.23744 8.17679 8.76256 8.46968 8.46967C8.76257 8.17678 9.23745 8.17678 9.53034 8.46967L12.0001 10.9394L14.4697 8.46978C14.7626 8.17689 15.2374 8.17689 15.5303 8.46978C15.8232 8.76268 15.8232 9.23755 15.5303 9.53044L13.0607 12.0001L15.5303 14.4697C15.8232 14.7626 15.8232 15.2374 15.5303 15.5303Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd">
			</path></svg></button>
         </div>
         
         <!-- Modal body -->
         <div class="modal-body">
         <div id="pwdChange">
            <iframe id="iframe_pwdChange" style="border: none; width: 100%; height: 250px;" src="<%= request.getContextPath()%>/pwdChange.up"></iframe>
         </div>
         </div>
         
       </div>
     </div>
   </div>
   
   
   <%-- **** 검색 Modal **** --%>
	<div class="modal fade" id="sideSearch" style="background-color: rgba(240, 240, 240, 0.85);" aria-hidden="true" aria-labelledby="mw-address-label" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="overflow-y: hidden;border:none;border-radius: 15px;height: 400px;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 4%), 0px 24px 72px rgb(36 42 48 / 30%);">
		  		<!-- <div id="mwa-container"> -->
					<%-- <iframe id="mwa" style="border: none; width: 100%; height: 250px;" src="<%= request.getContextPath()%>/side/search.up"></iframe> --%>
				<div class="modal-header" style="justify-content: flex-start;position: sticky;top: 0px;z-index: 2;background-color: white;border-top-left-radius: 15px;border-top-right-radius: 15px;">
					<span id="se-icon-outer" style="margin: 4px 0 0 10px; color: rgba(0,0,0,0.7); padding: 5px 10px; border-radius: 10px;">
						<div style="display: flex; opacity: 1; transform: none;">
							<svg id="ss-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px; height: 20px; flex-shrink: 0;"><path d="M13.6646 1.5L5.25497 13.3399L6.00001 14.6804H10.3789L8.71888 21.8329L10.3428 22.5L18.7452 10.6601L18 9.31989H13.622L15.2881 2.16807L13.6646 1.5Z" fill="#556372" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
						</div>
					</span>
					<span id="se-searchicon" >
						<div style="display: flex; opacity: 1; transform: none;">
							<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px; height: 20px; flex-shrink: 0;"><path d="M14.2172 6.43433L15.3485 7.5657L10.9142 12L15.3485 16.4343L14.2172 17.5657L8.65147 12L14.2172 6.43433Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
						</div>
					</span>
					<div style="display: inline-block;">
						<input id="ss-input" type="text" placeholder="검색어 입력"/>
					</div>
				</div>
				
				<div class="modal-body"style="overflow-y: auto;" >
				
					 <div class="ss-container"> 
						<table class="ss-table">
							<tbody>
								<tr id="membertr" onclick="memberSearch()">
									<td width="2%" style="background-color: transparent;"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="flex-shrink: 0;"><path d="M6 6.75C6 4.54086 7.79086 2.75 10 2.75C12.2091 2.75 14 4.54086 14 6.75C14 8.95914 12.2091 10.75 10 10.75C7.79086 10.75 6 8.95914 6 6.75ZM10 4.59615C8.81046 4.59615 7.84615 5.56046 7.84615 6.75C7.84615 7.93954 8.81046 8.90385 10 8.90385C11.1895 8.90385 12.1538 7.93954 12.1538 6.75C12.1538 5.56046 11.1895 4.59615 10 4.59615Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path><path d="M11.5291 20.15H3.4L2.5 19.25V19.134C2.5 16.8508 3.55787 14.6965 5.36451 13.3004C6.65544 12.3029 8.24081 11.7617 9.87225 11.7617H10.4486C10.663 11.7617 10.8765 11.7715 11.0885 11.7909C10.633 12.3097 10.2656 12.9077 10.0098 13.5617H9.87225C8.63914 13.5617 7.44086 13.9707 6.46511 14.7247C5.30863 15.6184 4.55808 16.9231 4.35538 18.35H10.1943C10.5238 19.0318 10.9788 19.6418 11.5291 20.15Z" fill="currentColor"></path><path d="M11.5 15.5743C11.5 13.1861 13.4361 11.25 15.8243 11.25C18.2125 11.25 20.1486 13.1861 20.1486 15.5743C20.1486 16.4596 19.8826 17.2827 19.4261 17.9681L21.5 20.042L20.292 21.25L18.2181 19.1761C17.5327 19.6326 16.7096 19.8986 15.8243 19.8986C13.4361 19.8986 11.5 17.9625 11.5 15.5743ZM15.8243 12.9584C14.3796 12.9584 13.2084 14.1296 13.2084 15.5743C13.2084 17.019 14.3796 18.1902 15.8243 18.1902C17.269 18.1902 18.4402 17.019 18.4402 15.5743C18.4402 14.1296 17.269 12.9584 15.8243 12.9584Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></td>
									<td width="93%" style="background-color: transparent;">구성원 검색</td>
									<td width="5%" style="display: none; background-color: transparent;"><i class="fas fa-angle-right" aria-hidden="true"></i></td>
								</tr>
								<tr id="approvaltr" onclick="approvalSearch()">
									<td style="background-color: transparent;"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="flex-shrink: 0;"><path d="M4.80899 20.9999L4 20.1817V3.81809L4.80899 2.99991H14.6966L15.2687 3.23955L19.7631 7.785L20 8.36354V11.0091C19.4999 10.738 18.9562 10.5371 18.382 10.4197V9.13627H14.6966L13.9326 8.36354V4.63627H5.61798V19.3635H12.2234C12.6325 20.0039 13.1619 20.56 13.7798 20.9999H4.80899ZM17.2829 7.59082L15.4607 5.74789V7.59082H17.2829Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path><path d="M13 16.1946C13 13.878 14.878 12 17.1946 12C19.5112 12 21.3891 13.878 21.3891 16.1946C21.3891 17.0533 21.1311 17.8517 20.6883 18.5166L22.7 20.5283L21.5283 21.7L19.5166 19.6884C18.8517 20.1311 18.0533 20.3892 17.1946 20.3892C14.878 20.3892 13 18.5112 13 16.1946ZM17.1946 13.6571C15.7932 13.6571 14.6571 14.7932 14.6571 16.1946C14.6571 17.596 15.7932 18.732 17.1946 18.732C18.596 18.732 19.732 17.596 19.732 16.1946C19.732 14.7932 18.596 13.6571 17.1946 13.6571Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></td>
									<td style="background-color: transparent;">결재문서 검색</td>
									<td style="display: none; background-color: transparent;"><i class="fas fa-angle-right" aria-hidden="true"></i></td>
								</tr>
								<tr id="messagetr" onclick="messageSearch()" style="border: none;">
									<td style="background-color: transparent;"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="flex-shrink: 0;"><path d="M12.809 13.7272V16.5454H11.191V13.7272H8.40452V12.0908H11.191V9.27264H12.809V12.0908H15.5955V13.7272H12.809Z" fill="currentColor"></path><path d="M4.80899 20.9999L4 20.1817V3.81809L4.80899 2.99991H14.6966L15.2687 3.23955L19.7631 7.785L20 8.36354V20.1817L19.191 20.9999H4.80899ZM5.61798 4.63627V19.3635H18.382V9.13627H14.6966L13.9326 8.36354V4.63627H5.61798ZM17.2829 7.59082L15.4607 5.74789V7.59082H17.2829Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></td>
									<td style="background-color: transparent;">메시지 검색</td>
									<td style="display: none; background-color: transparent;"><i class="fas fa-angle-right" aria-hidden="true"></i></td>
								</tr>
							</tbody>
						</table>
						<!-- <br> -->
						<!-- <table class="hi-container mt-3">			
							<th style="font-weight: 500;font-size:5pt;cursor: default;"colspan="3" height="15px">
								<span style="color: rgb(85, 99, 114);float: left;cursor: default;">최근 검색</span>
								<span id="alldel"style="float: right;color: #d4d4d4;cursor: pointer;">전체 삭제</span>
							</th>
							<tr>
								<td width="5%"><i style="color: #cdcdcd;width: 22px;height: 19px;"class="icon icon-search"></i></td>
								<td width="90%">게시판 검색</td>
								<td width="5%"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 18px; height: 18px; flex-shrink: 0;"><path d="M12 13.2728L17.0205 18.2933L18.2932 17.0205L13.2728 12L18.2932 6.97954L17.0205 5.70675L12 10.7272L6.97954 5.70675L5.70675 6.97954L10.7272 12L5.70675 17.0205L6.97954 18.2932L12 13.2728Z" fill="#cdd2d6"></path></svg></td>
							</tr>
						</table> -->
					</div>
					<div class="sse-container">
						<!-- 구성원 검색 -->
						<table class="sse-member"></table>
						
						<!-- 전자결재 검색 -->
						<table class="sse-approval"></table>
						
						<!-- 메시지 검색 -->
						<table class="sse-message"></table>
					</div>
				</div>
				
				
				
				
			</div>
					
			<!-- </div> -->
		</div>
	</div>