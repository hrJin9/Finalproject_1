<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="board_header.jsp"%> 
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<style type="text/css">

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
.topnotice{
	background-color: #f9f9f9;
}

.username {
    color: #6d7077;
    font-weight: 600;
    position: relative;
    top: 2px;
    margin-right: 15px;
    margin-left: 6px;
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
    top: 28.5%;
    left: 55.5%;
    z-index: 2;
    overflow:hidden;
 } 
.detail-search-conditions {
  margin: 10px 20px 0 30px;
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
/* 검색기간 라디오 체크*/
.radio-label-checkbox {
    position: relative;
    cursor: pointer;
    left: -23px;
}
.label-checkbox {
    position: relative;
    cursor: pointer;
    left: 4px;
    font-size: 11.5px;
    top:-1px
}
.target-select-group .radio-label-checkbox::before {
    margin-right: 12px;
}
.radio-label-checkbox::before {
    display: inline-block;
    content: "";
    background: url(/flow-renewal/assets/images/allseach-sprite-type-4.png) no-repeat -96px 0;
    background-size: 560px auto;
    width: 14px;
    height: 14px;
    vertical-align: middle;
}
ul{
	padding-left: 0;
	list-style: none;
	margin-bottom: 3rem;
}
/* 검색기간 라디오 라벨*/
.custom-control-radio {
    position: relative;
    left: -5px;
    top: 3px;
    z-index: -1;
 }
 .radio-label-checkbox::before {
    display: inline-block;
    content: "";
    background: url(/flow-renewal/assets/images/allseach-sprite-type-4.png) no-repeat -96px 0;
    background-size: 560px auto;
    width: 14px;
    height: 14px;
    vertical-align: middle;
}
 li{
 	font-size: 10pt;
 }
 
 /* 날짜 옵션 */
.search-period-wr .filter-input-box {
    overflow: hidden;
    display: inline-block;
    margin: 10px 0 0 0;
    /* padding: 7px 44px 0 10px; */
    height: 32px;
    width: auto;
}
.filter-input-box {
    position: relative;
    height: 40px;
    margin-top: 10px;
    padding: 10px 15px 10px 15px;
    background: #fff;
    /* border: 1px solid #ddd; */
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-border-radius: 4px;
    /* border-radius: 4px; */
    width: 100%;
    font-size: 13px;
}
div.datebox > span > input {
    bottom: 3px !important;
    top: -10px !important;
}    
.attendance-dateSelector {
    height: 30px;
    display: inline-block;
    border: solid 1px rgba(0, 0, 0, .1);
    margin: 0;
    width: 120px !important;
    padding: 7px 20px 7px 20px;
	border-radius: 7px;
}

.search-period-wr .filter-date-label {
    right: 10px;
}
.filter-date-label {
    position: absolute;
    top: 50%;
    right: 20px;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
    cursor: pointer;
}




/* === 글쓰기 === */

/* 카테고리박스 */
#categorydiv{
	position:absolute;
	visibility:hidden;
	font-size:12px;
	background-color: white;
	width:25%;
	z-index: 2;
	border: 1px solid gainsboro;
    padding: 12px;
    border-radius: 5px;
}
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
	left:15px;
	top:3px;"
}
/* 댓글깻수 */
#bubblecnt{
	position: relative; 
	left:8px;
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
	left: 121.5%;
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
	height: 435px;
	border-top: solid 2px #d4d5d6;
	border-left: solid 1px #d4d5d6;
	z-index: 1;
	background-color: white;
	color: #4c4e54;
	position: relative; top: 25px; right: 476px;
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

.nb-info{
	width: 53%;
}

</style>

<script type="text/javascript">

