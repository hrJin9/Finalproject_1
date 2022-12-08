<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<style type="text/css">
	/* 페이지 전체 레이아웃 */
	.big::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	
	.big::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
		background-color: rgba(0,0,0, 0.3);  /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	
	.big::-webkit-scrollbar-track {
		background-color: rgba(242, 242, 242); /*스크롤바 뒷 배경 색상*/
	}

	
	.member_container {
		width: 88%;
		margin: 0 auto;
		overflow: hidden;
	}
	
	#admin_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	#admin_mainList {
		position: relative;
		display: flex;
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	}
	
	#admin_mainList a {
		display: block;
		width: 24%;
		padding: 0.7em 0 0.3em 0;
		text-decoration: none;
		margin-right: 4%;
		color: #4d4f53;
	}
	
	/* 검색 */
	#searchCondition {
	    display: block;
	    width: 100%;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #212529;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: 0.25rem;
	}

	.form-control{
		font-size: 12pt;
	}
	.row >*{
		width: auto;
		padding: 0;
	}
	
	.arrayIcon, .groupIcon {
		border: 1px solid #f7f7f7;
		padding: 15px;
		margin-bottom: 20px;
		margin-right: 10px;
		width: 18px;  
		height: 18px; 
		border-radius: 10px;
		float: left;
		
		display: block; 
		position: relative; 
		font-size: 9pt; 
		background-color: #f7f7f7;
	} 
	
	.positionIcon {
		border: 1px solid #f7f7f7;
	    margin-left: 25px;
	    padding: 9px 23px 9px 0;
	    margin-top: 5px;
	    text-align: right;
	    width: 163px;
	    height: 38px;
	    border-radius: 10px;
	    float: left;
	    font-size: 9.5pt;
	    background-color: #f7f7f7;
	} 

	/* 구성원 테이블 */
	.custom-table {
		thead {
			tr, th {
				border-top: none;
				border-bottom: none!important;
			}
		}
		tbody {
			th, td {
				color: #777;
			}
		}
	}
	
	.table>:not(caption)>*>* {
	    padding: 0.7srem 0.5rem;
	    background-color: var(--bs-table-bg);
	    border-bottom-width: 1px;
	    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
	}
	
	.contentsmargin {
		margin: 0 80px;
	}
	
	.chkboxpnum {
	    margin: 15px;
	}
	
	.profile{
     color: inherit;
     border-radius: 8px;
     position: relative;
     cursor: pointer;
     padding: 1px 13px;
     text-align: initial;
     display: flex;
   }
	
	#message {
	    border: 0.3px solid #d9d9d9;
	    margin-right: 10px;
	    margin-left: 10px;
	    padding: 3.5px 6.5px 3.5px 6.5px;
	    background-color: white;
	    border-radius: 3px;
	    font-size: 10pt;
	}
	#ml-cancel{
		height: 27px;
        width: 40px;
	    color: #4d4f53;
	    font-size: 10pt;
	    padding: 2px;
	    font-weight: 600;
	    border: solid 1px #d9d9d9;
	}
	
	.ml-checkmenu{
		margin: 0px 12px 0px 23px;
	}
	
	/* 	.table td{
		font-size: 10pt;
	    border-bottom: 1px solid #eef2f6;
	    padding-left: 22px;
	} */
	
	.table {
	    color: #4c4e54;
	}
	table tr:hover {
		background-color: #f4f8f9;
	}


	/* 조직도 */
	.menu {
		position: absolute;
        top: 45px;
	    right: 0;
	    height: 100vh;
	    max-width: 0;
	    z-index: 1;
	    background-color: white;
	    border: none;
	}
	
	.burger-icon {
	    cursor: pointer;
	    display: inline-block;
	    position: absolute;
	    z-index: 2;
	    padding: 8px 0px;
	    top: 5px;
	    right: 6px;
	    user-select: none;
	    width: auto;
	    margin: 0;
	}
	
	.burger-icon .burger-sticks {
	  background: #333;
	  display: block;
	  height: 2px;
	  position: relative;
	  transition: background .2s ease-out;
	  width: 18px;
	}
	
	.burger-icon .burger-sticks:before,
	.burger-icon .burger-sticks:after {
	  background: #333;
	  content: '';
	  display: block;
	  height: 100%;
	  position: absolute;
	  transition: all .2s ease-out;
	  width: 100%;
	}
	
	.burger-icon .burger-sticks:before {
	  top: 5px;
	}
	
	.burger-icon .burger-sticks:after {
	  top: -5px;
	}
	
	.burger-check {
	  display: none;
	}
	
	.burger-check:checked~.menu {
	    max-width: 325px;
	    border: 1px solid #eeeeee;
	}
	
	.burger-check:checked~.burger-icon .burger-sticks {
	  background: transparent;
	}
	
	.burger-check:checked~.burger-icon .burger-sticks:before {
	  transform: rotate(-45deg);
	}
	
	.burger-check:checked~.burger-icon .burger-sticks:after {
	  transform: rotate(45deg);
	}
	
	.burger-check:checked~.burger-icon:not(.steps) .burger-sticks:before,
	.burger-check:checked~.burger-icon:not(.steps) .burger-sticks:after {
	  top: 0;
	}
	
	.table>:not(:first-child){
		border-top: solid 1px #eeeeee !important;
	}
	
	.orgmenu {
		cursor: pointer;
		text-decoration: none;
		list-style: none;
		color: #556372;
	    font-size: 10.5pt;
    	/* line-height: 2px; */
	}
	
	li {
		line-height: 24.2px;
	}
	
	li::marker {
	    color: #cccccc;
	    font-size: 12pt;
	}
	
	.summary {
		padding-bottom: 8px; 
		/* font-weight: bold;  */
		font-size: 11pt;
		color: #4C4E54;
	}
	
	.unfold {
		padding-top: 10px;
		font-weight: bold;
		font-size: 10pt;
		color: #4c4e54;
		position: relative;
	}
	
	#cntbadge{
	    background-color: #e6e6e6;
	    padding: 0.5em 0.5em;
	    width: 12.5px;
	    height: 15px;
	    font-weight: 600;
	    color: #fbfbfb;
	    display: inline-block;
	    border-radius: 0.25rem;
	    box-shadow: inset 0px 0px 0px 1px rgb(0 0 0 / 4%);
	    position: relative;
	    top: 9.3px;
	    left: 5px;
	}
	  #newCnt{
	    font-size: 5pt;
	    color: #4C4E54;
	    position: relative;
	    top: -10px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-shrink: 0;
	    isolation: isolate;
   }
   
   .unfoldAlert {
   		border: 1px solid #f7f7f7;
	    padding: 6.3px;
	    text-align: center;
	    width: 106px;
	    height: 30px;
	    border-radius: 8px;
	    background-color: #4d4d4d;
	    color: #f2f2f2;
	    font-size: 8.5pt;
	    position: relative;
	    top: 1.3px;
	    left: 194px;
   }
	
