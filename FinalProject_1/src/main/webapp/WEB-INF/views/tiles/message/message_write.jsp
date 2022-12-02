<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<% String ctxPath = request.getContextPath(); %>
<style>
	.toastui-editor-defaultUI-toolbar{background-color: white;}
	.btn:hover{color: white;}
	.mw-totd:hover{cursor:pointer}
	#mwto > div:hover{background-color: rgba(0,0,0,0,0.2); border: solid 1px rgba(0,0,0,0.1);}
</style>
<script>
$(document).ready(function(){
	
	// 답장번호(reno)가 있을 때 값 미리 넣어주기
	const mw_to = "${requestScope.mw_to}";
	const mw_resubject = "${requestScope.mw_resubject}";
	if(mw_to != null ){
		$("#mw-to").val(mw_to);
		$("#mw-subject").val("RE: "+mw_resubject);
	}
	
	//받는사람 입력시 주소록 모달 뜨기
	$(".mw-totd").click(function(e){
		if($(e.target).is("#mw-to *")) return;
		$("#mw-address").trigger("click");
	});
	
	// 받는사람 x 클릭시 삭제하기
	$(document).on('click',".mwto-cancel",function(e){
		//id를 employeeno로 바꿔주기
		changeIdToEmpno();
		
		const delempno = $(e.target).parent().attr("id");
		var str_empno = $("#empno").val();
		const arr_empno = str_empno.split(",");
		
		var empnohtml = '';
		$.each(arr_empno, function(index, item){
			if(item != delempno){
				if(index != 0)
					empnohtml += ',' + item;
				else
					empnohtml += item;
			}
		});
		$("#empno").val(empnohtml);
		$(e.target).parent().remove();
	});
	
	
	
	<%-- 텍스트 에디터 시작 --%>
	const editor = new toastui.Editor({
	    el: document.querySelector("#editor"),
	    height: "390px",
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


// function declaration
// 보내기 버튼
function goSend(){ 
	changeIdToEmpno();
};// end of goSend


// 모달창에서 저장한 값 가져오기
function setEmp(m_empno, m_empname){
	ex_empno = $("#empno").val();
	ex_empname = $("#empname").val();
	if(ex_empno != ''){
		// input에 이미 있는 empno인지 확인하기
		
		
		$("#empno").val(ex_empno+","+m_empno);
		$("#empname").val(ex_empname+","+m_empname);
	} else {
		$("#empno").val(m_empno);
		$("#empname").val(m_empname);
	}
	
	// 저장된 값 가공하기
	str_empname = $("#empname").val();
	var empnameArr = str_empname.split(",");
	var html = '';
	$.each(empnameArr,function(index,item){
		html += '<div id="toname'+index+'" style="display:inline-block; width: auto; height: 25px; margin: 5px 5px 5px 0; background-color: #f5f5f5; border-radius: 10px; font-weight: 500; color: #555555; padding: 2px 10px;">'+
					'<span>'+item+'</span>'+		
					'<span id="" class="mwto-cancel" style="display:inline-block; width: 14px; height: 21px; color: #99999991; position:relative; bottom:1px; left:4px; padding-left: 3px;">x</span>'+
				'</div>';
		if(index%7 == 0 && index != 0) //7의 배수일때  한칸 띄기
			html += '<br>'
	});//end of each
	
	if(str_empname != ''){
		$("#mw-to").html(html);
	} else {
		$("#mw-to").html("");
	}
}//end of setEmp


//보낼사람의 employeeno를 id에 넣어주기
function changeIdToEmpno(){
	var str_empno = $("#empno").val();
	var empnoArr = str_empno.split(",");
	// id에 employeeno값 변경하기
	$.each(empnoArr,function(index,item){
		$("#toname"+index).attr("id",item);
	});//end of each
}//end of changeIdToEmpno


	

</script>    
    
<div class="mw-container">
	<div class="mw-top">
		<div style="float:left;">
			<div class="mw-top-1">
				<span class="header-nonsub" style="padding:1.4em 0 !important;" onclick="javascript:location.href='<%= ctxPath%>/message.up'"><i class="fa-solid fa-chevron-left" style="font-size: 15pt;"></i></span>
				<span class="header-nonsub" style="padding:1.4em 0 !important;">메시지 보내기</span>
			</div>
		</div>		
		<div class="mw-top-right" style="float:right; padding: 2.65em 0; margin-right: 10px;">
			<span>
				<button type="button" id="mw-book" class="btn" data-bs-toggle="modal" data-bs-target="#mw-book-modal" data-bs-dismiss="modal">예약</button>
			</span>
			<span>
				<button type="button" id="mw-send" class="gradientbtn btn" onclick="goSend();">
					<span><i class="fa-regular fa-paper-plane"></i></span>
					<span>보내기</span>
				</button> <!-- 보낸메일함의 보낸 메일으로 이동. -->
			</span>		
		</div>
	</div>
	<hr class="HRhr" style="clear:both;"/>
	<div class="mw-bottom">
		<table class="mw-table" style="width: 100%;">
			<tr>
				<td>받는 사람</td>
				<td width="86.4%" class="mw-totd">
					<div id="mw-to" style="height: auto;"></div>
					<!-- <input id="mw-to" type="text" placeholder="받는사람" readonly/> -->
				</td> <!-- 답장하기의 경우 자동으로 입력되게 --> <!-- 클릭시 자동으로 밑에 최근 보낸사람? 뜨게 -->
				<td><button id="mw-address" class="btn" type="button" data-bs-toggle="modal" data-bs-target="#mw-address-modal" data-bs-dismiss="modal">주소록</button></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="2"><input id="mw-subject" type="text" placeholder="제목을 입력하세요"/></td> <!-- 답장하기의 경우 RE: 하고 제목 가져오기. 총 20자까지 -->
			</tr>
			<tr>
				<td>파일첨부</td>
				<td colspan="2">
					<div class="input-group" style="font-size: 11pt !important;">
						<input type="file" class="form-control" id="inputGroupFile02" style="border: solid 1px rgba(0,0,0,0.1); font-size: 11pt; height: 33px; position:relative; top:3px;">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3"><div id="editor" style="font-weight: 500;"></div></td>
			</tr>
		</table>
	</div>

	<%-- **** 예약버튼  Modal **** --%> <!-- 이거 기능하다가 벅차면 빼자요 -->
	<div class="modal fade" id="mw-book-modal" aria-hidden="true" aria-labelledby="mw-address-label" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalToggleLabel" style="margin-left: 15px; font-weight: 800; color:#444444;">발송 예약</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
			  		<div id="mwa-container">
						<iframe id="mwa" style="border: none; width: 100%; height: 400px;" src="<%= request.getContextPath()%>/message/book.up"></iframe>
					</div>
			  	</div>
			</div>
		</div>
	</div>

	<%-- **** 주소록 Modal **** --%>
	<div class="modal fade" id="mw-address-modal" aria-hidden="true" aria-labelledby="mw-address-label" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalToggleLabel" style="margin-left: 15px; font-weight: 800; color: #444444;">주소록</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
			  		<div id="mwa-container">
						<iframe id="mwa" style="border: none; width: 100%; height: 500px;" src="<%= request.getContextPath()%>/message/memberList.up"></iframe>
					</div>
			  	</div>
			</div>
		</div>
	</div>
	
	<form>
		<input id="empno" type="text" value="">
		<input id="empname" type="text" value="">
	</form>
	


</div>