$(document).ready(function(){
	$(".search-period-wr").hide();
	$("div#ntRplAnon").hide();
	$("a#notice").addClass('list_iscurrent');
	$("#date_total").prop("checked", true);
	
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
	
	//offcanvas
 	$("a#writebtn").click(function(e){
 		$('.offcanvas').offcanvas('show');
 	});
	 	
	
	
 	<%-- 텍스트 에디터 시작 --%>
	/* const editor = new toastui.Editor({
	    el: document.querySelector("#editor"),
	    height: "500px",
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
	 }); */
	 const { Editor } = toastui; 
	 const { colorSyntax } = Editor.plugin;
	 
	 /* const colorSyntaxOptions = {
			 preset: ['#181818', '#292929', '#393939']
	 }; */

	const editor = new Editor({
	      el: document.querySelector('#editor'),
	      height: '500px',
	      initialEditType:"wysiwyg",
	      previewStyle: 'vertical',
	      plugins: [colorSyntax],
	      /* language: "ko-KR", */
	      hooks: {
		      addImageBlobHook: function (blob, callback) {
		        const formData = new FormData();
		        formData.append("image", blob);
		        const imageURL = imageUpload(formData);
		        // console.log(imageURL);
		        callback(imageURL, "image");
		      },
		    } 
	    });
     
	<%-- 텍스트 에디터 끝 --%>
	
	
	
	// 글쓰기 버튼
    $("button#writecmt").click(function(){
       
       
       // 폼(form)을 전송(submit)
    });	  
	
	
	
	/* 익명체크뜨게하기 */
    $("input#ntAlwReply").change(function(){
        if($("#ntAlwReply").is(":checked")) ntRplAnonDiv.style.display="block";
        else ntRplAnonDiv.style.display="none";
    });
	
	
	
    
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
	});
	
	
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
	// 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기
	$("input#burger-check").change(function(){
	    if($("#burger-check").is(":checked")){
	        $(".table").css({'width':'62%','margin-top':'32px'});
	        // $(".table th:nth-child(2)").attr("width","8%");
	        $(".myscrap").css({'position':'relative', 'top':'31.5px', 'right':''});
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
	
	
});//end of ready

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
function changetagname(obj){
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
};

function goSearch(){
	
}

</script>
<div class="container mt-5">
	<div class="row">
      <div class="table-responsive" style="width: 100%; overflow-y: hidden;">
      	 
          <form action="#" class="booking-form ml-3"  style="margin-bottom: 3px;">
			<div class="row" style="float: right;position: relative;left: -121px;" >
			
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group"">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 6px; position: relative; left: 15%;">
								<option value="">전체</option>
								<option value="">작성자</option>
								<option value="">제목</option>
								<option value="">제목+내용</option>
							</select>
						</div>
					</div>
				</div>
				<div class="">
					<div class="form-group">
						<div class="form-field">
							<!-- <div class="icon"><span class="fa fa-search"></span></div> --> 
							<input type="text" class="form-control" placeholder="검색" style="width:135%; font-size: 9pt; padding:6px 12px;padding-left: 45px; position: relative; left: 8%">
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
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: -17%"></a>
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
														<div><span>관리자</span>·<span>마케팅</span></div>
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
							     <li class="mb-1"><input type="checkbox" name="category" id="chk1"value="인사"><label for="chk1" class="label-checkbox" data-code="unlimit">인사</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk2"value="경조사"><label for="chk2" class="label-checkbox" data-code="unlimit">경조사</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk3"value="행사"><label for="chk3" class="label-checkbox" data-code="unlimit">행사</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk5"value="일반"><label for="chk5" class="label-checkbox" data-code="unlimit">일반</label></li>
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
		            <button type="button" class="workstatus-save mr-1"  onClick="goSearch()">검색</button>
		        </div>
		    </div>
		</div>
   </div>
</form>

	
        <table class="table" style="height: 400px;">
          <thead>
            <tr>
              <th width="4%" scope="col"/>
              <th width="83%"scope="col"/>
              <th width="6%"scope="col"/>
            </tr>
          </thead>
          <tbody>
          	<tr class="topnotice"><!-- 공지 상단에 고정 -->
          	  <td>1</td>
              <td>
              	<div class="titlefirst"> 
	              	<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/pushpin_1f4cc.png" width="15px"/>
	              	<span class="title" onclick="location.href='/thumbsup/board/view.up'">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div class="nb-info">
              		<div style="display: inline-block; width: 11%;">
              			<span class="categorybadge">일반</span>
              		</div>
              		<div style="display: inline-block; width: 10%;">
              			<span class="username">관리자</span>
              		</div>
              		<div style="display: inline-block; width: 10%;">
              			<span class="writedate">2022.11.16</span>
              		</div>
              		<div style="display: inline-block; width: 30%;"> 
              			<span class="icon icon-bubble2" id="iconbubble" ></span><span id="bubblecnt">11</span>
              		</div>
              	</div>			
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
              <td>2</td>
              <td>
              	<div class="titlefirst">
              		<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/pushpin_1f4cc.png" width="15px"/>
              		<span class="title">[전원필독] ★퇴근 시 유의사항★</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div class="nb-info">
              		<div style="display: inline-block; width: 11%;">
              			<span class="categorybadge">일반</span>
              		</div>
              		<div style="display: inline-block; width: 10%;">
              			<span class="username">관리자</span>
              		</div>
              		<div style="display: inline-block; width: 10%;">
              			<span class="writedate">2022.11.16</span>
              		</div>
              		<div style="display: inline-block; width: 30%;"> 
              			<span class="icon icon-bubble2" id="iconbubble" ></span><span id="bubblecnt">11</span>
              		</div>
              	</div>					
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            
            <tr class="topnotice">
               <td>3</td>
               <td>
              	<div class="titlefirst">
              		<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/pushpin_1f4cc.png" width="15px"/>
              		<span class="title">[떰접식당 이용정책 변경안내]</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
              	</div>  
              	<div class="nb-info">
              		<div style="display: inline-block; width: 11%;">
              			<span class="categorybadge">인사</span>
              		</div>
              		<div style="display: inline-block; width: 10%;">
              			<span class="username">관리자</span>
              		</div>
              		<div style="display: inline-block; width: 10%;">
              			<span class="writedate">2022.11.16</span>
              		</div>
              		<div style="display: inline-block; width: 30%;"> 
              			<span class="icon icon-bubble2" id="iconbubble" ></span><span id="bubblecnt">11</span>
              		</div>
              	</div>					
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr>
               <td>4</td>
               <td>
              	<div class="titlefirst">
              		<span class="title">[그룹웨어] 알림기능 업데이트 안내</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
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
              		<div style="display: inline-block; width: 30%;"> 
              			<span class="icon icon-bubble2" id="iconbubble" ></span><span id="bubblecnt">11</span>
              		</div>
              	</div>		
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr >
               <td>5</td>
               <td>
              	<div class="titlefirst">
              		<span class="title">[온라인 세미나] 11/25(금) 세미나 공지</span>
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
              		<div style="display: inline-block; width: 30%;"> 
              			<span class="icon icon-bubble2" id="iconbubble" ></span><span id="bubblecnt">11</span>
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
		<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">공지사항</div>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		  <div class="offcanvas-body">
	    		
    		<form>
	    		<div class="d-flex-space mb-3">
	    			<div class="mb-1">
	    				<div class="dropdown bootstrap-select">
	    					<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
	    						<input type="checkbox" class="checkbox-disable custom-control-input" id="ntPriority" name="ntPriority">
	    						<label class="custom-control-label" for="ntPriority">이 글을 상단에 고정합니다</label>
	    					</div>
	    				</div>
						<div class="d-flex-space mb-1">
							<div class="dropdown bootstrap-select">
								<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
									<input type="checkbox" class="checkbox-disable custom-control-input" id="ntAlwReply" name="ntAlwReply">
									<label class="custom-control-label" for="ntAlwReply">이 글에 댓글달기를 허용합니다</label>
								</div>
							</div>
						</div>
						<div class="d-flex-space" id="ntRplAnonDiv">
							<div class="dropdown bootstrap-select">
								<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
									<input type="checkbox" class="checkbox-disable custom-control-input" id="ntRplAnon" name="ntRplAnon">
									<label class="custom-control-label" for="ntRplAnon">이 글의 댓글은 익명으로 작성됩니다</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			<!-- <hr class="HRhr  mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/> -->
			<div class="form-group"style="width:30%">
			
				<div class="form-group mr-1  mb-2">
					<div class="form-field">
						<select name="selectTag" id="selectTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;" onchange="changetagname(this)">
							<option value="" selected>태그선택</option>
							<option value="">전체공지</option>
							<option value="">일반공지</option>
							<option value="">사내공지</option>
							<option value="">이벤트공지</option>
							<option value="">문진표공유</option>
							<option value="plus">태그추가</option>
						</select>
						</div>
				</div>
				  <div id="divPlusTag1"></div><!-- <span class="error">태그명을 입력해주세요</span> -->
				  <div id="divPlusTag2"></div>
			</div>
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">제목</span>
				<div class="position-relative">
					<input type="text" id="title" class="form-control" title="" placeholder="제목을 입력해주세요" name="title" value="">
				</div>
			</div>
			
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">내용</span>
				<div class="position-relative mb-1">
				      <div id="editor"></div>
				</div>
			</div>
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">파일첨부</span><span style="color: #d8d8d8;font-size:9pt">파일은 하나당 최대 10MByte 까지 업로드 가능합니다. 여러개를 첨부하려면 [Shift키] 또는 [Ctrl키]를 누르고 선택해주세요</span>
				<div class="position-relative">
					<input type="file" id="file" class="form-control"  name="file" >
				</div>
			</div>
	    	<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
	    	
	    	<!-- <div class="form-group" style="margin-top: 10px;">
				<div class="control-label" style="float: left;">공개범위</div>
	            <div class="condition-cell">
	                <input type="radio" class="custom-control-radio2" id="entire" name="showrange">
	                <label for="entire" class="js-period-type radio-label-checkbox2" data-code="unlimit">전체공개</label>
	                <input type="radio" class="custom-control-radio2" id="dept" name="showrange">
	                <label for="dept" class="js-period-type radio-label-checkbox2" data-code="unlimit">부서공개</label>
	                <input type="radio" class="custom-control-radio2" id="manager" name="showrange">
	                <label for="manager" class="js-period-type radio-label-checkbox2" data-code="unlimit">관리자공개</label>
				</div>
			</div> -->
	    	<div class="form-group" style="margin-top: 5px;">
				<div class="control-label" style="float: left;">알림설정</div>
	            <div class="condition-cell">
	                <!-- <input type="radio" class="custom-control-radio2" id="mail" name="boardalarm">
	                <label for="mail" class="js-period-type radio-label-checkbox2" data-code="unlimit">메일알림</label> -->
	                <input type="radio" class="custom-control-radio2" id="popup" name="boardalarm">
	                <label for="popup" class="js-period-type radio-label-checkbox2" data-code="unlimit">팝업알림</label>
	                <input type="radio" class="custom-control-radio2" id="none" name="boardalarm">
	                <label for="none" class="js-period-type radio-label-checkbox2" data-code="unlimit">미설정</label>
				</div>
			</div>
    	</form>
			
    			<div class="workstatus-buttoncontainer">
	  				<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		  			<button type="button" class="workstatus-save mr-1"style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;">임시저장<span style="color:#a3a3a3"> | 5</span></button>
		  			<button type="button" class="workstatus-save mr-1">저장하기</button>
		  			<button type="reset" class="workstatus-cancel mr-1">취소</button>
	  			</div>
    	
		  	</div>
		  </div>
		<!-- 오프캔버스 끝 -->