</style>

<script type="text/javascript">

//체크박스 개수
var total = $("input[name='memberChx']").length;

$(document).ready(function(){
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	// 구성원 정보 불러오기
	showEmpList();
	
	//검색어 입력할때마다 구성원정보 가져오기
	$(document).on('keyup',"#searchVal",function(e){
		$("#memberAll").prop("checked",false);
		$("input:checkbox[name='memberChx']").prop("checked",false);
		show_noncheckmenu();
		showEmpList();
	});//end of keyup
	
	
	//팀이름 클릭시 해당 팀 사람 불러오기
	$(document).on('click','.orgmenu',function(e){
		//체크박스 해제시키기
		$("#memberAll").prop("checked",false);
		$("input:checkbox[name='memberChx']").prop("checked",false);
		show_noncheckmenu();
		
		let teamVal = $(e.target).attr("id");
		$("#searchVal").val("");
		showEmpList(teamVal);
	});
	
	// 전체개수 값
	const allCnt = $("input:checkbox[name='memberChx']").length;  // 체크여부 상관없는 모든 체크박스개수
	document.getElementById("memberCnt").textContent = allCnt;
	
	// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
	$(document).on('change',"#memberAll",function(){
		if($("#memberAll").is(":checked")){
			var total = $("input[name='memberChx']").length;
			$("input[name='memberChx']").prop("checked",true);
			show_checkmenu();
			$("#check_ctn").text(total);
		} else {
			$("input[name='memberChx']").prop("checked",false);
			show_noncheckmenu();
		}
	});
	
	$(document).on('change',"input[name='memberChx']",function() {
		//체크박스 선택
		check_one(); 
	});
	
	// 취소 버튼 누를시 선택 모두 해제, 값 삭제하기
	$(document).on('click',"#ml-cancel",function(){
		$("input[name='memberChx']").prop("checked",false);
		$("#memberAll").prop("checked",false);
		show_noncheckmenu();
	});
	
	
	// 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기
	$("input#burger-check").change(function(){
	    if($("#burger-check").is(":checked")){
	        $(".big").css({'width':'72.6%','position':'relative','top':'24px'});
	        $(".menucontent").css({'visibility':'visible','transition':'all .2s'});
	    }else{
	        $(".big").css({'width':'100%','top':'0'});
	        $(".menucontent").css({'visibility':'hidden','transition':'all .2s'});
	    }
	});  
	
	// 모든 조직 펼치기
	$(".unfold").click(function(){  // 조직도 확대 아이콘 클릭시
		$(".summary").click();      // 모든 조직의 summary 클릭
	});
	
	
	// 메시지 전송 이벤트
	$("#message").click(function(){
		var selectedList = $("input[name='memberChx']:checked");
		var empnoArr = new Array();
		selectedList.each(function(index,item){
			var empno = $(item).parent().parent().attr("id");
			empnoArr.push(empno);
		});
		var str_empno = empnoArr.join(",");
		
		location.href="<%=ctxPath%>/message/write.up?to="+str_empno;
	});
	
	
	// 한 줄 클릭시 해당 팀원의 상세보기로 이동
	$(document).on("click",".mem-tr",function(e){
		if($(e.target).is("td:first-child, td:first-child *,td:last-child, td:last-child *")) return;
		var empno = $(this).attr("id");
		console.log(empno);
		location.href= "<%= ctxPath%>/memberInfo_hr.up?empno="+empno;
	});
	
	
	
});// end of$(document).ready(function(){})--------------------------

