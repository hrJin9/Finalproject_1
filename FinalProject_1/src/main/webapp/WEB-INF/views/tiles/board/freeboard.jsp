<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="freeboard_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/mdb.min.css"> --%>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

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
	left:15px;
	top:3px;"
}
/* 댓글갯수 */
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
    left: 130%;
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
	
</style>

<script type="text/javascript">

$(document).ready(function(){
	$("div#ntRplAnon").hide();
	/* $("a#notice").addClass('list_iscurrent'); */
	//툴팁 사용
	var tooltipel = $(".tp").tooltip();
	
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
	 const { Editor } = toastui; 
	 const { colorSyntax } = Editor.plugin;
	 
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

	
	// 모든 조직 펼치기
	$(".unfold").click(function(){  // 조직도 확대 아이콘 클릭시
		$(".summary").click();      // 모든 조직의 summary 클릭
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
	
	
	<%-- 내게시물 nav바 --%>
	$("a.mainlist").click(function(){
		if($(this).hasClass('list_iscurrent') != true){// 현재 페이지가아닐경우 
			$(this).removeClass('list_notcurrent');
			$(this).addClass('list_iscurrent');
			$(this).siblings().removeClass('list_iscurrent');
		}
	});
	
	
});//end of ready



function goSearch(){  // 검색시 함수
	
}

</script>
<div class="container mt-5">
	<div class="row">
      <div class="table-responsive" style="width: 100%; height: 500px; overflow-y: hidden;">
      	
          <form action="#" class="booking-form ml-3"  style="margin-bottom: 3px;">
			<div class="row" style="float: right;position: relative;left: -132px;" >
			
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 6px;">
								<option value="">전체</option>
								<option value="">작성자</option>
								<option value="">제목</option>
								<option value="">제목+내용</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: 14px;">
							<input type="text" class="form-control" placeholder="검색" style="width:150%; font-size: 9pt; padding:6px 6px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: -25%;"></a>
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
										페이징할거..
									</div>
								</div>
							</div>
						</div>
		             </div>
				  </div>
				</div>
			</form>

		
        <table class="table" style="height: 378px; margin-top: 40px;">
          <thead>
            <tr>
              <th width="4%" scope="col"/>
              <th width="84%" scope="col"/>
              <th width="6%" scope="col"/>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>
              	<div class="titlefirst">
              		<span class="title">맛집 추천합니다!</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div class="fb-info" style="width: 55%;">
              		<div style="display: inline-block; width: 16.5%; margin-left: -1%;">
              			<span class="username">이예은&nbsp;본부장</span>
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
              <td>2</td>
              <td>
              	<div class="titlefirst">
              		<span class="title">3층 여자화장실 청결 관리 신경써주세요.</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div class="fb-info" style="width: 55%;">
              		<div style="display: inline-block; width: 16.5%; margin-left: -1%;">
              			<span class="username">이예은&nbsp;본부장</span>
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
               <td>3</td>
               <td>
              	<div class="titlefirst">
              		<span class="title">이번주 사내식당 메뉴 공유합니다.</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div class="fb-info" style="width: 55%;">
              		<div style="display: inline-block; width: 16.5%; margin-left: -1%;">
              			<span class="username">이예은&nbsp;본부장</span>
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
              		<span class="title">회사 근처 헬스장 추천 부탁드려요.</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
            		<span class="newbadge"><span style="position: relative;top:-2px;">n</span></span>
              	</div>  
              	<div class="fb-info" style="width: 55%;">
              		<div style="display: inline-block; width: 16.5%; margin-left: -1%;">
              			<span class="username">이예은&nbsp;과장</span>
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
              		<span class="title">남은 3주 화이팅해봅시다:)! 오늘도 다들 수고 많았어요.</span>
              		<span class="icon icon-attachment" id="iconattachment"></span> 
              	</div>  
              	<div class="fb-info" style="width: 55%;">
              		<div style="display: inline-block; width: 16.5%; margin-left: -1%;">
              			<span class="username">이예은&nbsp;대리</span>
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
     
     
	</div>
</div>
</div>

<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">자유게시판</div>
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
				<span class="control-label">파일첨부</span><span style="color: #d8d8d8;font-size:9pt">파일은 하나당 최대 10MByte 까지 업로드 가능합니다. 여러개를 첨부하려면 [Shift키] 또는 [Ctrl키]를 누르고 선택해주세요</span>
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
	    	<!-- <hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/> -->
	    	
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