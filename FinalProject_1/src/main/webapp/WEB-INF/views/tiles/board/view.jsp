<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="noticeboard_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	
	.form-control{
		font-size: 11pt;
		height: 12px;
	}
	
	/* == 글정보 == */  
	.viewtitle{
		font-size: 14pt;
		/* font-weight: bolder; */
		margin-bottom: 5px;
	}
	.writeinfo{
		font-size: 9pt;
	}
	.cmt{
		font-size: 9pt;
	}
	p.contents{
		font-size: 11pt;
		margin-left: 8px;
	}
	
	span.reply{
		color:#999494;
		font-size:9pt;
		position: relative;
		top:5px;
	}
	span.reply:hover{
		cursor: pointer;
	}
	div.line{
		border: 0.1px solid #ececec; 
		margin:15px;
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
	
	/* 댓글작성 버튼  */
	button#writecmt{
		float:right;
		margin:10px;
		margin-right:0;
		right:10px;
		font-size:9pt;
		padding-left:20px;
		padding-right:20px;
		border-color:white; 
		background-color:#4d4f53;
		color:white;
	}
	
	/* 드롭다운 css */
	a.dropdown-link{
		color:#7f7f7f;
		float:right;
		position: absolute;
		right:91px;
	}
	
 	/* 공유아이콘  */
	a.share{
		font-size: 11pt !important;
	}
	
	div#cmtcontent{
		width:85%;
		margin-bottom: 10px;
		margin-left: 52px;
	}
	a.bookmark, a.share {
		border-radius: 7px;
	    width: 26px;
	    height: 26px;
	    position: relative;
	    margin-right: 5px;
	    font-size: 13pt;
	    right: -4px;
	    top: 8px;
	}
	 a.share {
		border: 1px solid #d9d9d9;
	}
	a.bookmark::before{
	    position: absolute;
	    top: 0.2rem;
	    right: 0.2rem;
	}
	a.share::before{
	    position: absolute;
	    top: 0.3rem;
	    right: 0.3rem;
	}
	
     #empty-heart{
		 display: inline-block;
	}
	#full-heart{
	    margin-left: 5px;
		display: none;
	}
	.like{
		margin-left: 5px;
		font-size: 12pt;
		color: #f53e50;
		position: relative;
	    right: 5px;
	    top: 1.3px;
	}
	
	
	
	
	
	
	
	/* 수정 삭제 버튼 */
	.bd_toolbar{
		border: 1px solid #d9d9d9;
		border-radius: 7px;
	    width: 35px;
	    height: 26px;
	    position: relative;
	    margin-right: 5px;
	    color: #7f7f7f;
    	text-align: center;
    	padding-top: 3px;
    	display: inline-block;
    	font-size: 10pt;
    	top: 8px;
    	position: relative;
	}
	#edit:hover{
		color: #7f7f7f;
	}
	
	
	.table td {
	    font-size: 10pt;
	    border-top: 1px solid #ececec;
	    padding-left: 0;
	    border-bottom: 0px;
	    padding-top: 14px;
	}
	
	
	
	/* 댓글작성 에디터  */
	.toastui-editor-defaultUI .ProseMirror {
	    padding: 14px 23px;
	}
	.toastui-editor-defaultUI button {
		font-size: 9px !important;
	}
	
	
	/* === 댓글목록 === */
	#name{
		position: relative;
		right: -8px;
	    top: 9.5px;
	}
	#picbox{
		display: inline-block !important;
		position: relative !important;
		right: -6px !important;
		top: 7px !important;
		margin-left: -5px !important;
		height: 35px !important;
		width: 35px !important;
		font-size: 8pt !important;
	}
	a.icon-flickr{
		font-size: 5pt !important
	}
	
	
	.article_reply div.reply_wrap div.reply div.view_option {
	    cursor: default;
	    padding-bottom: 16px;
	    border-bottom: 1px solid #e6e6e6;
	}
	.article_reply div.reply_wrap div.reply>div {
	    width: 100%;
	    table-layout: fixed;
	    border-spacing: 0;
	    box-sizing: border-box;
	}
	.article_reply div.reply_wrap div.reply>div {
	    margin: 0px 0;
	    padding: 8px 24px;
	}
	span.part{
     	margin-left:3px;
     	margin-right:3px;
     	color:#ececec;
     }
     
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	
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
	});
  	$('#empty-heart').click(function() {
  		$(this).css('display',"none");
  		$(this).next().css('display',"inline-block");
	});
	  $('#full-heart').click(function() {
  		$(this).css('display',"none");
  		$(this).prev().css('display',"inline-block");
	});
		  
		  
		  
		  
		  
		  
		  
	// 글쓰기 버튼
    $("button#writecmt").click(function(){
       
       // 폼(form)을 전송(submit)
    });	  
	
    <%-- 텍스트 에디터 시작 --%>
	/* const editor = new toastui.Editor({
	    el: document.querySelector("#editor"),
	    height: "140px",
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
	 const editor = new Editor({
	      el: document.querySelector('#editor'),
	      height: '150px',
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
	
	
	//offcanvas
 	$("a#edit").click(function(){
 		$('.offcanvas').offcanvas('show');	
 	});
	
});//end of ready

/* 글쓰기 버튼을 눌렀을경우 빈 폼이 나오고 , 수정하기 눌렀을경우 해당 게시물의 값이 입력된 폼이 나타나기 */
/* 	function offcanvas_show(btn){
		if(btn.attr("id")=="edit"){
			
		}
		
		$('.offcanvas').offcanvas('show');	
	}
 */
	function imageUpload(formData) {
	/* 	 
	  let imageURL;
	  $.ajax({
	    type: "post",
	    url: "",
	    async: false,
	    data: formData,
	    processData: false,
	    contentType: false,
	    success: function (data) {
	      imageURL = data;
	      console.log(imageURL);
	    },
	    error: function (request, status, error) {
	      alert(request + ", " + status + ", " + error);
	    },
	  }); */
	
	  return imageURL;
	}