///////////////////////////////////////////////////////////////////
	      
// Function declaration


//체크시 나타나는 메뉴
function show_checkmenu(){
	$(".ml-noncheckmenu").hide();
	$(".ml-checkmenu").fadeIn("fast");
}//end of show_checkmenu

// 체크안되었을때 나타나는 메뉴
function show_noncheckmenu(){
	$(".ml-checkmenu").hide();
	$(".ml-noncheckmenu").fadeIn("fast");
}//end of show_noncheckmenu


//체크박스 하나 체크 이벤트
function check_one(){
	var total = $("input[name='memberChx']").length;
	var checked = $("input[name='memberChx']:checked").length;

	if(checked<=0) {
		$("#memberAll").prop("checked", false);
		show_noncheckmenu();
	}
	
	if(total != checked){
		$("#memberAll").prop("checked", false);
		show_checkmenu();
		$("#check_ctn").text(checked);
		
	} else {
		$("#memberAll").prop("checked", true); 
		show_checkmenu();
		$("#check_ctn").text(checked);
	}
	
}//end of check_one

//체크박스 전체개수값 구해오기
function totalChx(){
	const allCnt = $("input:checkbox[name='memberChx']").length;  // 체크여부 상관없는 모든 체크박스개수
	$("#memberCnt").text(allCnt);
}//end of totalChx


