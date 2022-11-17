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
	
	<%-- === 스마트 에디터 구현 시작 === 
	
	//전역변수
       var obj = [];
       
       //스마트에디터 프레임생성
       nhn.husky.EZCreator.createInIFrame({
           oAppRef: obj,
           elPlaceHolder: "content",
           sSkinURI: "<%= ctxPath%>/resources/smarteditor/SmartEditor2Skin.html",
           htParams : {
               // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
               bUseToolbar : true,            
               // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
               bUseVerticalResizer : true,    
               // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
               bUseModeChanger : true,
           }
       });
===  스마트 에디터 구현 끝 === --%>
	
	// 글쓰기 버튼
    $("button#writecmt").click(function(){
       
       <%-- === 스마트 에디터 구현 시작 === 
       // id가 content인 textarea에 에디터에서 대입
         obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
         === 스마트 에디터 구현 끝 === --%>
       
    
    <%-- === 글내용 유효성 검사(스마트 에디터 사용 할 경우) 시작 === 
        var contentval = $("textarea#content").val();
            
       
          contentval = contentval.replace(/&nbsp;/gi, ""); // 공백을 "" 으로 변환
       /*    
             대상문자열.replace(/찾을 문자열/gi, "변경할 문자열");
         ==> 여기서 꼭 알아야 될 점은 나누기(/)표시안에 넣는 찾을 문자열의 따옴표는 없어야 한다는 점입니다. 
                      그리고 뒤의 gi는 다음을 의미합니다.
    
         g : 전체 모든 문자열을 변경 global
         i : 영문 대소문자를 무시, 모두 일치하는 패턴 검색 ignore
    */ 
    //   alert(contentval);
    //   <p>             </p>
       
         contentval = contentval.substring(contentval.indexOf("<p>")+3);
         contentval = contentval.substring(0, contentval.indexOf("</p>"));
                
         if(contentval.trim().length == 0) {
            alert("글내용을 입력하세요!!");
             return;
         }
      
     === 글내용 유효성 검사(스마트 에디터 사용 할 경우) 끝 === --%>
       
       // 폼(form)을 전송(submit)
    });	  
	
});//end of ready


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
					<textarea  class="" title="" placeholder="내용을 입력해주세요" name="content" value=""></textarea>
				</div>
			</div>
    	</form>

    </div>  
		
	
</div>
