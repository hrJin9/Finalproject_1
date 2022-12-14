<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="noticeboard_header.jsp"%> 
<link rel="stylesheet" href="<%= ctxPath%>/resources/fonts/icomoon/style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/board.css?after">
<style type="text/css">
#searchWord {
	width:135%; 
	font-size: 9pt;
	padding:6px 12px;
	padding-left: 45px; 
	position: relative; left: 8%
}
#searchbtn {
	style="color:#76787a;
	background-color: white; 
	font-size: 0.8rem; 
	padding: 0.375rem; 
	position: absolute; 
	bottom: 5%; 
	right: -15%"
}
</style>


<script type="text/javascript">
	$(document).ready(function(){
		
		$(".search-period-wr").hide();
		$("div#ntRplAnon").hide();
		$("a#notice").addClass('list_iscurrent');
		$("#date_total").prop("checked", true);
		
		<%-- ***** 글쓰기 ***** --%>
		/* 관리자 계정만 공지게시판 글쓰기 권한 부여 */
		if(${sessionScope.loginuser.employee_no} == '99') {
			$("a#writebtn").show();
		} else {
			$("a#writebtn").hide();
		}
		
		// offcanvas
	 	$("a#writebtn").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 	});
		
	 	<%-- 텍스트 에디터 시작 --%>
		editor = new toastui.Editor({
		    el: document.querySelector("#editor"),
		    height: "390px",
		    initialEditType: "wysiwyg",
		    hooks: {
		      addImageBlobHook: function (blob, callback) {
		        const formData = new FormData();
		        formData.append("image", blob);
		        const imageURL = imageUpload(formData);
		        // console.log(imageURL);
		        callback(imageURL, "image");
		      },
		    },
		    language: 'ko-KR'
		 });
		<%-- 텍스트 에디터 끝 --%>
		
		/* 익명체크뜨게하기 */
	    /* $("input#ntAlwReply").change(function(){
	        if($("#ntAlwReply").is(":checked")) ntRplAnonDiv.style.display="block";
	        else ntRplAnonDiv.style.display="none";
	    }); */
		
	    
	    <%-- ***** 글 목록 ***** --%>
	    // 검색하기  ==> 검색조건 및 검색어 값 유지시키기 , 자동금 완성하기 추후에 처리하기★
	    $("input#searchWord").keyup(function(e){
			if(e.keyCode == 13) { // 검색어에 엔터를 했을 경우
				
				goSearch(); // 검색하는 함수 호출
			}
		});
	    
	    
	    // 검색시 검색조건 및 검색어 값 유지시키기
		if( ${not empty requestScope.paraMap} ){  // 글목록보기에서 검색할 시 paraMap 값이 비어있지 않다면
			$("select#searchCondition").val("${requestScope.paraMap.searchCondition}");  
			$("input#searchVal").val("${requestScope.paraMap.searchVal}");  
		}
	    
	    
	    
	    <%-- 옵션창 날짜 직접입력 --%>
	    $("input[name='period-type']").change(function(){
	        if($("#date_select").is(":checked")){
			    $(".search-period-wr").show();
	        }else{
	        	$(".search-period-wr").hide();
	        }
	    });
		
	  
	    
	    <%-- 카테고리 복수 선택 인풋태그에 보이도록하기 --%>
	    $("input[name='category']").change(function(e){
	    	const $target = $(e.target).val()
	   		let inputval = $("input#ctgy").val()
	
	   		if($(this).is(":checked")){// 체크했다면 
		    	if($("input#ctgy").val() != ""){ // 체크된게 있다면 
		    		inputval += ","+ $target;
		    		$("input#ctgy").val(inputval);
		    	}
		    	else{ // 체크된게 없다면
			    	$("input#ctgy").val($target);
		    	}
	        }else{// 체크해지했다면
	        	if($target == inputval){//하나밖에 없다면  
	        		$("input#ctgy").val("");
	        	}
	        	else{// 여러개 있다면 
		        	let arrval = [];
		        	arrval = inputval.split(",");
		        	for(let i=0; i<arrval.length; i++){
		        		if(arrval[i]==$target){
		        			arrval.splice(i,1);
		        			break;
		        		}
		        	}
		        	inputval = arrval.toString();
		        	$("input#ctgy").val(inputval);
	        		
	        	}
	        }
	    });
		
	    
	    // 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d",
			defaultDate: new Date(),
			local: 'ko'
		});
		
		
		
		// 초기화 버튼 누르면 옵션 값들 비우기 
		$("button#optionreset").click(function(){
			$("#ctgy").val("");
			$("#writer").val("");
			$("#date_total").prop("checked", true);
			
			$("input[name='category']").each(function() {
				if(this.checked)
					this.checked = false;
	        });
		})
		
		//툴팁 사용
		var tooltipel = $(".tp").tooltip();
		
		// 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기
		$("input#burger-check").change(function(){
		    if($("#burger-check").is(":checked")){
		        $(".table").css({'width':'62%','margin-top':'32px'});
		        // $(".table th:nth-child(2)").attr("width","8%");
		        $(".myscrap").css({'position':'relative', 'top':'25.5px', 'right':''});
		        $(".table th:nth-child(1)").css({'width':'6%'});
		        $(".table th:nth-child(3)").attr("width","14%");
		        $(".nb-info").css("width", "96%");
		        $(".myscrap").fadeIn(100);
		        
		    } else{
		        $(".table").css({'width':'100%','margin-top':''});
		        // $(".table th:nth-child(2)").attr("width","6%");
		        $(".myscrap").css({'position':'relative', 'top':'', 'right':''});
		        $(".table th:nth-child(1)").css({'width':''});
		        $(".table th:nth-child(3)").attr("width","6%");
		        $(".nb-info").css("width", "53%");
		        $(".myscrap").fadeOut(100);
		    }
		});  
		
		
		/* 북마크 표시 */
		$('.bookmark').click(function(e) {
		  	const $this = $(this);
		
		  	if ( $this.hasClass('icon-star-empty') ) {
		  		$this.removeClass('icon-star-empty');
		  		$this.addClass('icon-star-full');
		  	} else {
		  		$this.removeClass('icon-star-full');
		  		$this.addClass('icon-star-empty');
		  	}
		  	/* e.preventDefault(); */
		});
		  
		
		/* 게시물뷰 링크 이동 */
		 $('.titlefirst').click(function() {
			
		});
		
		// 별 북마크표시
		$(".check-star").click(function(){
			const itag = $(this).find("i");
			if ( itag.hasClass('icon-star-empty') ) {
				itag.removeClass('icon-star-empty');
				itag.addClass('icon-star-full');
				itag.css({"color":"#ffc107","transition":"all .2s"});  	
			} else {
		  		itag.removeClass('icon-star-full');
		  		itag.addClass('icon-star-empty');
		  		itag.css({"color":"","transition":"all .2s"});  
		  	}
		});
		
		// 체크박스 개수
		var total = $("input[name='ms-check']").length;
		// 체크박스 전체선택 기능 및 체크박스 선택시 메뉴 변경
		$("#ms-checkall").change(function(){
			const itag = $("input[name='ms-check']").next().find("i");
			
			if($("#ms-checkall").is(":checked")){
				$("input[name='ms-check']").prop("checked",true);
				ms_check(itag); ms_check($(this).next().find("i"));
				show_checkmenu();
				$("#check_ctn").text(total);
				
			} else {
				$("input[name='ms-check']").prop("checked",false);
				ms_uncheck(itag); ms_uncheck($(this).next().find("i"));
				show_noncheckmenu();
			}
		});
		
		$("input[name='ms-check']").change(function(e) {
			const itag = $(e.target).next().find("i");
			var checked = $("input[name='ms-check']:checked").length;
			
			ms_check(itag);
			show_checkmenu();
			if(!$(e.target).is(":checked")){
				ms_uncheck(itag);
			}		
			
			if(checked<=0)
				show_noncheckmenu();
			$("#check_ctn").text(checked);
			
			if(total != checked){
				$("#ms-checkall").prop("checked", false);
				ms_uncheck($("#ms-checkall").next().find("i"));
			} else {
				$("#ms-checkall").prop("checked", true);
				ms_check($("#ms-checkall").next().find("i"));
			}
		});
		
		
		//const searchCondition = $("#searchCondition").val();
		//const searchVal = $("#searchVal").val();
		
		
		
		
		
		
	});//end of ready---------------------------------------
	
	
	//체크박스  css변경 이벤트
	function ms_check(itag){
		itag.removeClass("icon-checkbox-unchecked");
		itag.addClass("icon-checkbox-checked");
		itag.css({"color":"#37A652","transition":"all .2s"});
	}
	
	function ms_uncheck(itag){
		itag.removeClass("icon-checkbox-checked");
		itag.addClass("icon-checkbox-unchecked");
		itag.css({"color":"rgba(0,0,0,0.2)","transition":"all .2s"});  
	}
	
	//체크했을 때 보이는 메뉴
	function show_checkmenu(){
		$(".mg-noncheckmenu").hide();
		$(".mg-checkmenu").fadeIn("fast");
	}
	
	// 체크안할 때 보이는 메뉴
	function show_noncheckmenu(){
		$(".mg-checkmenu").hide();
		$(".mg-noncheckmenu").fadeIn("fast");
	}
	<%-- 카테고리 멀티 셀렉터 열리고 닫히고  --%>
	function multiSelect(value){
		 if(value=="OPEN") categorydiv.style.visibility="visible";
		 else categorydiv.style.visibility="hidden";
	}
	
	<%-- 옵션창 열리고 닫히고  --%>
	function optionForm(value){
		 if(value=="OPEN") option.style.visibility="visible";
		 else option.style.visibility="hidden";
	}
	
	
	//태그 직접입력을 선택했을경우 
	/* function changetagname(obj){
		$("span.error").hide();
		let html1 = "";
		let html2 = "";
		if(obj.value !="plus"){
			$("div.existhide").hide();
			$("div#divPlusTag1").html("");
			$("div#divPlusTag2").html("");
		}
		else{
			$("div.existhide").show();
			html1 += '<label for="tagname" class="control-label">태그명</label>';
			html2 += '<input type="text" class="form-control" name="tagname" id="tagname" placeholder="태그명을 입력해주세요" >';
			$("div#divPlusTag1").html(html1);
			$("div#divPlusTag2").html(html2);
		}
	}; */
	
	//Function Declaration
	<%-- 
	function goView(seq) {
		location.href="<%= request.getContextPath()%>/view.action?seq="+seq;
	}// end of function goView(seq)-------------------
	
	--%>
	// 검색하는 함수
	function goSearch() { // 검색하는 함수
		const frm = document.searchFrm;
		frm.method = "GET";  
		frm.action = "<%= ctxPath%>/board_all.up";
		frm.submit(); 
	}// end of function goSearch()-------------------
		
	
	
	//폼값을 받아서 저장하기
	function goSave() {
		
		// 상단고정 선택여부
		if( $("#ntpriority").is(":checked") ) {
			$("#priority").val(1);
		}else {
			$("#priority").val(0);
		}
		var priority = $("#priority").val();
		
		// 카테고리 유효성 검사
		if($("select[name='categoryTag']").val() == 0) {
			alert("태그를 선택하세요.");
		    return; // 종료
		}
		
		// 글제목 유효성 검사
		const subject = $("input#subject").val().trim();
		if(subject == "") {
		    alert("제목을 입력하세요.");
			return; // 종료
		}
		    
		var content = editor.getHTML();  // (스마트 에디터 사용 할 경우) <p>글내용</p> 와 같이 출력됨.
		            
		content = content.replace(/&nbsp;/gi, ""); // 공백을 "" 으로 변환
		content = content.substring(content.indexOf("<p>")+3);   // "            </p>"  => index 3 부터 까지
		content = content.substring(0, content.indexOf("</p>")); // "            "
		//alert("content >>" + content);   
		
		if(content.trim().length == 0 || content == "<br>"){
			alert("내용을 입력하세요.");
			return;
		}
		
		// 알림설정 유효성 검사
		var tagCheck = $('input:radio[name=boardalarm]').is(':checked'); // 체크 여부(checked)
		if(tagCheck == false) {
			alert("알림설정 여부를 선택하세요.");
			return;
		}
		
		// 폼(form)을 전송(submit)
		const frm = document.addFrm;
        frm.method = "POST";
        frm.fk_employee_no.value = "${sessionScope.loginuser.employee_no}";
        frm.content.value = content;
        frm.priority.value = priority;
        frm.action = "<%= ctxPath%>/addEnd.up";
        frm.submit();
		 
	}

