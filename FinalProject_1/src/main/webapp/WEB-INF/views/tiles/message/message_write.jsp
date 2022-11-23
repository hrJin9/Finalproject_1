<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script>
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
	});//end of ready


</script>    
    
<div class="mw-container">
	<div class="mw-top">
		<div style="float:left;">
			<div>
				<span></span>
				<span>메시지 보내기</span>
			</div>
			<div>
				<div>예약메시지</div>
			</div>
		
		</div>		
		<div style="float:right;">
			<span>
				<button>취소</button>
			</span>		
			<span>
				<button>보내기</button>
			</span>		
		
		</div>
	</div>
	<hr class="HRhr" style="clear:both;"/>
	<div class="mw-bottom">
		<table>
			<tr>
				<td>받는 사람</td>
				<td><input type="text" placeholder="받는사람 직접입력"/></td> <!-- 답장하기의 경우 자동으로 입력되게 -->
				<td><button type="button">주소록</button></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="2"><input type="text" placeholder="제목을 입력하세요"/></td> <!-- 답장하기의 경우 RE: 하고 제목 가져오기. 총 20자까지 -->
			</tr>
			<tr>
				<td>파일첨부</td>
				<td colspan="2"><input type="file" name="mw-attach"/></td>
			</tr>
			<tr>
				<td colspan="3"><div id="editor"></div></td>
			</tr>
		</table>
	</div>

</div>