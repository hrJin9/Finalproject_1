<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

<!-- 텍스트에디터 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<style type="text/css">
	
	#mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	#subList a:hover{
		background-color: rgba(200,200,200, .2);
		cursor: pointer;
		color: #4d4f53;
	}
		
	#mainList {
		position: relative;
	    display: flex;
	    width: 640px;
	    font-size: 18pt;
	}
	
	.header-main {
	    font-weight: 800 !important;
	    padding: 0.9em 0 0.3em 0 !important;
	    font-size: 18pt !important;
	}
	#mainList a {
		display: block;
    	width: 17%;
    	text-align: center;
		text-decoration: none;
		margin-right: 4%;
	}
	
	.list_iscurrent{
		color: #4d4f53;
	}
	.list_notcurrent{
		color: #D2D6D9;
	}
	
	#subList{
		position: relative;
		display: flex;
		width: 640px;
		font-size: 11pt;
		font-weight: bold;
		/* margin: 4px 0 0 60px; */
	}
	
	#subList a {
		display: block;
		width: 10%;
		padding: .9em 0;
		/* color: #333; */
		text-align: center;
		text-decoration: none;
		/* color: #D2D6D9; */
		border-radius: 12px;
	}
	
	.subList_underline {
	    position: absolute;
	    left: 2%;
	    bottom: -1px;
	    width: 10%;
	    height: 2px;
	    background: #333;
	    transition: all .3s ease-in-out;
	    margin-right: 5%;
	}
	#subList {
	    position: relative;
	    display: flex;
	    width: 640px;
	    font-size: 11pt;
	    font-weight: bold;
	}
	#subList a:nth-child(1).iscurrent ~ .subList_underline {
		left: 0%;
	}
	#subList a:nth-child(2).iscurrent ~ .subList_underline {
		left: 10.5%; /* width랑 margin-left랑 합친거 */
	}
	.newbadge{
	  background-color: #dc3545;
	  width: 12px;
	  height: 12px;
	  display:inline-block;
	  border-radius: 4px;
	  position: relative;
	  left:10px; 
	  color:white;
	  font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center;
	  position: relative;
	  top: 3px;
	  margin-right: 14px;
	}
	.titlefirst{
		font-weight: 800;
		font-size:11.5pt;
		padding-top:5px;
		/* padding-bottom: 9px; */
	}
	.categorybadge{
	  background-color: #30353f;
	  padding: 1px 15px;
	  padding-top:3px;
	  font-size:7pt;
	  font-weight:bold;
	  width: auto;
	  height: 21px;
	  display:inline-block;
	  border-radius: 10px;
	  position: relative;
	  margin-right: 5px;
	  top: 0.5px;
	  /* top:-2px;
	  left:10px; */ 
	  color:white;
	  /* font-size:0.2rem;
	  font-weight:bold; 
	  text-align: center; */
	}
	.teamname{
	  color:#6d7077;
	  font-weight:bold;
	  position: relative;
	  top:2px;
	  margin-right: 15px;
	  margin-left: 6px;
	}
	.writedate{
	  position: relative;
	  top:2px;
	  color:#bfbfbf;
	}
	.icon-star-full{
		color:#ffc107;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
	}
	.icon-star-empty{
		color:#bfbfbf;
		padding:0 auto;
		font-size: 15pt;
		position: relative;
	}
	a.icon-star-empty:hover, a.icon-star-full:hover {
		color: #ffc107;
	}
	a, a:hover {
    	text-decoration: none !important;
	}
	
	a.icon-star-empty:hover {
		color: #ffc107;
    }
	.title:hover{
		cursor: pointer; 
		text-decoration: underline;
	}
	img.approvalprofile{
		border: 0px;
		border-radius: 17.5px;
		background-color: #D2D6D9;
	}
	select {
    word-wrap: normal;
	}
	
	button, select {
	    text-transform: none;
	}
	.toastui-editor-defaultUI-toolbar {
		background-color: #ffffff;
	}
	div.toastui-editor-mode-switch{
		display: none !important;
	}
	.toastui-editor-defaultUI {
		width: 95%;
	    float: right;
    }
   .custom-control-input:checked~.custom-control-label::before {
	    color: #fff;
	    border-color: #007bff;
	    background-color: #007bff;
	}
	.custom-checkbox .custom-control-label::before {
	    border-radius: 0.25rem;
	}
	.custom-control-label::before, .custom-file-label, .custom-select {
    	transition: background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.custom-control-label::before {
	    position: absolute;
	    top: 0.25rem;
	    left: -1.5rem;
	    display: block;
	    width: 1rem;
	    height: 1rem;
	    pointer-events: none;
	    content: "";
	    background-color: #fff;
	    border: #adb5bd solid 1px;
	}
	.custom-checkbox .custom-control-input:checked~.custom-control-label::after {
    	background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath fill='%23fff' d='M6.564.75l-3.59 3.612-1.538-1.55L0 4.26l2.974 2.99L8 2.193z'/%3e%3c/svg%3e");
	}
	.custom-control-label::after {
	    position: absolute;
	    top: 0.25rem;
	    left: -1.5rem;
	    display: block;
	    width: 1rem;
	    height: 1rem;
	    content: "";
	    background: 50%/50% 50% no-repeat;
	}
	.custom-control-input {
	    position: absolute;
	    left: 0;
	    z-index: -1;
	    width: 1rem;
	    height: 1.25rem;
	    opacity: 0;
	}
	.custom-control {
	    position: relative;
	    z-index: 1;
	    display: block;
	    min-height: 1.5rem;
	    padding-left: 1.5rem;
	    -webkit-print-color-adjust: exact;
	    color-adjust: exact;
	}
	.custom-control-label {
	    position: relative;
	    margin-bottom: 0;
	    vertical-align: top;
	}
	#prevList:hover {
	    color: #000000;
	    cursor: pointer;
	}
	#prevList{
	    display: block;
	    text-align: center;
	    text-decoration: none;
	    margin-right: 4%;
	    font-weight: 800 !important;
    	padding: 0.9em 0 0.3em 0 !important;
    	font-size: 18pt !important;
    	width: 0 !important;
	}
	
	
	
	
	
		.flatpickr-month
	.flatpickr-monthDropdown-months
	.flatpickr-weekdays
	.flatpickr-weekday{
		background: #ffffff !important;
		color: #3a3a3a !important;
	}