</script>
<div class="container mt-5">
	<div class="row">
      <div class="table-responsive" style="width: 100%; overflow-y: hidden;">
      	 
           <!-- <form action="#" class="booking-form ml-3"  style="margin-bottom: 3px;"> -->
           <form name="searchFrm">
			<div class="row" style="float: right; position: relative; left: -121px; margin-bottom: 0.6%;" >
			
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group"">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 6px; position: relative; left: 15%;">
								<!-- <option value="all" selected>전체</option> -->
								<option value="name_kr">작성자</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
					</div>
				</div>
				<div class="">
					<div class="form-group">
						<div class="form-field">
							<input type="text" name="searchVal" id="searchVal" class="form-control" placeholder="검색" autocomplete="off">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 8pt;margin-bottom:0;">
						<a id="searchoption"href="#" class="btn" style="color:#0a58caa1; padding: 0.2rem 0.4rem;border-radius:0px; background-color: white;font-size: 0.7rem;position: relative;left: -588%;border-right: 1px solid #ced4da;" onClick="optionForm('OPEN')">옵션</a>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<button type="button" class="btn icon icon-search" id="searchbtn" onclick="goSearch()"></button>
					</div>
				</div>
				
				<div style="display: block;">
					<div class="groupIcon">
						<input class="burger-check" type="checkbox" id="burger-check" />
						<label class="burger-icon" for="burger-check"><span class="burger-sticks"></span></label>
						
						<div class="myscrap">
							<div class="mg-left-container">
								<nav class="mgList-info">
									<a class="list_iscurrent" style="width: 21%;">내게시물<span>2</span></a>
									<a class="list_notcurrent" style="width: 14%;">북마크<span>1</span></a>
								</nav>
								<hr class="HRhr" style="margin: 0;"/>
								<div class="mgList">
									<div class="mgList-menu">
										<input id="ms-checkall" type="checkbox" class="ms-check" style="display: none;"/>
										<label for="ms-checkall" style="margin: auto;">
											<i class="icon icon-checkbox-unchecked"></i>
										</label>
										<div class="mg-menucontainer" style="height: 30px;">
											<div class="mg-noncheckmenu" style="margin-left: 10px;">
												<span>9</span>	<!-- 전체수량 -->
											</div>
											<div class="mg-checkmenu" style="display: none; margin-left: 10px;">
												<button class="tp" data-bs-toggle="tooltip" data-bs-placement="top" title="삭제"><i class="fas fa-trash" style="bottom: 3px; right: 1px;"></i></button> <!-- 삭제 -->
												<span style="margin-left: 315px;"><span id="check_ctn"></span>개 선택</span>
											</div>
										</div>
									</div>
									<div class="mgList-contents">
										<table>
											<c:forEach var="i" begin="1" end="9">
												<tr>
													<td width="3%">
														<input id="ms-check${i}" class="ms-check" type="checkbox" name="ms-check" style="display: none;"/><label for="ms-check${i}"><i class="icon icon-checkbox-unchecked"></i></label>
													</td>
													<td width="3%">
														<input id="check-star${i}" type="checkbox" name="check-star" style="display: none;"/>
													</td>
													<td width="72%">
														<div><span>글제목</span><span><i class="fas fa-paperclip"></i></span></div>
														<div><span>진혜린</span>&nbsp;<span>대리</span></div>
													</td>
													<td width="22%">
														<div>2022.11.13</div>
													</td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div class="mg-paging">
										페이징할거..
									</div>
								</div>
							</div>
						</div>
		             </div>
				  </div>
			</div>
		
				
		   <div id="option" class="option">
		      <div style="font-size: 11pt; color: #595959; font-weight: bold; padding-bottom: 20px;">검색 옵션
		      	 <!-- <label class="filter-date-label"><i class="icon icon-redo"></i></label> -->
		         <button type="button" id="optionreset">초기화</button>
		      </div>
		      <div class="detail-search-conditions">
			    <ul class="conditions-group">
			        <li class="js-project-name-search-filter" style="display: block;">
						<div class="condition-cell title">카테고리</div>
			            <div class="condition-cell">
			                <input id="ctgy"class="form-control" onClick="multiSelect('OPEN')" style="box-shadow: none;font-size:9pt; border-radius: 0px;border-top: none;border-radius: none;border-left: none;border-right: none;width:260%;background-color: white;"  placeholder="카테고리를 선택하세요"readonly>
							 <div id="categorydiv" >
							  <ul>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk5"value="일반"><label for="chk5" class="label-checkbox" data-code="unlimit">일반</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk3"value="행사"><label for="chk3" class="label-checkbox" data-code="unlimit">행사</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk1"value="인사"><label for="chk1" class="label-checkbox" data-code="unlimit">인사</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk2"value="경조사"><label for="chk2" class="label-checkbox" data-code="unlimit">경조사</label></li>
						      </ul>
						      <div style="padding-top:3px;text-align:right">
							    	<!-- <button type="reset" class="workstatus-cancel">취소</button> -->
							    	<input type="button" class="workstatus-cancel"value="SAVE" onClick="multiSelect('CLOSE')" style="width:50%; border:none;color:#0a58caa1;">
							  </div>
				   			</div>
						</div>
			        </li>
			        <li class="js-register-name-search-filter" style="display: block;">
			            <div class="condition-cell title">작성자</div>
			            <div class="condition-cell">
			            	<input id="writer"class="form-control" type="text" placeholder="작성자명 입력 (여러명 입력시, 콤마로 구분)">
			            </div>
			        </li>
			        <li class="js-period-type-search-filter" data-code="unlimit" style="display: block;">
			            <div class="condition-cell title" style="top: 14px;position: relative;float: left;">검색기간</div>
			            <div class="condition-cell">
			              <ul class="target-select-group">
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_total" name="period-type">
				                <label for="date_total" class="js-period-type radio-label-checkbox" data-code="unlimit">전체</label>
				            </li>
				        
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_today" name="period-type">
				                <label for="date_today" class="js-period-type radio-label-checkbox" data-code="today">오늘</label>
				            </li>
				        
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_week" name="period-type">
				                <label for="date_week" class="js-period-type radio-label-checkbox" data-code="week">7일</label>
				            </li>
				        
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_month" name="period-type">
				                <label for="date_month" class="js-period-type radio-label-checkbox" data-code="month">1개월</label>
				            </li>
				        
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_3month" name="period-type">
				                <label for="date_3month" class="js-period-type radio-label-checkbox" data-code="thirdMonth">3개월</label>
				            </li>
				        
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_6month" name="period-type">
				                <label for="date_6month" class="js-period-type radio-label-checkbox" data-code="sixthMonth">6개월</label>
				            </li>
				        
				            <li>
				                <input type="radio" class="custom-control-radio" id="date_year" name="period-type">
				                <label for="date_year" class="js-period-type radio-label-checkbox" data-code="year">1년</label>
				            </li>
				        
				            <li>
				            	<input type="radio" class="custom-control-radio" id="date_select" name="period-type" data-code="select" >
				                <label for="date_select" class="js-period-type radio-label-checkbox" data-code="select">기간선택</label>
					            <div class="search-period-wr" >
					                <div class="js-search-pickr-layer" data-code="unlimit">
 					                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
						                	<div class="datebox margin-container">
												<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;"/></span>
											</div>
										</div>
					                    <span class="dash-swung" style="position: relative;bottom: 10px;right: 2px;">~</span>
 					                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
						                	<div class="datebox margin-container">
												<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;"/></span>
											</div>
										</div>
					                </div>
					            </div>
				        
				            </li>
			        	</ul>
            		</div>
       			 </li>
    		</ul>
		    <div class="condition-button-area">
		        <!-- <div class="condition-left">
		            <button type="button" class="js-filter-reset condition-reset">초기화</button>
		        </div> -->
		        <div class="condition-right">
		            <button type="reset" class="workstatus-cancel" onClick="optionForm('CLOSE'), multiSelect('CLOSE')">취소</button>
		            <button type="button" class="workstatus-save mr-1"  onClick="goOptionSearch()">검색</button>
		        </div>
		    </div>
		</div>
   </div>
