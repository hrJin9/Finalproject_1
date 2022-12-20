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
	/* 
	.header-main {
	    font-weight: 700 !important;
	    padding: 0.9em 0 0.3em 0 !important;
	    font-size: 20pt !important;
	} */
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
		width: 14%;
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
	    width: 11%;
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
		color: #0775ff;
		padding:0 auto;
		font-size: 11pt;
		position: relative;
	}
	.icon-star-empty{
		color:#bfbfbf;
		padding:0 auto;
		font-size: 11pt;
		position: relative;
	}
	a.icon-star-empty:hover, a.icon-star-full:hover {
		color: #0775ff;
	}
	a, a:hover {
    	text-decoration: none !important;
	}
	#tabledata tr td:hover{
		cursor: pointer; 
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
	#writebtn{
	font-size: 12pt;
    padding: 0px 34px 1px 26px;
    font-weight: 700;
    border-radius: 8px;
    display: flex;
    align-items: center;
    color: rgb(7 122 180);
    background-color: white;
    /* background-image: linear-gradient(96.77deg, rgb(0 128 204) -0.96%, rgb(18, 194, 205) 100%); */
    box-shadow: rgb(0 0 0 / 2%) 0px 2px 6px, rgb(0 0 0 / 6%) 0px -1px 0px inset, rgb(0 0 0 / 8%) 0px 0px 0px 1px inset;
		/* border-color: rgb(176 176 176); */
	}
	
	
	
	
	.flatpickr-month
	.flatpickr-monthDropdown-months
	.flatpickr-weekdays
	.flatpickr-weekday{
		background: #ffffff !important;
		color: #3a3a3a !important;
	}
	.toggleSwitch {
	width: 35px;
  height: 20px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 10px 2px rgb(0 0 0 / 11%);
  cursor: pointer;
  margin: 15px;
}

.toggleSwitch .toggleButton {
  width: 13px;
  height: 13px;
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
  left: calc(100% - 19px);
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
       padding: 20px 40px 0px;
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
font-weight: 700;
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
margin-top: 10px;
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
border-color: rgba(36, 42, 48, 0.04);"
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
</style>
<script>
	$(document).ready(function(){
		
		
	});
</script>
<nav id="mainList" class="margin-container header-nav">
	<a class="header-main list_notcurrent" id="send" href="<%= request.getContextPath()%>/approval.up">상신함</a>
	<a class="header-main list_iscurrent" id="requested" href="<%= request.getContextPath()%>/approval/requested.up">수신함</a>
</nav>


 <div style="display: inline-block;position: relative;float: right;right: 90px;top: -49px;">
  	<a href="<%= request.getContextPath()%>/approval/writing.up" id="writebtn"class="btn"><span style="margin-top: -7px;font-weight: 100;margin-right: 5px;font-size: 24pt;display: flex;align-items: center;">+</span>작성하기</a>
</div>

 
