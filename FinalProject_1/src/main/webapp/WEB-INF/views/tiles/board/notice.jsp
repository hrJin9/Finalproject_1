<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="board_header.jsp"%> 

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
#title {
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
#title {
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
	
	
	("input#ntAlwReply").check
  
});//end of ready


</script>
<div class="container col-9 mt-5">
	<div class="row">
      <div class="table-responsive">
      	 
      	 <div style="display: inline-block;float: right;">
      	 	 <a href="#" id="write"class="btn "style="font-size: 9pt;padding-left:20px;padding-right:20px;border-color:white; background-color:#4d4f53;color:white">글쓰기</a>
      	 </div>
          <form action="#" class="booking-form ml-3"  style="float: left;margin-bottom: 0;">
			<div class="row" style="margin-right:0;">
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<div class="select-wrap">
								<select name="" id="" class="form-control" style="font-size: 9pt;padding:6px 12px;">
								<option>태그선택</option>
								<option value="">제목</option>
								<option value="">작성자</option>
								<option value="">팀</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="">
					<div class="form-group">
						<div class="form-field">
							<!-- <div class="icon"><span class="fa fa-search"></span></div> --> 
							<input type="text" class="form-control" placeholder="제목/작성자/팀으로 검색" style="width:190%; font-size: 9pt; padding:6px 12px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 10pt;margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white;font-size: 0.8rem;position: relative;left: 100px;"></a>
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
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
              <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr>
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr >
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
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
	    		<div class="d-flex-space">
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
						<div class="d-flex-space">
							<div class="dropdown bootstrap-select">
								<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
									<input type="checkbox" class="checkbox-disable custom-control-input" id="ntRplAnon" name="ntRplAnon">
									<label class="custom-control-label" for="ntRplAnon">이 글의 댓글은 익명으로 작성됩니다</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">제목</span>
				<div class="position-relative">
					<input type="text" id="title" class="form-control" title="" placeholder="제목을 입력해주세요" name="title" value="">
				</div>
			</div>
			
			<div class="form-group" style="margin-top: 10px;">
				<span class="control-label">내용</span>
				<div class="position-relative">
					<div id="editor"></div>
					<!-- <textarea  class="" title="" placeholder="내용을 입력해주세요" name="content" value=""></textarea> -->
				</div>
			</div>
    	</form>
    		<div class="workstatus-buttoncontainer">
	  				<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		  			<button type="reset" class="workstatus-cancel">취소</button>
		  			<button type="button" style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;"class="workstatus-save">임시저장</button>
		  			<button type="button" class="workstatus-save">저장하기</button>
	  			</div>
    	
		  	</div>
		  </div>
		<!-- 오프캔버스 끝 -->