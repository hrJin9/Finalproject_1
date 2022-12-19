<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="noticeboard_header.jsp"%> 
<link rel="stylesheet" href="<%= ctxPath%>/resources/fonts/icomoon/style.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/board.css?after">
<style type="text/css">
	.search-none {
	    border: solid 1px rgba(0,0,0, 0.1);
	    background-color: rgba(250,250,250,.5);
	    height: 200px;
	    width: 100%;
	    border-radius: 5px;
	    text-align: center;
	    padding-top: 77px;
	    font-size: 12pt;
	}

</style>

<script type="text/javascript">
	let bookmark = "";
	let startDate = "";
	let endDate = "";
	let searchCondition = "";
	let searchVal = "";
	
	$(document).ready(function(){
		$(".search-period-wr").hide();
		$("#searchbar").css("display","none");
		$(".dropselchx").css("display","none");
		/* $("div#ntRplAnon").hide(); */
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
		
	    
	    <%-- ***** 글 목록보기 ***** --%>
	    // 검색하기  ==> 검색조건 및 검색어 값 유지시키기 , 자동금 완성하기 추후에 처리하기★
	    $("input#searchVal").keyup(function(e){
			if(e.keyCode == 13) { // 검색어에 엔터를 했을 경우
				goSearch(); // 검색하는 함수 호출
			}
		});
	    
	    // 검색시 검색조건 및 검색어 값 유지시키기
		if( ${not empty requestScope.paraMap} ){  // 글목록보기에서 검색할 시 paraMap 값이 비어있지 않다면
			$("select#searchCondition").val("${requestScope.paraMap.searchCondition}");  
			$("input#searchVal").val("${requestScope.paraMap.searchVal}");  
		}
	    
	    
		<%-- 검색어 입력시 자동 리스트검색  --%>
		$("div#displayList").hide();
		
		$("input#searchWord").keyup(function(e){ 
			const wordLength = $(e.target).val().trim().length;// 검색어에서 공백을 제거한 길이를 알아온다.
			
			if(wordLength != 0) {
				searchType = $("select#searchType").val()
				searchWord = $("input#searchWord").val()
			}
			else{
				searchType = ""
				searchWord = ""
			}
				showList(ap_type,bookmark,startDate,endDate,searchType,searchWord);	
		}); // end of $("input#searchWord").keyup()---------------
	    
		  
		
	});//end of ready---------------------------------------
	
	
	//Function Declaration
	// 게시물 보여주기 
	function goView(nbno) {
		// 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
	    // 사용자가 "검색된결과목록보기" 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해 현재 페이지 주소를 뷰단으로 넘겨준다.
		const gobackURL = "${requestScope.gobackURL}";  // BoardController.java 에서 넘겨준 키값 gobackURL
	
		<%-- /list.action?searchType=subject searchWord=java currentShowPageNo=3   ==> 구분자 & 가 없으므로 list.jsp 파일에서 확인한 gobackURL 을 그대로 전부 다 BoardController.java 파일로 넘길 수 있게 된다. --%> 
		
		const searchCondition = $("select#searchCondition").val();
		const searchVal = $("input#searchVal").val();
		
		location.href="<%= ctxPath%>/notice/view.up?nbno="+nbno+"&gobackURL="+gobackURL+"&searchCondition="+searchCondition+"&searchVal="+searchVal;
				
	}// goView(nbno)-------------------

	
	
	// ajax 검색필터 적용 
	<%-- function showList(ap_type,bookmark,startDate,endDate,searchType,searchWord){
		$.ajax({
			url:"<%= ctxPath%>/approval/apList.up",
			type:"GET",
			data:{"bookmark":bookmark
				, "searchStartday":startDate
				, "searchEndday":endDate
				, "searchCondition":searchCondition
				, "searchVal":searchVal},
				 /* ,"searchType":$("select#searchType").val()
				 ,"searchWord":$("input#searchWord").val()} */
			dataType:"json",
			success:function(json){
				console.log(json.length);
                let html = "";
                let html2 = "";
                if(json.length > 0) {
                   $.each(json, function(index, item) {
                	   
                	   html+= '<tr><td><input class="anoval" hidden="hidden" value="'+item.ano+'"></td><td>'
      	              	 	+ '<div  style="justify-content: unset;margin-top: 14px;"><label class="control control--checkbox" style="top: 1px;">'
      	              		+ '<input type="checkbox" name="ap-selectchx" /><div class="control__indicator icon icon-checkmark" ></div>'
      		            	+ '</label></div></td>'
      	              		+ '<td class="title"><div id="writername">'+item.name_kr+'</div>'
      	              		+ '<div id="writerday">'+item.writeday+'</div>'
      		              	+ '<div id="writertitle">'+item.title+'</div></td>'
      	              		+ '<td class="ap_type"><div>'+item.ap_type+'</div></td><td><div>'
      	              if(item.final_signyn == "승인"){
 		              		html += '<button type="button" class="btn btn-badge" style="background-color: #D1FCF1; color: #4dc6ad; ">승인</button>'
 		               }
 		               else if(item.final_signyn == "반려"){
 		            	   html += '<button type="button" class="btn btn-badge" style="background-color: #FBD8D7; color: #D2737F; ">반려</button>'
 		               }
 		               else if(item.final_signyn == "진행"){
 		            	   html +=  '<button type="button" class="btn btn-badge" style="background-color: #17a6f21f;color: #06689c; ">진행중</button>'
 		               }
 		               else if(item.final_signyn == "취소"){
 		            	   html +=  '<button type="button" class="btn btn-badge" style="background-color: #E9E9EB;color: #747378; ">취소</button>'
 		               }
      	              	html += '</div></td><td>'
      	              	
      	              	if(item.bookmark == '0'){
			   	            html += `<div style="margin-top:12px;"><a class="bookmark icon icon-star-empty" onclick="addbookmark('`+item.ano+`',event)"></a></div>`
		   	            }else if(item.bookmark == '1'){
			   	            html += `<div style="margin-top: 12px;"><a class="bookmark icon icon-star-full" onclick="addbookmark('`+item.ano+`',event)"></a></div>`
		   	            }
      	              	
                    	html+= '</td><td></td></tr>'
                    	
		               if(item.pageBar != "0"){
		            	   html2 = item.pageBar;
		               }
                   }); 
                   
               }else{
            	   html = "<td colspan='7' style='text-align: center;'><div style='margin-top: 150px;display: flex;justify-content: flex-start;flex-direction: column;'>"
            	   		 +'<svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin: 0 auto;width: 48px; height: 48px; flex-shrink: 0;"><path d="M10.5956 3C6.40068 3 3 6.40068 3 10.5956C3 14.7906 6.40068 18.1913 10.5956 18.1913C12.3602 18.1913 13.9842 17.5896 15.2737 16.5801L19.6936 21L21 19.6936L16.5801 15.2737C17.5896 13.9842 18.1913 12.3602 18.1913 10.5956C18.1913 6.40068 14.7906 3 10.5956 3ZM4.84759 10.5956C4.84759 7.42107 7.42107 4.84759 10.5956 4.84759C13.7702 4.84759 16.3437 7.42107 16.3437 10.5956C16.3437 13.7702 13.7702 16.3437 10.5956 16.3437C7.42107 16.3437 4.84759 13.7702 4.84759 10.5956Z" fill="rgba(36, 42, 48, 0.12)" fill-rule="evenodd" clip-rule="evenodd"></path></svg>'
            	   		 +"<div style='font-weight: 700;font-size: 16px;line-height: 26px;color: #242a30;margin-top: 10px;'>"+searchWord+"에 대한 검색결과가 없어요.</div>"
            	   		 +"<div style='font-weight: 400;font-size: 13px;line-height: 21px;color: #556372;'>다른 검색어를 입력해주세요.</div></div>"
            	   		 +"<button onclick='emptysearchbar()'style='color: rgb(85, 99, 114);position: relative;cursor: pointer;display: inline-flex;align-items: center;justify-content: center;font-weight: 700;outline: none;border: none;font-size: 13px;border-radius: 6px;background: transparent;box-shadow: none;padding-left: 10px;padding-right: 10px; margin-top: 15px;'><span>검색어 지우기</span></button></td>";
            	   html2 = ""; 
               }
                   $("#tabledata").html(html);
				   $("div#pageBar").html(html2);
				   // console.log(html2);
                     
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		}); 
	} --%>
	
	// 검색어 비우기
	/* function emptysearchbar(){
		$("input#searchWord").val('');
		searchWord = '';
		$("input#searchWord").focus();
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord);
	} */
	
	// 날짜필터 => 일, 주, 월, 년 날짜 자동 입력 (오늘날짜 기준)
	/* function getDate(val,e){
		$(".dropselchx").each(function(){
			$(this).css("display","none");
		})
		$(e.target).find(".dropselchx").css("display","block");
		
		var today = new Date();
		//오늘 년, 월, 일
		var day = today.getDate();
		var month = today.getMonth();
		var year = today.getFullYear();
		var today = new Date().toLocaleDateString();
		//일주일 전
		var Aweek = new Date(new Date().setDate(day-7)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		//한달 전
		var Amonth = new Date(new Date().setMonth(month-1)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		//세달 전
		var Amonth = new Date(new Date().setMonth(month-3)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		//일년 전
		var Ayear = new Date(new Date().setYear(year-1)).toLocaleDateString("ko-KR",{
			year:"numeric"
			,month:"2-digit"
			,day:"2-digit"
		});
		startDate = "";
		endDate = today;
		if(val == '1') {
			startDate = today;
		} else if(val == '2') {
			startDate = Aweek;
		} else if(val == '3') {
			startDate = Amonth;
		} else if(val == '4') {
			startDate = Ayear;
		} else if(val == '5') {
			startDate = Ayear;
		}
		
		let [y1,m1,d1] = startDate.split('.');
		startDate = [y1,m1,d1].join('-');
		let [y2,m2,d2] = endDate.split('.');
		endDate = [y2,m2,d2].join('-');
		
		startDate = startDate.replaceAll(' ','');
		endDate = endDate.replaceAll(' ','');
		
		showList(bookmark,startDate,endDate,searchCondition,searchVal);
	} */
	
	
	// ** 북마크 표시하기 및 표시 해제하기 ** //
	function updatebookmark(nbno, status, e){
		console.log("여기 >>" + $(e.target));
		console.log("status >>" + status);
		
  		$.ajax({
			url:"<%= ctxPath%>/notice/updateScrap.up",
			type:"GET",
			data:{"nbno":nbno,
				  "status":status},
			dataType:"json",
			success:function(json){
				if(json.result = 1){
				  	if ( $(e.target).hasClass('icon-star-empty') ) {
				  		$(e.target).removeClass('icon-star-empty');
				  		$(e.target).addClass('icon-star-full');
				  	} else {
				  		$(e.target).removeClass('icon-star-full');
				  		$(e.target).addClass('icon-star-empty');
				  	}
				}

			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		}); 
	}// addbookmark(nbno)----------------	
	
	
	
	
	// 검색하는 함수
	function goSearch() { // 검색하는 함수
		const frm = document.searchFrm;
		frm.method = "GET";  
		frm.action = "<%= ctxPath%>/board_all.up";
		frm.submit(); 
	}// end of function goSearch()-------------------
		
	
	// ** 글쓰기 폼값을 받아서 저장하기 ** //
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
			$(".tagAlert").fadeIn("fast");
			setTimeout(function(){
				$(".tagAlert").fadeOut("fast");
			}, 1500);
			//alert("태그를 선택하세요.");
		    return; // 종료
		}
		
		// 글제목 유효성 검사
		const subject = $("input#subject").val().trim();
		if(subject == "") {
			$(".subjectAlert").fadeIn("fast");
			setTimeout(function(){
				$(".subjectAlert").fadeOut("fast");
			}, 1500);
		    //alert("제목을 입력하세요.");
			return; // 종료
		}
		    
		var content = editor.getHTML();  // (스마트 에디터 사용 할 경우) <p>글내용</p> 와 같이 출력됨.
		            
		//content = content.replace(/&nbsp;/gi, ""); // 공백을 "" 으로 변환
		//content = content.substring(content.indexOf("<p>")+3);   // "            </p>"  => index 3 부터 까지
		//content = content.substring(0, content.indexOf("</p>")); // "            "
		//alert("content >>" + content);   
		
		/* if(content.trim().length == 0 || content == "<br>"){
			$(".contentAlert").fadeIn("fast");
			setTimeout(function(){
				$(".contentAlert").fadeOut("fast");
			}, 1500);
			//alert("내용을 입력하세요.");
			return;
		} */
		
		if(content == "<p><br></p>"){
			$(".contentAlert").fadeIn("fast");
			setTimeout(function(){
				$(".contentAlert").fadeOut("fast");
			}, 1500);
			//alert("내용을 입력하세요.");
			return;
		}
		
		// 알림설정 유효성 검사
		var tagCheck = $('input:radio[name=boardalarm]').is(':checked'); // 체크 여부(checked)
		if(tagCheck == false) {
			$(".alarmAlert").fadeIn("fast");
			setTimeout(function(){
				$(".alarmAlert").fadeOut("fast");
			}, 1500);
			//alert("알림설정 여부를 선택하세요.");
			return;
		}
		
		// 폼(form)을 전송(submit)
		const frm = document.addFrm;
        frm.method = "POST";
        frm.fk_employee_no.value = "${sessionScope.loginuser.employee_no}";
        frm.content.value = content;
        frm.priority.value = priority;
        frm.action = "<%= ctxPath%>/board_addEnd.up";
        frm.submit();
		 
	}//goSave()----------------------

