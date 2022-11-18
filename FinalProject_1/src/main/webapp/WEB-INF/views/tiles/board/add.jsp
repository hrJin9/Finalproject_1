<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="board_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

.boardth{
	position: relative;
	top: -6px;
}
.table td{
	font-size: 10pt;
    border-top: 1px solid #ececec;
    padding-left: 0;
    border-bottom: 0px;
}
.table {
    color: #4c4e54;
}
table tr{
	padding-left: 10px;
}
.topnotice{
	background-color: #f9f9f9;
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
button#writecmt{
	float:right;
	margin:10px;
	right:10px;
	font-size:9pt;
	padding-left:20px;
	padding-right:20px;
	border-color:white; 
	background-color:#b9b8b8;
	color:white;
}
a.dropdown-link{
	color:#999494;
	font-size: 5pt;
	float:right;
	position: absolute;
	right: 50px;
}
div#cmtcontent{
	width:85%;
	margin-bottom: 10px;
	margin-top:10px;
	margin-left: 52px;
}
a.bookmark, a.share{
	border: 1px solid #d9d9d9;
	border-radius: 7px;
    width: 26px;
    height: 26px;
    position: relative;
}
a.bookmark{
    margin-right: 5px;
    font-size: 13pt;
    right: -4px;
    top: 10px;
}
a.share{
    font-size: 11pt;
    color:#626161;
    left: 581px;
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
.form-control, .btn {
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
.form-control {
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
    font-size: 12px;
    line-height: 1.43;
    color: #9e9e9e;
}
.form-control:focus {
    background-color: #fff !important;
    border-color: #086bde !important;
}
.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #80bdff;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 25%);
}

</style>


<script type="text/javascript">


$(document).ready(function(){
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
		  	e.preventDefault();
	});
	
	
	// 글쓰기 버튼
    $("button#writecmt").click(function(){
       
       
       // 폼(form)을 전송(submit)
    });	  
	
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
	<div>
      <h4 class="h4">공지사항</h4>
      <span class="icon icon-cross"></span>
	</div>

    <div class="modal-body-content">
    	<div>
    		<div class="d-flex-space"><div class="mb-1"><div class="dropdown bootstrap-select"><div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;"><input type="checkbox" class="checkbox-disable custom-control-input" id="ntPriority" name="ntPriority"><label class="custom-control-label" for="ntPriority">이 글을 상단에 고정합니다</label></div></div><div class="d-flex-space mb-1"><div class="dropdown bootstrap-select"><div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;"><input type="checkbox" class="checkbox-disable custom-control-input" id="ntAlwReply" name="ntAlwReply"><label class="custom-control-label" for="ntAlwReply">이 글에 댓글달기를 허용합니다</label></div></div></div><div class="d-flex-space"><div class="dropdown bootstrap-select"><div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;"><input type="checkbox" class="checkbox-disable custom-control-input" id="ntRplAnon" name="ntRplAnon"><label class="custom-control-label" for="ntRplAnon">이 글의 댓글은 익명으로 작성됩니다</label></div></div></div></div><div></div></div>
    	</div>
    	<form>
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">제목</span>
				<div class="position-relative"><input type="text" class="form-control" title="" placeholder="제목을 입력해주세요" name="title" value=""></div>
			</div>
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">내용</span>
				<div class="position-relative">
					<div id="editor"></div>
					<!-- <textarea  class="" title="" placeholder="내용을 입력해주세요" name="content" value=""></textarea> -->
				</div>
			</div>
    	</form>

    </div>  
		
	
</div>
