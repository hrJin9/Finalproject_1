<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="approval_writing_header.jsp"%>
<!-- 텍스트에디터 시작-->
<!-- <script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script> -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css" />
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
 <!-- Editor -->
<!-- Color Picker -->
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
<!-- Editor -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- Editor's Plugin -->
<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<!-- 텍스트에디터 끝 --> 

<!-- 혜린style.css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/message_memberList.css?after">

<style>
	.c-iFzzFJ {
    display: block;
    width: 100%;
    padding: 6px 32px;
    font-size: 12px;
    line-height: 1.33;
	}

	
	/* .approval-box > div:hover{
	    background-color: rgba(200,200,200, .2);
	    cursor: pointer;
	} */
	.custom-control{
	    height: 27px;
	}
	.custom-control-radio2 {
	    position: relative;
	    left: 21px;
	    top: -2px;
	    z-index: -1;
	}
	.radio-label-checkbox2 {
	    position: relative;
	    cursor: pointer;
	    left: 21px;
	    top: -4px;
	    font-size: 9pt;
	    margin-right: 10px;
	    color: #605c5c;
	}
	
	/* @media (min-width: 576px)
	.modal-dialog {
    	max-width: 990px !important;
	}
	.modal-dialog-centered {
	    align-items: normal !important;
    } */
    
    modal{
        background: rgba(0, 0, 0, 0.5);
    }
    
    
    
    .form-control{
		font-size: 12pt;
		background-color: #fff;
		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	/* .form-control, .bootstrap-select .btn {
	    height: 44px;
	    padding: 6px 16px 9px 16px;
	    padding-right: 30px;
	    border-radius: 4px !important;
	    box-shadow: none !important;
	    -webkit-appearance: none;
	    border: 2px solid #e8e8e8 !important;
	    font-size: 14px;
	    font-weight: 500;
	    line-height: calc(1.5 * 10px);
	    color: #484848;
	} */
	.custom-control-label::before {
		top: 0.14rem !important;
		cursor: pointer;
	}
	.custom-control-label::after {
		cursor: pointer !important;
		top: -0.11rem !important;
    	left: -1.7rem !important;
    	width: 1.4rem !important;
    	height: 1.4rem !important;
	}
	
	#title, #tagname {
	    height: 44px;
	    padding: 6px 16px 9px 16px;
	    padding-right: 30px;
	    /* background-color: #fafafa !important; */
	    border-radius: 4px !important;
	    box-shadow: none !important;
	    -webkit-appearance: none;
	    border: 2px solid #e8e8e8 !important;
	    font-size: 14px;
	    font-weight: 500;
	    line-height: calc(1.5 * 10px);
	    color: #484848;
	}
	.control-label {
	    display: block;
	    margin-bottom: 4px;
	    font-size: 13px;
	    line-height: 1.43;
	    color: #9e9e9e;
	}
	.toastui-editor-defaultUI-toolbar {
		background-color: #ffffff;
	}
/* 	div.toastui-editor-mode-switch{
		display: none !important;
	} */
	.toastui-editor-defaultUI-toolbar {
    	border-bottom: 0px solid #ebedf2 !important;
    }
	.toastui-editor-defaultUI {
		width: 100%;
    }
    .write-topput{
    	padding: 4px 69px;
    	padding-left: 10px; 
    	background-color: #fafafa;
    	font-size: 14px;
    	height: 35px;
    	color: #484848;
    	font-weight: 500;
    	border-radius: 5px; 
    	border:1px solid #fafafa;
    	font-size: 10pt;
    }
    
    
    
    
    .dwAYaw {
    width: 100%;
    position: relative;
}
.dwAYaw .apv-wrapper {
    border-width: 1px 1px 0px;
    border-style: solid;
    border-color: rgb(224, 224, 224);
    border-image: initial;
    padding: 10px;
    height: calc(100% - 220px);
    overflow: auto;
}
.dwAYaw .wrapper {
    padding: 10px;
    border: 1px solid rgb(224, 224, 224);
    width: 100%;
    overflow: auto;
    height: 100px;
}
.dwAYaw .cr-wrapper {
    padding: 10px;
    border-width: 0px 1px 1px;
    border-style: solid;
    border-color: rgb(224, 224, 224);
    border-image: initial;
    width: 100%;
    overflow: auto;
    height: 100px;
}
.table {
    margin: 0;
}
.table-fixed {
    table-layout: fixed;
}
.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
}
.iIsGzI:nth-child(1) {
    width: 45px;
}
.table thead th {
    height: 24px;
    padding: 4px;
    border: 0;
    border-bottom: 2px solid #e0e0e0;
    font-size: 12px;
    line-height: 1.33;
    color: #767676;
}
.iIsGzI:nth-child(2) {
    width: 60px;
}
.dvJzzI {
    border-bottom: 1px solid rgb(224, 224, 224) !important;
}
.table tbody > tr > * {
    height: 44px;
    max-height: 44px;
    border: 0;
    padding: 8px 4px;
    font-size: 14px;
    line-height: 1.43;
    font-weight: 500;
    vertical-align: middle;
    color: #484848;
}
.hDNriY {
    display: flex;
    flex-wrap: wrap;
    margin-top: 10px;
}
.table>:not(:first-child) {
	border: none;
}
.cursor-pointer, .gnb-back {
    cursor: pointer;
}
.text-primary {
    color: #0381eb !important;
}
.toastui-editor-contents table th{
	background-color: white;
}
.search-period-wr .filter-input-box {
    /* overflow: hidden; */
    display: inline-block;
    /* margin: 10px 0 0 0; */
    /* padding: 7px 44px 0 10px; */
    height: 30px;
    width: auto;
}
.filter-input-box {
    position: relative;
    height: 40px;
    /* margin-top: 10px; */
    /* padding: 10px 15px 10px 6px; */
    background: #fff;
    /* border: 1px solid #ddd; */
    width: 100%;
    font-size: 11px;
}
.attendance-dateSelector {
	width: 100% !important;
	height: 38px !important;
}

