<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>   

<title>Thumbs up</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- jQueryUI CSS 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- *** ajax로 파일을 업로드할때 가장 널리 사용하는 방법 ==> ajaxForm *** --%>
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

<!-- 혜린style.css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/hyerin.css?after">

<!-- calendar CSS, js -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/calendar.css">

<script src='<%= ctxPath%>/resources/js/calendar.js'></script>

<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- pretendard-font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />

<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<style type="text/css">
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
   body{font-family: 'Pretendard'; font-weight: 500; overflow-x: hidden; }
		
	#memberInfo_mainList {
		position: relative;
	    display: flex;
	    width: 11%;
	    font-size: 18pt;
	    font-weight: bold;
	    margin: 4px 0 0 70px;
	    padding: 0.8em 0 0.8em 0;
	    color: #333;
	}

	hr.memberInfohr{
		width: 100%;
		background-color: rgba(0,0,0, .3) !important;
		border: none; 
		height: 1px;
		margin-top: 0px;
	}
	
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
	    padding: 9px;
	    margin-top: 5px;
	    text-align: center;
	    width: 160px;
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
	    margin-top: 15px;
	    margin-right: 84px;
	    margin-left: 11px;
	    padding: 3.5px 6.5px 3.5px 6.5px;
	    background-color: white;
	    border-radius: 3px;
	    font-size: 10pt;
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
        top: 51px;
	    right: 0;
	    height: 403px;
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
   
   .pic{
     height: 38px;
    width: 38px;
     font-size: 9pt;
     position: relative;
     display: flex;
     align-items: center;
     justify-content: center;
     flex-shrink: 0;
     isolation: isolate;
     color: #fbfbfb;
     -webkit-mask-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxwYXRoIGQ9Ik0wLjUgMTAwQzAuNSA3OS40MjM5IDEuNjAzMTcgNjIuOTIzNSA0LjUzMjYyIDQ5Ljc0MjFDNy40NjA4MiAzNi41NjY0IDEyLjIwNzEgMjYuNzM3NSAxOS40NzIzIDE5LjQ3MjNDMjYuNzM3NSAxMi4yMDcxIDM2LjU2NjQgNy40NjA4MiA0OS43NDIxIDQuNTMyNjJDNjIuOTIzNSAxLjYwMzE3IDc5LjQyMzkgMC41IDEwMCAwLjVDMTIwLjU3NiAwLjUgMTM3LjA3NyAxLjYwMzE3IDE1MC4yNTggNC41MzI2MkMxNjMuNDM0IDcuNDYwODIgMTczLjI2MiAxMi4yMDcxIDE4MC41MjggMTkuNDcyM0MxODcuNzkzIDI2LjczNzUgMTkyLjUzOSAzNi41NjY0IDE5NS40NjcgNDkuNzQyMUMxOTguMzk3IDYyLjkyMzUgMTk5LjUgNzkuNDIzOSAxOTkuNSAxMDBDMTk5LjUgMTIwLjU3NiAxOTguMzk3IDEzNy4wNzcgMTk1LjQ2NyAxNTAuMjU4QzE5Mi41MzkgMTYzLjQzNCAxODcuNzkzIDE3My4yNjIgMTgwLjUyOCAxODAuNTI4QzE3My4yNjIgMTg3Ljc5MyAxNjMuNDM0IDE5Mi41MzkgMTUwLjI1OCAxOTUuNDY3QzEzNy4wNzcgMTk4LjM5NyAxMjAuNTc2IDE5OS41IDEwMCAxOTkuNUM3OS40MjM5IDE5OS41IDYyLjkyMzUgMTk4LjM5NyA0OS43NDIxIDE5NS40NjdDMzYuNTY2NCAxOTIuNTM5IDI2LjczNzUgMTg3Ljc5MyAxOS40NzIzIDE4MC41MjhDMTIuMjA3MSAxNzMuMjYyIDcuNDYwODIgMTYzLjQzNCA0LjUzMjYyIDE1MC4yNThDMS42MDMxNyAxMzcuMDc3IDAuNSAxMjAuNTc2IDAuNSAxMDBaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K);
     -webkit-mask-size: contain;
     background-color: #4285f4;
   }
	
	.my{
		margin-left: 10px;
		font-weight: 600;
	}
	
	.role{
		color: #ababab;
		position: relative; bottom: 5px;
	}
	
	#ml-save {
		border: none;
		border-radius: 10px;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		// 체크박스 개수
		var total = $(".chkboxpnum").length;
		// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
		$("#memberAll").change(function(){
			if($("#memberAll").is(":checked")){
				$("input[name='memberChx']").prop("checked",true);
				show_checkmenu();
				$("#check_ctn").text(total);
				
			} else {
				$("input[name='memberChx']").prop("checked",false);
				show_noncheckmenu();
			}
		});
		
		$("input[name='memberChx']").change(function() {
			var checked = $("input[name='memberChx']:checked").length;
			show_checkmenu();
			
			if(checked<=0)
				show_noncheckmenu();
			$("#check_ctn").text(checked);
			
			if(total != checked)
				$("#memberAll").prop("checked", false);
			else
				$("#memberAll").prop("checked", true); 
			
		});
		
		// 프로필 클릭시 구성원 선택
		$(".mem-tr").click(function(e){
			//체크박스 선택시 함수 종료
			if( $(e.target).is('input:checkbox') ) return;
			
			var memcheck = $(this).find("td:first-child > input");
			if(memcheck.prop("checked"))
				memcheck.prop("checked",false);
			else
				memcheck.prop("checked",true);
		});
		
		// 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기
		$("input#burger-check").change(function(){
		    if($("#burger-check").is(":checked")){
		        $(".big").css({'width':'55%','position':'relative','top':'24px'});
		        $(".big table").css({"width":"100%","top":""});
		        $(".menucontent").css({'visibility':'visible'});
		    }else{
		        $(".big").css({'width':'100%','position':'','top':''});
		        $(".big table").css("width","100%");
		        $(".menucontent").css({'visibility':'hidden'});
		    }
		});  
		
		// 모든 조직 펼치기
		$(".unfold").click(function(){  // 조직도 확대 아이콘 클릭시
			$(".summary").click();      // 모든 조직의 summary 클릭
		});
		
			
	});// end of$(document).ready(function(){})--------------------------
	   
	///////////////////////////////////////////////////////////////////////////////////////////////////////    
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
	
	
</script>
</head>
<body>