.toggleSwitch {
  width: 30px;
  height: 15px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 10px 2px rgb(0 0 0 / 11%);
  cursor: pointer;
  margin: 15px;
}

.toggleSwitch .toggleButton {
  width: 10px;
  height: 10px;
  position: absolute;
  top: 50%;
  left: 4px;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #0775ff;
}

#toggle:checked ~ .toggleSwitch {
  background: #0775ff;
}

#toggle:checked ~ .toggleSwitch .toggleButton {
  left: calc(100% - 14px);
  background: #fff;
}

.toggleSwitch, .toggleButton {
  transition: all 0.2s ease-in;
}


.pad-part {
    padding: 40px;
    color: rgb(17, 17, 17);
}
.ApvHeader-title {
    font-size: 28px;
    font-weight: 700;
    color:#3c4651;
    border: none;
    width:80%;
}
.StyledApv {
    margin-top: 15px;
}
.ApvDl-item {
    display: flex;
    padding: 3px 0px;
    color:rgb(85, 99, 114);
    font-weight: 350;
}
.ApvDl-dt {
    display: inline-block;
    min-width: calc(var(--max-length-title) * 1em);
    padding-right: 10px;
}
.ft-16 {
    font-size: 14px;
}
.ApvDl-dd {
    max-width: calc((100 - var(--max-length-title)) * 1%);
    white-space: pre-line;
}