.form-inputlabel {
    align-items: center;
/*     color: #3c4651; */
    color: #9e9e9e;
    display: block;
    flex-shrink: 0;
    font-size: 13px;
    font-weight: 500;
    height: 22px;
    margin-right: 12px;
    position: relative;
    white-space: nowrap;
}
.icon-calendar{
	position: relative;
    z-index: 2;
    top: 30px;
    right: -38px;
    color:#5d646a !important;
    font-size: 10pt;
}
.ant-input, .ant-input-selector {
    background-color: #fff;
    background-image: none;
    border: none;
    border-radius: 4px;
    box-shadow: 0 0 0 0 rgb(36 42 48 / 0%), 0 0 0 1px rgb(36 42 48 / 10%), 0 1px 1px 0 rgb(36 42 48 / 0%), 0 6px 12px 0 rgb(36 42 48 / 0%);
    color: #242a30;
    display: inline-block;
    font-size: 14px;
    height: 32px;
    line-height: 1.5;
    min-width: 0;
    outline: none;
    padding: 0 10px;
    position: relative;
    transition: all .2s;
    width: 100%;
}
#myModal_selSignMem {
  overflow: auto;
} 
.selectedmem{
	margin-top:0px !important;
	/* margin-bottom: 10px  !important; */
	padding-bottom: 50px;
    padding-top: 10px;
    border-radius: 10px;
    padding-left: 10px;
    padding-right: 20px;
}
td{
	width: 77%;
}	
.positionIcon{
	margin-left: 90px;
}
div#memcontent-iframe{
	margin-top:0px !important;
}
.profile{
	display: inline-flex !important;
	float: left !important;
}
.mem-del{
	color: rgb(141, 150, 161);
    float: right;
    top: 16px;
    position: relative;
    width: 0.3em;
    height: 0.3em;
}
.step-del{
	float: right;
    top:-18px;
    position: relative;
    width: 0.3em;
    height: 0.3em;
}
div#dayoff-temp{
	display:hidden;
}
</style> 
<script>
	$(document).ready(function(){
		$("#writebtn").hide(); // 글쓰기 버튼 숨기기
		//툴팁 사용
		var tooltipel = $(".tp").tooltip();
		
		$("input.dayradio").attr("disabled", true) // 반차 라디오버튼 못누르게  
		const mydayoff = "${sessionScope.loginuser.dayoff_cnt}";
		// 로그인한 사용자 값 넣기 
		$("input#left-dayoffcnt").val(mydayoff);
		$("input#use-dayoffcnt").val("0");
		$("input[name='myname']").val("${sessionScope.loginuser.name_kr}");
		
		
		// 날짜피커 값이 변경될때마다 연차 갯수 바뀌게하기 
		$(".dateSelector").change(function(){
			var today = getTimeStamp(); // 오늘날짜 yyyy-mm-dd 
			const $thisid =$(this).attr("id");
			
			const startday = $("input#startday").val();
			const endday = $("input#endday").val();
			
			let startdayarr = startday.split("-");
			let enddayarr = endday.split("-");
			let sdate = new Date(startdayarr[0], startdayarr[1], startdayarr[2]);
			let edate = new Date(enddayarr[0], enddayarr[1], enddayarr[2]);

			var diff = edate - sdate;
			var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
			var currMonth = currDay * 30;// 월 만듬
			var currYear = currMonth * 12; // 년 만듬
			 
			console.log("* 날짜 두개 : " + startday + ", " + endday + "<br/>");
			console.log("* 일수 차이 : " + parseInt(diff/currDay) + " 일<br/>");
			/* console.log("* 월수 차이 : " + parseInt(diff/currMonth) + " 월<br/>");
			console.log("* 년수 차이 : " + parseInt(diff/currYear) + " 년<br/><br/>"); */ 
			let betday = parseInt(diff/currDay)+1;
			let flag = true;
			flag =  betday < 0? true:false; // 날짜양식에 맞는지 
			
			
			if(!flag){ // 날짜가 양식에맞으면 연차갯수 계산  
				$("#approvalsave").prop("disabled",false);
				$("#approvalsave").css("background-color","rgb(0 101 204)");
				$("input.dayradio").each(function(){
					if($(this).is(":checked")) {
						betday-=0.5;
					}
					
				})
				
				$("input#use-dayoffcnt").val(betday);
				$("input#left-dayoffcnt").val(mydayoff-betday);
			}
			else{ // 양식에 맞지않으면 (시작날짜가 종료일자 보다 클경우- 시작날짜를 종료날짜보다 크게잡은경우, 종료날짜를 시작날짜보다적게잡은경 )
				/* $("#approvalsave").prop("disabled",true);		
				$("#approvalsave").css("background-color","#c3c3c3"); */
				if( $thisid == endday){
					$("input#endday").val(startday);
				}else{
					$("input#startday").val(endday);
				}
			}
		});
		
		// 반차 오전 오후 클릭됐을경우 
		$("input.dayradio").change(function(e){
			let useval = Number($("input#use-dayoffcnt").val());
			let leftval = Number($("input#left-dayoffcnt").val());
			if($(e.target).is(":checked")){
				if(useval!=0){
					useval -= 0.5;
					leftval -= 0.5;
				}
			}
			$("input#use-dayoffcnt").val(useval);
			$("input#left-dayoffcnt").val(leftval);
		})
		
		
		<%-- 반차여부 체크시 라디오 선택 가능 불가능  --%>
		$("input#halfstart").change(function(){
			let useval = Number($("input#use-dayoffcnt").val());
			let leftval = Number($("input#left-dayoffcnt").val());
			if($(this).is(":checked")){ // 반차여부 체크되었으면
			    $("input[name='startdaynight']").attr("disabled", false);
	        }else{
	        	$("input[name='startdaynight']").each(function(){
	    			if(this.checked){
	    				this.checked = false;
	    				useval += 0.5;
	    				leftval += 0.5;
	    				$("input#use-dayoffcnt").val(useval);
	    				$("input#left-dayoffcnt").val(leftval);
	    			}
	        	})
			    $("input[name='startdaynight']").attr("disabled", true);
	        }
	    });
		$("input#halfend").change(function(){
			let useval = Number($("input#use-dayoffcnt").val());
			let leftval = Number($("input#left-dayoffcnt").val());
	        if($(this).is(":checked")){ // 반차여부 체크되었으면
			    $("input[name='enddaynight']").attr("disabled", false);
	        }else{
	        	$("input[name='enddaynight']").each(function(){
	    			if(this.checked){
	    				this.checked = false;
	    				useval += 0.5;
	    				leftval += 0.5;
	    				$("input#use-dayoffcnt").val(useval);
	    				$("input#left-dayoffcnt").val(leftval);
	    			}
	        	})
			    $("input[name='enddaynight']").attr("disabled", true);
	        }
	    });
	    
	    
		
		
		
		
		/* 양식에 맞는 모달창 뜨게하기  */
		$("div.dayoff-box").click(function(e){
			const temname = $(this).children('div').text();
			//console.log(temname);
			$("input#template-name").val(temname);
			
			const $target = $(e.target)
			const id = $target.attr("id");

			id!="timeoff"? $("div#dayoff-temp").hide():$("div#dayoff-temp").show(); // 연차양식 뜨게하기  
			id!="work"? $("div#work-temp").hide():$("div#work-temp").show();  // 업무양식 뜨게하기 
			
			let data = ""
			switch (id) {
			case "timeoff":
				data = timeoff_temp 
				break;
			case "reason":
				data = reason_temp 
				break;
			case "work":
				data = work_temp 
				break;
			case "expenditure": 
				data = expenditure_temp 
				break;
			case "buy":
				data = buy_temp 
				break;
			case "condolence":
				data = condolence_temp; 
				break;
			case "other":
				data = ""; 
				break;
			}
			
			editor.setMarkdown(data);
			
			showmodal();
		})
		
		// 플랫피커
	 	flatpickr.localize(flatpickr.l10ns.ko);
	 	flatpickr($(".dateSelector"));
		$(".dateSelector").flatpickr({
			dateFormat: "Y-m-d",
			defaultDate: new Date(),
			local: 'ko'
		});
		
		
		/* 문서 템플릿  */
		const timeoff_temp = '';
		const reason_temp = '';
		const work_temp = '';
		const condolence_temp = '<div class="fr-element fr-view" dir="auto" contenteditable="true" style="min-height: 100px;" aria-disabled="false" spellcheck="true"><h1 id="isPasted" style="box-sizing: border-box; margin: 0px; font-weight: 600; line-height: 1.8; font-size: 26px; padding: 30px 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: center;">경조금 지급 신청서</h1><p style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(118, 118, 118); font-family: &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, &quot;SF Pro KR&quot;, &quot;SF Pro Text&quot;, &quot;SF Pro Icons&quot;, &quot;Apple Gothic&quot;, &quot;HY Gulim&quot;, MalgunGothic, &quot;HY Dotum&quot;, &quot;Lexi Gulim&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, roboto, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><br style="box-sizing: border-box;"></p><p style="box-sizing: border-box; margin: 0px; padding: 20px 0px 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 1.8; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; font-size: 16px; text-align: start;"><strong style="box-sizing: border-box; font-weight: 700;">1. 경조금 수혜자</strong></p><p style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 1.8; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; font-size: 16px; text-align: start;">소속:&nbsp;</p><p style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 1.8; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; font-size: 16px; text-align: start;">성명:&nbsp;</p><p style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(118, 118, 118); font-family: &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, &quot;SF Pro KR&quot;, &quot;SF Pro Text&quot;, &quot;SF Pro Icons&quot;, &quot;Apple Gothic&quot;, &quot;HY Gulim&quot;, MalgunGothic, &quot;HY Dotum&quot;, &quot;Lexi Gulim&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, roboto, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><br style="box-sizing: border-box;"></p><table align="" style="box-sizing: border-box; border-collapse: collapse; margin: 0px; padding: 0px; font-family: &quot;맑은 고딕&quot;; width: 938px; border: 1px none rgb(0, 0, 0); empty-cells: show; max-width: 100%; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; text-align: start; font-size: 16px; line-height: 1.8; color: rgb(0, 0, 0); table-layout: fixed;"><tbody style="box-sizing: border-box;"><tr style="box-sizing: border-box;"><td rowspan="5" scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 142px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">지급사유</p></td><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 194px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">경조 대상자 성명</p></td><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 578px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(156, 156, 156); font-family: &quot;맑은 고딕&quot;; font-size: 16px;">예시) 형제/자매 결혼시, 형제/자매 성함 입력</span></p></td></tr><tr style="box-sizing: border-box;"><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 194px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">관계</p></td><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 578px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><br style="box-sizing: border-box;"></p></td></tr><tr style="box-sizing: border-box;"><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; width: 194px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-weight: bold; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">경조일</p><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; text-align: start;"><strong style="box-sizing: border-box; font-weight: 700;">(장례시 발인일 입력)</strong></span></p></td><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 578px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><br style="box-sizing: border-box;"></p></td></tr><tr style="box-sizing: border-box;"><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 194px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">경조내용</p></td><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 578px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><br style="box-sizing: border-box;"></p></td></tr><tr style="box-sizing: border-box;"><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 194px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">발생지 주소(필요시 작성)</p></td><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 578px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><br style="box-sizing: border-box;"></p></td></tr><tr style="box-sizing: border-box;"><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 142px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">지급금액</p></td><td colspan="2" scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 679px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(156, 156, 156); font-family: &quot;맑은 고딕&quot;; font-size: 16px;">경조금 지급금액 000,000원을 입력</span></p></td></tr><tr style="box-sizing: border-box;"><td scope="" style="box-sizing: border-box; margin: 0px; padding: 10px 0px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; text-align: center; font-weight: bold; width: 142px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;">지급계좌</p></td><td colspan="2" scope="" style="box-sizing: border-box; margin: 0px; padding: 10px; min-width: 5px; border: 1px solid rgb(0, 0, 0); word-break: break-all; line-height: 1.8; width: 679px;"><p style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 1.8; font-family: &quot;맑은 고딕&quot;; font-size: 16px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(156, 156, 156); font-family: &quot;맑은 고딕&quot;; font-size: 16px;">급여계좌 입력</span></p></td></tr></tbody></table></div>';
		const buy_temp = '<div class="fr-element fr-view" dir="auto" contenteditable="true" style="min-height: 100px;" aria-disabled="false" spellcheck="true"><p align="center" id="isPasted" style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; font-size: 10pt; text-align: center;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 24px;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 25.68px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;"><strong style="box-sizing: border-box; font-weight: 700;">구 매 요 청 서</strong></span></span></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: normal; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: SpoqaHanSans-Bold;">&nbsp;</span></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: normal; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: SpoqaHanSans-Bold;">&nbsp;</span></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt; text-indent: -18pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">1.<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">구매요청부서 :</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">&nbsp;</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt; text-indent: -18pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">2.<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">구매목적(필요성) :</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt; text-indent: -18pt;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: SpoqaHanSans-Bold; font-size: 12px; letter-spacing: 1pt; text-indent: -18pt;">&nbsp; &nbsp; &nbsp;</span><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: SpoqaHanSans-Bold; font-size: 12px; letter-spacing: 1pt; text-indent: -18pt;">※작성 Tip : 구매요청 물품이 업무상 필수물품인 근거사항을 제시해주세요</span></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">&nbsp;</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt; text-indent: -18pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">3.<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">희망납기일 :</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">&nbsp;</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt; text-indent: -18pt;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">4.<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 12pt; line-height: 17.12px; font-family: SpoqaHanSans-Bold; letter-spacing: 1pt;">구매요청품목</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 14.2667px; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; text-align: justify; font-size: 10pt; text-indent: -18pt;"><br style="box-sizing: border-box;"></p><div style="box-sizing: border-box; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; font-family: &quot;맑은 고딕&quot;; font-size: 16px; color: rgb(0, 0, 0); line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"><table style="box-sizing: border-box; border-collapse: collapse; margin: 0px; padding: 0px; font-family: &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, &quot;SF Pro KR&quot;, &quot;SF Pro Text&quot;, &quot;SF Pro Icons&quot;, &quot;Apple Gothic&quot;, &quot;HY Gulim&quot;, MalgunGothic, &quot;HY Dotum&quot;, &quot;Lexi Gulim&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, roboto, sans-serif; width: 937px; border: none; empty-cells: show; max-width: 100%;"><tbody style="box-sizing: border-box;"><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">NO</strong>.</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">품목명</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">모델명</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">수량</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">단가</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">금액</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.734px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">사용부서(사용자)</strong></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.734px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.734px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.734px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.734px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 133.734px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td colspan="4" style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 534.844px; text-align: center; background-color: rgb(204, 204, 204);"><strong style="box-sizing: border-box; font-weight: 700;">합계(부가세 포함)</strong></td><td colspan="3" style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 401.156px; background-color: rgb(204, 204, 204);"><br style="box-sizing: border-box;"></td></tr></tbody></table><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; line-height: 14.2667px; text-align: justify; font-size: 10pt; font-family: &quot;맑은 고딕&quot;;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 9pt; line-height: 12.84px; font-family: SpoqaHanSans-Bold;">&nbsp;</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; line-height: 14.2667px; text-align: justify; font-size: 10pt; text-indent: -18pt; font-family: &quot;맑은 고딕&quot;;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 11pt; line-height: 15.6933px; font-family: SpoqaHanSans-Bold;">5.<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp; &nbsp;&nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 11pt; line-height: 15.6933px; font-family: SpoqaHanSans-Bold;">첨부서류</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 38pt; padding: 0px; line-height: 14.2667px; text-align: justify; font-size: 10pt; text-indent: -18pt; font-family: &quot;맑은 고딕&quot;;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 11pt; line-height: 15.6933px; font-family: SpoqaHanSans-Bold;"><br style="box-sizing: border-box;"></span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 56pt; padding: 0px; line-height: 14.2667px; text-align: justify; font-size: 10pt; text-indent: -18pt; font-family: &quot;맑은 고딕&quot;;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 14.2666px; font-family: SpoqaHanSans-Bold; font-size: 13.3333px;">(1)<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp; &nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 14.2666px; font-family: SpoqaHanSans-Bold; font-size: 13.3333px;">관련 구매 링크 :&nbsp;</span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 56pt; padding: 0px; line-height: 14.2667px; text-align: justify; font-size: 10pt; text-indent: -18pt; font-family: &quot;맑은 고딕&quot;;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 14.2666px; font-family: SpoqaHanSans-Bold; font-size: 13.3333px;"><br style="box-sizing: border-box;"></span></strong></p><p style="box-sizing: border-box; margin: 0cm 0cm 0.0001pt 56pt; padding: 0px; line-height: 14.2667px; text-align: justify; font-size: 10pt; text-indent: -18pt; font-family: &quot;맑은 고딕&quot;;"><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 14.2666px; font-family: SpoqaHanSans-Bold; font-size: 13.3333px;">(2)<span style="box-sizing: border-box; margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp; &nbsp;</span></span></strong><strong style="box-sizing: border-box; font-weight: 700;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; line-height: 14.2666px; font-family: SpoqaHanSans-Bold; font-size: 13.3333px;">견적서(필요시 첨부)</span></strong></p></div></div>';
		const expenditure_temp = '<div class="fr-element fr-view" dir="auto" contenteditable="true" style="min-height: 100px;" aria-disabled="false" spellcheck="true"><div id="isPasted" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;맑은 고딕&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; line-height: 1.8; display: block; margin-top: 0px; margin-bottom: 0px; text-align: center;"><span style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 24px;"><strong style="box-sizing: border-box; font-weight: 700;">지 출 결 의 서</strong></span><br style="box-sizing: border-box;"><br style="box-sizing: border-box;"></div><table style="box-sizing: border-box; border-collapse: collapse; margin: 0px; padding: 0px; font-family: &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, &quot;SF Pro KR&quot;, &quot;SF Pro Text&quot;, &quot;SF Pro Icons&quot;, &quot;Apple Gothic&quot;, &quot;HY Gulim&quot;, MalgunGothic, &quot;HY Dotum&quot;, &quot;Lexi Gulim&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, roboto, sans-serif; width: 937px; border: none; empty-cells: show; max-width: 100%; color: rgb(0, 0, 0); font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><tbody style="box-sizing: border-box;"><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">NO</strong><strong style="box-sizing: border-box; font-weight: 700;">.</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">거래일</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">거래처명</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px; text-align: center;"><div style="box-sizing: border-box; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">내용</strong></div></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">금액</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">지급 요청일</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">예금주</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">은행</strong></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px; text-align: center;"><div style="box-sizing: border-box; text-align: center;"><strong style="box-sizing: border-box; font-weight: 700;">계좌번호</strong></div></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px; text-align: center;">1</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px; text-align: center;">2022-01-07</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px; text-align: center;">abc운송</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px; text-align: center;">물품 운반료</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px; text-align: center;">100,000</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px; text-align: center;">2022-01-31</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px; text-align: center;">000</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px; text-align: center;">00은행</td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px; text-align: center;">123-456-789</td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 57.1719px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 95.5703px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 160.648px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 100.07px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 107.711px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 104.578px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 103.992px;"><br style="box-sizing: border-box;"></td><td style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 102.266px;"><br style="box-sizing: border-box;"></td></tr><tr style="box-sizing: border-box;"><td colspan="4" style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 417.383px; background-color: rgb(204, 204, 204);"><div style="box-sizing: border-box; text-align: right;"><strong style="box-sizing: border-box; font-weight: 700;">총계 : &nbsp; &nbsp; &nbsp;</strong></div></td><td colspan="5" style="box-sizing: border-box; margin: 0px; padding: 0px; min-width: 5px; border: 1px solid rgb(221, 221, 221); width: 518.617px; background-color: rgb(204, 204, 204);">&nbsp;100,000</td></tr></tbody></table></div>';
		
		<%--텍스트 에디터 시작 --%>
		const { Editor } = toastui; 
		const { colorSyntax } = Editor.plugin;
		
		const editor = new toastui.Editor({
		  el: document.querySelector('#editor'),
	      height: '500px',
	      initialEditType:"wysiwyg",
	      previewStyle: 'vertical',
	      plugins: [colorSyntax],
	      hooks: {
		      addImageBlobHook: function (blob, callback) {
		        const formData = new FormData();
		        formData.append("image", blob);
		        formData.append("uri", window.location.pathname);
		        const imageURL = imageUpload(formData);
		        callback(imageURL, "image");
		      }
		  }, 
		  language: "ko-KR"
		});
		
		<%-- 텍스트 에디터 끝 --%>
		
		// 저장하기 눌렀을경우 
		$("button#approvalsave").click(function(){
			$('#content').prepend(editor.getHTML());
			
			let useval = Number($("input#use-dayoffcnt").val());
			let leftval = Number($("input#left-dayoffcnt").val());
			
			if(useval == 0){ // 사용연차가 0보다 적으면 
				alert("신청하는 연차가 없습니다!");
				return;
			}else if( useval<0 ){
				alert("신청할려는 연차가 잔여연차 갯수보다 많습니다!");
				return;
			}
			
			// 글제목 유효성 검사
	         const subject = $("input#subject").val().trim();
	         if(subject == "") {
	            alert("글제목을 입력하세요!!");
	            return;
	         }
	         var contentval = editor.getHTML();
	         console.log(contentval);
	         contentval = contentval.replace(/&nbsp;/gi, ""); // 공백을 "" 으로 변환
	         contentval = contentval.substring(contentval.indexOf("<p>")+3);
	         contentval = contentval.substring(0, contentval.indexOf("</p>"));
	         
	         if(contentval.trim().length == 0) {
	              alert("글내용을 입력하세요!!");
	               return;
	           }
	         $("#content").val(contentval);         

	         // 폼(form)을 전송(submit)
	   		 const frm = document.addFrm;
	         frm.method = "POST";
	         frm.action = "<%= ctxPath%>/addEnd.up";
	         frm.submit(); 
		});
		
		
		$(document).on({
			mouseenter: function(){
				$(this).css('background-color','#f6f6f6');
				// 만일 1단계만 있다면 삭제버튼 계속 안보이게 하기 
				if($("div[name='approvalstep']").length > 1) 
					$(this).find('.delboxbtn').css('display','flex');
			},
			mouseleave: function(){
				$(this).css('background-color','transparent');
				$(this).find('.delboxbtn').css('display','none');
			}
		}, '.signheader');
		
		
		// 외부영역 클릭 시 팝업 닫기
		$(document).mouseup(function (e){
			var option = $(".option");
			if(option.has(e.target).length === 0){
				option.css('display','none');
			}
		});
		
	});//end of $(document).ready(function(){}---------------
	
	function imageUpload(formData) {
		  let imageURL;

	  $.ajax({
	    type: "post",
	    url: "<%= ctxPath%>/approval/image_upload.up",
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
	  });

	  return imageURL;
	}
	
	function showmodal(){
		$('#writemodal').modal('show');
	};
	
	
	function showmodal_selSignMem(){
		$('#myModal_selSignMem').modal('show');
	}
	
	// 저장된 개인결재선보여주기 
	function showmodal_mySignMade(){
		$.ajax({
			url: "<%= ctxPath%>/approval/loadsavedline.up",
			type:"GET",
			/* data:{"ano":anoval
				, "ap_type":ap_type}, */
			dataType:"json",
			success: function(json) {
				html = '';
				if(json.length > 0){
					
					$.each(json, function(index, item) {
						html += '';
		      	  
					});
				}
				else{
					html += '<div style="text-align:center;color:grey;">저장한 결재라인이 없습니다.</div>' ;
				}
				
				$("#mysavedline").html(html);
			},
			
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    }
		});
		
		$('#myModal_saveSignLine').modal('show');
	}
	
	// 선택된 라인 개인결재선으로 저장
	function showmodal_saveSignLine(){
		if($('.selectedmem').length >1 ){
			$('#myModal_signName').modal('show');
		}else{
			alert("우선 결재사원을 선택해주세요!");
		}
	}
	function savemystep(){
		if($("#signpath_name").val() != ""){ // 결재선 이름을 적었으면 
			let n=0
			let result = 0;
			let spno = 0;
			//var list = [];
			$("div[name='approvalstep']").each(function(index){ // 추가된 단계만큼  
				// 단계, 사원번호 넘겨주기
				//console.log($(this).find('.empno'));
				const $this = $(this); 
				let appendval='';
				$this.find('input.empno').each(function(index, item){
					let val = $(item).val();
					if(index != 0 ) val=','+val;
					
					appendval += val;
					console.log('appendval => '+appendval);
				});			
				if(appendval != ""){
					
					if(spno==0){ // tbl_signpath 한번 넣기 
						$.ajax({
							url: "<%= ctxPath%>/approval/getspno.up",
							type:"GET",
							dataType:"json",
							async:false,
							success: function(json) {
								console.log(json.spno);
								spno = json.spno;
							},
							error: function(request, status, error){
								alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						    }
						});
					}
					
					if(spno != 0){
						$.ajax({ // tbl_signpath_detail 
							url: "<%= ctxPath%>/approval/savemyline.up",
							type:"POST",
							data:{"signpath_name":$("#signpath_name").val()
								, "signpath":appendval
								,"signstep":index+1
								,"signpath_no":spno}, 
							dataType:"json",
							success: function(json) {
								result *= json.result;
								console.log(result);
								n++;
							},
							error: function(request, status, error){
								alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						    }
						});
						
					}
				}
				//list.push(appendval); // 단계마다 들감. [(10001,10001),(10001)]
			});
			result ==1? alert("저장에 성공했습니다!"):alert("저장에 성공했습니다!");
			$('#myModal_signName').modal('hide');
		}
		else{
			alert("저장할 결재선명을 적어주세요!")
		}
		 
		
	}
	
	
	
	
	/* 모달창 닫힐때 confirm 뜨게하기 */
	function modalclose(){
		if(!confirm("결재문서를 닫으시겠습니까? 작성중인 내용은 모두 삭제됩니다.")){
			$('#writemodal').modal("show");  
		}else{
			// val(""); // 모든 값 없애기 
			$('#writemodal').modal("hide"); //닫기 
		}
	}
	
	
	let num = 0;
	<%-- 옵션창 열리고 닫히고  --%>
	function optionForm(value,e,thisnum){
		 if(value=="OPEN") {
			 option.style.display="block";
			 /* console.log("$(this) =>"+$(this).html()); */
/* 			 console.log("$(e.target) =>"+$(e.target).html()); */
			 num = thisnum;
			 //num = optionnum; //옵션창 열린 박스 넘버 저장 
			 //console.log("옵션창 열릴때 num 값 =>"+num);
		 }
		 else{
			 option.style.display="none";
		 }
	}
	 
	// 앞에꺼 삭제하고 옵션창 열면 삭제전 값으로 num이 넘겨짐  
	
	/* iframe 에서 선택한 멤버 append */
	function get_memname(memInfo){
		/* console.log(memInfo); */
		optionForm('CLOSE');
		let html = '<div class="selectedmem">'+memInfo
				  +'<button type="button" class="btn-close mem-del" aria-label="close" onclick="del_appendmember(event)"></button>'
				  +'</div>';
		
		//console.log("멤버append할때 num 값 =>"+num);
		$("div#memcontent-iframe"+num).append(html);
		/* $("div#memcontent-iframe"+num).next(".selmembtn").css('display','none'); */
	}
	
	/*  append 된 멤버 삭제버튼 누를시  */
	function del_appendmember(e){
		$(e.target).parent().remove();
		
		// 선택된 멤버가 하나도 없다면 
		$(".selmembtn").css('display','block');
	}
	
	
	
	
	let aprCnt = 1; // 박스 단계 넘버 
	/* 승인단계 박스 단계추가 */
	function approvalplus(){
		++aprCnt;
		let html = $("div.approvalplus").html();
		
		html += `<div class="signli" id="stepdiv`+aprCnt+`" name="approvalstep"  >`
		  +`<header class="signheader">`
		  +`<span class="signspan spanbox" id="stepspan`+aprCnt+`" style="color: rgb(141, 150, 161);">`
				+`<span>`+aprCnt+`단계</span>`
		  +`</span>`
			+`<div class="separator" aria-orientation="horizontal" ></div>`
			+`<div class="stepbtn">`
  				+`<button type="button" id="delbox`+aprCnt+`" class="delboxbtn" onclick="del_stepapproval(`+aprCnt+`,event)"><div style="height: 16px;display: flex;align-items: center;justify-content: center;"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px;height: 20px;flex-shrink: 0;width: 20px;height: 20px;flex-shrink: 0;">`
  				+`<path d="M10.5358 4.82022C10.0803 4.82022 9.67068 5.09715 9.50151 5.51946L9.29552 6.03371H14.7045L14.4985 5.51946C14.3293 5.09715 13.9197 4.82022 13.4642 4.82022H10.5358ZM7.8091 4.84345L7.33232 6.03371H5.66739C4.74652 6.03371 4 6.77918 4 7.69876C4 8.37524 4.20052 9.0366 4.5763 9.59947L5.01266 10.2531V19.0787C5.01266 20.1398 5.87408 21 6.93671 21H17.0633C18.1259 21 18.9873 20.1398 18.9873 19.0787V10.2531L19.4237 9.59947C19.7995 9.0366 20 8.37524 20 7.69876C20 6.77917 19.2535 6.03371 18.3326 6.03371H16.6677L16.1909 4.84345C15.7449 3.73007 14.6651 3 13.4642 3H10.5358C9.33493 3 8.25508 3.73007 7.8091 4.84345ZM5.83031 7.85393H7.94937H16.0506H18.1697C18.1442 8.11627 18.0543 8.36917 17.9071 8.58979L17.1646 9.70197V19.0787C17.1646 19.1345 17.1192 19.1798 17.0633 19.1798H6.93671C6.88078 19.1798 6.83544 19.1345 6.83544 19.0787V9.70197L6.09295 8.58979C5.94566 8.36917 5.8558 8.11627 5.83031 7.85393ZM10.8861 17.9663V10.0787H9.06329V17.9663H10.8861ZM14.9367 17.9663V10.0787H13.1139V17.9663H14.9367Z" fill="#c32700" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div></button>`
	  			+`<button type="button" id="plusmem`+aprCnt+`" class="plusmembtn" onClick="optionForm('OPEN',event,`+aprCnt+`)"><div><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px; height: 20px; flex-shrink: 0;">`
	  			+`<path d="M12.9 12.9L19 12.9L19 11.1L12.9 11.1L12.9 5L11.1 5L11.1 11.1L5 11.1L5 12.9L11.1 12.9L11.1 19L12.9 19L12.9 12.9Z" fill="#556372" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div></button>`
				/* +`<button type="button" class="btn-close step-del" aria-label="close" onclick="del_stepapproval(event)"  style="float: right;"></button>` */
		   +`</div>`
			+`</header>`
				+`<ul class="signul">`
					+`<li class="signli-prof">`
						+`<div class="signdiv-prof">`
							+`<div style="line-height: 1;display: block;width:100%;">`
							+`<div id="memcontent-iframe`+aprCnt+`"></div>`
						  		/* +`<button id="`+aprCnt+`" type="button" class="attendance-dateSelector  selmembtn" onClick="optionForm('OPEN',event,`+aprCnt+`)">`
					      	  		+`<span style="color: rgba(36, 42, 48, 0.48);">`
					      	  			+`<span style="font-size: 10pt;text-align: center;color: rgb(85, 99, 114);display: block;" >대상 검색</span>`
					      	  			+`<span style="line-height: 2;font-size: 8pt;text-align: center;color: rgb(141, 150, 161);display: block;" >승인·참조 대상을 선택해주세요.</span>`
					      	  		+`</span>`
					      	  	+`</button>` */
						  	+`</div>`
			  			+`</div>`
		  			+`</li>`
	  			+`</ul>`
			+`</div>`
		$("div.approvalplus").html(html);
	} 
	
	/* 승인단계 박스 삭제버튼 누를경우 */
	function del_stepapproval(delidnum,e){
		/* const thisdivbody = $(e.target).parent().parent().parent(); */
		/* const delidnum = thisdivbody.attr("id").substr(-1); */
		//console.log("delidnum =>"+delidnum)
		$("#stepdiv"+delidnum).remove();
		
		// 삭제 버튼 누르면 해당 승인단계박스의 단계보다 큰 애들은 한칸씩 내려옴
		let j =1;
		$("div[name='approvalstep']").each(function(){ 
			if(j >= delidnum ){
				++j; // 삭제된 박스넘버와 같아지므로 +1 해줌 
				
				const $this = $(this).parent();
				//console.log("$this => "+$this.html());
				
				const divid = $this.find("#stepdiv"+j);
				const divid2 = $this.find("#memcontent-iframe"+j);
				const spanid = $this.find("#stepspan"+j);
				const delboxid = $this.find("#delbox"+j);
				const plusmemid = $this.find("#plusmem"+j);
				const btnid = $this.find("#"+j);
				
				--j; // 단계낮추기
				
				spanid.text(j+"단계");
				
				divid.attr('id',"stepdiv"+j); // id 단계 변경  
				//console.log("divid의 id => "+divid.attr('id'))
				divid2.attr('id',"memcontent-iframe"+j); // id 단계 변경  
				//console.log("divid2의 id => "+divid2.attr('id'))
				spanid.attr('id',"stepspan"+j); // id 단계 변경 
				//console.log("spanid의 id => "+spanid.attr('id'))
				btnid.attr('id',j); // id 단계 변경 
				
				delboxid.attr('onclick','del_stepapproval('+j+',event);');
				plusmemid.attr('onclick',"optionForm('OPEN',event,"+j+");");
				
				delboxid.attr('id','delbox'+j); // id 단계 변경 
				plusmemid.attr('id','plusmem'+j); // id 단계 변경 
				
				++j;	
			}
			else ++j;
		});// end of $("div[name='approvalstep']").each(function(){}-------------
		
		--aprCnt;
		console.log("박스 aprCnt =>"+aprCnt);
		//console.log("추가될 aprCnt =>"+aprCnt);
	}
	
	
	function getTimeStamp() {
		
	    var d = new Date();
	    var s =
	        leadingZeros(d.getFullYear(), 4) + '-' +
	        leadingZeros(d.getMonth() + 1, 2) + '-' +
	        leadingZeros(d.getDate(), 2);
	
	    return s;
	}
	
	function leadingZeros(n, digits) {
	
	    var zero = '';
	    n = n.toString();
	
	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}

	// 저장된 결재라인 선택시 해당 문서 결재단계적용 
	function picksavedline(){
		
	}