</form>


	<%-- ★★★★★★★★★★ 게시글 목록 뿌리기 ★★★★★★★★★ --%>
	<table class="table">
	<thead>
	  <tr>
	    <th width="4%" scope="col"/>
	    <th width="83%"scope="col"/>
	    <th width="6%"scope="col"/>
	  </tr>
	</thead>
	<tbody>
		<c:forEach var="boardvo" items="${requestScope.boardList}" varStatus="status">
			<tr class="topnotice"><!-- 공지 상단에 고정 -->
			  <td>${boardvo.nbno}</td>
			   <td>
			   	<div class="titlefirst"> 
			    	<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/pushpin_1f4cc.png" width="15px"/>
			    	<span class="title" onclick="location.href='/thumbsup/board/view.up'">${boardvo.subject}</span>
			   		<span class="icon icon-attachment" id="iconattachment"></span> 
			   	</div>  
			   	<div class="nb-info">
			   		<div style="display: inline-block; width: 11%;">
			   			<span class="categorybadge">${boardvo.categoryTag}</span>
			   		</div>
			   		<div style="display: inline-block; width: 10%;">
			   			<span class="username">${boardvo.name_kr}</span>
			   		</div>
			   		<div style="display: inline-block; width: 15%;">
			   			<span class="writedate">${boardvo.writedate}</span>
			   		</div>
			   	</div>			
			   </td>
			   <td>
			   	<a href="#" class="bookmark icon icon-star-empty"></a>
			   </td>
			 </tr>
	       </c:forEach>
	       
			 <tr >
			    <td>5</td>
			    <td>
				   	<div class="titlefirst">
				   		<span class="title notopnotice">[온라인 세미나] 11/25(금) 세미나 공지</span>
				   		<span class="icon icon-attachment" id="iconattachment"></span> 
				   	</div>  
				   	<div class="nb-info">
			 		<div style="display: inline-block; width: 11%;">
			 			<span class="categorybadge">경조사</span>
			 		</div>
			 		<div style="display: inline-block; width: 10%;">
			 			<span class="username">관리자</span>
			 		</div>
			 		<div style="display: inline-block; width: 10%;">
			       			<span class="writedate">2022.11.16</span>
			       		</div>
			       	</div>			
		       </td>
		       <td>
		       	<a href="#" class="bookmark icon icon-star-empty"></a>
		       </td>
		     </tr>
     
	     </tbody>
	   </table>
	<h2 class="mt-3"style="text-align: center;">페이징처리</h2>
     
	</div>