</script>
<div class="container mt-5">
	<div class="row">
		<div class="table-responsive" style="width: 100%; overflow-y: hidden;">
      	 
        <!-- <form action="#" class="booking-form ml-3"  style="margin-bottom: 3px;"> -->
		<form name="searchFrm">
			<div class="row" style="float: right;position: relative;left: -123px;" >
				
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:7px 6.7px; position: relative; left: 15%;">
								<!-- <option value="all" selected>전체</option> -->
								<option value="categoryTag">카테고리</option>
								<option value="name_kr">작성자</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: 14px;">
							<!-- <input type="text" class="form-control" placeholder="검색" style="width:150%; font-size: 9pt; padding:6px 6px;"> -->
							<input type="text" name="searchVal" id="searchVal" class="form-control" placeholder="검색" autocomplete="off" style="width:150%; font-size: 9pt; padding:6px 6px;">
							<input type="text" style="display: none;" />
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<button type="button" class="btn headersearch icon icon-search" id="searchbtn" onclick="goSearch()"></button>
						<!-- <button type="button" class="btn headersearch icon icon-search" id="searchbtn" onclick="goSearch()"></button> -->
					</div>
				</div>
			
				<!-- 날짜 필터  -->
				<a class="headersearch dropdown-link icon icon-sort-amount-asc" id="dropdownMenuButton" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20"></a>
		          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="color:#d0d0d0;min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton" >
		            <!-- <a class="dropdown-item" >업데이트 일</a>
		            <a class="dropdown-item" >작성일</a>
		            <div class="dropdown-divider"></div> -->
		            <a class="dropdown-item" onclick="getDate(1,event)">오늘<span class="icon icon-checkmark dropselchx"></span></a>
		            <a class="dropdown-item" onclick="getDate(2,event)">지난 1주일<span class="icon icon-checkmark dropselchx"></span></a>
		            <a class="dropdown-item" onclick="getDate(3,event)">지난 1개월<span class="icon icon-checkmark dropselchx"></span></a>
		            <a class="dropdown-item" onclick="getDate(4,event)">지난 3개월<span class="icon icon-checkmark dropselchx"></span></a>
		            <a class="dropdown-item" onclick="getDate(5,event)">지난 1년<span class="icon icon-checkmark dropselchx"></span></a>
		            <a class="dropdown-item">직접 입력<span class="icon icon-checkmark dropselchx"></span></a>
		            <!-- <a class="dropdown-item">
			            <div class="search-period-wr" >
			                <div class="js-search-pickr-layer" data-code="unlimit">
			                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
				                	<div class="datebox margin-container">
										<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;"/></span>
									</div>
								</div>
			                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
				                	<div class="datebox margin-container">
										<span><input class="dateSelector attendance-dateSelector" style="padding: 0 20px 1px 20px;"/></span>
									</div>
								</div>
							</div>
		            	</div>
		          	</a>  -->
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
	
		<c:if test="${not empty requestScope.boardList}">
		<c:forEach var="boardvo" items="${requestScope.boardList}" varStatus="status">
			<c:choose>
				<c:when test="${boardvo.priority == '1'}">
				<c:if test="${boardvo.priority =='1'}">
					<tr class="topnotice"><!-- 공지 상단에 고정 -->
					  <td>${boardvo.nbno}</td>
					   <td>
					   	<div class="titlefirst"> 
					    	<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/pushpin_1f4cc.png" width="15px" style="margin-right: 3px;"/>
					    	<span class="title" onclick="goView('${boardvo.nbno}')">${boardvo.subject}</span>
					   		<c:if test="${boardvo.nb_fileName != null}">
						   		<span class="icon icon-attachment" id="iconattachment"></span> 
					   		</c:if>
					   		<c:if test="${boardvo.writedate == requestScope.today}">
						   		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
					   		</c:if>
					   	</div>  
					   	<div class="nb-info">
					   		<div style="display: inline-block; width: 11%;">
					   			<span class="categorybadge">${boardvo.categoryTag}</span>
					   		</div>
					   		<div style="display: inline-block; width: 14%;">
					   			<span class="username">${boardvo.name_kr}</span>
					   		</div>
					   		<div style="display: inline-block; width: 15%;">
					   			<span class="writedate">${boardvo.writedate}</span>
					   		</div>
					   	</div>			
					   </td>
					   <td>
	            		<c:choose>
				       	 	<c:when test="${boardvo.bookmark == 'true'}">
					       	 	<div style="margin-top:3px;"><a class="bookmark icon icon-star-full" onclick="updatebookmark('${boardvo.nbno}', 'del', event)"></a></div>
					        </c:when>
					        <c:otherwise>
					       		<div style="margin-top:3px;"><a class="bookmark icon icon-star-empty" onclick="updatebookmark('${boardvo.nbno}', 'add', event)"></a></div>
					       	</c:otherwise>
				       	 </c:choose> 
					   </td>
					 </tr>
	            </c:if>
		         </c:when> 
            	 <c:otherwise>
					 <tr >
					    <td>${boardvo.nbno}</td>
					    <td>
						   	<div class="titlefirst">
						   		<span class="title" style="padding-left: 2%;" onclick="goView('${boardvo.nbno}')">${boardvo.subject}</span>
						   		<c:if test="${boardvo.nb_fileName != null}">
							   		<span class="icon icon-attachment" id="iconattachment"></span> 
						   		</c:if>
						   		<c:if test="${boardvo.writedate == requestScope.today}">
							   		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
						   		</c:if>
						   	</div>  
						   	<div class="nb-info">
						   		<div style="display: inline-block; width: 11%;">
						   			<span class="categorybadge">${boardvo.categoryTag}</span>
						   		</div>
						   		<div style="display: inline-block; width: 14%;">
						   			<span class="username">${boardvo.name_kr}</span>
						   		</div>
						   		<div style="display: inline-block; width: 15%;">
						   			<span class="writedate">${boardvo.writedate}</span>
						   		</div>
						   	</div>	
				       </td>
				       <td>
				       	 <c:choose>
				       	 	<c:when test="${boardvo.bookmark == 'true'}">       
					       	 	<div style="margin-top:3px;"><a class="bookmark icon icon-star-full" onclick="updatebookmark('${boardvo.nbno}', 'del', event)"></a></div>
					        </c:when>
					        <c:otherwise>
					       		<div style="margin-top:3px;"><a class="bookmark icon icon-star-empty" onclick="updatebookmark('${boardvo.nbno}', 'add', event)"></a></div>
					       	</c:otherwise>
				       	 </c:choose> 
				       </td>
				     </tr>
      			 </c:otherwise> 
				</c:choose>
	       </c:forEach>
	       </c:if>
	       <c:if test="${empty requestScope.boardList}">
				<tr>
					<td style="width: 100%; border: none;">
						<div class="search-none">
							<i class="fa-solid fa-circle-info" style="display: block; margin-bottom: 5px;"></i>
							조회된 게시글이 없습니다.
						</div>
					</td>
				</tr>
		   </c:if>
		   
	     </tbody>
	   </table>
	   <div id="pageBar" class="mg-paging" align="center" style="width: fit-content; margin:20px auto; margin-top: 50px;">${requestScope.pageBar}</div>
     
	</div>
</div>
</div>



<%-- ★★★★★★★★★★ 오프캔버스 시작 ★★★★★★★★★ --%>
<form name="addFrm" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" 를 해주어야만 파일첨부가 되어진다. -->
<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <div class="offcanvas-header">
    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">공지사항</div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  
  	<div id="alert" class="tagAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">카테고리를 선택하세요.</span>
	</div>
	<div id="alert" class="subjectAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">제목을 입력하세요.</span>
	</div>
	<div id="alert" class="contentAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">내용을 입력하세요.</span>
	</div>
	<div id="alert" class="alarmAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">알림설정 여부를 선택하세요.</span>
	</div>
  
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
					<option value="0" selected>카테고리 선택</option>
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
			<!-- <input multiple="" type="file" name="attaches" class="form-control mg-file" id="mg-file"> -->
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
<%-- ★★★★★★★★★★ 오프캔버스 끝 ★★★★★★★★★ --%>
		
