<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="board_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	
	p {
		color: darken(#ccc, 10%);
		font-weight: 400;
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
	
	
	
	
	.form-control{
		font-size: 11pt;
		height: 12px;
	}
	
	
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
	a.dropdown-link{
		color:#7f7f7f;
		float:right;
		position: absolute;
		right:91px;
	}
	a.share{
		font-size: 11pt !important;
	}
	div#cmtcontent{
		width:85%;
		margin-bottom: 10px;
		margin-left: 52px;
	}
	a.bookmark, a.share{
		border: 1px solid #d9d9d9;
		border-radius: 7px;
	    width: 26px;
	    height: 26px;
	    position: relative;
	    margin-right: 5px;
	    font-size: 13pt;
	    right: -4px;
	    top: 10px;
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
	
	
	.table td {
	    font-size: 10pt;
	    border-top: 1px solid #ececec;
	    padding-left: 0;
	    border-bottom: 0px;
	    padding-top: 14px;
	}
	.toastui-editor-defaultUI .ProseMirror {
	    padding: 14px 23px;
	}
	.toastui-editor-defaultUI button {
		font-size: 9px !important;
	}
	
	
	
	.post-option .set-btn {
	    margin: -1px 0 0 20px;
	}
	.set-btn {
	    padding: 4px 8px;
	    margin: 1px 7px 0 30px;
	    vertical-align: middle;
	    cursor: pointer;
	}
	.post-option .setup-group {
	    overflow: hidden;
	    position: absolute;
	    z-index: 1;
	    top: 50px;
	    right: 35px;
	    background: #fff;
	    border: 1px solid #555;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    -webkit-border-radius: 6px;
	    border-radius: 6px;
	}
	.setup-group {
	    padding: 4px 0;
	}
	.setup-group>li {
	    position: relative;
	}
	button {
	    background-color: transparent;
	}
	button, input {
	    border-radius: 0;
	    border: 0;
	}
	button{
	    font-family: inherit;
	    font-size: 100%;
	    line-height: normal;
	    color: #333;
	}
	.post-option .set-btn span {
	    width: 2px;
	    height: 2px;
	    background: #777;
	}
	.set-btn span:first-child {
	    margin: 0;
	}
	.set-btn span {
	    display: block;
	    border-radius: 50%;
	}
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
		/*   	e.preventDefault(); */
	});
	
	// 글쓰기 버튼
    $("button#writecmt").click(function(){
       
       // 폼(form)을 전송(submit)
    });	  
	
    <%-- 텍스트 에디터 시작 --%>
	const editor = new toastui.Editor({
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
	 });
	<%-- 텍스트 에디터 끝 --%>
	
});//end of ready
	

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

		<div class="titlefirst">
       		<div class="categorybadge mb-1">전체공지</div><br>
       		<div class="viewtitle">5주년 창립기념일 행사</div>
       <!-- <span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> --> 
       	</div>  
       	<div class="writeinfo">
       		<img class="boardprofile mr-2 mt-1" width="35px" height="35px" style="border-radius: 13px;background-color: white;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 6%);" src="<%= request.getContextPath()%>/resources/images/로고2.jpg"> 
       		<span class="teamname">THUMBS UP</span>
     		<span class="writedate">11.16</span>
     		<!-- <span class="icon icon-eye" style="position:relative;color:#7e7e7e;font-size:8pt;top:2px"></span>32 -->
     		<a style="float:right"href="#" class="bookmark icon icon-star-empty"></a>
     		
     		<div class="dropdown custom-dropdown text-left " style="margin-right: 10px;display: inline-block;float: right;">
            <a class="dropdown-link share icon icon-share2"href="#" id="dropdownMenuButton1" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20"></a>
	            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton1" >
	              <a class="dropdown-item" href="#">메일로 공유하기</a>
	              <a class="dropdown-item" href="#">링크복사</a>
	              <a class="dropdown-item" href="#">인쇄하기</a>
	            </div>
          	</div>
          	
       	</div>

		<div class="line"></div>
		
		<p class="contents pl-2">
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
	
		<div class="cmt mt-5" style="display: inline-block;"><span style="margin-right: 1rem;">댓글 11</span><span>읽음 11</span></div>
		<div class="dropdown custom-dropdown text-left " style="position: inherit;display: inline-block;">
            <a class="dropdown-link icon icon-flickr" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="-70, 20"></a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;" >
              <a class="dropdown-item" href="#">수정하기</a>
              <a class="dropdown-item" href="#">삭제하기</a>
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
	          	<!-- <button class="js-setting-button set-btn">
                  <span></span>
                  <span></span>
                  <span></span>
                </button>
				<ul class="js-setting-ul js-setting-layer setup-group d-none" style="display: block;">
                   <li class="js-setting-item" data-code="modify" style="display:block" data="">
                       <a href="#"> <i class="icons-write"></i>수정
                           <i class="edit-auth-icon icons-question js-mouseover d-none" mouseover-text="공동 수정 권한이 활성화 되어있습니다." style="display:none" data=""></i>
                       </a>
                   </li>
                   <li class="js-setting-item" data-code="copy" style="display:block" data="">
                       <a href="#"> <i class="icons-project-1"></i>다른 프로젝트에 복사</a>
                   </li><li class="js-setting-item" data-code="url" style="display:block" data="">
                       <a href="#"> <i class="icons-copy"></i>링크 복사</a>
                   </li>
                   <li class="js-setting-item" data-code="googleCalendar" style="display:none" data="">
                       <a href="#"> <i class="ico-schedule"></i>구글 캘린더에 등록</a>
                   </li>
                   

                   <li class="js-setting-item" data-code="delete" style="display:block" data="">
                       <a href="#"> <i class="icons-delete-3"></i>삭제</a>
                   </li>
                 </ul>
                           -->      
                                
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
		   
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;position: relative;top: -13px">
		      		<!-- <img class="boardprofile mr-2" width="35px" height="35px"> -->
		      		<span class="pic" id="picbox" style="background-color: #fbbc05" ><span id="name" >혜린</span></span>
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
		      		<span class="pic" id="picbox" style="background-color: #34a853"><span id="name" >예은</span></span>
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
		      		<span class="pic" id="picbox" style="background-color: #ea4335"><span id="name">채영</span></span>
		      	</div>
		      	<span class="teamname">강채영</span>
		      	<span class="writedate">11.16</span>
		      	<span class="reply icon icon-forward"></span>
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
		   
        </table>
     	
	<%-- ==== #132. 댓글 페이지바 ==== --%>	
	<div style="display: flex; margin-bottom: 50px;">
	    <div id="pageBar" style="margin: auto; text-align: center;"></div>
	</div>	
		
	</div>
	
</div>
