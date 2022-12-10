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
	.alert {
	    color: #4285f4;
	    transition: 1s;
	} 
	.mg-fileplus, .mg-fileminus{
		display: inline-block;
		height: 20px; width: 20px;
		border: solid 2px rgba(0,0,0,0.1);
		border-radius: 5px !important;
		color: rgba(0,0,0,0.2);
		font-size: 8pt;
		padding: 1.2px 2.5px;
		margin-left: 2px;
	}
	
	.mg-fileminus{
		height: 33px; width: 33px;
		border: solid 1px rgba(0,0,0,0.1);
		color: #BF2604;
		position: relative; top: 2px; left: 5px;
	}
	
	.mg-fileminus > i {
		position: relative; top: 7px; left: 7px;
	}
	.mg-fileplus:hover, .mg-fileminus:hover {
		background-color: rgba(230,230,230,0.4);
		cursor: pointer;
	}
	
	.input-group:first-child > span:hover {
		cursor: not-allowed;
	}
	
	.essential {
		color: #BF2604;
		font-weight: 700;
		font-size: 11pt;
		margin-left: 5px;
	}
	
</style>
<script>

var filecnt = 1;
var editer;
$(document).ready(function(){
	
	// 답장번호(reno)가 있을 때 값 미리 넣어주기
	const to = "${requestScope.paraMap.to}";
	const toname = "${requestScope.paraMap.name}";
	const re_subject = "${requestScope.paraMap.re_subject}";
	
	console.log(re_subject);
	if(to != '' ){
		$("#mw-subject").val(re_subject);
		$("#empno").val(to);
		$("#empname").val(toname);
		setEmpname();
	}
	
	getempname();
	
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
	editor = new toastui.Editor({
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

///////////////////////////////////////////////////////////////////////////////////////////////
//function declaration

// 모달창에서 저장한 값 가져오기
function setEmp(m_empno){
	ex_empno = $("#empno").val();
	//ex_empname = $("#empname").val();
	if(ex_empno != ''){ // 이미 오류
		// input에 있는 값 중복제거하기
		var ex_empnoArr = ex_empno.split(",");
		var m_empnoArr = m_empno.split(",");
		
		// 원래 있는 값인 경우 교집합을 빼서 문자열로 만들어준다
		//교집합 구하기
		var internoArr = ex_empnoArr.filter(x => m_empnoArr.includes(x));
		
		// 대칭차집합 구하기
		var symEmpnoArr = ex_empnoArr.filter(x => !m_empnoArr.includes(x)).concat(m_empnoArr.filter(x => !ex_empnoArr.includes(x)));
		
		var newEmpnoArr = symEmpnoArr.concat(internoArr);
		
		var str_newEmpno = newEmpnoArr.join(",");
		
		$("#empno").val(str_newEmpno);
		
	} else {
		$("#empno").val(m_empno);
	} //중복제거 끝
	
	// 이름 불러오기
	getempname();
	
}//end of setEmp


//empno가 변경될때마다 name값 및 부서명도 가져오기
function getempname(){
	var str_empno = $("#empno").val();
	var empnoArr = str_empno.split(",");
	
	$.ajax({
		url: "<%= ctxPath%>/getempname.up",
		traditional: true, //배열 넘기기 옵션
		data: {"empnoArr":empnoArr},
		dataType:"json",
		success:function(json){
			if(json.length > 0){
				var html = '';
				$.each(json,function(index, item){
					if(index+1 == json.length) html += item.name + '·' + item.dept_name;
					else html += item.name + '·' + item.dept_name + ',';
				});
				$("#empname").val(html);
				
				//보낼사람에 이름 보여주기
				setEmpname();
			}
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});//end of ajax
	
}


// 모달창의 값 가공하기
function setEmpname(){
	str_empname = $("#empname").val();
	var empnameArr = str_empname.split(",");
	var html = '';
	$.each(empnameArr,function(index,item){
		html += '<div id="toname'+index+'"style="font-size: 10pt; display:inline-block; width: auto; height: 25px; margin: 3px 5px 3px 0; background-color: #f5f5f5; border-radius: 10px; font-weight: 500; color: #555555; padding: 3px 10px;">'+
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
}


// 모달창에서 저장한 메시지 예약전송시간 가지고오기
function getMstime(mstime){
	$("#sendtime").val(mstime);
}//end of getMstime


//보낼사람의 employeeno를 id에 넣어주기
function changeIdToEmpno(){
	var str_empno = $("#empno").val();
	var empnoArr = str_empno.split(",");
	// id에 employeeno값 변경하기
	$.each(empnoArr,function(index,item){
		$("#toname"+index).attr("id",item);
	});//end of each
}//end of changeIdToEmpno



//폼값을 받아서 전송해주기 
function goSend(){ 
	changeIdToEmpno();
	
	// 유효성 검사하기
	// 받는사람
	if($("#empno").val() == ""){
		alert("받는 사람을 지정해주세요.");
		$("#mw-address").trigger("click");
		return;
	} else $("#totd").removeClass("alert"); 
	// 제목
	if($("#mw-subject").val() == ""){
		alert("제목을 입력해주세요.");
		$("#mw-subejct").focus();
		return;
	}
	
	//내용
	if(content == "<p><br></p>"){
		alert("메시지 내용을 입력하세요");
		return;
	}
	
	var content = editor.getHTML();
	
	const mwform = document.mgwriteFrm;
	mwform.writer.value = "${sessionScope.loginuser.employee_no}";
	mwform.mgroup.value = "${requestScope.paraMap.mgroup}";
	mwform.reno.value = "${requestScope.paraMap.reno}";
	mwform.depthno.value = "${requestScope.paraMap.depthno}";
	mwform.content.value = content;
	mwform.action = "<%= ctxPath%>/sendMessage.up";
	mwform.submit();
};// end of goSend
	

</script>    
    
<div class="mw-container">
	<div class="mw-top">
		<div style="float:left;">
			<div class="mw-top-1">
				<span class="header-nonsub" style="padding:1.4em 0 !important; color: #444444 !important;" onclick="javascript:location.href='<%= ctxPath%>/message.up'"><i class="fa-solid fa-chevron-left" style="font-size: 15pt;"></i></span>
				<span class="header-nonsub" style="padding:1.4em 0 !important; color: #444444 !important;">메시지 보내기</span>
			</div>
		</div>		
		<div class="mw-top-right" style="float:right; padding: 2.65em 0; margin-right: 10px;">
			<span>
				<button type="button" id="mw-book" class="btn" data-bs-toggle="modal" data-bs-target="#mw-book-modal" data-bs-dismiss="modal">예약</button>
			</span>
			<span>
				<button type="button" id="mw-send" class="gradientbtn btn" onclick="goSend()">
					<span><i class="fa-regular fa-paper-plane"></i></span>
					<span>보내기</span>
				</button>
			</span>		
		</div>
	</div>
	<hr class="HRhr" style="clear:both;"/>
	<form name="mgwriteFrm" method="post" enctype="multipart/form-data">
		<div class="mw-bottom">
			<table class="mw-table" style="width: 100%;">
				<tr>
					<td id="totd">받는 사람<span class="essential">*</span></td>
					<td width="90%" class="mw-totd" style="vertical-align: bottom;">
						<div id="mw-to" style="height: auto;"></div>
					</td> <!-- 답장하기의 경우 자동으로 입력되게 --> <!-- 클릭시 자동으로 밑에 최근 보낸사람? 뜨게 -->
					<td style="display: none;"><button id="mw-address" class="btn bluebtn" type="button" data-bs-toggle="modal" data-bs-target="#mw-address-modal" data-bs-dismiss="modal">주소록</button></td>
				</tr>
				<tr>
					<td id="subjecttd">제목<span class="essential">*</span></td>
					<td colspan="2"><input id="mw-subject" name="subject" type="text" placeholder="제목을 입력하세요" size="20"/></td> <!-- 답장하기의 경우 RE: 하고 제목 가져오기. 총 20자까지 -->
				</tr>
				<tr>
					<td id="filetd">파일첨부</td>
					<td id="fileaddTd" colspan="2">
						<div class="input-group" style="font-size: 11pt !important; margin-bottom: 5px; width: 100%;">
							<input multiple type="file" name="attaches" class="form-control mg-file" id="mg-file" style="border-radius: 5px; color: #444444 !important; border: solid 1px rgba(0,0,0,0.1); font-size: 11pt; height: 33px; position:relative; top:3px;">
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
	
		<input id="empno" type="text" name="receiver" value="">
		<input id="empname" type="text" value="">
		<input id="sendtime" type="text" name="sendtime" value="">
		<input id="mgroup" type="text" name="mgroup" value="">
		<input id="reno" type="text" name="reno" value="">
		<input id="depthno" type="text" name="depthno" value="">
		<input id="writer" type="text" name="writer" value="">
		<input id="content" type="text" name="content" value="">
	</form>
	


</div>