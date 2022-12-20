<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="freeboard_header.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/board.css?after">
<style type="text/css">
	.table-responsive::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	
	.table-responsive::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
		background-color: rgba(0,0,0, 0.3);  /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	
	.table-responsive::-webkit-scrollbar-track {
		background-color: rgba(242, 242, 242); /*스크롤바 뒷 배경 색상*/
	}
	
	p {
		color: darken(#ccc, 10%);
		font-weight: 300;
	}
	a {
		transition: .3s all ease;
		&, &:hover {
			text-decoration: none!important;
		}
	}
	.content {
		padding: 7rem 0;
	}
	h2 {
		font-size: 20px;
	}
	
	
	.custom-table {
		min-width: 900px;
		thead {
			tr, th {
				border-top: none;
				border-bottom: none!important;
			}
		}
		tbody {
			th, td {
				color: #777;
				font-weight: 400;
	      font-weight: 300;
			}
		}
	}
	
	/* 검색버튼 */
	#searchbtn {
	    /* background-color: white; */
	    font-size: 0.8rem;
	    padding: 0.375rem;
	    position: absolute;
	    bottom: 20%;
	    left: 121%;
	}
	
	
	/* === 게시글목록 테이블 css === */
	.table thead th {
		padding-top: 0;
	    border-bottom: 2px solid #d4d5d6;
	    border-top: 1px solid white;
	}
	.boardth{
		position: relative;
		top: -6px;
	}
	.table td{
		font-size: 10pt;
	    border-bottom: 1px solid #eef2f6;
	    padding-left: 22px;
	}
	.table td:nth-child(1) {
	    padding-top: 27px;
	    border-right: 1.5px solid #eef2f6;
	}
	.table {
	    color: #4c4e54;
	}
	table tr{
		padding-left: 10px;
	}
	table tr:hover {
		background-color: #f4f8f9;
	}
	
	.username {
	    color: #6d7077;
	    font-weight: 600;
	    position: relative;
	    top: 2px;
	    left: -0.5%;
	    margin-right: 15px;
	    margin-left: 6px;
	}
	
	.icon-star-empty{
		color:#bfbfbf;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
		top:12px;
	}
	a.icon-star-empty:hover {
		color: #ffc107;
	}
	
	
	/* === 게시글 목록 === */
	#title,#tagname {
	    height: 44px;
	    padding: 6px 16px 9px 16px;
	    padding-right: 30px;
	    background-color: #fafafa !important;
	    border-radius: 4px !important;
	    box-shadow: none !important;
	    -webkit-appearance: none;
	    border: 2px solid #e8e8e8 !important;
	    font-size: 14px;
	    font-weight: 500;
	    line-height: calc(1.5 * 10px);
	    color: #484848;
	}
	
	#file{
		font-size: 14px;
	}
	
	#title, #tagname {
	    display: block;
	    width: 100%;
	    background-clip: padding-box;
	    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	input {
	    outline: none;
	}
	.control-label {
	    display: block;
	    margin-bottom: 4px;
	    font-size: 13px;
	    line-height: 1.43;
	    color: #9e9e9e;
	}
	#title:focus {
	    background-color: #fff !important;
	    border-color: #086bde !important;
	}
	#title:focus {
	    color: #495057;
	    background-color: #fff;
	    border-color: #80bdff;
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 25%);
	}
	
	
	.toastui-editor-defaultUI {
	    width: 100% !important;
	}
	
	/* 최근글 new 아이콘  */
	.newbadge{
	  background-color: #dc3545;
	  width: 12px;
	  height: 12px;
	  display:inline-block;
	  border-radius: 4px;
	  position: relative;
	  left:10px; 
	  color:white;
	  font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center;
	  position: relative;
	     top: -2px;
	     left: 0%;
	  margin-right: 14px;
	}
	
	
	/* ===  옵션창  === */
	div.option {
	    border: 0px solid #b0b0b0d9;
	    padding: 20px;
	    margin-bottom: 22px;
	    width: 600px;  
	    height: auto; 
	    border-radius: 10px;
	    background-color: white;
	    display: inline-block;
	    font-size: 18pt;
	    box-shadow: 0.5px 0.5px 14px 0.5px rgb(0 0 0 / 20%);
	    position: absolute;
	    top: 25.5%;
	    left: 55.5%;
	    z-index: 2;
	    overflow:hidden;
	 } 
	.condition-cell.title {
	    width: 100px;
	    height: 43px;
	    /* padding-top: 14px; */
	    border: 0;
	    font-size: 13px;
	    font-weight: 500;
	    color: #333;
	    box-sizing: border-box;
	}
	.condition-cell {
	    display: table-cell;
	}
	.js-register-name-search-filter .condition-cell:last-child {
	    width: 80%;
	}
	.target-select-group {
	    margin: 16px 18px 12px 10px;
	    font-size: 10px;
	    color: #555;
	}
	.target-select-group li {
	    float: left;
	    min-width: 122px;
	    height: 28px;
	}
	
	
	/* === 글쓰기 === */
	#option {
		visibility:hidden;
	}
	.title:hover {
	    cursor: pointer;
	    text-decoration: underline; 
	}
	.offcanvas {
	    box-shadow: 5px 5px 20px 3px rgb(91 91 91 / 80%) !important;
	}
	/* 익명체크 */
	#ntRplAnonDiv{
		display:none;
	}
	/* 댓글아이콘 */
	#iconbubble{
		color:#4c4e54;
		padding:0 auto;
		font-size: 10pt;
		position: relative; 
		left:-3px;
		top:3px;"
	}
	/* 댓글갯수 */
	#bubblecnt{
		position: relative; 
		left: -13px;
		top:2px;
	}
	/* 파일첨부 아이콘 */
	#iconattachment{
		color:#4c4e54;
		font-size: 10pt;
		position: relative; 
		left:2px;
	}
	.radio-label-checkbox {
	    position: relative;
	    cursor: pointer;
	    left: -23px;
	}
	
	/* 공개범위, 알림설정 라디오 */
	.custom-control-radio2 {
	    position: relative;
	    left: 21px;
	    top: -2px;
	    z-index: -1;
	}
	.radio-label-checkbox2 {
	    position: relative;
	    cursor: pointer;
	    left: 21px;
	    top: -4px;
	    font-size: 9pt;
	    margin-right: 10px;
	    
	}
	.mr-1{
		margin-right: 10px;
	}
	
	/* 옵션창 초기화버튼 */
	#optionreset{
		margin-left: 90px; 
		border: none; 
		font-size: 8pt; 
		font-weight:bold; 
		border-radius: 3px; 
		background-color:#3B86C812; 
		color: #2E5E87;
		padding: 5px 8px;
		float: right;
	}
	
	/* 작성자 검색 */
	#writer{
		box-shadow: none;
		font-size:9pt; 
		border-radius: 0px;
		border-top: none;
		border-radius: none;
		border-left: none;
		border-right: none;
	}
	
	/* 찜하기 아이콘  */
	.empty-heart{
		 display: inline-block;
		 font-size: 18pt;
		 color: #bfbfbf;
		 position: relative;
		 right: 5px;
	}
	.full-heart{
		 display: none;
		 font-size: 18pt;
		 color: #f53e50;
		 position: relative;
	    right: 5px;
	}
	
	
	/* 에디터 */
	div.toastui-editor-mode-switch {
	    display: none !important;
	}
	
	/* 검색 */
	#searchCondition, #cntselect {
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
	
	
	/* 내게시물 */
	.groupIcon {
		border: 1px solid #f7f7f7;
		padding: 15px;
		margin-bottom: 20px;
		margin-right: 10px;
		width: 18px;  
		height: 18px; 
		border-radius: 10px;
		float: left;
		
		display: block; 
		position: absolute; 
	    left: 139%;
		font-size: 9pt; 
		background-color: #f7f7f7;
	} 	
		
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
	
	.myscrap{
		width: 487px;
		height: 439px;
		border-top: solid 2px #d4d5d6;
		border-left: solid 1px #d4d5d6;
		z-index: 1;
		background-color: white;
		color: #4c4e54;
		position: relative; top: 33px; right: 476px;
		display: none;
	}
		
	/* 내게시물 nav바 */
	.mgList-info a:hover{
		color: #000000;
		cursor: pointer;
	}
	
	.mgList-info {
		margin-left: 4%;
	}
	
	.mgList {
		margin-left: 7%;
	}
	
	.mgList-info {
		font-size: 11pt;
	}
	
	.mgList-info > a {
		display: inline-block;
		width: 13%;
		text-align: center;
		padding: 5px;
		text-decoration: none;
	}
	
	.mgList-info > a > span {
	    margin-left: 1px;
	    color: #37A652;
	    font-weight: bold;
	}
	
	
	/* .mg-current{
		font-weight: bold;
	} */
		
	.mgList-contents{
		height: 330px;
	}
	
	.ms-check + label i{
		color: rgba(0,0,0,0.2);
		font-size: 11pt;
	}
	
	.check-star{
		font-size: 13pt;
		color: rgba(0,0,0,0.3);
		position: relative; bottom: 2px;
	}
	
	.ms-check + label i:hover, .check-star:hover{
		cursor: pointer;
	}
	
	.ms-check + label:hover{color:#37A652;}
	.check-star:hover{color:#ffc107;}
	
	.mgList-contents td:first-child ~ td{
		padding: 7px 5px;
	}
	
	.mg-noncheckmenu{
		font-size: 10pt;
	}
	
	.mg-left-container{
		border: none;
	}
	
	.myscrap-top{
		position: absolute;
		top: 20%;
		height: 2px;
		border: none;
		background-color: red;
	}
		
	/* 조회된 게시글 없을 시 */	
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
		
		
		<%-- ***** 자유게시판에만 있는 것 시작 ***** --%>
		// 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기
		$("input#burger-check").change(function(){
		    if($("#burger-check").is(":checked")){
		        $(".table").css({'width':'62%'});
		        $(".myscrap").css({'position':'relative', 'top':'33.5px', 'right':''});
		        $(".table th:nth-child(1)").css({'padding-right':'47px'});
		        //$(".table td:nth-child(2) div:nth-child(2)").css({'width':'50%'});
		        $(".table th:nth-child(3)").attr("width","12%");
		        $(".fb-info").css("width","100%");
		        $(".myscrap").fadeIn(100);
		        
		    } else{
		        $(".table").css({'width':'100%'});
		        $(".myscrap").css({'position':'relative', 'top':'', 'right':''});
		        $(".table th:nth-child(1)").css({'padding-right':'0.5rem'});
		        $(".table th:nth-child(3)").attr("width","6%");
		        $(".fb-info").css("width","55%");
		        $(".myscrap").fadeOut(100);
		    }
		});

		<%-- 내게시물 nav바 --%>
		$("a.mainlist").click(function(){
			if($(this).hasClass('list_iscurrent') != true){// 현재 페이지가아닐경우 
				$(this).removeClass('list_notcurrent');
				$(this).addClass('list_iscurrent');
				$(this).siblings().removeClass('list_iscurrent');
			}
		});
		<%-- ***** 자유게시판에만 있는 것 끝 ***** --%>

		
		
		
		<%-- ***** 글쓰기 ***** --%>
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
		/* $("div#displayList").hide();
		
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
	     */
		  
		
	});//end of ready---------------------------------------
	
	
	//Function Declaration
	// 게시물 보여주기 
	function goView(fbno) {
		// 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
	    // 사용자가 "검색된결과목록보기" 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해 현재 페이지 주소를 뷰단으로 넘겨준다.
		const gobackURL = "${requestScope.gobackURL}";  // BoardController.java 에서 넘겨준 키값 gobackURL
	
		// /freeboard.up?searchCondition=subject searchVal=java currentShowPageNo=3   ==> 구분자 & 가 없으므로 freeboard.jsp 파일에서 확인한 gobackURL 을 그대로 전부 다 BoardController.java 파일로 넘길 수 있게 된다. 
		
		const searchCondition = $("select#searchCondition").val();
		const searchVal = $("input#searchVal").val();
		
		location.href="<%= ctxPath%>/fboard/view.up?fbno="+fbno+"&gobackURL="+gobackURL+"&searchCondition="+searchCondition+"&searchVal="+searchVal;
				
	}// goView(fbno)-------------------

	
	// 검색어 비우기
	/* function emptysearchbar(){
		$("input#searchWord").val('');
		searchWord = '';
		$("input#searchWord").focus();
		showList(ap_type,bookmark,startDate,endDate,searchType,searchWord);
	} */
	
	// ** 북마크 표시하기 및 표시 해제하기 ** //
	function updatebookmark(fbno, status, e){
		//console.log("여기 >>" + $(e.target));
		//console.log("status >>" + status);
		
  		$.ajax({
			url:"<%= ctxPath%>/fboard/updateScrap.up",
			type:"GET",
			data:{"fbno":fbno,
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
	}// addbookmark(fbno)----------------	 
	
	
	// 검색하는 함수
	function goSearch() { // 검색하는 함수
		const frm = document.searchFrm;
		frm.method = "GET";  
		frm.action = "<%= ctxPath%>/freeboard.up";
		frm.submit(); 
	}// end of function goSearch()-------------------
		
	
	// ** 글쓰기 폼값을 받아서 저장하기 ** //
	function goSave() {
		
		// 댓글허용여부 선택
		if( $("#fbcommentCheck").is(":checked") ) {
			$("#commentCheck").val(1);  // 1:댓글허용
		}else {
			$("#commentCheck").val(0);  // 0:댓글불가
		}
		var commentCheck = $("#commentCheck").val();
		
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
		
		// 폼(form)을 전송(submit)
		const frm = document.addFrm;
        frm.method = "POST";
        frm.fk_employee_no.value = "${sessionScope.loginuser.employee_no}";
        frm.content.value = content;
        frm.commentCheck.value = commentCheck;
        frm.action = "<%= ctxPath%>/freeboard_addEnd.up";
        frm.submit();
		 
	}//goSave()----------------------

</script>

<div class="container mt-5">
	<div class="row">
      <div class="table-responsive" style="width: 100%; height: 500px;">
      	
        <!-- <form action="#" class="booking-form ml-3"  style="margin-bottom: 3px;"> -->
		<form name="searchFrm">
		<div class="row" style="float: right;position: relative;left: -155px;">
		
			<%-- 검색 --%>
			<div class=" mr-2">
				<div class="form-group">
					<div class="form-field">
						<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:7px 6.7px; position: relative; left: 15%;">
							<!-- <option value="all" selected>전체</option> -->
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
			
			<!-- 내게시물 버거  -->
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
													<div><span>이예은</span>&nbsp;<span>대리</span></div>
												</td>
												<td width="22%">
													<div>2022.11.13</div>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<div class="mg-paging">
									<!-- 페이징할거.. -->  <%-- 페이징 처리 잠시 보류...!! --%>
								</div>
							</div>
						</div>
					</div>
	             </div>
			  </div>
			  
		</div>
	    </form>

		<%-- ★★★★★★★★★★ 게시글 목록 뿌리기 ★★★★★★★★★ --%>
        <table class="table" style="margin-top: 40px;">
          <thead>
            <tr>
              <th width="4%" scope="col"/>
              <th width="84%" scope="col"/>
              <th width="6%" scope="col"/>
            </tr>
          </thead>
          <tbody>
          	<c:if test="${not empty requestScope.boardList}">
          	<c:forEach var="boardvo" items="${requestScope.boardList}" varStatus="status">
			<tr>
				<td>${boardvo.fbno}</td>
				<td>
					<div class="titlefirst"> 
				    	<span class="title" onclick="goView('${boardvo.fbno}')">${boardvo.subject}</span>
				   		<c:if test="${boardvo.fb_fileName != null}">
					   		<span class="icon icon-attachment" id="iconattachment"></span> 
				   		</c:if>
				   		<c:if test="${boardvo.writedate == requestScope.today}">
					   		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
				   		</c:if>
				   	</div>  
					<div class="fb-info" style="width: 55%;">
						<div style="display: inline-block; width: 15%; margin-left: -1%;">
							<span class="username">${boardvo.name_kr}&nbsp;${boardvo.position}</span>
						</div>
						<div style="display: inline-block; width: 12.5%;">
							<span class="writedate">${boardvo.writedate}</span>
						</div>
						<div style="display: inline-block; width: 30%;"> 
							<c:if test="${boardvo.commentCheck =='1' && boardvo.commentCount != '0'}">
								<span class="icon icon-bubble2" id="iconbubble" ></span>
						   		<span id="bubblecnt">${boardvo.commentCount}</span>
					   		</c:if>
						</div>
					</div>	
				</td>
				<td>
					<c:choose>
			       	 	<c:when test="${boardvo.bookmark == 'true'}">
				       	 	<div style="margin-top:3px;"><a class="bookmark icon icon-star-full" onclick="updatebookmark('${boardvo.fbno}', 'del', event)"></a></div>
				        </c:when>
				        <c:otherwise>
				       		<div style="margin-top:3px;"><a class="bookmark icon icon-star-empty" onclick="updatebookmark('${boardvo.fbno}', 'add', event)"></a></div>
				       	</c:otherwise>
			       	 </c:choose> 
				</td>
			</tr>
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
    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">자유게시판</div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  
  	<!-- <div id="alert" class="tagAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">카테고리를 선택하세요.</span>
	</div> -->
	<div id="alert" class="subjectAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">제목을 입력하세요.</span>
	</div>
	<div id="alert" class="contentAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">내용을 입력하세요.</span>
	</div>
  
  </div>
  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
  <div class="offcanvas-body">
  
	<div class="d-flex-space mb-3">
		<div class="mb-1">
		
			<div class="dropdown bootstrap-select">
				<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
					<input type="checkbox" class="checkbox-disable custom-control-input" id="fbcommentCheck" name="fbcommentCheck">
					<label class="custom-control-label" for="fbcommentCheck">이 글에 댓글달기를 허용합니다</label>
				</div>
			</div>
		</div>
	</div>	
		
	<!-- <hr class="HRhr  mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/> -->
	<!-- <div class="form-group"style="width:30%">
	
		<div class="form-group mr-1  mb-2">
			<div class="form-field">
				<select name="categoryTag" id="categoryTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;" onchange="changetagname(this)">
				<select name="categoryTag" id="categoryTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;">
					<option value="0" selected>카테고리 선택</option>
					<option value="일반">일반</option>
					<option value="행사">행사</option>
					<option value="인사">인사</option>
					<option value="경조사">경조사</option>
					<option value="plus">태그추가</option>
				</select>
			</div>
		</div>
	</div> -->
	
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
		
	<div class="workstatus-buttoncontainer">
		<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		<!-- <button type="button" class="workstatus-save mr-1"style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;">임시저장<span style="color:#a3a3a3"> | 5</span></button> -->
		<button type="button" class="workstatus-save mr-1 gradientbtn" id="btnWrite" onclick="goSave()">저장하기</button>
		<button type="reset" class="workstatus-cancel mr-1">취소</button>
	</div>   		
	
	<input type="hidden" name="fk_employee_no" value="${sessionScope.loginuser.employee_no}" style="margin-left: 100px; font-size: 6pt;" />
    <input type="hidden" name="name_kr" value="${sessionScope.loginuser.name_kr}" style="font-size: 6pt;" />
    <input type="hidden" name="position" value="${sessionScope.loginuser.position}" style="font-size: 6pt;" />
	<input type="hidden" id="content" name="content" value="" style="font-size: 6pt;">
	<input type="hidden" id="commentCheck" name="commentCheck" value="" style="font-size: 6pt;">
   	
	</div>
</div>
</form>
<%-- ★★★★★★★★★★ 오프캔버스 끝 ★★★★★★★★★ --%>
		