.ApvHeader-footer {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
}
.ApvSection-header {
    /* position: sticky; */
    top: 76px;
    z-index: 1;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    padding-top: 10px;
    padding-bottom: 10px;
    background-color: transparent;
}
.ApvSection-body {
    margin-top: 14px;
}
.ApvSection-title {
        font-size: 15px;
    font-weight: 500;
    color: #787878;
}
.cstQxy {
   padding: 10px 40px 20px 40px;
   /* background-color: rgb(244, 245, 246); */
   color: rgb(17, 17, 17);
}
  .head-btnsection{
   padding: 20px 40px;
   background-color: white;
   color: rgb(17, 17, 17);
   position: sticky;
   top: 0px;
   z-index: 2;
  }
  .Apv-button.is-neutral {
    border-color: rgb(153, 153, 153);
}
.Apv-button {
    color: inherit;
    background: none;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    height: 36px;
    padding: 8px 12px;
    border-radius: 4px;
    border: 1px solid;
    font-size: 13px;
    cursor: pointer;
}
.statebadge{
	margin-top: 3px;
	cursor: default;
	font-weight: bold !important;
	border-radius: 1.2em;
	font-size: .675rem;
	padding: 0.15rem 0.5rem;
}
.approvebtn{
outline: none;border: none;
border-radius: 8px;
font-size: 14px;
display: inline-flex;
align-items: center;
justify-content: center;
font-weight: 600;
padding-left: 14px;
padding-right: 14px;
height: 48px;
background-color: rgba(85, 99, 114, 0.07);
position: relative;
cursor: pointer;
width: 100%;
color: rgb(60, 70, 81);

}
.signol{
align-items: flex-start;
list-style: none;
padding-inline-start: 0px;
display: flex;
flex-wrap: nowrap;
justify-content: flex-start;
flex-direction: column;
}
.signli{
align-items: flex-start;
display: flex;
position: relative;
width: 100%;
padding-top: 4px;
flex-direction: column;
}
.signli-prof{
width: 100%;
display: flex;
flex-direction: column;
align-items: stretch;
}
.signdiv-prof{
display: flex;
align-items: center;
justify-content: space-between;
gap: 8px;
padding: 6px;
}
.signul{
padding: 0;
justify-content: flex-start;
flex-direction: column;
align-items: flex-start;
display: flex;
width: 100%;
/* margin-top: 10px; */
}
.signheader{
height: 26px;
display: flex;
align-items: center;
width: 100%;
padding-left: 8px;
padding-right: 8px;
}
.signspan{
flex-shrink: 0;
margin-right: 10px;
font-size: 14px;
font-weight: 600;
}
.separator{
border-style: solid;
border-width: 0px;
width: 100%;
border-top-width: 1px;
border-color: rgba(36, 42, 48, 0.04);
margin-right: 10px;
}
/* #writemodal{
	top: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    border-radius: 16px;
    box-shadow: var(--shadows-modal);
    display: flex;
    z-index: var(--zIndices-LINEAR_MODAL);
    position: fixed;
    left: 50%;
} */
#footercss{
	display: flex;
	justify-content: flex-start;
	flex-direction: row;
	align-items: center;
	width:100%
}
#btnsection button{
	padding: .175rem .45rem !important;
}

/* ===  옵션창  === */
div.option {
    /* border: 0px solid #b0b0b0d9;
    padding: 20px;
    margin-bottom: 22px;
    width: 600px;  
    height: auto; 
    border-radius: 10px;
    background-color: white;
    display: inline-block;
    font-size: 18pt;
    box-shadow: 0.5px 0.5px 14px 0.5px rgb(0 0 0 / 20%);
    position: absolute;
    top: 28.5%;
    left: 55.5%;
    z-index: 2;
    overflow:hidden; */
    display: none;
    border: 0px solid #b0b0b0d9;
    padding: 20px;
    border-radius: 10px;
    background-color: white;
    font-size: 18pt;
    box-shadow: 0.5px 0.5px 14px 0.5px rgb(0 0 0 / 20%);
    /* width: 459px; */
    height: auto;
    position: fixed;
    max-width: 40%;
    height: auto;
    position: fixed;
    min-width: 30%;
    z-index: 3000;
    top: 30%;
    left: 50.5%;
 } 
