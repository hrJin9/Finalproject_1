<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="board_header.jsp"%> 
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/mdb.min.css"> --%>
<!-- MDB -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css" rel="stylesheet"/> -->
<!-- MDB -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.js"></script> -->
<style type="text/css">


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


.form-control{
	font-size: 12pt;
}
.row>*{
	width: auto;
	padding: 0;
}





.viewtitle{
	font-size: 14pt;
	font-weight: bolder;
}
.writeinfo{
	font-size: 9pt;
}
.cmt{
	font-size: 9pt;
}
p.contents{
	font-size: 11pt;
}

span.reply{
	color:#999494;
	font-size:9pt;
	position: relative;
	top:3px;
}
span.reply:hover{
	cursor: pointer;
}
div.line{
	border: 0.1px solid #ececec; 
	margin:20px;
	width:100%;
	position:relative;
	left:-20px;
}
textarea#content{
 	float:right;
 	width: 93%; 
 	margin-right:10px; 
 	height: 100px;
}
a.dropdown-link{
	color:#999494;
	font-size: 5pt;
	float:right;
	position: absolute;
	right: 50px;
} 
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
/* #tagname {
	
} */

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

div.option {
    border: 1px solid #b0b0b0d9;
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
    top: 15%;
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
 /* 
 .search-period-wr .filter-input-box:first-child {
    margin: 10px 30px 0 0;
} */
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
#ntRplAnonDiv{
	display:none;
}
#iconbubble{
	color:#4c4e54;
	padding:0 auto;
	font-size: 10pt;
	position: relative; 
	left:15px;
	top:3px;"
}
#bubblecnt{
	position: relative; 
	left:8px;
	top:2px;
}
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
#writer{
	box-shadow: none;
	font-size:9pt; 
	border-radius: 0px;
	border-top: none;
	border-radius: none;
	border-left: none;
	border-right: none;
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
 	$("a#write").click(function(e){
 		$('.offcanvas').offcanvas('show');
 	});
	 	
	
 	<%-- 텍스트 에디터 시작 --%>
	const editor = new toastui.Editor({
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
	})
	
	
});//end of ready

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
<div class="container col-9 mt-5">
	<div class="row">
      <div class="table-responsive" style="width: 100%;">
      	 
      	 <div style="display: inline-block;float: left;">
      	 	 <a href="#" id="write"class="btn "style="font-size: 9pt;padding-left:20px;padding-right:20px;border-color:white; background-color:#4d4f53;color:white">글쓰기</a>
      	 </div>
          <form action="#" class="booking-form ml-3"  style="margin-bottom: 3px;">
			<div class="row" style="float: right;position: relative;left: -120px;" >
			
				<div class="form-group" style="margin-right: 1rem;margin-left: 1rem;">
					<div class="form-field">
						<div class="select-wrap">
							<select name="" id="" class="form-control" style="font-size: 9pt;padding:6px 12px;">
							<option>분류 선택</option>
							<option value="">제목</option>
							<option value="">작성자</option>
							<option value="">팀</option>
							</select>
						</div>
					</div>
				</div>
				<div class="">
					<div class="form-group">
						<div class="form-field">
							<!-- <div class="icon"><span class="fa fa-search"></span></div> --> 
							<input type="text" class="form-control" placeholder="제목/작성자/팀으로 검색" style="width:193%; font-size: 9pt; padding:6px 12px;padding-left: 45px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 8pt;margin-bottom:0;">
						<a id="searchoption"href="#" class="btn" style="color:#0a58caa1; padding: 0.2rem 0.4rem;border-radius:0px; background-color: white;font-size: 0.7rem;position: relative;left: -540%;border-right: 1px solid #ced4da;" onClick="optionForm('OPEN')">옵션</a>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 10pt;margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white;font-size: 0.8rem;position: relative;left: 253%;"></a>
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
							     <li class="mb-1"><input type="checkbox" name="category" id="chk1"value="전체공지"><label for="chk1" class="label-checkbox" data-code="unlimit">전체공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk2"value="일반공지"><label for="chk2" class="label-checkbox" data-code="unlimit">일반공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk3"value="이벤트공지"><label for="chk3" class="label-checkbox" data-code="unlimit">이벤트공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk4"value="문진표공유"><label for="chk4" class="label-checkbox" data-code="unlimit">문진표공유</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk5"value="사내공지"><label for="chk5" class="label-checkbox" data-code="unlimit">사내공지</label></li>
							     <li class="mb-1"><input type="checkbox" name="category" id="chk6"value="기타공지"><label for="chk5" class="label-checkbox" data-code="unlimit">기타공지</label></li>
							    </ul>
							    <div style="padding-top:3px;text-align:right">
							    	<!-- <button type="reset" class="workstatus-cancel">취소</button> -->
							    	<input type="button" class="workstatus-cancel"value="SAVE" onClick="multiSelect('CLOSE')" style="width:50%; border:none;color:#0a58caa1;">
							    </div>
				   			</div>
			   			</div>
			        </li>
			        <!-- <li class="js-project-name-search-filter" style="display: block;">
			            <div class="condition-cell title">프로젝트</div>
			            <div class="condition-cell">
			                <input class="form-control" style="box-shadow: none;font-size:9pt; border-radius: 0px;border-top: none;border-radius: none;border-left: none;border-right: none;"type="text" placeholder="프로젝트명을 입력하세요">
			            </div>
			        </li> -->
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

		
        <table class="table custom-table">
          <thead>
            <tr>
              <th width="80%"scope="col"/>
              <th width="6%"scope="col"/>
            </tr>
          </thead>
          <tbody>
          	<tr class="topnotice"><!-- 공지 상단에 고정 -->
              <td>
              	<div class="titlefirst">
              		<i class="icon icon-pushpin"style="color:#4285f4;"></i>&nbsp;<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">THUMBS UP</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
              		<span class="icon icon-bubble2" id="iconbubble" ></span> <span id="bubblecnt">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
              <td>
              	<div class="titlefirst">
              		<i class="icon icon-pushpin"style="color:#4285f4;"></i>&nbsp;<span class="title">[전원필독] ★퇴근 시 유의사항★</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">일반공지</span>
              		<span class="teamname">THUMBS UP</span>
            		<span class="writedate">11.16</span>
            		<!-- <span class="newbadge"><span style="position: relative;top:-2px;">n</span></span> -->
              		<span class="icon icon-bubble2" id="iconbubble" ></span> <span id="bubblecnt">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            
            <tr class="topnotice">
               <td>
              	<div class="titlefirst">
              		<i class="icon icon-pushpin"style="color:#4285f4;"></i>&nbsp;<span class="title">[떰접식당 이용정책 변경안내]</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">일반공지</span>
              		<span class="teamname">THUMBS UP</span>
            		<span class="writedate">11.16</span>
            		<!-- <span class="newbadge"><span style="position: relative;top:-2px;">n</span></span> -->
              		<span class="icon icon-bubble2" id="iconbubble" ></span> <span id="bubblecnt">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr>
               <td>
              	<div class="titlefirst">
              		<span class="title">[그룹웨어] 알림기능 업데이트 안내</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">전체공지</span>
              		<span class="teamname">IT</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
              		<span class="icon icon-bubble2" id="iconbubble" ></span> <span id="bubblecnt">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr >
               <td>
              	<div class="titlefirst">
              		<span class="title">[온라인 세미나] 11/25(금) 세미나 공지</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
              		<span class="icon icon-bubble2" id="iconbubble" ></span> <span id="bubblecnt">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>

            
          </tbody>
        </table>
     
     
     
     
     
	</div>
