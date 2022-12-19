<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="freeboard_header.jsp"%>
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
	
	/* 작성자 */
	.myname {
	    color: #6d7077;
	    font-weight: bold;
	    position: relative;
	    top: 17px;
	    margin-right: 15px;
	    margin-left: 12px;
	}
	
	/* 작성일자 */
	.mywritedate {
	    position: relative;
	    top: 17px;
	    color: #bfbfbf;
	}
	
	/* 북마크 */
	.icon-star-empty {
	    color: #bfbfbf;
	   /*  padding: 0 auto;
	    font-size: 15pt;
	    position: relative;
	    top: 12px; */
	}
	
	.icon-star-full {
	    color: #ffc107;
	    /* padding: 0 auto;
	    font-size: 15pt;
	    position: relative;
	    top: 12px; */
	}
	
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
	
	
	/* 글쓰기 알림창  */
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
	/* 링크복사 & 작성버튼 알림창  */
	.urlcopyAlert, .contentAlert2 {
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
	
	/* 댓글 작성자 */
	.cowriter {
	    font-size: 10pt;
	    color: #6d7077;
	    font-weight: bold;
	    position: relative;
	    top: 2px;
	    margin-right: 15px;
	    margin-left: 6px;
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
		margin-left: 59px;
	}
	div#cmtcontent p {
	    margin-top: -5px;
	    margin-bottom: 0rem;
        font-weight: 600;
	}
	a.bookmark {
	    border-radius: 7px;
	    width: 26px;
	    height: 26px;
	    position: relative;
	    margin-right: 5px;
	    font-size: 13pt;
	    right: -106px;
	    top: 5px;
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
	
	/* 댓글 수정 및 삭제  */
	a.icon-flickr {
	    font-size: 5pt !important;
	    color: #7f7f7f;
	    float: right;
	    position: absolute;
	    right: 109px;
	    bottom: -36.5%;
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
		goViewComment(1);    // 페이징 처리한 댓글 읽어오기.  맨처음에 (1)페이지를 읽어온다.
		
		<%-- ***** 작성자만 본인 게시물 글수정 및 삭제 권한 부여 ***** --%>
		if(${sessionScope.loginuser.employee_no} == ${requestScope.boardvo.fk_employee_no}) {
			$("a#editbtn").show();
			$("a#deletebtn").show();
		} else {
			$("a#editbtn").hide();
			$("a#deletebtn").hide();
		}
		
		
		<%-- 텍스트 에디터 시작 --%>
 		editor2 = new toastui.Editor({
		    el: document.querySelector("#editor2"),
		    height: "140px",
		    /* initialValue: '${requestScope.boardvo.content}', // 이 부분! */
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
		
		
		
		// offcanvas
	 	$("a#editbtn").click(function(e){
	 		$('.offcanvas').offcanvas('show');
	 		
	 		// 상단고정 여부 넣어주기
	 		if(${requestScope.boardvo.commentCheck} == '1') {  // 댓글허용
	 			$("input:checkbox[id='fbcommentCheck']").prop("checked", true); 
	 		}
	 		
	 		// 내용 넣어주기 (제목은 HTML에서 넣어줌)
	        <%-- 텍스트 에디터 시작 --%>
	 		editor = new toastui.Editor({
			    el: document.querySelector("#editor"),
			    height: "390px",
			    initialValue: '${requestScope.boardvo.content}', // 이 부분!
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
		goLikeCount(${requestScope.boardvo.fbno});
		
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
	function likeAdd(fbno, status, e) {
		//console.log("여기 >>" + $(e.target).text());
		//console.log("status >>" + status);
		
        $.ajax({
            url:"<%= request.getContextPath()%>/fn_heartAdd.up",
            type:"POST",
			data:{"fbno":fbno,
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
            	
                goLikeCount(fbno); // 좋아요 개수 알아오기
            },
            error: function(request, status, error){
                 alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
        });


	}// likeAdd(fbno, status, e)--------------------
	
	
	// 게시글 1개의 좋아요 개수 알아오기
	function goLikeCount(fbno) {
		//console.log("fbno >>" + fbno);
		
	    $.ajax({
	        url:"<%= request.getContextPath()%>/fn_goLikeCount.up",
	     // type:"GET",
	        data:{"fbno":fbno},
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
	function updatebookmark(fbno, status, e){
		console.log("여기 >>" + $(e.target));
		console.log("status >>" + status);
		
  		$.ajax({
			url:"<%= ctxPath%>/fboard/updateScrap.up",
			type:"GET",
			data:{"fbno":fbno,
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
	}// addbookmark(fbno)----------------	
	
	
	
	// ** 글쓰기 폼값을 받아서 수정내용 저장하기 ** //
	function goEdit() {
		
		// 댓글허용여부 선택
		if( $("#fbcommentCheck").is(":checked") ) {
			$("#commentCheck").val(1);  // 1:댓글허용
		}else {
			$("#commentCheck").val(0);  // 0:댓글불가
		}
		var commentCheck = $("#commentCheck").val();
		
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
		
		// 폼(form)을 전송(submit)
		const frm = document.editFrm;
		frm.method = "POST";
        frm.fk_employee_no.value = "${sessionScope.loginuser.employee_no}";
        frm.content.value = content;
        frm.commentCheck.value = commentCheck;
        frm.action = "<%= ctxPath%>/freeboard_editEnd.up";  
        frm.submit();
		 
	}//goEdit()----------------------
		
	// 글삭제 하기
	function del() {
		
		var result = confirm("게시글을 정말 삭제하시겠습니까?");
		if(result) {
            //yes
			// 폼(form)을 전송(submit)
			const frm = document.Frm;
			frm.fbno.value = "${requestScope.boardvo.fbno}";
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/freeboard_delEnd.up";
			frm.submit(); 
		} else {
            //no
        	return; // 종료
        }
		
	}	

	// ****** 댓글 작성하기 ****** //
	// 댓글 작성하기
	var co_content
	function goAddWrite() {
		  
		co_content = editor2.getHTML();  // (스마트 에디터 사용 할 경우) <p>글내용</p> 와 같이 출력됨.
        
		//console.log("co_content >>" +co_content);
		if(co_content == "<p><br></p>"){
			$(".contentAlert2").fadeIn("fast");
			setTimeout(function(){
				$(".contentAlert2").fadeOut("fast");
			}, 1500);
			//alert("댓글 내용을 입력하세요.");
			return;
		}
		
		// 첨부파일이 없는 댓글쓰기인 경우  ** 첨부파일 유무에 따라 ajax 문법이 아예 다르다.
		goAddWrite_noAttach();
	  
	}// end of function goAddWrite()---------------
	

	//첨부파일이 없는 댓글쓰기
    function goAddWrite_noAttach() {
		
		$.ajax({
			url:"<%= request.getContextPath()%>/addComment.up",
			data:{"fk_employee_no":"${sessionScope.loginuser.employee_no}",  // 값이 문자/숫자가 섞여 있을 수 있으므로  쌍따옴표""를 밖에 써주는 것이 좋다.
				  "name_kr":"${sessionScope.loginuser.name_kr}",
				  "position":"${sessionScope.loginuser.position}",
				  "content":co_content,
				  "fk_fbno":"${requestScope.boardvo.fbno}"},
			type:"POST",
			dataType:"JSON",
			success:function(json){  
				
				// goReadComment();  // 페이징 처리 안한 댓글 읽어오기
				goViewComment(1);    // 페이징 처리한 댓글 읽어오기.  맨처음에 (1)페이지를 읽어온다.				  
				location.href="javascript:location.reload(true)"; // 현재 페이지로 이동(새로고침) 
				//$("div#toastui-editor-contents").val("");  // 입력한 댓글이 update 되면 입력란 비우기
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }					
		});
		
	}// end of function goAddWrite_noAttach()---------------
	
	
	<%--
	// 페이징 처리 안한 댓글 읽어오기
	function goReadComment(){
		
		$.ajax({
			url:"<%= request.getContextPath()%>/readComment.action",
			data:{"parentSeq":"${requestScope.boardvo.seq}"},  // seq 값이 문자/숫자가 섞여 있을 수 있으므로  쌍따옴표""를 밖에 써주는 것이 좋다.
			dataType:"JSON",  // BoardController.java 로 data 를 보낸다.
			success:function(json){   // BoardController.java 에서 jsonArr.put(jsonObj) 한 json 을 받아옴.
				// [{"fileName":"20221031171351436650695940700.jpg","orgFilename":"쉐보레후면.jpg","fileSize":"101133","name":"이예은","regDate":"2022-10-25 11:02:34","content":"여섯번째 댓글입니다."},{ 생략,"name":"이예은","regDate":"2022-10-25 11:02:27","content":"다섯번째 댓글입니다."},{ 생략,"name":"이예은","regDate":"2022-10-25 11:02:05","content":"네번째 댓글입니다."},{ 생략,"name":"이예은","regDate":"2022-10-25 11:01:58","content":"세번째 댓글입니다."},{ 생략,"name":"이예은","regDate":"2022-10-25 11:01:48","content":"두번째 댓글입니다."},{ 생략,"name":"이예은","regDate":"2022-10-25 11:01:33","content":"첫번째 댓글입니다."}]
				// 또는
				// []
				
				let html = "";
				if(json.length > 0) { // json 으로 받아온 값이 [] 아니라면
					$.each(json, function(index, item){
						  html += "<tr>"+
						             "<td class='comment'>"+(index+1)+"</td>"+ // index 는 0부터 시작하기 때문에 + 1 해줌.
						             "<td>"+item.content+"</td>"+
						             "<td class='comment'>"+item.name+"</td>"+
						             "<td class='comment'>"+item.regDate+"</td>"+
						          "</tr>";
					});
				}
				else {
					html += "<tr>"+
								"<td colspan='4' class='comment'>댓글이 없습니다</td>"+
						    "</tr>";
				}
				
				$("tbody#commentDisplay").html(html);  // 여기에 찍어준다.
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }	
		});
		
	}// end of function goReadComment()--------------- --%>

	
	
	// Ajax로 불러온 댓글내용을 페이징 처리하기
	function goViewComment(currentShowPageNo) {  // currentShowPageNo 은 문서가 로딩되자마자 기본적으로 int타입 1값을 넘겨준다. 하지만, 페이징처리를 map 으로 해주어서  다른 페이지번호를 클릭 시 String 타입으로 바뀐다. (예: 2페이지 클릭시)
		
		$.ajax({
			url:"<%= request.getContextPath()%>/commentList.up",
			data:{"fk_fbno":"${requestScope.boardvo.fbno}",  // 읽고싶은 원글 번호     **seq 값이 문자/숫자가 섞여 있을 수 있으므로  쌍따옴표""를 밖에 써주는 것이 좋다.
				  "currentShowPageNo":currentShowPageNo},    // 현재 보고있는 페이지번호  
			dataType:"JSON",  
			success:function(json){
				//console.log(JSON.stringify(json));
				let html = "";
				
				if(json.length > 0) {
					$.each(json, function(index, item){
						
						html += "<tr style='height: 15px;'>"
								  + "<td style='border-right: none; padding-top: 19px;'>"
								      + "<div style='display: inline-block;width: 50px;position: relative;top: -13px'>"
								      	+ "<span class='pic' id='picbox'><span id='name'>"+item.name_kr.substring(1,3)+"</span></span>"
								      + "</div>"
								      + "<span class='teamname'>"+item.name_kr+"</span>"
								      + "<span class='writedate'>"+item.writedate+"</span>"
								      + "<span class='reply icon icon-forward'></span>"
								      	
								      + "<div class='dropdown custom-dropdown text-left' style='position: inherit;display: inline-block;'>"
								      	+ "<a class='dropdown-link icon icon-flickr' role='button' data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false' data-offset='-70, 20'></a>"
									      + "<div class='dropdown-menu' aria-labelledby='dropdownMenuButton' style='min-width: 8rem;font-size: 10pt;' >"
										      + "<a class='dropdown-item'>수정하기</a>"
										      + "<a class='dropdown-item'>삭제하기</a>"
									      + "</div>"
								      + "</div>"
								      + "<div id='cmtcontent'>"+item.content+"</div>"
							      + "</td>"
						      + "</tr>";
						
					  });
				}
				/* else {
					html += "<tr>"+
							"<td colspan='4' class='comment'>댓글이 없습니다</td>"+ // 첨부파일이 없는 경우
							     "<td colspan='6' class='comment'>댓글이 없습니다</td>"+       // 첨부파일이 있는 경우
						    "</tr>";
				} */
				
				$("#co_table").html(html);
				
				// 페이지바 함수 호출
				makeCommentPageBar(currentShowPageNo);
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }	
		});
		
	}// end of function goViewComment(currentShowPageNo)---------------
	
	
	
	
	// 댓글 페이지바 만들기
	function makeCommentPageBar(currentShowPageNo) {
		
		<%-- 하나의 게시물당 댓글의 totalPage 수 알아오기(Ajax 처리) --%>
		$.ajax({
			url:"<%= request.getContextPath()%>/commentTotalPage.up",
			data:{"fk_fbno":"${requestScope.boardvo.fbno}",  // 읽고싶은 원글 번호     **seq 값이 문자/숫자가 섞여 있을 수 있으므로  쌍따옴표""를 밖에 써주는 것이 좋다.
				  "sizePerPage":"3"},  // 한 페이지에 몇개의 댓글개수를 보여줄 것인지(4개씩)
			type:"GET",
			dataType:"JSON",
			success:function(json){
				
				if(json.totalPage > 0) { // 댓글이 있는 경우
				
					const totalPage = json.totalPage;
					const blockSize = 5; // 1개 블럭(토막)당 보여지는 페이지번호의 개수
					let loop = 1;        // int -> let 로 바꾼다. loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
				      
			        if(typeof currentShowPageNo == "string") { // currentShowPageNo 타입이  String 일 경우 
			        	//  기본적으로 int타입 1값을 넘겨준다. 하지만, 페이징처리를 map 으로 해주어서  다른 페이지번호를 클릭 시 String 타입으로 바뀐다. (예: 2페이지 클릭시)
			        	currentShowPageNo = Number(currentShowPageNo);
			        }
			       
					let pageNo = Math.floor( (currentShowPageNo - 1)/blockSize ) * blockSize + 1;
					let pageBarHTML = "<nav><ul class='pagination mg-pagebar'style='align-items: center;display: inline-flex;'>";
					
					
					// === [맨처음][이전] 만들기 === //
					if(pageNo != 1) {
						pageBarHTML += "<li class='page-item'><a class='page-link'  aria-label='처음' href='javascript:goViewComment(\"1\")'><span aria-hidden='true'>&laquo;</span></a></li>";
						pageBarHTML += "<li class='page-item'><a class='page-link'  aria-label='이전' href='javascript:goViewComment(\""+(pageNo-1)+"\")'><span aria-hidden='true'>&lt;</span></a></li>";
			        }
				      
 					while( !(loop > blockSize || pageNo > totalPage) ) {  // loop가  blockSize보다 커지지 않는다면 (지금은 blockSize 가 2 로 loop 가 1~2 라면) 또는 페이지수가 총페이지수를 초과하지 않는다면 반복한다.
				    
 						if(pageNo == currentShowPageNo) {  // 해당 블럭의 페이지번호 시작값(1, 11, 21, ...)
 							 pageBarHTML += "<li class='page-item' style='cursor:not-allowed; font-weight: 700; '><a class='page-link' style='background-color: #4285f4; color: white !important;'><span aria-hidden='true'>"+pageNo+"</span></a></li>";
 				         }
 				         else {
 				        	 pageBarHTML += "<li class='page-item'><a class='page-link' href='javascript:goViewComment(\""+pageNo+"\")'>"+pageNo+"</a></li>";
 				         }
 				         loop++;
 				         pageNo++;
			        }// end of while--------------------------
			        
 				    // === [다음][마지막] 만들기 === //
 					if(pageNo <= totalPage) {
 						pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='다음' href='javascript:goViewComment(\""+pageNo+"\")'><span aria-hidden='true'>&gt;</span></a></li>";  // while 문을 돌면서 빠져나오면 pageNo++; 되어지기 때문에  (pageNo+1) 로 할 필요가 없다.   
 						pageBarHTML += "<li class='page-item'><a class='page-link' aria-label='마지막' href='javascript:goViewComment(\""+totalPage+"\")'><span aria-hidden='true'>&raquo;</span></a></li>";
			        	// 페이지 이동시  url 이 아닌, ajax 방식으로 함수를 호출하여 이동한다.
 					}
				      
				    pageBarHTML += "</ul></nav>";       
			        $("div#pageBar").html(pageBarHTML);  // ★ 프로젝트 시에는 댓글 검색어 기능도 만들도록 해보자!!!★
			        
				}// end of if(json.totalPage > 0)----------------
				
				
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
			
		});
		
	}// end of function makeCommentPageBar(currentShowPageNo)---------------
	
	
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
		       		<div class="viewtitle">${requestScope.boardvo.subject}</div>
		       		<!-- <a style="float:right;font-size: 25px;top: -35px;"href="#" class="bookmark icon icon-star-empty"></a> -->
		       		
		       		<c:choose>
			       	 	<c:when test="${boardvo.bookmark == 'true'}">       
				       	 	<div style="margin-top:-26px;"><a class="bookmark icon icon-star-full" onclick="updatebookmark('${boardvo.fbno}', 'del', event)"></a></div>
				        </c:when>
				        <c:otherwise>
				       		<div style="margin-top:-26px;"><a class="bookmark icon icon-star-empty" onclick="updatebookmark('${boardvo.fbno}', 'add', event)"></a></div>
				       	</c:otherwise>
			       	 </c:choose> 
		       		
		       <!-- <span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> --> 
		       	</div>  
		       	<div class="writeinfo">
		       		<%-- <img class="boardprofile mr-2 mt-1" width="35px" height="35px" style="border-radius: 13px;background-color: white;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 6%);" src="<%= request.getContextPath()%>/resources/images/로고2.jpg">  --%>
		       		<span class="pic" id="picbox" style="background-color: #8080ff;"><span id="name" >예은</span></span>
		       		<span class="myname">${boardvo.name_kr}&nbsp;${boardvo.position}</span>
		     		<span class="mywritedate">${requestScope.boardvo.writedate}</span>
				     
		       	</div>
	       	</div>
			<%-- <p style="word-break: break-all;" class="contents pl-2">${requestScope.boardvo.content}</p> --%>  <!-- style="word-break: break-all; 은 공백없는 긴영문일 경우 width 크기를 뚫고 나오는 것을 막는 것임. -->
			<div class="contents pl-2" style="word-break: break-all; font-size: 11pt; min-height: 240px; padding-left: 30px; padding-bottom: 50px;">${requestScope.boardvo.content}</div>
			<input type="hidden" name="fbno" value="${requestScope.boardvo.fbno}" style="margin-left: 100px; font-size: 6pt;" />
			
			<!-- 첨부파일 아코디언 시작 -->
			<div class="accordion mgc-ac mt-5 mb-3" id="accordionPanelsStayOpenExample" style="margin-left: 0;">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button style="pading: 0.5rem 1.25rem;"class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
						<div><i class="icon icon-attachment"></i></div>
						
						<c:if test="${empty requestScope.boardvo.fb_orgFilename}">
							<div>첨부파일 <span>0</span></div> <!-- 없으면 0이라고 뜸 -> 사이즈개수 처리하기 ★ -->
						</c:if>
						<c:if test="${not empty requestScope.boardvo.fb_orgFilename}">
							<div>첨부파일 <span>1</span></div>
						</c:if>
			      </button>
			    </h2>
			    <c:if test="${not empty requestScope.boardvo.fb_orgFilename}">
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
				      <div class="accordion-body mgc-attach mgc-ac-content">
				      	<div>
					      	<span><i class="fas fa-download"></i></span>
					      	<<%-- span>${requestScope.boardvo.fb_orgFilename}</span> --%>
					      	<%-- <span>( ${requestScope.boardvo.fileSize} Bytes )</span> --%>
					      	<span><a href="<%= request.getContextPath()%>/fn_download.up?fbno=${requestScope.boardvo.fbno}">${requestScope.boardvo.fb_orgFilename} ( ${requestScope.boardvo.fileSize} Bytes )</a></span>  <%-- fb_orgFilename 은 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 진짜 파일명  --%>
				      	</div>
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
					       	 	<a href="#" class="like full-heart" id="full-heart" onclick="likeAdd('${boardvo.fbno}', 'del', event)">♥</a>
					        </c:when>
					        <c:otherwise>
					       		<a href="#" class="like empty-heart" id="empty-heart" onclick="likeAdd('${boardvo.fbno}', 'add', event)">♡</a>
					       	</c:otherwise>
				       	 </c:choose> 
				       	 
	                     <%-- <a href="#" class="like full-heart" id="full-heart" onclick="updatebookmark('${boardvo.fbno}', 'del', event)">♥</a>
	                     <a href="#" class="like empty-heart" id="empty-heart" onclick="updatebookmark('${boardvo.fbno}', 'add', event)">♡</a> --%>
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
			
			
	     	<%-- ******** 댓글 작성 시작 ******** --%>
	     	<div style="margin-bottom:4rem!important">
	     		<div style="display: inline-block;width: 50px;position: relative;top: -13px">
		      		<span class="pic" id="picbox" ><span id="name" >${fn:substring(sessionScope.loginuser.name_kr, 1,3)}</span></span>
		      	</div>
		      	<span class="cowriter">${sessionScope.loginuser.name_kr}&nbsp;${sessionScope.loginuser.position}</span>
		      	<br>
	     		<div id="editor2" style="margin-top: 0.7%;margin-left: -1.3%;"></div>
	     		<button type="button" id="writecmt"class="btn" onclick="goAddWrite()">작성</button>
	     	
	     		<%-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글 글번호) --%>
                <input type="hidden" name="fk_fbno" id="fk_fbno" value="${requestScope.boardvo.fbno}" />
               	<div id="alert2" class="contentAlert2">
				     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
				     <span id="alertText" style="position: relative; bottom: 2px;">댓글 내용을 입력하세요.</span>
				</div>
	     	</div>
	     	<%-- ******** 댓글 작성 끝 ******** --%>
	     	
	     	<%-- ******** 댓글 목록 시작 ******** --%>
	     	 <table class="table custom-table">
	     	  <tbody id="co_table">
		          <tr style="height: 15px;">
				      <td style="border-right: none; padding-top: 19px;">
				      	<div style="display: inline-block;width: 50px;position: relative;top: -13px">
				      		<!-- <img class="boardprofile mr-2" width="35px" height="35px"> -->
				      		<span class="pic" id="picbox" ><span id="name" >지은</span></span>
				      	</div>
				      	<span class="teamname"></span>
				      	<span class="writedate"></span>
				      	<span class="reply icon icon-forward"></span>
				      	
				      	<div class="dropdown custom-dropdown text-left " style="position: inherit;display: inline-block;">
			            <a class="dropdown-link icon icon-flickr" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="-70, 20"></a>
				            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"style="min-width: 8rem;font-size: 10pt;" >
				             <!--  <a class="dropdown-item" href="#">수정하기</a> -->
				              <a class="dropdown-item" href="#">삭제하기</a>
				              <a class="dropdown-item" href="#">취소</a>
				            </div>
			          	</div>
				      	<div id="cmtcontent"></div>
				      </td>
				   </tr>
			   </tbody>
	        </table> 
	     	<%-- ******** 댓글 목록 끝 ******** --%>
	     	
	     	<%-- ******** 댓글 페이지바 시작 ******** --%>
			<div id="pageBar" class="mg-paging" align="center" style="width: fit-content; margin:20px auto; margin-top: 19px; font-size: 9pt;"></div>
	     	<%-- ******** 댓글 페이지바 끝 ******** --%>
			
		
		
			<c:set var="v_gobackURL" value='${ fn:replace(requestScope.gobackURL, "&", " ") }' /><br> <%-- 만약 url에  "&" 가 있다면 " " 공백으로 바꾸라는 것이다. --%>
	     	
			<%-- 이전글 다음글  --%>	                  
			<div id="pn_nbview" style="margin-top: 0.8%;">
				<span style="margin-right: 32px;">이전글제목</span>
				<span class="move" onclick="javascript:location.href='view_pn.up?fbno=${requestScope.boardvo.previousseq}&searchCondition=${requestScope.paraMap.searchCondition}&searchVal=${requestScope.paraMap.searchVal}&gobackURL=${v_gobackURL}'">${requestScope.boardvo.previoussubject}</span>
			</div>
		    <div id="pn_nbview">
		    	<span style="margin-right: 32px;">다음글제목</span>
		    	<span class="move" onclick="javascript:location.href='view_pn.up?fbno=${requestScope.boardvo.nextseq}&searchCondition=${requestScope.paraMap.searchCondition}&searchVal=${requestScope.paraMap.searchVal}&gobackURL=${v_gobackURL}'">${requestScope.boardvo.nextsubject}</span>
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
    <div class="offcanvas-title headeroffcanvas" style="font-weight: 700;font-size: 16pt;"id="offcanvasScrollingLabel">자유게시판</div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  
	<div id="alert" class="subjectAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">제목을 입력하세요.</span>
	</div>
	<div id="alert" class="contentAlert">
	     <i class="fas fa-check-circle" style="color: #29a329; margin-right: 7px; margin-top:10px; font-size:13pt;"></i>
	     <span id="alertText" style="position: relative; bottom: 2px;">내용을 입력하세요.</span>
	</div>
  
  </div>
  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
  <div class="offcanvas-body">
  
	<div class="d-flex-space mb-3">
		<div class="mb-1">
		
			<div class="dropdown bootstrap-select">
				<div class="custom-control custom-checkbox" style="min-height: auto; padding-bottom: 5px;">
					<input type="checkbox" class="checkbox-disable custom-control-input" id="fbcommentCheck" name="fbcommentCheck">
					<label class="custom-control-label" for="fbcommentCheck">이 글에 댓글달기를 허용합니다</label>
				</div>
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
			<!-- <input multiple="" type="file" name="attaches" class="form-control mg-file" id="mg-file"> -->
		</div>
	</div>
   	<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>	
		
		
	<div class="workstatus-buttoncontainer">
		<button type="button" class="workstatus-del"><i class="fa-solid fa-trash-can"></i></button>
		<!-- <button type="button" class="workstatus-save mr-1"style="color:#dc3545; border: solid 1px rgba(0, 0, 0, 0.1); background-color: white;">임시저장<span style="color:#a3a3a3"> | 5</span></button> -->
		<button type="button" class="workstatus-save mr-1 gradientbtn" id="btnWrite" onclick="goEdit()">저장하기</button>
		<button type="reset" class="workstatus-cancel mr-1">취소</button>
	</div>		
	<input type="hidden" name="fbno" value="${requestScope.boardvo.fbno}" style="margin-left: 100px; font-size: 6pt;" />
	<input type="hidden" name="fk_employee_no" value="${sessionScope.loginuser.employee_no}" style="margin-left: 100px; font-size: 6pt;" />
    <input type="hidden" name="name_kr" value="${sessionScope.loginuser.name_kr}" style="font-size: 6pt;" />
    <input type="hidden" name="position" value="${sessionScope.loginuser.position}" style="font-size: 6pt;" />
	<input type="hidden" id="content" name="content" value="" style="font-size: 6pt;">
	<input type="hidden" id="commentCheck" name="commentCheck" value="" style="font-size: 6pt;">
   	
	</div>
</div>
</form>
<%-- ★★★★★★★★★★ 오프캔버스 끝 ★★★★★★★★★ --%>