aside{
   -ms-overflow-style: none;
}
aside::-webkit-scrollbar{
  display:none;
}
.detail-search-conditions {
  margin: 10px 20px 0 30px;
}
.condition-cell.title {
    width: 100px;
    height: 43px;
    /* padding-top: 14px; */
    border: 0;
    font-size: 13px;
    font-weight: 500;
    color: #333;
    box-sizing: border-box;
}
.condition-cell {
    display: table-cell;
}
.js-register-name-search-filter .condition-cell:last-child {
    width: 80%;
}
.target-select-group {
    margin: 16px 18px 12px 10px;
    font-size: 10px;
    color: #555;
}
.target-select-group li {
    float: left;
    min-width: 122px;
    height: 28px;
}
/* 검색기간 라디오 체크*/
.radio-label-checkbox {
    position: relative;
    cursor: pointer;
    left: -23px;
}
.label-checkbox {
    position: relative;
    cursor: pointer;
    left: 4px;
    font-size: 11.5px;
    top:-1px
}
.target-select-group .radio-label-checkbox::before {
    margin-right: 12px;
}
.radio-label-checkbox::before {
    display: inline-block;
    content: "";
    background: url(/flow-renewal/assets/images/allseach-sprite-type-4.png) no-repeat -96px 0;
    background-size: 560px auto;
    width: 14px;
    height: 14px;
    vertical-align: middle;
}
ul{
	padding-left: 0;
	list-style: none;
	margin-bottom: 3rem;
}
/* 검색기간 라디오 라벨*/
.custom-control-radio {
    position: relative;
    left: -5px;
    top: 3px;
    z-index: -1;
 }
 .radio-label-checkbox::before {
    display: inline-block;
    content: "";
    background: url(/flow-renewal/assets/images/allseach-sprite-type-4.png) no-repeat -96px 0;
    background-size: 560px auto;
    width: 14px;
    height: 14px;
    vertical-align: middle;
}
 li{
 	font-size: 10pt;
 }
  
 /* 날짜 옵션 */
.search-period-wr .filter-input-box {
    overflow: hidden;
    display: inline-block;
    margin: 10px 0 0 0;
    /* padding: 7px 44px 0 10px; */
    height: 32px;
    width: auto;
}
.filter-input-box {
    position: relative;
    height: 40px;
    margin-top: 10px;
    padding: 10px 15px 10px 15px;
    background: #fff;
    /* border: 1px solid #ddd; */
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-border-radius: 4px;
    /* border-radius: 4px; */
    width: 100%;
    font-size: 13px;
}
div.datebox > span > input {
    bottom: 3px !important;
    top: -10px !important;
}    
.attendance-dateSelector {
    height: 30px;
    display: inline-block;
    border: solid 0px rgba(0, 0, 0, .1);
    margin: 0;
    padding: 7px 20px 7px 20px;
	border-radius: 7px;
}
.plusstepbox {
	width:100%;
    height: 40px;
    display: inline-block;
    border: solid 1px rgba(0, 0, 0, .1);
    margin: 0;
    padding: 7px 20px 7px 20px;
	border-radius: 7px;
	font-weight: 500;
}
.iptlabel{
	color:rgba(36, 42, 48, 0.64);
	font-size: 14px;
	font-weight: 500;
	line-height: 18px;
	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	word-break: break-all;
	margin-left: 10px;
}
.search-period-wr .filter-date-label {
    right: 10px;
}
.filter-date-label {
    position: absolute;
    top: 50%;
    right: 20px;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
    cursor: pointer;
} 

/* 카테고리박스 */
#categorydiv{
	position:absolute;
	visibility:hidden;
	font-size:12px;
	background-color: white;
	width:25%;
	z-index: 2;
	border: 1px solid gainsboro;
    padding: 12px;
    border-radius: 5px;
}
/* #option {
	visibility:hidden;
} */
hr {
    margin: 0 !important;
}
td.title #writername{
	font-size: 15px;
    font-weight: 600;
    line-height: 1.4;
    display: inline-block;
    color: rgb(36, 42, 48);
}
td.title #writerday{
	display: inline-block;
    margin-left: 10px;
    color: #bababa;
    font-weight: 400;
    line-height: 10px;
}
td.title #writertitle{
	margin: 0px;
    line-height: 10px;
    display: block;
    margin-bottom: 10px;
    color: rgb(85, 99, 114);
    margin-top: -5px;
    font-weight: 400;
}
.headersearch{
	height: 32px;
    margin-right: 5px;
	color: rgb(85, 99, 114);
    cursor: pointer;
    width: 32px;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    border-radius: 6px;
}
.dropdown-divider{
	height: 0;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border-top: 1px solid #e9ecef;
}

.dropdown-item {
	font-weight: 500 !important;
}
.dropselchx{
    color: rgb(41 170 236) !important;
    font-size: 9pt;
    float: right;
    margin-top: 2px;
}
#mainList .list_notcurrent{
	color: #D2D6D9 !important;
}