</script>

<div class="dayoff-index-container">
	<div class="dayoff-write">
		<!-- <div class="margin-container dayoff-subject">잔여 휴가</div> -->
		<div class="ml-1 margin-container approval-box" >
			<div class="dayoff-box timeoff mb-2" style="width: 32.4%;" id="timeoff">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/beach-with-umbrella_1f3d6-fe0f.png" width="25px"/>
				<div>연차</div>
			</div>
			<div class="dayoff-box sick" style="width: 32.4%;" id="reason">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/pill_1f48a.png" width="25px"/>
				<div>사유서</div>
			</div>
			<div class="dayoff-box condole" style="width: 32.4%;" id="work">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/325/clipboard_1f4cb.png" width="25px"/>
				<div>업무기안서</div>
			</div>
			<br>
			<div class="dayoff-box condole  mb-2" style="width: 32.4%;" id="expenditure">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/325/money-with-wings_1f4b8.png" width="25px"/>
				<div>지출결의서</div>
			</div>
			<div class="dayoff-box condole" style="width: 32.4%;" id="buy">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/325/credit-card_1f4b3.png" width="25px"/>
				<div>구매요청서</div>
			</div>
			<div class="dayoff-box condole" style="width: 32.4%;" id="condolence">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/325/confetti-ball_1f38a.png" width="25px"/>
				<div>경조금신청서</div>
			</div>
		
			<div class="dayoff-box condole" style="width: 32.4%;" id="other">
				<img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/envelope_2709-fe0f.png" width="25px"/>
				<div>기타</div>
			</div>
		
		</div>
		<!-- <hr class="HRhr" style="margin: 40px 0;"/> -->
		
	</div>
	
	
		<!-- <div class="container mt-3">  
		
		  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Hz">모달 열기</button>
		
		</div> -->
	
	
	</div>
	
	
	 
	<!-- 모달창 -->
	<!--  aria-labelledby="staticBackdropLabel"  aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" -->
	<%-- ****************** 결재선 상신 모달창 시작 ********************* --%>
	<div class="modal fade" id="writemodal" tabindex="-1"  aria-labelledby="staticBackdropLabel"  aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" style="border-radius: 0.5rem;background-color: rgba(240, 240, 240, 0.85);">
 <div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable" style="    border-radius: 0.5rem;box-shadow: 0px 0px 0px 1px rgb(0 0 0 / 4%), 0px 24px 72px rgb(36 42 48 / 30%);max-width: 1080px !important;align-items: normal !important;">
   <div class="modal-content" style="border:none">
		<div class="modal-body-header" style="position: absolute;top: 0px;display: flex;-webkit-box-pack: justify;justify-content: space-between;-webkit-box-align: center;align-items: center;right: 0px;background-color: transparent;z-index: 10;padding: 20px 30px;">
		  <button type="button" class="btn-close" onclick="modalclose()"></button><!-- data-bs-dismiss="modal" -->
		</div>
		<div class="modal-body" style="padding: 0px;">
			<div style="float: left;width: 100%;height: 100%;justify-content: flex-start;align-items: stretch;flex-direction: row;display: flex;">
				<div style="width: 70%;height: 100%;">
					  <!-- 문서 헤더버튼  -->
					  <div class="head-btnsection" >
						  <div class="ApvHeader-footer">
							  <div class="ApvHeader-footer_column" id="badgesection"><button type="button" class="btn btn-badge statebadge" style="margin:auto;background-color: #e7dfd9;color: #b2a9a4;">템이름</button></div><!-- 문서상태뱃지 -->
							  <!-- <div class="ApvHeader-footer_column" id="btnsection"></div> -->
						  </div>
		  	     	  </div>
					  <!-- 문서 헤더정보  -->			  
					  <div id="datasection" style="border-bottom: 1px solid rgba(36, 42, 48, 0.06);">
					  	<div class="sc-bCfvAP cstQxy"><input type="text" class="ApvHeader-title" id="modaltitle" value=""></input> <!-- 작성 문서 제목. 클릭한 문서에 맞는 템플릿 이름 들어감  -->
							<div class="sc-cOxWqc ft-16 StyledApv">
							  	  <div class="ApvDl-item"style="font-weight:500;"><span class="ApvDl-dd"><i class="icon icon-file-text2"></i>'+json.ano+'・'+writeday+' 작성</span></div>
								  <div class="ApvDl-item"><span class="ApvDl-dt">보존연한:</span><span class="ApvDl-dd">'+json.preserveperiod+'</span></div>
								  <!-- <div class="ApvDl-item"><span class="ApvDl-dt">템플릿:</span><span class="ApvDl-dd">'+json.ap_type+'</span></div> -->
								  <!-- <div class="ApvDl-item"><span class="ApvDl-dt">작성자:</span><span class="ApvDl-dd">'+json.name_kr+'</span></div> -->
							</div>
						</div>
					  </div>
					  
					  
					  
					  <!-- 문서내용  -->
					  <div class="pad-part"> 
					  	<!-- <div class="ApvSection-header"><h2 class="ApvSection-title">내용</h2></div> --> 
						  <div class="ApvSection-body">
						  	<div style="color: rgb(17, 17, 17);font-size: 16px;line-height: 1.63;">
						  		<div style="display: flex;min-height: 32px;">
						  			<div style="display: flex;align-items: center;width: 160px;height: 32px;">
						  				<span style="font-weight: 500;line-height: 18px;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;word-break: break-all;-webkit-box-orient: vertical;-webkit-line-clamp: 1;">부서</span>
						  				<div style="width: 3px;height: 3px;border-radius: 50%;background-color: #f57453;margin-left: 6px;flex-shrink: 0;"></div>
						  			</div>
						  			<div style="width: 100%;">
						  				<div>
						  					<textarea class="write-textarea" aria-disabled="false" placeholder="내용을 입력해주세요." style="height: 32px !important;"></textarea>
						  				</div>
						  			</div>
						  		</div> 
						  		<div style="display: flex;min-height: 32px;">
						  			<div style="display: flex;align-items: center;width: 160px;height: 32px;">
						  				<span style="font-weight: 500;line-height: 18px;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;word-break: break-all;-webkit-box-orient: vertical;-webkit-line-clamp: 1;">부서</span>
						  				<div style="width: 3px;height: 3px;border-radius: 50%;background-color: #f57453;margin-left: 6px;flex-shrink: 0;"></div>
						  			</div>
						  			<div style="width: 100%;">
						  				<div>
						  					<textarea class="write-textarea" aria-disabled="false" placeholder="내용을 입력해주세요." style="height: 32px !important;"></textarea>
						  				</div>
						  			</div>
						  		</div> 
						  		<div style="display: flex;min-height: 32px;">
						  			<div style="display: flex;align-items: center;width: 160px;height: 32px;">
						  				<span style="font-weight: 500;line-height: 18px;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;word-break: break-all;-webkit-box-orient: vertical;-webkit-line-clamp: 1;">부서</span>
						  				<div style="width: 3px;height: 3px;border-radius: 50%;background-color: #f57453;margin-left: 6px;flex-shrink: 0;"></div>
						  			</div>
						  			<div style="width: 100%;">
						  				<div>
						  					<textarea class="write-textarea" aria-disabled="false" placeholder="내용을 입력해주세요." style="height: 32px !important;"></textarea>
						  				</div>
						  			</div>
						  		</div> 
						  		<div style="display: flex;min-height: 32px;">
						  			<div style="display: flex;align-items: center;width: 160px;height: 32px;">
						  				<span style="font-weight: 500;line-height: 18px;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;word-break: break-all;-webkit-box-orient: vertical;-webkit-line-clamp: 1;">첨부파일</span>
						  				<div style="width: 3px;height: 3px;border-radius: 50%;background-color: #f57453;margin-left: 6px;flex-shrink: 0;"></div>
						  			</div>
						  			<div style="width: 100%;padding: 0 12px;">
						  				<div style="line-height: 1.5;width: 100%;">
						  					<span class="c-lmMdX c-lmMdX-ikflzLD-css" style="cursor: pointer;font-size: 14px;"><span style="color: #8d96a1;" data-lokalise="true" >파일 추가 (20MB 이하, 최대 10개)</span></span>
						  					<input type="file" multiple="" class="c-kBYYkb" style="outline: none;touch-action: manipulation;display: none;appearance: none;">
						  					<!-- <input type="file" class="write-textarea" aria-disabled="false" placeholder="첨부할 파일을 선택해주세요" style="height: 32px !important;"></input> -->
						  				</div>
						  			</div>
						  		</div> 
						  	
						  		
						  	</div>
				  		</div>
				  	  </div>
						  		
				  		  <!-- <div id="contentsection" style="padding: 20px 0px;white-space: pre-line;">
						  		  <div class="sc-bCfvAP cstQxy"><h4 class="ApvHeader-title">엄나ㅣ어</h4>'
								  <div class="sc-cOxWqc ft-16 StyledApv"><div class="ApvDl-item"style="font-weight:500;"><span class="ApvDl-dd"><i class="icon icon-file-text2"> </i>'+json.ano+'・'+writeday+' 작성</span>'
								  </div><div class="ApvDl-item"><span class="ApvDl-dt">보존연한:</span><span class="ApvDl-dd">ㅊㅇㄹㄴㅇ</span>
								  </div><div class="ApvDl-item"><span class="ApvDl-dt">템플릿:</span><span class="ApvDl-dd">ㄹㅇㄴㄹㄹ</span>
								  </div><div hidden="" class="ApvDl-item"><span class="ApvDl-dt">작성자:</span><span class="ApvDl-dd">ㄴㅇㅁㄴㅇㅁ</span></div>
								  </div>
								  </div>
						  		</div> -->
					  
					<div class="pad-part form-group mt-3" >
					<div class="ApvSection-header"><h2 class="ApvSection-title">내용</h2></div>
					<!-- <span class="form-inputlabel">내용</span> -->
					<div class="position-relative mb-1" style="width: 100%;">
					      <textarea id="content" name="content" hidden="hidden"></textarea>
					      <div id="editor" style="height: 300px;width: 100%;"></div>
					</div>
					
				  	  <div class="modal-footer" style="position: sticky;bottom: 0;background-color: white;padding: 5px 40px 20px;display: flex;align-items: center;border-top:0px;">
					  	  <div id="footercss">
						  	  
						  	  <button id="rejdoc"class="approvebtn" type="button" style="margin-right:10px;">
						  	  	<div class="c-dhzjXW c-dhzjXW-jroWjL-align-center c-dhzjXW-knmidH-justify-space-between c-dhzjXW-ejCoEP-direction-row c-dhzjXW-kVNAnR-wrap-noWrap c-dhzjXW-ihnNXey-css" style="width: 100%;"><div class="c-dhzjXW c-dhzjXW-jroWjL-align-center c-dhzjXW-bICGYT-justify-center c-dhzjXW-ejCoEP-direction-row c-dhzjXW-kVNAnR-wrap-noWrap c-dhzjXW-ihnNXey-css c-fGHEql c-fGHEql-jVpCez-align-center">
						  	  	<div style="display: inline-block;"><svg width="20" height="19" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 24px; height: 24px; flex-shrink: 0;"><path d="M12 13.2728L17.0205 18.2933L18.2932 17.0205L13.2728 12L18.2932 6.97954L17.0205 5.70675L12 10.7272L6.97954 5.70675L5.70675 6.97954L10.7272 12L5.70675 17.0205L6.97954 18.2932L12 13.2728Z" fill="currentColor"></path></svg></div>
						  	  	<div style="display: inline-block;"><span>취소</span></div></div></div>
						  	  </button>
						  	  <button id="aprdoc"class="approvebtn"type="button" style="background-color: rgb(19 133 255 / 86%);color:white;">
							  	  <div class="" style="width: 100%;"><div class="">
							  	  <div style="display: inline-block;"><svg width="20" height="19" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 24px; height: 24px; flex-shrink: 0;"><path d="M10.0425 14.6397L17.8067 6.35059L19.1934 7.64946L10.0975 17.3603L4.83347 12.1769L6.16656 10.8231L10.0425 14.6397Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div>
							  	  <div style="display: inline-block;"><span>상신하기</span></div></div></div>
							  </button>
					  	  </div>
				  	  </div>
			  	</div>
			  </div>
			  <aside style="float: right;width: 30%;background: #fbfbfb;height: 100%;height: 300%;">
				  <!-- 문서 결재라인 --> 
				  <div data-radix-scroll-area-viewport dir="ltr" class="pad-part" style="box-shadow: inset 1px 0px 0px rgba(0, 0, 0, 0.08);isolation: isolate;position: relative;padding: 26px 24px;height: 100%;width: 100%;">
					  <div class="ApvSection-header" style="display: flex;flex-direction: row;justify-content: flex-start;">
					  	<h2 class="ApvSection-title"style="margin: auto 0;" >승인・참조</h2>
					  	<button onclick="showmodal_saveSignLine()"class="btn tp" style="display: flex;font-size: small;"data-bs-toggle="tooltip" data-bs-placement="top" title="개인결재선으로 저장"><i style="color: rgb(78 111 215);background-color: transparent;" class="icon icon-user-plus"></i></button> <!-- 삭제 -->
					  	<button onclick="showmodal_mySignMade()"class="btn tp" style="display: flex;font-size: small;"data-bs-toggle="tooltip" data-bs-placement="top" title="결재선 불러오기"><i style="color: #abb3ba;background-color: transparent;" class="icon icon-users"></i></button> <!-- 삭제 -->
					  </div>
					  <div class="ApvSection-body approvalplus">
						  <div class="signli"  id="stepdiv1" name="approvalstep"  > 
						  <header class="signheader">
							  <span class="signspan" id="stepspan1"style="color: rgb(141, 150, 161);">
					  				<span>1단계</span>
					  		  </span>
					  			<div class="separator" aria-orientation="horizontal" ></div>
					  			<div class="stepbtn">
					  			<!-- 단계박스 삭제 버튼 -->
					  				<button type="button" id="delbox1" class="delboxbtn"onclick="del_stepapproval(1,event)"><div style="height: 16px;display: flex;align-items: center;justify-content: center;"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px;height: 20px;flex-shrink: 0;width: 20px;height: 20px;flex-shrink: 0;">
					  				<path d="M10.5358 4.82022C10.0803 4.82022 9.67068 5.09715 9.50151 5.51946L9.29552 6.03371H14.7045L14.4985 5.51946C14.3293 5.09715 13.9197 4.82022 13.4642 4.82022H10.5358ZM7.8091 4.84345L7.33232 6.03371H5.66739C4.74652 6.03371 4 6.77918 4 7.69876C4 8.37524 4.20052 9.0366 4.5763 9.59947L5.01266 10.2531V19.0787C5.01266 20.1398 5.87408 21 6.93671 21H17.0633C18.1259 21 18.9873 20.1398 18.9873 19.0787V10.2531L19.4237 9.59947C19.7995 9.0366 20 8.37524 20 7.69876C20 6.77917 19.2535 6.03371 18.3326 6.03371H16.6677L16.1909 4.84345C15.7449 3.73007 14.6651 3 13.4642 3H10.5358C9.33493 3 8.25508 3.73007 7.8091 4.84345ZM5.83031 7.85393H7.94937H16.0506H18.1697C18.1442 8.11627 18.0543 8.36917 17.9071 8.58979L17.1646 9.70197V19.0787C17.1646 19.1345 17.1192 19.1798 17.0633 19.1798H6.93671C6.88078 19.1798 6.83544 19.1345 6.83544 19.0787V9.70197L6.09295 8.58979C5.94566 8.36917 5.8558 8.11627 5.83031 7.85393ZM10.8861 17.9663V10.0787H9.06329V17.9663H10.8861ZM14.9367 17.9663V10.0787H13.1139V17.9663H14.9367Z" fill="#c32700" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div></button>
					  			<!-- 단계박스 멤버추가 버튼 -->
						  			<button type="button" id="plusmem1" class="plusmembtn" onClick="optionForm('OPEN',event,1)"><div><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px; height: 20px; flex-shrink: 0;">
						  			<path d="M12.9 12.9L19 12.9L19 11.1L12.9 11.1L12.9 5L11.1 5L11.1 11.1L5 11.1L5 12.9L11.1 12.9L11.1 19L12.9 19L12.9 12.9Z" fill="#556372" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div></button>
						  		</div>
				  			</header>
								<ul class="signul">
									<li class="signli-prof">
										<div class="signdiv-prof">
											<div style="line-height: 1;display: block;width:100%;">
												<!-- iframe 선택된 멤버 보여주기  -->
		      	  							<div id="memcontent-iframe1"></div>
										  		<!-- <button id="1" type="button" class="attendance-dateSelector selmembtn"onClick="optionForm('OPEN',event,1)">
									      	  		<span style="color: rgba(36, 42, 48, 0.48);text-align: center;">
									      	  			<span style="font-size: 10pt;color: rgb(85, 99, 114);display: block;" >대상 검색</span>
									      	  			<span style="line-height: 2;font-size: 8pt;color: rgb(141, 150, 161);display: block;" >승인·참조 대상을 선택해주세요.</span>
									      	  		</span>
									      	  	</button> -->
										  	</div>
							  			</div>
						  			</li>
					  			</ul>
				  			</div>
			  			</div>
				  		  <button type="button" class="attendance-dateSelector" style="border-color:#dbdbdb; background-color: white;display: block;width: 100%;"onclick="approvalplus(1)">
				      	  		<span class="ant-typography c-iuedIb" style="color: rgba(36, 42, 48, 0.48);" >
				      	  			<span data-lokalise="true" style="font-size: 10pt;" >+ 단계 추가하기</span>
				      	  		</span>
				      	  </button>
						  <div class="signli mt-5" >
						  <header class="signheader">
						  <span class="signspan" style="color: rgb(141, 150, 161);">
				  				<span>참조자</span>
				  		  </span>
				  			<div class="separator" aria-orientation="horizontal" ></div>
				  			<div class="stepbtn">
				  				<!-- 단계박스 멤버추가 버튼 -->
						  			<button type="button" id="plusmem0" class="plusmembtn" onClick="optionForm('OPEN',event,0)"><div><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: 20px; height: 20px; flex-shrink: 0;">
						  			<path d="M12.9 12.9L19 12.9L19 11.1L12.9 11.1L12.9 5L11.1 5L11.1 11.1L5 11.1L5 12.9L11.1 12.9L11.1 19L12.9 19L12.9 12.9Z" fill="#556372" fill-rule="evenodd" clip-rule="evenodd"></path></svg></div></button>
				  			</div>
				  			</header>
								<ul class="signul">
									<li class="signli-prof">
										<div class="signdiv-prof">
											<div style="line-height: 1;display: block;width:100%;">
												<!-- iframe 선택된 멤버 보여주기  -->
		      	  								<div id="memcontent-iframe0"></div>
										  		<!-- <button type="button" class="attendance-dateSelector selmembtn"onClick="optionForm('OPEN',event,1)">
									      	  		<span style="color: rgba(36, 42, 48, 0.48);text-align: center;">
									      	  			<span style="font-size: 10pt;color: rgb(85, 99, 114);display: block;" >대상 검색</span>
									      	  			<span style="line-height: 2;font-size: 8pt;color: rgb(141, 150, 161);display: block;" >승인·참조 대상을 선택해주세요.</span>
									      	  		</span>
									      	  	</button> -->
										  	</div>
							  			</div>
						  			</li>
					  			</ul>
				  			</div>
			  				
			  			
			  			
					  	<!-- <div class="approvalplus">
	      	  
				      	  <div id="stepdiv1" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
				      	  	<div style="margin-top: 0;">
					      	  	<span  id="stepspan1" class="spanbox" style="font-weight: bold;display: block;">1단계</span>
								<button type="button" class="btn-close step-del" aria-label="close" onclick="del_stepapproval(event)" style="float: right;"></button>      	  	
				      	  	</div>
				      	  	
							
							<textarea placeholder="휴가 등록 메시지 입력" id="memo" class="ant-input c-uExMz" style="height: 37px; max-height: 9.0072e+15px; resize: none;"></textarea>
							
						</div>
		      	  	
		      	  	iframe 선택된 멤버 보여주기 
		      	  	<div id="memcontent-iframe1"></div>

		      	  	<button id="1" type="button" class="attendance-dateSelector" style="background-color: white;display: block;" onClick="optionForm('OPEN',event)">
		      	  		<span style="color: rgba(36, 42, 48, 0.48);">
		      	  			<span style="font-size: 10pt;text-align: left;" >대상 검색</span>
		      	  		</span>
		      	  	</button>
		      	  </div>
		      	  
	      	  	</div>
	      	  
	      	  
	      	  	<button type="button" class="attendance-dateSelector" style="border-color:#dbdbdb; background-color: white;display: block;width: 100%;"onclick="approvalplus(1)">
	      	  		<span class="ant-typography c-iuedIb" style="color: rgba(36, 42, 48, 0.48);" >
	      	  			<span data-lokalise="true" style="font-size: 10pt;" >+ 단계 추가하기</span>
	      	  		</span>
	      	  	</button>-->
				  
				  </div>
			  </aside>
		</div>
    </div>
  </div>