</div>
</div>

<!-- 오프캔버스 시작 -->
<form name="addFrm" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" 를 해주어야만 파일첨부가 되어진다. -->
<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <div class="offcanvas-header">
    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">공지사항</div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
  <div class="offcanvas-body">
  
	<div class="d-flex-space mb-3">
		<div class="mb-1">
		
			<div class="dropdown bootstrap-select">
				<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
					<input type="checkbox" class="checkbox-disable custom-control-input" id="ntpriority" name="ntpriority">
					<label class="custom-control-label" for="ntpriority">이 글을 상단에 고정합니다</label>
				</div>
			</div>
		</div>
	</div>	
		
	<!-- <hr class="HRhr  mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/> -->
	<div class="form-group"style="width:30%">
	
		<div class="form-group mr-1  mb-2">
			<div class="form-field">
				<!-- <select name="categoryTag" id="categoryTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;" onchange="changetagname(this)"> -->
				<select name="categoryTag" id="categoryTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;">
					<option value="0" selected>태그선택</option>
					<option value="일반">일반</option>
					<option value="행사">행사</option>
					<option value="인사">인사</option>
					<option value="경조사">경조사</option>
					<!-- <option value="plus">태그추가</option> -->
				</select>
			</div>
		</div>
	</div>
	
	<div class="form-group" style="margin-top: 10px;">
		<span class="control-label">제목</span>
		<div class="position-relative">
			<input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 입력해주세요" name="title" value="">
		</div>
	</div>
		
		
	<div class="form-group" style="margin-top: 10px;">
		<span class="control-label">내용</span>
		<div class="position-relative mb-1" >
		      <div id="editor" class="editor" name="content"></div>
		</div>
	</div>
	<div class="form-group" style="margin-top: 10px;">
		<span class="control-label">파일첨부</span><span style="color: #d8d8d8;font-size:9pt">파일은 하나당 최대 10MByte 까지 업로드 가능합니다. 여러개를 첨부하려면 [Shift키] 또는 [Ctrl키]를 누르고 선택해주세요</span>
		<div class="position-relative">
			<input type="file" id="file" class="form-control"  name="attach" >
		</div>
	</div>
   	<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
   	
   	<div class="form-group" style="margin-top: 5px;">
		<div class="control-label" style="float: left;">알림설정</div>
           <div class="condition-cell">
               <!-- <input type="radio" class="custom-control-radio2" id="mail" name="boardalarm">
               <label for="mail" class="js-period-type radio-label-checkbox2" data-code="unlimit">메일알림</label> -->
               <input type="radio" class="custom-control-radio2" id="popup" name="boardalarm" value="popup">
               <label for="popup" class="js-period-type radio-label-checkbox2" data-code="unlimit">팝업알림</label>
               <input type="radio" class="custom-control-radio2" id="nopopup" name="boardalarm" value="nopopup">
               <label for="nopopup" class="js-period-type radio-label-checkbox2" data-code="unlimit">미설정</label>
		</div>
	</div>
		
	<div class="workstatus-buttoncontainer">
		<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		<!-- <button type="button" class="workstatus-save mr-1"style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;">임시저장<span style="color:#a3a3a3"> | 5</span></button> -->
		<button type="button" class="workstatus-save mr-1 gradientbtn" id="btnWrite" onclick="goSave()">저장하기</button>
		<button type="reset" class="workstatus-cancel mr-1">취소</button>
	</div>   		
	
	<input type="hidden" name="fk_employee_no" value="${sessionScope.loginuser.employee_no}" style="margin-left: 100px; font-size: 6pt;" />
    <input type="hidden" name="name_kr" value="${sessionScope.loginuser.name_kr}" style="font-size: 6pt;" />
	<input type="hidden" id="content" name="content" value="" style="font-size: 6pt;">
	<input type="hidden" id="priority" name="priority" value="" style="font-size: 6pt;">
   	
	</div>
</div>
</form>
<!-- 오프캔버스 끝 -->
		
<div id="alert">
	<i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	<span id="alertText" style="position: relative; bottom: 2px;"></span>
</div>	
		