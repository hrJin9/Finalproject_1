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
	
	
	
	
	
	
	
	.form-control{
		font-size: 11pt;
		height: 12px;
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
	
	<%-- === 스마트 에디터 구현 시작 === \
	
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
	<div >

		<div class="titlefirst">
       		<div class="categorybadge mb-1">전체공지</div><br>
       		<div class="viewtitle">5주년 창립기념일 행사</div>
       <!-- <span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> --> 
       	</div>  
       	<div class="writeinfo">
       		<img class="boardprofile mr-2" width="35px" height="35px">
       		<span class="teamname">THUMBS UP</span>
     		<span class="writedate">11.16</span>
     		<a style="float:right"href="#" class="bookmark icon icon-star-empty"></a>
     		
     		<div class="dropdown custom-dropdown text-left " style="position: absolute;;display: inline-block;right: 39rem;">
            <a class="dropdown-link bookmark share icon icon-share2"style="float:right" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="-70, 20"></a>
	            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;" >
	              <a class="dropdown-item" href="#">메일로 공유하기</a>
	              <a class="dropdown-item" href="#">링크복사</a>
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
	
		<div class="cmt mt-5">댓글 11</div>
		<div class="line"></div>
     	
     	<div style="margin-bottom:11rem!important">
     		<img class="boardprofile mr-2" width="35px" height="35px" style="display:block; position: absolute;"><br><br>
     		<textarea name="content" id="content"></textarea>
     		<button id="writecmt"class="btn ">작성</button>
     	</div>
     	
     	
     	
     	
     	
     	 <table class="table custom-table ">
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;"><img class="boardprofile mr-2" width="35px" height="35px"></div>
		      	<span class="teamname">김지은</span>
		      	<span class="writedate">25분전</span>
		      	<span class="reply icon icon-forward"></span>
		      	
		      	<div class="dropdown custom-dropdown text-left " style="position: inherit;display: inline-block;">
	            <a class="dropdown-link icon icon-flickr" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="-70, 20"></a>
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
		      	<div style="display: inline-block;width: 50px;"><img class="boardprofile mr-2" width="35px" height="35px"></div>
		      	<span class="teamname">진혜린</span>
		      	<span class="writedate">1시간전</span>
		      	<span class="reply icon icon-forward"></span>
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;"><img class="boardprofile mr-2" width="35px" height="35px"></div>
		      	<span class="teamname">이예은</span>
		      	<span class="writedate">11.16</span>
		      	<span class="reply icon icon-forward"></span>
		      	<div id="cmtcontent">확인했습니다!</div>
		      </td>
		   </tr>
          <tr style="height: 15px;">
		      <td>
		      	<div style="display: inline-block;width: 50px;"><img class="boardprofile mr-2" width="35px" height="35px"></div>
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