</div>

  
   
   
   

	
	
	<%-- ****************** 결재선 멤버리스트 시작 ********************* --%>
	<div id="option" class="option">
	   <!-- <div style="font-size: 11pt; color: #595959; font-weight: bold; padding-bottom: 20px;">검색 옵션</div> -->
	   <div id="mwa-container" style="height: auto;">
			<iframe id="mwa" name="selmemiframe"style="border: none; width: 100%;height: 280px;" src="<%= request.getContextPath()%>/approval/memberList.up"></iframe>
		</div>
		
        <!-- <div class="modal-footer">
         <a style="cursor:pointer;"class="btn" onclick="optionForm('CLOSE')">닫기</a>
         <a style="cursor:pointer;"class="btn btn-primary">Save</a> 
       </div> --> 
	</div>
	
	
  
   
   
   
   <%-- ****************** 저장한 승인라인 모달창 시작 ********************* --%>
	
	<div class="modal fade " id="myModal_saveSignLine"  tabindex="-1"aria-labelledby="staticBackdropLabel" aria-hidden="true"style="background: rgba(0, 0, 0, 0.5);display: none; z-index: 1060;">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-height: 500px;min-height: 500px;top: 15%;">
	    <div class="modal-content" style="border:none">
	      <div class="modal-header">
	        <h4 class="modal-title" style="padding: 0 10px;font-weight: 600;font-size: 1.2rem;">저장한 결재라인</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	     
	      <div class="modal-body " style="padding: 30px;overflow: auto;">
	      	  
	      	  <!-- <div id="mysavedline">
	      	  
		      	  <div id="savediv1" onclick="picksavedline()" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
		      	  	<div style="margin-top: 0;">
			      	  	<span  id="savespan1" style="font-weight: 500;display: block;">연차결재</span>
		      	  	</div>
		      	  	<div style="margin-top: 5px;">
		  				<div class="selectedmem" style="padding-bottom: 20px;">
				      	  	<div class="signli"  id="stepdiv1" name="approvalstep"  > 
							 	 <header class="signheader" style="padding: 30px 8px;">
				  					<div class="profile" style="padding: 1px;width: 190px;">
				  					<span class="pic"><span>지은</span></span>
				  					<span class="my"><span class="name" style="font-size: 10.8pt;">강채영5</span>
				  					<br>
				  					<span class="role" style="font-size: 9pt;">매장관리</span>
				  					</span>
				  					</div>
				  					<span class="positionIcon"><span>영업 영업2팀&nbsp;|&nbsp;사원</span></span>
				  					<div class="separator" aria-orientation="horizontal" ></div>
				  					<span class="signspan" style="color: #5d6267;font-size: 13px;font-weight: 500;">
									  	<span>1단계</span>
						  		   </span>
			  					</header>
							 	 <header class="signheader" style="padding: 30px 8px;">
				  					<div class="profile" style="padding: 1px;width: 190px;">
				  					<span class="pic"><span>지은</span></span>
				  					<span class="my"><span class="name" style="font-size: 10.8pt;">강채영5</span>
				  					<br>
				  					<span class="role" style="font-size: 9pt;">매장관리</span>
				  					</span>
				  					</div>
				  					<span class="positionIcon"><span>영업 영업2팀&nbsp;|&nbsp;사원</span></span>
				  					
				  					<div class="separator" aria-orientation="horizontal" ></div>
				  					
				  					<span class="signspan" style="color: #5d6267;font-size: 13px;font-weight: 500;">
									  	<span>2단계</span>
						  		   </span>
			  					</header>
		  					</div>
		  				</div>
		  			</div>
		      	  </div>
		      	  
			      	  
			      	  <div id="savediv1" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
			      	  	<div style="margin-top: 0;">
				      	  	<span  id="savespan1" style="font-weight: bold;display: block;">업무결재2(프로젝트)</span>
			      	  	</div>
			      	  </div>
			      	  <div id="savediv1" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
			      	  	<div style="margin-top: 0;">
				      	  	<span  id="savespan1"  style="font-weight: bold;display: block;">업무결재</span>
			      	  	</div>
			      	  </div>
			      	  <div id="savediv1" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
			      	  	<div style="margin-top: 0;">
				      	  	<span  id="savespan1" style="font-weight: bold;display: block;">지출</span>
			      	  	</div>
			      	  </div>
		      	  
	      	  	</div> -->
	      	  
	      	  
	      	  	
            </div>

          </div>
        </div>
    </div> 
    
    
    
    
     
     
     
     
     
    
    
    <%-- ****************** 결재선 라인 저장 모달창 시작 ********************* --%>
    
    <div class="modal fade" id="myModal_signName"  tabindex="-1"aria-labelledby="myModal_signNameLabel" aria-hidden="true"style="background: rgba(0, 0, 0, 0.5);display: none; z-index: 2260;">
	  <div class="modal-dialog modal-sm modal-dialog-centered" >
	    <div class="modal-content" style="border:none">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title" style="padding: 0 10px;font-weight: 700;font-size: 1rem;">개인결재선으로 저장</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button><!-- data-bs-dismiss="modal" -->
	      </div>
	     
	      <!-- Modal body -->
	      <div class="modal-body " style="padding: 30px;overflow: auto;">
			<!-- <form id="mysingpath" name="mysingpath" > -->
				<div class="form-group">
					<span class="form-inputlabel">결재선 이름</span> 
					<div class="position-relative">
						<input type="text" id="signpath_name" class="form-control" placeholder="" name="signpath_name" value="">
					</div>
				</div>
			<!-- </form> -->

		 </div>
             <div class="modal-footer">
              <a data-bs-dismiss="modal" class="btn" style="cursor:pointer;">취소</a>
              <a class="btn" onclick="savemystep()" style="cursor:pointer;color:rgb(0 101 204)">확인</a>
            </div> 
          </div>
        </div>
    </div>
	
