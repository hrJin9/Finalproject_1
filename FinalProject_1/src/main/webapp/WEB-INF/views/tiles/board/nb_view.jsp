<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="noticeboard_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">

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
		margin-bottom: 14%;
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
	
	/* 북마크 */
	a.bookmark::before {
	    position: absolute;
	    top: -2rem;
	    left: 70.5rem;
	    font-size: 16pt;
	}
	
	/* 이전글, 다음글 클릭  */
	div#pn_nbview{
		color: #403f3f; 
		font-size: 11pt;
    	padding: 0.8% 0.5%;
	}
	div#pn_nbview:hover {
		background-color: #f4f8f9;
	}
	
	.move:hover {
	    cursor: pointer;
	    text-decoration: underline;
	}
	
	
	/* 알림창  */
	div#alert {
	    display: none;
	    width: 243px;
	    height: 35px;
	    background-color: #4d4d4d;
	    color: white;
	    font-weight: bold;
	    font-size: 10pt;
	    border-radius: 2em;
	    padding-left: 32px;
	    position: fixed;
	    top: 15px;
	    right: 17%;
	    box-shadow: 1px 1px 1px 1.3px rgb(0 0 0 / 20%);
	}
	
	/* 링크복사 알림창  */
	.urlcopyAlert {
	    display: none;
	    width: 243px;
	    height: 35px;
	    background-color: #4d4d4d;
	    color: white;
	    font-weight: bold;
	    font-size: 10pt;
	    border-radius: 2em;
	    padding-left: 32px;
	    position: fixed;
	    top: 15px;
	    right: 40%;
	    box-shadow: 1px 1px 1px 1.3px rgb(0 0 0 / 20%);
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
	a.bookmark {
	    border-radius: 7px;
	    width: 26px;
	    height: 26px;
	    position: relative;
	    margin-right: 5px;
	    font-size: 13pt;
	    right: -106px;
	    top: -27px;
	}
	
	a.share {
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
		/* display: none; */
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
		font-size: 5pt !important;
		color: #7f7f7f;
		float: right;
		position: absolute; right: 106px; bottom: -41.5%;
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
		$("a#writebtn").hide();
		
		
		<%-- ***** 관리자 계정만 공지게시판 글수정 및 삭제 권한 부여 ***** --%>
		if(${sessionScope.loginuser.employee_no} == '99') {
			$("a#editbtn").show();
			$("a#deletebtn").show();
		} else {
			$("a#editbtn").hide();
			$("a#deletebtn").hide();
		}
		
		
		// offcanvas
	 	$("a#editbtn").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		
	 		// 상단고정 여부 넣어주기
	 		if(${requestScope.boardvo.priority} == '1') {
	 			$("input:checkbox[id='ntpriority']").prop("checked", true); 
	 		}
	 		
	 		// 카테고리 값 넣어주기
	 		$('#categoryTag').val("${requestScope.boardvo.categoryTag}").prop("selected",true);
	 		
	 		// 내용 넣어주기 (제목은 HTML에서 넣어줌)
	        <%-- 텍스트 에디터 시작 --%>
	 		editor = new toastui.Editor({
			    el: document.querySelector("#editor"),
			    height: "390px",
			    initialValue: '${requestScope.boardvo.content}',
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
	 		
	 	});// $("a#editbtn").click-------------------
	 	
		
		// 게시글 1개의 좋아요 개수 알아오기
		goLikeCount(${requestScope.boardvo.nbno});
		
	 	// 인쇄하기
		$("#print").click(function(e){
			window.print();
		});
		
	});//end of ready---------------------------------

	
	// 링크복사
	let nowUrl = window.location.href;
	function copyUrl(){ 
	  	//nowUrl 변수에 담긴 주소를
	  	navigator.clipboard.writeText(nowUrl).then(res=>{
		  $(".urlcopyAlert").fadeIn("fast");
			setTimeout(function(){
				$(".urlcopyAlert").fadeOut("fast");
			}, 1500);
			//alert("주소가 복사되었습니다!");
			return; // 종료
		})
	}
	
	
	// 좋아요 누르기
	function likeAdd(nbno, status, e) {
		//console.log("여기 >>" + $(e.target).text());
		//console.log("status >>" + status);
		
        $.ajax({
            url:"<%= request.getContextPath()%>/heartAdd.up",
            type:"POST",
			data:{"nbno":nbno,
				  "status":status},
			dataType:"json",
            success:function(json){
            	if(json.result = 1){
            		
            		if($(e.target).text() == '♡') {  // 비어있다면
            			$(e.target).text('♥');
            		} else {
            			$(e.target).text('♡');
            		}
				}
            	
                goLikeCount(nbno); // 좋아요 개수 알아오기
            },
            error: function(request, status, error){
                 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
        });


	}// likeAdd(nbno, status, e)--------------------
	
	
	// 게시글 1개의 좋아요 개수 알아오기
	function goLikeCount(nbno) {
		//console.log("nbno >>" + nbno);
		
	    $.ajax({
	        url:"<%= request.getContextPath()%>/goLikeCount.up",
	     // type:"GET",
	        data:{"nbno":nbno},
	        dataType:"JSON",
	        success:function(json){
	        	$("a#listPostRecommend").html(json.heartCnt); 
	        },
	        error: function(request, status, error){
	             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }

	    });

	}// goLikeCount()--------------------
	
	// ** 북마크 표시하기 및 표시 해제하기 ** //
	function updatebookmark(nbno, status, e){
		console.log("여기 >>" + $(e.target));
		console.log("status >>" + status);
		
  		$.ajax({
			url:"<%= ctxPath%>/notice/updateScrap.up",
			type:"GET",
			data:{"nbno":nbno,
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
	}// addbookmark(nbno)----------------	
	
	
	
	// ** 글쓰기 폼값을 받아서 수정내용 저장하기 ** //
	function goEdit() {
		
		// 상단고정 선택여부
		if( $("#ntpriority").is(":checked") ) {
			$("#priority").val(1);
		}else {
			$("#priority").val(0);
		}
		var priority = $("#priority").val();
		
		// 카테고리 유효성 검사
		if($("select[name='categoryTag']").val() == 0) {
			$(".tagAlert").fadeIn("fast");
			setTimeout(function(){
				$(".tagAlert").fadeOut("fast");
			}, 1500);
			//alert("태그를 선택하세요.");
		    return; // 종료
		}
		
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
		
		// 알림설정 유효성 검사
		var tagCheck = $('input:radio[name=boardalarm]').is(':checked'); // 체크 여부(checked)
		if(tagCheck == false) {
			$(".alarmAlert").fadeIn("fast");
			setTimeout(function(){
				$(".alarmAlert").fadeOut("fast");
			}, 1500);
			//alert("알림설정 여부를 선택하세요.");
			return;
		}
		
		// 폼(form)을 전송(submit)
		const frm = document.editFrm;
        frm.method = "POST";
        frm.nbno.value = "${requestScope.boardvo.nbno}";
        /* frm.fk_employee_no.value = "${sessionScope.loginuser.employee_no}"; */
        frm.content.value = content;
        frm.priority.value = priority;
        frm.action = "<%= ctxPath%>/board_editEnd.up";
        frm.submit();
		 
	}//goEdit()----------------------
		
	// 글삭제 하기
	function del() {
		
		var result = confirm("게시글을 정말 삭제하시겠습니까?");
        if(result) {
            //yes
            // 폼(form)을 전송(submit)
			const frm = document.Frm;
			frm.nbno.value = "${requestScope.boardvo.nbno}";
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/board_delEnd.up";
			frm.submit(); 
        } else {
            //no
        	return; // 종료
        }
		
	}	
		
</script>

<div class="container col-9 mt-5">
	<form name="Frm">
		<c:if test="${empty requestScope.boardvo}">
		    <div style="padding: 50px 0; font-size: 16pt; color: red;">게시물이 존재하지 않습니다.</div>
		</c:if>
		
		<c:if test="${not empty requestScope.boardvo}">
		<div >
			<div class="mb-5">
				<div class="titlefirst">
		       		<div class="viewCategorybadge mb-1">${requestScope.boardvo.categoryTag}</div><br>
		       		<div class="viewtitle">${requestScope.boardvo.subject}</div>
		       		<!-- <a style="float:right;font-size: 25px;top: -35px;"href="#" class="bookmark icon icon-star-empty"></a> -->
		       		
		       		<c:choose>
			       	 	<c:when test="${boardvo.bookmark == 'true'}">       
				       	 	<div style="margin-top:-26px;"><a class="bookmark icon icon-star-full" onclick="updatebookmark('${boardvo.nbno}', 'del', event)"></a></div>
				        </c:when>
				        <c:otherwise>
				       		<div style="margin-top:-26px;"><a class="bookmark icon icon-star-empty" onclick="updatebookmark('${boardvo.nbno}', 'add', event)"></a></div>
				       	</c:otherwise>
			       	 </c:choose> 
		       		
		       <!-- <span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> --> 
		       	</div>  
		       	<div class="writeinfo">
		       		<img class="boardprofile mr-2 mt-2" width="35px" height="35px" style="border-radius: 13px;background-color: white;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 6%);" src="<%= request.getContextPath()%>/resources/images/로고2.jpg"> 
		       		<span class="teamname">${requestScope.boardvo.name_kr}</span>
		     		<span class="writedate">${requestScope.boardvo.writedate}</span>
				     
		       	</div>
	       	</div>
			<%-- <p style="word-break: break-all;" class="contents pl-2">${requestScope.boardvo.content}</p> --%>  <!-- style="word-break: break-all; 은 공백없는 긴영문일 경우 width 크기를 뚫고 나오는 것을 막는 것임. -->
			<div class="contents pl-2" style="word-break: break-all; font-size: 11pt; min-height: 240px; padding-left: 30px; padding-bottom: 50px;">${requestScope.boardvo.content}</div>
			<input type="hidden" name="nbno" value="${requestScope.boardvo.nbno}" style="margin-left: 100px; font-size: 6pt;" />
			
			<!-- 첨부파일 아코디언 시작 -->
			<div class="accordion mgc-ac mt-5 mb-3" id="accordionPanelsStayOpenExample" style="margin-left: 0;">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button style="padding: 0.5rem 1.25rem;"class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
						<div><i class="icon icon-attachment"></i></div>
						
						<c:if test="${empty requestScope.boardvo.nb_orgFilename}">
							<div>첨부파일 <span>0</span></div> <!-- 없으면 0이라고 뜸 -> 사이즈개수 처리하기 ★ -->
						</c:if>
						<c:if test="${not empty requestScope.boardvo.nb_orgFilename}">
							<div>첨부파일 <span>1</span></div>
						</c:if>
			      </button>
			    </h2>
			    <c:if test="${not empty requestScope.boardvo.nb_orgFilename}">
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
				      <div class="accordion-body mgc-attach mgc-ac-content">
				      	<div>
					      	<span><i class="fas fa-download"></i></span>
					      	<<%-- span>${requestScope.boardvo.nb_orgFilename}</span> --%>
					      	<%-- <span>( ${requestScope.boardvo.fileSize} Bytes )</span> --%>
					      	<span><a href="<%= request.getContextPath()%>/download.up?nbno=${requestScope.boardvo.nbno}">${requestScope.boardvo.nb_orgFilename} ( ${requestScope.boardvo.fileSize} Bytes )</a></span>  <%-- nb_orgFilename 은 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 진짜 파일명  --%>
				      	</div>
				      	<!-- <div>
					      	<span><i class="fas fa-download"></i></span>
					      	<span>첨부파일명</span>
					      	<span>(10MB)</span>
				      	</div> -->
				      </div>
				    </div>
			    </c:if>
			  </div>
			</div>
			<!-- 첨부파일 아코디언 끝 -->
			
			<div class="reply_wrap cmt mt-3" style="display: inline-block;">
	             <div class="reply additional">
	                 <div class="view_option" data-role="button" style="display: inline-block;">
	                     <span class="ic_classic ic_reply"></span>
	                     <span class="txt_ txt_b">조회
	                         <a id="listPostReader" class="linkNum">${requestScope.boardvo.readcnt}</a>
	                     </span>
	                     <span class="part">| </span>
	                     
	                     <c:choose>
				       	 	<c:when test="${boardvo.heart == 'true'}">
					       	 	<a href="#" class="like full-heart" id="full-heart" onclick="likeAdd('${boardvo.nbno}', 'del', event)">♥</a>
					        </c:when>
					        <c:otherwise>
					       		<a href="#" class="like empty-heart" id="empty-heart" onclick="likeAdd('${boardvo.nbno}', 'add', event)">♡</a>
					       	</c:otherwise>
				       	 </c:choose> 
				       	 
	                     <%-- <a href="#" class="like full-heart" id="full-heart" onclick="updatebookmark('${boardvo.nbno}', 'del', event)">♥</a>
	                     <a href="#" class="like empty-heart" id="empty-heart" onclick="updatebookmark('${boardvo.nbno}', 'add', event)">♡</a> --%>
	                     <span class="txt_ txt_b">좋아요 누른 사람 <a id="listPostRecommend" class="linkNum"></a> 명</span>
	                 </div>
	            </div>
	        </div>
	        <div class="dropdown custom-dropdown" style="margin-right: 10px;display: inline-block;float: right;top:8px;">
	        	<div style="display: inline-block;">
		            <!-- <a class="bd_toolbar" id="editbtn" href="#" onclick="edit()">수정</a> -->
		            <a class="bd_toolbar" id="editbtn" href="#">수정</a>
		            <a class="bd_toolbar" id="deletebtn" href="#" onclick="del()" style="color:#ea4335">삭제</a>
			    </div>
		        <a class="dropdown-link share icon icon-share2" style="float:right;"href="#" id="dropdownMenuButton1" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true"  data-offset="-70, 20"></a>
	            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;"aria-labelledby="dropdownMenuButton1" >
	                <!-- <a class="dropdown-item" href="#">메일로 공유하기</a> -->
	                <a class="dropdown-item" href="#" onclick="copyUrl()">링크복사</a>
	                <a class="dropdown-item" href="#" id="print">인쇄하기</a>
	            </div>
		    </div>
		    
			<div class="line"></div>
	     	
	     	<c:set var="v_gobackURL" value='${ fn:replace(requestScope.gobackURL, "&", " ") }' /><br> <%-- 만약 url에  "&" 가 있다면 " " 공백으로 바꾸라는 것이다. --%>
	     	
			<%-- 이전글 다음글  --%>	                  
			<div id="pn_nbview" style="margin-top: 0.8%;">
				<span style="margin-right: 32px;">이전글제목</span>
				<span class="move" onclick="javascript:location.href='view_pn.up?nbno=${requestScope.boardvo.previousseq}&searchCondition=${requestScope.paraMap.searchCondition}&searchVal=${requestScope.paraMap.searchVal}&gobackURL=${v_gobackURL}'">${requestScope.boardvo.previoussubject}</span>
			</div>
		    <div id="pn_nbview">
		    	<span style="margin-right: 32px;">다음글제목</span>
		    	<span class="move" onclick="javascript:location.href='view_pn.up?nbno=${requestScope.boardvo.nextseq}&searchCondition=${requestScope.paraMap.searchCondition}&searchVal=${requestScope.paraMap.searchVal}&gobackURL=${v_gobackURL}'">${requestScope.boardvo.nextsubject}</span>
	    	</div>
	    	<div id="alert2" class="urlcopyAlert">
			     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
			     <span id="alertText" style="position: relative; bottom: 2px;">링크가 복사되었습니다.</span>
			</div>
			<br/><br/><br/>
		</div>
		
		</c:if>
	</form>
</div>





<%-- ★★★★★★★★★★ 오프캔버스 시작 ★★★★★★★★★ --%>
<form name="editFrm" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" 를 해주어야만 파일첨부가 되어진다. -->
<div class="offcanvas offcanvas-end" style="width: 800px;" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <div class="offcanvas-header">
    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">공지사항</div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  
  	<div id="alert" class="tagAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">카테고리를 선택하세요.</span>
	</div>
	<div id="alert" class="subjectAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">제목을 입력하세요.</span>
	</div>
	<div id="alert" class="contentAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">내용을 입력하세요.</span>
	</div>
	<div id="alert" class="alarmAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">알림설정 여부를 선택하세요.</span>
	</div>
  
  </div>
  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
  <div class="offcanvas-body">
  
	<div class="d-flex-space mb-3">
		<div class="mb-1">
		
			<div class="dropdown bootstrap-select">
				<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
					<input type="checkbox" class="checkbox-disable custom-control-input" id="ntpriority" name="ntpriority">
					<label class="custom-control-label" for="ntpriority">이 글을 상단에 고정합니다</label>
				</div>
			</div>
		</div>
	</div>	
		
	<!-- <hr class="HRhr  mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/> -->
	<div class="form-group"style="width:30%">
	
		<div class="form-group mr-1  mb-2">
			<div class="form-field">
				<!-- <select name="categoryTag" id="categoryTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;" onchange="changetagname(this)"> -->
				<select name="categoryTag" id="categoryTag" class="mb-1" style="padding: 10px 13px; background-color: #fafafa;font-size: 14px;color: #484848;font-weight: 500;border-radius: 5px; border:1px solid #ced4da; font-size: 10pt;">
					<option value="0" selected>카테고리 선택</option>
					<option value="일반">일반</option>
					<option value="행사">행사</option>
					<option value="인사">인사</option>
					<option value="경조사">경조사</option>
					<!-- <option value="plus">태그추가</option> -->
				</select>
			</div>
		</div>
	</div>
	
	<div class="form-group" style="margin-top: 10px;">
		<span class="control-label">제목</span>
		<div class="position-relative">
			<input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 입력해주세요" value="${requestScope.boardvo.subject}">
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
		</div>
	</div>
   	<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
   	
   	<div class="form-group" style="margin-top: 5px;">
		<div class="control-label" style="float: left;">알림설정</div>
           <div class="condition-cell">
               <!-- <input type="radio" class="custom-control-radio2" id="mail" name="boardalarm">
               <label for="mail" class="js-period-type radio-label-checkbox2" data-code="unlimit">메일알림</label> -->
               <input type="radio" class="custom-control-radio2" id="popup" name="boardalarm" value="popup">
               <label for="popup" class="js-period-type radio-label-checkbox2" data-code="unlimit">팝업알림</label>
               <input type="radio" class="custom-control-radio2" id="nopopup" name="boardalarm" value="nopopup">
               <label for="nopopup" class="js-period-type radio-label-checkbox2" data-code="unlimit">미설정</label>
		</div>
	</div>
		
	<div class="workstatus-buttoncontainer">
		<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		<!-- <button type="button" class="workstatus-save mr-1"style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;">임시저장<span style="color:#a3a3a3"> | 5</span></button> -->
		<button type="button" class="workstatus-save mr-1 gradientbtn" id="btnWrite" onclick="goEdit()">저장하기</button>
		<button type="reset" class="workstatus-cancel mr-1">취소</button>
	</div>   		
	<input type="hidden" name="nbno" value="${requestScope.boardvo.nbno}" style="margin-left: 100px; font-size: 6pt;" />
	<input type="hidden" name="fk_employee_no" value="${sessionScope.loginuser.employee_no}" style="margin-left: 100px; font-size: 6pt;" />
    <input type="hidden" name="name_kr" value="${sessionScope.loginuser.name_kr}" style="font-size: 6pt;" />
	<input type="hidden" id="content" name="content" value="" style="font-size: 6pt;">
	<input type="hidden" id="priority" name="priority" value="" style="font-size: 6pt;">
   	
	</div>
</div>
</form>
<%-- ★★★★★★★★★★ 오프캔버스 끝 ★★★★★★★★★ --%>
		