//구성원을 구하는 ajax
function showEmpList(teamVal){
	
	const searchCondition = $("#searchCondition").val();
	const searchVal = $("#searchVal").val();
	
	$.ajax({
		url: "<%= ctxPath%>/showEmpList.up",
		data: {"searchCondition":searchCondition,
				"searchVal":searchVal,
				"teamVal":teamVal},
		type: "post",
		dataType:"json",
		success:function(json){
			//console.log(JSON.stringify(json));
			
			let html = '';
			if(json.length > 0 ){ //불러올 구성원목록이 있는 경우
				
				$.each(json,function(index,item){
					
					html += '<tr id="'+item.employee_no+'" class="mem-tr">'+
								'<td><input type="checkbox" name="memberChx" class="'+item.department_name+'" id="'+item.name_kr+'" value="'+item.employee_no+'"/></td>'+
								'<td>'+
									'<div class="profile" href="#" style="padding: 1px;">';
					if(item.profile_systemfilename != null){ // 프로필사진이 있는 경우
						
					} else { // 프로필사진이 없는 경우
						html += '<span class="pic"><span>지은</span></span>';
					}
										
					html +=	'<span class="my">'+
											'<span class="name" style="font-size: 10.8pt;">'+item.name_kr+'</span><br>'+
											'<span class="role" style="font-size: 9pt;">'+item.role+'</span>'+
										'</span>'+
									'</div>'+
								'</td>'+
								'<td>';
					if(item.employee_no == 1){ //사장(대표)인 경우
						html +=	'<span class="positionIcon">'+
											'<span>'+item.position+'</span>'+
										'</span>'+
									'</td>'+
								'</tr>';
						
					} else{
						html +=	'<span class="positionIcon">'+
										'<span>'+item.department_name+' '+item.team_name+'&nbsp;|&nbsp;'+item.position+'</span>'+
									'</span>'+
								'</td>'+
							'</tr>';
					}
				});//end of each
				
				
			} else {
				html = '<tr><td width="100%" style="font-size: 11pt; border-bottom: none;">조회된 구성원이 없습니다.</td></tr>';
			}
			
			$("#empList").html(html);
			totalChx();
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
}//end of showEmpList

	   
	   
</script>
<nav id="admin_mainList" class="margin-container">
	<a id="memberInfo_mainList" class="header-nonsub">구성원</a>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div class="member_container">
	<form action="#" class="booking-form ml-3" style="float: right;">
		<div class="row" style="padding-top: 11px;">
			<%-- 검색 --%>
			<div class=" mr-2">
				<div class="form-group">
					<div class="form-field">
						<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 12px;">
							<option value="name_kr" selected>이름</option>
							<option value="department_name">부서</option>
							<option value="team_name">팀</option>
							<option value="role">직무</option>
							<option value="position">직위</option>
						</select>
					</div>
				</div>
			</div>
			<div>
				<div class="form-group">
					<div class="form-field" style="padding-left:5px; margin-right: -9px;">
						<input id="searchVal" type="text" class="form-control" placeholder="검색" style="width:90%; font-size: 9pt; padding:6px 12px;">
					</div>
				</div>
			</div>
			<div class="align-items-end mt-1 mr-4">
				<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
					<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 11.5%;"></a>
				</div>
			</div>
			<div>
				<span class="arrayIcon">
					<span><ion-icon name="swap-vertical-outline" style="position: absolute; left: 7px; bottom:7px; font-size: 12pt;"></ion-icon></span>
	            </span>
			</div>
			<div>
				<span class="groupIcon">
					<input class="burger-check" type="checkbox" id="burger-check" />
					<label class="burger-icon" for="burger-check"><span class="burger-sticks"></span></label>
					<div class="menu" style="margin-top:6px;">
						<div class="menucontent" style="width: 340px; visibility: hidden; padding: 27px 0px 10px 38px; height: 500px; overflow-y: auto;">
							<div style="font-size: 12pt; font-weight: bold; color: #4C4E54; padding-bottom: 27px;">
								<span style="padding-right: 190px;">조직도</span>
								<span><i class="fas fa-expand-alt unfold"></i></span>
								<span class="unfoldAlert">모든 조직 펼치기</span> <%-- 호버 이벤트시 jQuery 효과주기 --%>
							</div>
							<div style="width:250px;">
								<div id="" class="orgmenu" style="font-size: 11pt;font-weight: 700; color: #4C4E54; margin-bottom: 5px;">전체</div>
								<c:forEach var="dept" items="${requestScope.deptvoList}">
									<details>
										<summary class="summary">${dept.department_name}</summary>
									   	<ul id="${dept.department_no}" class="deptno">
									   		<c:forEach var="dt" items="${requestScope.dtList}">
									   			<c:if test="${dept.department_no == dt.department_no}">
									   				<li><a id="${dt.team_no}" class="orgmenu">${dt.team_name}</a><span id="cntbadge" ><span id="newCnt">${dt.total}</span></span></li>
									   			</c:if>
									   		</c:forEach>
									    </ul>
									</details>
								</c:forEach>
							</div>
						</div>
					</div>
	            </span>
			</div>
		</div>
	</form>
		
	<%-- 전체 구성원 --%>
	<div style="margin:15px 0 0 8px; float: left; color: #4d4f53; font-weight: 700;">
		<input type="checkbox" id="memberAll"/>
		<span style="margin: 0 12px 0 23px;" class="ml-noncheckmenu">
			<span>전체 &nbsp; <span style="color:#4285f4;" id="memberCnt"></span>명</span>
		</span>
		<span class="ml-checkmenu" style="display: none;">
			<span id="check_ctn" style="color: #4285f4;"></span>명 선택
			<button type="button" id="message" style="font-size: 9.5pt" class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="메시지 보내기"><span><i class="far fa-envelope"></i></span></button>
			<button type="button" id="ml-cancel" class="btn">취소</button>
		</span>
	</div>
	<div class="big" style="height: 500px; overflow-y: auto; width: 100%;">
	 	<table class="table custom-table" style="float: left;">
	       <colgroup>
		          <col width="5px" />
		          <col width="650px" />
		          <col width="220px" />
	      	</colgroup>
	     	<tbody id="empList">
	         </tbody>
	 	</table>
	</div>
</div>