/* 상태뱃지  */
.btn-badge{
    font-weight: 500 !important;
    font-size: 10pt;
    padding: 0.2rem 0.7rem !important;
    font-size: .675rem !important;
    cursor: default !important;
    /* border-radius: 1.3em; */
    margin-top: 12px;
    background-image: linear-gradient(96.77deg, rgb(157, 60, 255) -0.96%, rgb(96, 102, 255) 100%);
    color: white;
    border-radius: 1em;
}



.write-textarea{
	width: 80%;
    min-height: 32px;
    display: flex;
    align-items: center;
    background: white;
    box-shadow: none;
    padding:5.5px 15px;
    font-weight: 500;
    line-height: 21px;
    font-size: 13px;
    border-radius: 6px;
    white-space: pre-line;
    resize: none;
    color: #242a30;
    border: none;
    margin: 0px;
}
.buttonipt{
	width: 100%;
    min-height: 32px;
    display: flex;
    align-items: center;
    background: white;
    box-shadow: none;
    position: relative;
    cursor: pointer;
    padding-left: 12px;
    padding-right: 12px;
    border: none;
    text-align: initial;
}
.buttonipt::before{
	content: "";
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    background-color: rgb(36, 42, 48);
    border-radius: inherit;
    opacity: 0;
    transition: all 0.15s ease 0s;
    pointer-events: none;
}
.c-gpCuAp {
    display: flex;
    align-items: flex-start;
    color: #3c4651;
    padding: 0px 8px;
    margin: 0px 6px;
    position: relative;
    user-select: none;
}
.c-jYnSkl {
    color: inherit;
    font-weight: 600;
    height: 32px;
    width: 100%;
    display: flex;
    align-items: center;
}
.c-gpCuAp::before {
    content: "";
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    background-color: rgb(36, 42, 48);
    border-radius: inherit;
    opacity: 0;
    transition: all 0.15s ease 0s;
    pointer-events: none;
}
.c-gpCuAp {
    font-size: 14px;
    border-radius: 6px;
    position: relative;
    cursor: pointer;
}

.selmembtn{
	border: none;
	 height: 50% !important;
	 background-color: transparent;
	display: block;
}
.selmembtn:hover{
	background-color: #ebebeb;
}
.signul{
	margin-bottom: 0 !important;
}
.my > .role{
    font-weight: 400 !important;
    font-size: 8pt !important;
    top: 5px !important;
}
.my > .name{
	font-size: 10pt !important;
    font-weight: 500 !important;
    top: 4px !important;
}
.positionIcon{
	display: none;
}
.plusmembtn, .delboxbtn{
	width: 24px;
    height: 24px;
    font-size: 12px;
    border-radius: 5px;
    background-color: white;
    box-shadow: rgb(0 0 0 / 2%) 0px 2px 6px, rgb(0 0 0 / 6%) 0px -1px 0px inset, rgb(0 0 0 / 8%) 0px 0px 0px 1px inset;
    position: relative;
    cursor: pointer;
    outline: none;
    border: none;
    align-items: center;
    justify-content: center;
    font-weight: 700;
}
.stepbtn, .plusmembtn{
   	display: inline-flex;
}
.delboxbtn{
   	display: none;
   	margin-right: 5px;
}
.delboxbtn :hover{
	background-color :rgba(244, 71, 18, 0.07);
}


.selectedmem:hover{
	background-color:#f6f6f6;
}


.modal-body{
   -ms-overflow-style: none;
}
.modal-body::-webkit-scrollbar{
  display:none;
}



</style>
<script>
	$(document).ready(function(){
		
		$("a.mainlist").click(function(){
			if($(this).hasClass('list_iscurrent') != true){// 현재 페이지가아닐경우 
				$(this).removeClass('list_notcurrent');
				$(this).addClass('list_iscurrent');
				$(this).siblings().removeClass('list_iscurrent');
			}
		});
	});
</script>
<nav id="mainList" class="margin-container header-nav">
	<a id="prevList" class="list_iscurrent" href="<%= request.getContextPath()%>/approval.up">〈 </a>
	<a class="header-nonsub list_iscurrent" id="notice" href="#">작성하기</a>
</nav>


<hr class="HRhr" style="margin-top: 0px;"/>