</div>
</div>

<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" style="font-weight: 1000;font-size: 16pt;"id="offcanvasScrollingLabel">공지사항</div>
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
				<div class="form-field mb-2">
					<div class="select-wrap">
						<select name="selectTag" id="selectTag" class="form-control" style="font-size: 10pt;padding: 6px 12px;height:36px;" onchange="changetagname(this)">
						<option>태그선택</option>
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
				<span class="control-label">파일첨부</span>파일은 하나당 최대 10MByte 까지 업로드 가능합니다. 여러개를 첨부하려면 [Shift키] 또는 [Ctrl키]를 누르고 선택해주세요
				<div class="position-relative">
					<input type="file" id="file" class="form-control"  name="file" >
				</div>
			</div>
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">내용</span>
				<div class="position-relative">
					<div id="editor"></div>
					<!-- <textarea  class="" title="" placeholder="내용을 입력해주세요" name="content" value=""></textarea> -->
				</div>
			</div>
	    	<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
	    	
	    	<div class="form-group" style="margin-top: 10px;">
				<div class="control-label" style="float: left;">공개범위</div>
	            <div class="condition-cell">
	                <input type="radio" class="custom-control-radio2" id="entire" name="showrange">
	                <label for="entire" class="js-period-type radio-label-checkbox2" data-code="unlimit">전체공개</label>
	                <input type="radio" class="custom-control-radio2" id="dept" name="showrange">
	                <label for="dept" class="js-period-type radio-label-checkbox2" data-code="unlimit">부서공개</label>
	                <input type="radio" class="custom-control-radio2" id="manager" name="showrange">
	                <label for="manager" class="js-period-type radio-label-checkbox2" data-code="unlimit">관리자공개</label>
				</div>
			</div>
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