</script>
<div class="container col-9 mt-5">
	<div >
		<div class="mb-5">
			<div class="titlefirst">
	       		<div class="categorybadge mb-1">전체공지</div><br>
	       		<div class="viewtitle">5주년 창립기념일 행사</div>
	       		<a style="float:right;font-size: 25px;top: -35px;"href="#" class="bookmark icon icon-star-empty"></a>
	       <!-- <span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> --> 
	       	</div>  
	       	<div class="writeinfo">
	       		<img class="boardprofile mr-2 mt-1" width="35px" height="35px" style="border-radius: 13px;background-color: white;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 6%);" src="<%= request.getContextPath()%>/resources/images/로고2.jpg"> 
	       		<span class="teamname">관리자</span>
	     		<span class="writedate">2022.11.16</span>
			     
	       	</div>
       	</div>

		
		<p class="contents pl-2"><!-- 메시지내용 -->
			안녕하세요.<br><br>

			2022년 12월 9일(금) 14:00 시에<br> 
			Thumps up 의 5주년 창립기념일 행사가 예정되어 있습니다.<br>
			
			급하신 업무는 오전에 마무리해주시기 바라오며,<br>
			각 부서별 14:00 시에 지하 1층 회의실에서 정시에 모여주시기 바랍니다.<br> 
			.....<br>
			
			날씨가 많이 추워지고 있습니다.<br>
			모두 한 주도 수고 많으셨고, <br>
			... 바랍니다.<br> 
			
			
		</p>
		<!-- 첨부파일 아코디언 시작 -->
		<div class="accordion mgc-ac mt-5 mb-3" id="accordionPanelsStayOpenExample" style="margin-left: 0;">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
		      <button style="padding: 0.5rem 1.25rem;"class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
					<div><i class="fas fa-paperclip"></i></div>
					<div>첨부파일 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
		      <div class="accordion-body mgc-attach mgc-ac-content">
		      	<div>
			      	<span><i class="fas fa-download"></i></span>
			      	<span>첨부파일명</span>
			      	<span>(10MB)</span>
		      	</div>
		      	<div>
			      	<span><i class="fas fa-download"></i></span>
			      	<span>첨부파일명</span>
			      	<span>(10MB)</span>
		      	</div>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 첨부파일 아코디언 끝 -->
		
		<div class="reply_wrap cmt mt-5" style="display: inline-block;">
             <div class="reply additional">
                 <div class="view_option" data-role="button" style="display:">
                     <span class="ic_classic ic_reply"></span>
                     <span class="txt_b">댓글 <span class="num txt_b" id="commentCount">1 </span>개</span>
                     <span class="part">|</span>
                     <span class="txt_ txt_b">
                         조회
                         <a id="listPostReader" class="linkNum">57</a>
                     </span>
                     <span class="part">|</span>
                     <a href="#" class="like"id="empty-heart">♡</a>︎<a href="#" class="like"id="full-heart">♥</a>︎<span class="txt_ txt_b">좋아요 누른 사람
                     <a id="listPostRecommend" class="linkNum">3 </a>명
                     </span>
                 </div>
            </div>
        </div>
        <div class="dropdown custom-dropdown" style="margin-right: 10px;display: inline-block;float: right;top:34px;">
        	<div style="display: inline-block;">
	              <a class="bd_toolbar" id="edit" style=""href="#">수정</a>
	              <a class="bd_toolbar" id="delete" style="color:#ea4335"href="#">삭제</a>
			   </div>
	          <a class="dropdown-link share icon icon-share2" style="float:right;"href="#" id="dropdownMenuButton1" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20"></a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton1" >
	             <a class="dropdown-item" href="#">메일로 공유하기</a>
	             <a class="dropdown-item" href="#">링크복사</a>
	             <a class="dropdown-item" href="#">인쇄하기</a>
	           </div>
	    </div>
	    

		<div class="line"></div>
     	
     	<div style="margin-bottom:4rem!important">
	      	<span class="pic" id="picbox" ><span id="name" >지은</span></span>
	      	<br>
     		<div id="editor"></div>
     		<button id="writecmt"class="btn ">작성</button>
     	</div>
     	
     	
     	
     	
     	 <table class="table custom-table ">
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;position: relative;top: -13px">
		      		<!-- <img class="boardprofile mr-2" width="35px" height="35px"> -->
		      		<span class="pic" id="picbox" ><span id="name" >지은</span></span>
		      	</div>
		      	<span class="teamname">김지은</span>
		      	<span class="writedate">25분전</span>
		      	<span class="reply icon icon-forward"></span>
		      	
		      	<div class="dropdown custom-dropdown text-left " style="position: inherit;display: inline-block;">
	            <a class="dropdown-link icon icon-flickr" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="-70, 20"></a>
		            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;" >
		              <a class="dropdown-item" href="#">수정하기</a>
		              <a class="dropdown-item" href="#">삭제하기</a>
		            </div>
	          	</div> 
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
		   
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;position: relative;top: -13px">
		      		<!-- <img class="boardprofile mr-2" width="35px" height="35px"> -->
		      		<span class="pic" id="picbox" style="background-color: rgb(238, 144, 111)" ><span id="name" >혜린</span></span>
		      	</div>
		      	<span class="teamname">진혜린</span>
		      	<span class="writedate">1시간전</span>
		      	<span class="reply icon icon-forward"></span>
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;position: relative;top:-13px">
		      		<!-- <img class="boardprofile mr-2" width="35px" height="35px"> -->
		      		<span class="pic" id="picbox" style="background-color: rgb(104 210 109)"><span id="name" >예은</span></span>
		      	</div>
		      	<span class="teamname">이예은</span>
		      	<span class="writedate">11.16</span>
		      	<span class="reply icon icon-forward"></span>
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;position: relative;top: -13px">
		      		<!-- <img class="boardprofile mr-2" width="35px" height="35px"> -->
		      		<span class="pic" id="picbox" style="background-color: rgb(120 201 226)"><span id="name">채영</span></span>
		      	</div>
		      	<span class="teamname">강채영</span>
		      	<span class="writedate">11.16</span>
		      	<span class="reply icon icon-forward"></span>
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
		   
        </table>
     	
	<%-- 댓글 페이지바  --%>	
		<div style="display: flex; margin-bottom: 50px;">
		    <div id="pageBar" style="margin: auto; text-align: center;"></div>
		</div>	
		
	<%-- 이전글 다음글  --%>	
		<div style="margin-bottom: 1%;">이전글제목&nbsp;&nbsp;<span class="move" onclick=""></span></div>
	    <div style="margin-bottom: 1%;">다음글제목&nbsp;&nbsp;<span class="move" onclick="'"></span></div>
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
				<div class="form-field mb-2">
					<div class="select-wrap">
						<select name="selectTag" id="selectTag" class="form-control mb-1" style="font-size: 10pt;padding: 6px 12px;height:36px;" onchange="changetagname(this)">
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
		  			<!-- <button type="button" class="workstatus-save mr-1"style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;">임시저장<span style="color:#a3a3a3"> | 5</span></button> -->
		  			<button type="button" class="workstatus-save mr-1">수정하기</button>
		  			<button type="reset" class="workstatus-cancel mr-1">취소</button>
	  			</div>
    	
		  	</div>
		  </div>
		<!-- 오프캔버스 끝 -->
