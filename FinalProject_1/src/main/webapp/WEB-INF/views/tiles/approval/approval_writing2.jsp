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
    color: var(--colors-grayLight);
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
div.option {
    border: 0px solid #b0b0b0d9;
    padding: 20px;
    border-radius: 10px;
    background-color: white;
    /* display: inline-block; */
    font-size: 18pt;
    box-shadow: 0.5px 0.5px 14px 0.5px rgb(0 0 0 / 20%);
    margin: 0 auto; 
    width: 450px;
    height: 50%;
    position: fixed;
    top: 42%;
    left: 32.5%;
    /* min-width: 430px; */
    /* top: 27%; */
    z-index: 3000;
    display: none;
    /* max-width: 25%; */
 } 
div.option:before {
    bottom: 0;
    content: " ";
    left: -7px;
    opacity: .0001;
    position: absolute;
    right: 0;
    top: 0;
    z-index: -9999;
}
.selectedmem{
	margin-top:0px !important;
	/* margin-bottom: 10px  !important; */
	padding-bottom: 60px;
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
	function showmodal_mySignMade(){
		$('#myModal_signName').modal('show');
	}
	function showmodal_saveSignLine(){
		$('#myModal_saveSignLine').modal('show');
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
	function optionForm(value,e){
		 if(value=="OPEN") {
			 option.style.display="block";
			 num = $(e.target).attr("id");
			 console.log("옵션창 열릴때 num 값 =>"+num);
			 //num = optionnum; //옵션창 열린 박스 넘버 저장 
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
		
		console.log("멤버append할때 num 값 =>"+num);
		$("div#memcontent-iframe"+num).append(html);
	}
	
	/*  append 된 멤버 삭제버튼 누를시  */
	function del_appendmember(e){
		$(e.target).parent().remove();
	}
	
	
	
	
	let aprCnt = 1; // 박스 단계 넘버 
	/* 승인단계 박스 단계추가 */
	function approvalplus(){
		++aprCnt;
		let html = $(".approvalplus").html();
		
		
		
		
		html += `<div id="stepdiv`+aprCnt+`" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">`
			  	  	+`<div style="margin-top: 0;">`
			      	  	+`<span id="stepspan`+aprCnt+`" class="spanbox" style="font-weight: bold;display: block;">`+aprCnt+`단계</span>`
						+`<button type="button" class="btn-close step-del" aria-label="close" onclick="del_stepapproval(event)"  style="float: right;"></button>`      	  	
			  	  	+`</div>`
			  	  	
			  	  	+`<div id="memcontent-iframe`+aprCnt+`"></div>`
			  	  	+`<button id="`+aprCnt+`" type="button" class="attendance-dateSelector" style="background-color: white;display: block;" onClick="optionForm('OPEN',event)">`
			  	  		+`<span style="color: rgba(36, 42, 48, 0.48);">`
			  	  			+`<span style="font-size: 10pt;text-align: left;" >대상 검색</span>`
			  	  		+`</span>`
			  	  	+`</button>`
			  	  +`</div>`;
		$("div.approvalplus").html(html);
	} 
	
	/* 승인단계 박스 삭제버튼 누를경우 */
	function del_stepapproval(e){
		const thisdivbody = $(e.target).parent().parent();
		const delidnum = thisdivbody.attr("id").substr(-1);
		console.log("delidnum =>"+delidnum)
		thisdivbody.remove();
		
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
	<div class="modal fade" id="writemodal" tabindex="-1"   aria-labelledby="staticBackdropLabel"  aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	  <div class="modal-dialog  modal-dialog-centered modal-dialog-scrollable" style="min-width:50% !important;max-width: 75% !important;align-items: normal !important;">
	    <div class="modal-content" style="border:none">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title" style="padding: 0 10px;font-weight: 700;font-size: 1.2rem;">결재 상신</h4>
	        <button type="button" class="btn-close" onclick="modalclose()"></button><!-- data-bs-dismiss="modal" -->
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body" style="padding: 30px;overflow: auto;">
			<form name="addFrm" enctype="multipart/form-data">
				<div class="form-group mb-3">
					<div style="display:inline-block;margin-right: 20px;">
						<span class="control-label">템플릿</span> 
						<div class="position-relative">
							<input id="template-name"style="padding-right: 14px;"type="text"  class="write-topput"  name="tempname"  readonly>
						</div>
					</div>
					<div class="form-field " style="display:inline-block;margin-right: 20px;float:right;">
						<span class="control-label">보존연한</span>
						<select name="selectTag" id="selectTag" class="mb-1 write-topput" style="display:inline-block;">
							<option value="영구" selected>영구</option>
							<option value="1">1년</option>
							<option value="3">3년</option>
							<option value="5">5년</option>
							<option value="10">10년</option>
						</select>
					</div>
					<div style="display:inline-block;">
						<span class="control-label">이름</span> 
						<div class="position-relative">
							<input style="padding-right: 14px;"type="text" id="" class="write-topput"  name="myname" value="김지은" readonly>
						</div>
					</div>
				</div>
				<hr class="HRhr mt-3 mb-3"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
				
				
				
				
				<div id="dayoffopt"style="display:none;position: fixed; left: 0px; top: 0px; transform: translate3d(348px, 272px, 0px); min-width: max-content; z-index: 1002; --radix-popper-transform-origin:0% 0px;">
						  					<div data-side="bottom" data-align="start" role="listbox" aria-orientation="vertical" data-state="open" dir="ltr" id="radix-:rap:" aria-labelledby="radix-:rao:" class="c-bWOuWO c-bWOuWO-ieTlZXA-css" tabindex="-1" data-orientation="vertical" style="outline: none; pointer-events: auto; --radix-dropdown-menu-content-transform-origin:0% 0px;">
						  					<div data-role="select-content-root">
						  					<div class="c-fkvKyD c-kvgLFJ" style="overflow: hidden scroll; max-height: 293.846px;">
						  					<div style="min-width: 100%; display: table;">
						  					<div role="group">
						  					<div class="c-fUKQMF">
						  					<div role="option" aria-checked="false" data-radix-collection-item="" class="c-gpCuAp c-hJlXvB" data-state="unchecked" tabindex="-1" data-orientation="vertical">
						  					<div style="width: 100%;">
						  					<div class="c-jYnSkl">결혼</div></div></div>
						  					<div role="option" aria-checked="false" data-radix-collection-item="" class="c-gpCuAp c-hJlXvB" data-state="unchecked" tabindex="-1" data-orientation="vertical">
						  					<div style="width: 100%;">
						  					<div class="c-jYnSkl">상병</div></div></div>
						  					<div role="option" aria-checked="false" data-radix-collection-item="" class="c-gpCuAp c-hJlXvB" data-state="unchecked" tabindex="-1" data-orientation="vertical">
						  					<div style="width: 100%;">
						  					<div class="c-jYnSkl">기타</div></div></div>
						  					</div></div></div></div></div></div></div>
						  					
				<div style="display: flex;min-height: 32px;">
						  			<div style="display: flex;align-items: center;width: 160px;height: 32px;">
						  				<span style="font-weight: 500;line-height: 18px;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;word-break: break-all;-webkit-box-orient: vertical;-webkit-line-clamp: 1;">부서</span>
						  				<div style="width: 3px;height: 3px;border-radius: 50%;background-color: #f57453;margin-left: 6px;flex-shrink: 0;"></div>
						  			</div>
						  			<div style="width: 100%;">
						  				<div>
						  					<!-- <button onclick="$('#dayoffopt').css('display','block')" type="button" id="radix-:rao:" aria-haspopup="menu" data-state="open" aria-disabled="false" class="buttonipt" aria-expanded="true" aria-controls="radix-:rap:">
						  						<div style="display: flex;align-items: center;padding: 0px;font-size: 14px;line-height: 1.5;width: 100%;">
						  							<span style="color:#8d96a1;font-weight: 500;">옵션을 선택해주세요.</span>
						  						</div>
						  					</button> -->
						  					
						  					
						  				</div>
						  			</div>
						  		</div> 		  					
				<!-- 템플릿따라 다른 내용넣기    -->

				<div id="bytemp"></div>
				
				<div id="dayoff-temp">
					<div class="form-field mb-3" style="display:inline-block;margin-right: 20px;">
						<span class="form-inputlabel">휴가종류</span>
						<select name="selectTag" id="selectTag" class="mb-1"style="padding: 10px 17px;padding-left: 10px;color: #484848;font-weight: 500;border-radius: 5px;border: 1px solid #ced4da;font-size: 10pt;" >
								<option value="연차" selected>연차</option>
							<!-- <option value="">조퇴</option>
								<option value="">지각</option> -->
								<option value="경조">경조</option>
								<option value="공가">공가</option>
								<option value="병가">병가</option>
						</select>
					</div>
					<br>
					<div class="form-group mb-3"style="display:inline-block;">
						<span class="form-inputlabel" style="z-index: 2;">기간 및 일시</span>
						<div class="search-period-wr" >
			                <div class="js-search-pickr-layer" data-code="unlimit" style="position: relative;top: -22px;">
			                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
				                	<div class="datebox margin-container">
										<span><span class="icon icon-calendar"></span><input name="startdate" id="startday"class="dateSelector attendance-dateSelector" style="padding:0px 3px 1px 15px;text-align: center;"/></span>
									</div>
								</div>
			                    <span class="dash-swung" style="position: relative;right: 1px;">~</span>
			                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box" >
				                	<div class="datebox margin-container">
										<span><span class="icon icon-calendar"></span><input name="enddate" id="endday" class="dateSelector attendance-dateSelector" style="padding:0px 3px 1px 15px;text-align: center;"/></span>
									</div>
								</div>
			                </div>
			            </div>
					</div>
					
					<div class="form-group"style="display:inline-block;position: absolute;">
						<span class="form-inputlabel">사용연차</span> 
						<div class="position-relative" style="display:inline-block;top:-1.4px">
							<input style="padding-right: 14px;width: 25%;background-color: #e9ecef;"type="text" id="use-dayoffcnt" class="form-control" value="2" readonly>
						</div>
					</div>
					<div class="form-group"style="display:inline-block;top: -21.4px;position: relative;right: -61px;top: -20.9px;">
						<span class="form-inputlabel">잔여연차</span> 
						<div class="position-relative" style="display:inline-block;top:-1.4px">
							<input style="padding-right: 14px;width: 25%;background-color: #e9ecef;"type="text" id="left-dayoffcnt" name="left-dayoffcnt" class="form-control" value="2" readonly>
						</div>
					</div>
					
					<br>
					<div class="form-group mb-3"style="display:inline-block;position: relative;">
						<span class="form-inputlabel">반차여부</span>
						<div class="custom-control custom-checkbox" style="min-height: auto;padding-bottom: 5px;display: inline-block;">
	   						
	   						<input type="checkbox" class="checkbox-disable custom-control-input" id="halfstart" name="halfstart">
	   						<label class="custom-control-label form-inputlabel" for="halfstart" style="display: inline-block;font-size: 13px;color:#418dd0">시작일</label>
							
							<span>   						
		   						<div class="condition-cell" style="display: inline-block;right: 23px;position: relative;top: 1px;">
					                <input type="radio" class="custom-control-radio2 dayradio" id="startmorning" name="startdaynight">
					                <label for="startmorning" class="js-period-type radio-label-checkbox2" data-code="unlimit">오전</label>
					                <input type="radio" class="custom-control-radio2 dayradio" id="startnoon" name="startdaynight">
					                <label for="startnoon" class="js-period-type radio-label-checkbox2" data-code="unlimit">오후</label>
								</div>
							</span>
	   					</div>
	   					
						<div class="custom-control custom-checkbox" style="min-height: auto;right: -18px; padding-bottom: 5px;display: inline-block;">
	   						<input type="checkbox" class="checkbox-disable custom-control-input" id="halfend" name="halfend">
	   						<label class="custom-control-label form-inputlabel" for="halfend"style="display: inline-block;font-size: 13px;color:#418dd0">종료일</label>
	   						
	   						<span>
		   						<div class="condition-cell" style="display: inline-block;right: 23px;position: relative;top: 1px;">
					                <input type="radio" class="custom-control-radio2 dayradio" id="endmorning" name="enddaynight">
					                <label for="endmorning" class="js-period-type radio-label-checkbox2" data-code="unlimit">오전</label>
					                <input type="radio" class="custom-control-radio2 dayradio" id="endnoon" name="enddaynight">
					                <label for="endnoon" class="js-period-type radio-label-checkbox2" data-code="unlimit">오후</label>
								</div>
							</span>
							
	   					</div>
					</div>
					
				</div>

				
				<div id="work-temp">
					<div style="display: flex;">
						<div class="form-group mb-3"style="display:inline-block;margin-right: 10px;">	
							<span class="form-inputlabel" style="z-index: 2;">시행일자</span>
							<div class="search-period-wr" >
				                <div class="js-search-pickr-layer" data-code="unlimit" style="position: relative;top: -22px;">
				                    <div class="js-date-type js-pickr-layer js-start-flatpickr filter-input-box">
					                	<div class="datebox margin-container">
											<span><span class="icon icon-calendar"></span><input class="dateSelector attendance-dateSelector" style="padding:0px 3px 1px 15px;text-align: center;"/></span>
										</div>
									</div>
				                </div>
				            </div>
						</div>
						
						<div class="form-field mb-3" style="display:inline-block;margin-right: 20px;">
							<span class="form-inputlabel">협조부서</span><!-- style="padding: 10px 17px;padding-left: 10px;color: #484848;font-weight: 500;border-radius: 5px;border: 1px solid #ced4da;font-size: 10pt;" -->
							<select name="selectTag" id="selectTag" class="mb-1 attendance-dateSelector" >
									<option value="" selected>IT</option>
								<!-- <option value="">조퇴</option>
									<option value="">지각</option> -->
									<option value="">경조</option>
									<option value="">공가</option>
									<option value="">병가</option>
							</select>
						</div>
					</div>
					
				</div>
				
				
				
					
				
				<div class="form-group">
					<span class="form-inputlabel">제목</span> 
					<div class="position-relative">
						<input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 입력해주세요" name="title" >
					</div>
				</div>
				
				<div class="form-group mt-3" >
					<span class="form-inputlabel">내용</span>
					<div class="position-relative mb-1">
					      <textarea id="content" name="content" hidden="hidden"></textarea>
					      <div id="editor"></div>
					</div>
					
					<!-- <textarea placeholder="휴가 등록 메시지 입력" id="memo" class="ant-input c-uExMz" style="height: 37px; max-height: 9.0072e+15px; resize: none;"></textarea> -->
					
				</div>
				
				<!-- 
				<div class="form-group" style="font-size: 9pt;" >
					<p> 1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.
					 2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출
					 3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
					 </p>
				</div>
				 -->
				
				
				
				<div class="form-group mt-3">
					<span class="control-label"style="margin-bottom: 0;">파일첨부</span><span style="color: #d8d8d8;font-size:9pt">파일은 하나당 최대 10MByte 까지 업로드 가능합니다. 여러개를 첨부하려면 [Shift키] 또는 [Ctrl키]를 누르고 선택해주세요</span>
					<div class="position-relative">
						<input style="font-size: 10pt;"type="file" id="file" class="form-control"  name="file" >
					</div>
				</div>
		    	
				<div class="form-group mt-3" >
					<span class="control-label"style="margin-bottom: 0;">관련문서</span>
					<div class="position-relative">
						<!-- <input type="file" id="file" class="form-control"  name="file" > -->
						<div class="text-primary cursor-pointer mt-1">+
						관련문서 첨부하기</div>
					</div>
				</div> 
		    	
		    	
		    	
		    	<div width="100%" class="sc-jIRcFI dwAYaw mt-5">
		    		<span class="control-label"style="margin-bottom: 0;">결재라인</span><button type="button" class="btn" style="display: inline-block;border-radius: 6px;font-size: 11px;height: 38px;min-width: 38px;padding: 0 14px;"onclick="showmodal_saveSignLine()"><i class="icon icon-checkmark" style="margin-right: 10px;"></i><span>저장한 결재라인 가져오기</span></button>
		    		<div class="apv-wrapper  cursor-pointer">
		    			<table class="table table-fixed my-3" onclick="showmodal_selSignMem()">
		    				<caption class="sr-only"></caption>
		    				<thead>
		    					<tr>
		    						<th class="sc-hhOBVt iIsGzI">순서</th>
		    						<th class="sc-hhOBVt iIsGzI">타입</th>
		    						<th class="sc-hhOBVt iIsGzI">결재자</th>
		    					</tr>
		    				</thead>
		    	 			<tbody>
		    				<tr class="sc-gYbzsP dvJzzI no-select">
		    					<td class="sc-cCjUiG Osauc">
		    						<div>1</div>
		    					</td>
		    					<td class="sc-cCjUiG Osauc">결재</td>
		    					<td class="sc-cCjUiG Osauc">
		    						<div class="sc-ezOQGI gBMVIv">
		    							<div class="sc-kMjNwy dqCMym">팀리더</div>
		    						</div>
		    					</td>
		    				</tr>
		    				<tr class="sc-gYbzsP bHZyYu no-select">
		    					<td class="sc-cCjUiG Osauc">
		    						<div>2</div>
		    					</td>
		    					<td class="sc-cCjUiG Osauc">합의</td>
		    					<td class="sc-cCjUiG Osauc">
		    						<div class="sc-ezOQGI gBMVIv">
		    							<div class="sc-kMjNwy dqCMym">상위 팀리더</div>
		    						</div>
		    					</td>
		    				</tr>
		    			</tbody>
		    		</table>
		    	</div>
		    	<!-- <div class="wrapper">
		    		<div>통보</div>
		    		<div class="sc-cabOPr hDNriY">
		    			<div>통보자가 없습니다.</div>
		    		</div>
		    	</div> -->
		    	<div class="wrapper">
		    		<div>참조</div>
		    		<div class="sc-cabOPr hDNriY">
		    		<div>참조자가 없습니다.</div>
		    	</div>
		    </div>
		  </div>
		    	
    		</form>
	
	      </div>
	
	
	
	      <!-- Modal footer -->
	
	      <div class="modal-footer">
			 
			<button type="button" id="approvalsave"class="workstatus-save bluebtn mr-1">저장하기</button>
		  	<button type="reset" class="workstatus-cancel mr-1"onclick="modalclose()">취소</button>
	
	      </div>
	
	
	
	    </div>
	
	  </div>
	
	</div>

  
   
   
   
   <%-- ****************** 결재선 라인 선택 모달창 시작 ********************* --%>
	
	<div class="modal fade " id="myModal_selSignMem"  tabindex="-1"aria-labelledby="staticBackdropLabel" aria-hidden="true"style="background: rgba(0, 0, 0, 0.5);display: none; z-index: 1060;">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-height: 60%;min-height: 60%;top: 15%;">
	    <div class="modal-content" style="border:none">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title" style="padding: 0 10px;font-weight: 700;font-size: 1.2rem;">승인・참조 대상</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button><!-- data-bs-dismiss="modal" -->
	      </div>
	     
	      <!-- Modal body -->
	      <div class="modal-body " style="padding: 30px;overflow: auto;">
	      	  
	      	  <div class="approvalplus">
	      	  
		      	  <div id="stepdiv1" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
		      	  	<div style="margin-top: 0;">
			      	  	<span  id="stepspan1" class="spanbox" style="font-weight: bold;display: block;">1단계</span>
						<button type="button" class="btn-close step-del" aria-label="close" onclick="del_stepapproval(event)" style="float: right;"></button>      	  	
		      	  	</div>
		      	  	
		      	  	<!-- iframe 선택된 멤버 보여주기  -->
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
	      	  	</button>
	      	  	<!-- <button type="button" class="mt-1 attendance-dateSelector" style="border-color:white; background-color: white;display: block;width: 100%;">
	      	  		<span class="ant-typography c-iuedIb" style="color: rgb(82 82 82);" >
	      	  			<span data-lokalise="true" style="font-size: 10pt;" ><i class="icon icon-upload" style="margin-right: 10px;"></i> 결재선 불러오기</span>
	      	  		</span>
	      	  	</button> -->
	      	  	
            </div>

             <div class="modal-footer">
              <a  style="float: left;cursor:pointer;color:white;"class="btn bluebtn" onclick="showmodal_mySignMade()">개인결재선저장하기</a> 
              <!-- <a href="#" data-bs-dismiss="modal" class="btn">취소</a>  -->
              <a  class="btn" style="cursor:pointer;color:rgb(0 101 204)">확인</a>
            </div> 
          </div>
        </div>
    </div>
    

  
   
   
   
   <%-- ****************** 저장한 승인라인 모달창 시작 ********************* --%>
	
	<div class="modal fade " id="myModal_saveSignLine"  tabindex="-1"aria-labelledby="staticBackdropLabel" aria-hidden="true"style="background: rgba(0, 0, 0, 0.5);display: none; z-index: 1060;">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-height: 60%;min-height: 60%;top: 15%;">
	    <div class="modal-content" style="border:none">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title" style="padding: 0 10px;font-weight: 700;font-size: 1.2rem;">저장한 결재라인</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button><!-- data-bs-dismiss="modal" -->
	      </div>
	     
	      <!-- Modal body -->
	      <div class="modal-body " style="padding: 30px;overflow: auto;">
	      	  
	      	  <div class="approvalplus">
	      	  
		      	  <div id="stepdiv1" name="approvalstep" class="divbox dayoff-box timeoff mb-2" style="border: solid 1px rgb(0 0 0 / 7%);height: auto;display: block;">
		      	  	<div style="margin-top: 0;">
			      	  	<span  id="stepspan1" class="spanbox" style="font-weight: bold;display: block;">1단계</span>
						      	  	
		      	  	</div>
		      	  	
		      	  	<!-- iframe 선택된 멤버 보여주기  -->
		      	  	<div id="memcontent-iframe1"></div>

		      	  	<button id="1" type="button" class="attendance-dateSelector" style="background-color: white;display: block;" onClick="optionForm('OPEN',event)">
		      	  		<span style="color: rgba(36, 42, 48, 0.48);">
		      	  			<span style="font-size: 10pt;text-align: left;" >대상 검색</span>
		      	  		</span>
		      	  	</button>
		      	  </div>
		      	  
	      	  	</div>
	      	  
	      	  
	      	  	
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
			
			<div class="form-group">
				<span class="form-inputlabel">결재선 이름</span> 
				<div class="position-relative">
					<input type="text" id="title" class="form-control" title="" placeholder="" name="title" value="">
				</div>
			</div>

		 </div>
             <div class="modal-footer">
              <a data-bs-dismiss="modal" class="btn" style="cursor:pointer;">취소</a>
              <a class="btn" style="cursor:pointer;color:rgb(0 101 204)">확인</a>
            </div> 
          </div>
        </div>
    </div>
	
	
	
	<%-- ****************** 결재선 멤버리스트 시작 ********************* --%>
	<div id="option" class="option">
	   <!-- <div style="font-size: 11pt; color: #595959; font-weight: bold; padding-bottom: 20px;">검색 옵션</div> -->
	   <div id="mwa-container" style="height: 271px;">
			<iframe id="mwa" name="selmemiframe"style="border: none; width: 100%;height: 280px;" src="<%= request.getContextPath()%>/approval/memberList.up"></iframe>
		</div>
		
        <div class="modal-footer">
         <a style="cursor:pointer;"class="btn" onclick="optionForm('CLOSE')">닫기</a>
         <a style="cursor:pointer;"class="btn btn-primary">Save</a> 
       </div> 
	</div>
	
	