<div>
	<div>
		<form action="#" class="booking-form" style="float: right; margin-right: 20px;">
			<div class="row" style="padding-top: 11px;">
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 12px;">
								<option value="">이름</option>
								<option value="">소속</option>
								<option value="">직무</option>
								<option value="">직위</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: -9px;">
							<input type="text" class="form-control" placeholder="검색" style="width:90%; font-size: 9pt; padding:6px 12px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 14%;"></a>
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
						<div class="menu">
							<div class="menucontent" style="width: 340px; visibility: hidden; padding: 27px 0px 10px 38px;">
								<div style="font-size: 12pt; font-weight: bold; color: #4C4E54; padding-bottom: 27px;">
									<span style="padding-right: 190px;">조직도</span>
									<span><i class="fas fa-expand-alt unfold"></i></span>
									<span class="unfoldAlert" style="display: none;">모든 조직 펼치기</span> <%-- 호버 이벤트시 jQuery 효과주기 --%>
								</div>
								<details>
									<summary class="summary">IT</summary>
								   	<ul>
								      <li><a href="#" class="orgmenu">개발1팀</a><span id="cntbadge" ><span id="newCnt">1</span></span></li>
								      <li><a href="#" class="orgmenu">개발2팀</a></li>
								      <li><a href="#" class="orgmenu">기술지원팀1팀</a></li>
								    </ul>
								</details>
								<details>
									<summary class="summary">기획</summary>
								   	<ul>
								      <li><a href="#" class="orgmenu">기획1팀</a><span id="cntbadge" ><span id="newCnt">1</span></span></li>
								      <li><a href="#" class="orgmenu">기획2팀</a></li>
								    </ul>
								</details>
							</div>
						</div>
		            </span>
				</div>
			</div>
		</form>
	
	<%-- 전체 구성원 --%>
	<div style="margin-top: 15px; float: left;">
		<span style="margin: 0 12px 0 23px;">
			<input type="checkbox" id="memberAll" />
		</span>
		<span class="ml-noncheckmenu">전체 구성원 &nbsp; <span style="color:#4285f4;" id="memberCnt"></span>명</span>
		<span class="ml-checkmenu">
			<button type="button" id="ml-save" class="gradientbtn">선택</button>		
			<span id="check_ctn"></span>명 선택
		</span>
	</div>
	<div class="big" style="height: 400px; overflow-y: auto; width: 100%;">
		<table class="table custom-table big" style="float: left;">
			<colgroup>
				<col width="5px" />
				<col width="650px" />
				<col width="220px" />
			</colgroup>
			<c:forEach var="i" begin="1" end="10">
				<tr class="mem-tr">
					<td><input type="checkbox" name="memberChx" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
					<td>
						<div class="profile" href="#" style="padding: 1px ;">
							<span class="pic"><span>지은</span></span>
							<span class="my">
								<span class="name" style="font-size: 10.8pt;">김지은</span><br>
								<span class="role" style="font-size: 9pt;">개발자</span>
							</span>
						</div>
					</td> 
					<td>
						<span class="positionIcon">
							<span>IT 개발1팀&nbsp;|&nbsp;대리</span>
						</span>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</div>
</body>
</html>
