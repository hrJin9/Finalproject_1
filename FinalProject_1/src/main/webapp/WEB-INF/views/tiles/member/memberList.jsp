<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %> 
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/fonts/icomoon/style.css">

<style type="text/css">
		
	#memberInfo_mainList {
		position: relative;
	    display: flex;
	    width: 11%;
	    font-size: 18pt;
	    font-weight: bold;
	    margin: 4px 0 0 70px;
	    padding: 0.8em 0 0.8em 0;
	    color: #333;
	}

	hr.memberInfohr{
		width: 100%;
		background-color: rgba(0,0,0, .3) !important;
		border: none; 
		height: 1px;
		margin-top: 0px;
	}
	
	#searchCondition {
	    display: block;
	    width: 100%;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #212529;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: 0.25rem;
	}

	.form-control{
		font-size: 12pt;
	}
	.row >*{
		width: auto;
		padding: 0;
	}
	
	.arrayIcon, .groupIcon {
		border: 1px solid #f7f7f7;
		padding: 15px;
		margin-bottom: 20px;
		margin-right: 10px;
		width: 18px;  
		height: 18px; 
		border-radius: 10px;
		float: left;
		
		display: block; 
		position: relative; 
		font-size: 9pt; 
		background-color: #f7f7f7;
	} 
	
	.positionIcon {
		border: 1px solid #f7f7f7;
	    margin-left: 25px;
	    padding: 9px 23px 9px 0;
	    margin-top: 5px;
	    text-align: right;
	    width: 163px;
	    height: 38px;
	    border-radius: 10px;
	    float: left;
	    font-size: 9.5pt;
	    background-color: #f7f7f7;
	} 

	/* 구성원 테이블 */
	.custom-table {
		thead {
			tr, th {
				border-top: none;
				border-bottom: none!important;
			}
		}
		tbody {
			th, td {
				color: #777;
			}
		}
	}
	
	.table>:not(caption)>*>* {
	    padding: 0.7srem 0.5rem;
	    background-color: var(--bs-table-bg);
	    border-bottom-width: 1px;
	    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
	}
	
	.contentsmargin {
		margin: 0 80px;
	}
	
	.chkboxpnum {
	    margin: 15px;
	}
	
	.profile{
     color: inherit;
     border-radius: 8px;
     position: relative;
     cursor: pointer;
     padding: 1px 13px;
     text-align: initial;
     display: flex;
   }
	
	#message {
	    border: 0.3px solid #d9d9d9;
	    margin-top: 15px;
	    margin-right: 84px;
	    margin-left: 11px;
	    padding: 3.5px 6.5px 3.5px 6.5px;
	    background-color: white;
	    border-radius: 3px;
	    font-size: 10pt;
	}	
	
	/* 	.table td{
		font-size: 10pt;
	    border-bottom: 1px solid #eef2f6;
	    padding-left: 22px;
	} */
	
	.table {
	    color: #4c4e54;
	}
	table tr:hover {
		background-color: #f4f8f9;
	}


	/* 조직도 */
	.menu {
		position: absolute;
        top: 45px;
	    right: 0;
	    height: 100vh;
	    max-width: 0;
	    z-index: 1;
	    background-color: white;
	    border: none;
	}
	
	.burger-icon {
	    cursor: pointer;
	    display: inline-block;
	    position: absolute;
	    z-index: 2;
	    padding: 8px 0px;
	    top: 5px;
	    right: 6px;
	    user-select: none;
	    width: auto;
	    margin: 0;
	}
	
	.burger-icon .burger-sticks {
	  background: #333;
	  display: block;
	  height: 2px;
	  position: relative;
	  transition: background .2s ease-out;
	  width: 18px;
	}
	
	.burger-icon .burger-sticks:before,
	.burger-icon .burger-sticks:after {
	  background: #333;
	  content: '';
	  display: block;
	  height: 100%;
	  position: absolute;
	  transition: all .2s ease-out;
	  width: 100%;
	}
	
	.burger-icon .burger-sticks:before {
	  top: 5px;
	}
	
	.burger-icon .burger-sticks:after {
	  top: -5px;
	}
	
	.burger-check {
	  display: none;
	}
	
	.burger-check:checked~.menu {
	    max-width: 325px;
	    border: 1px solid #eeeeee;
	}
	
	.burger-check:checked~.burger-icon .burger-sticks {
	  background: transparent;
	}
	
	.burger-check:checked~.burger-icon .burger-sticks:before {
	  transform: rotate(-45deg);
	}
	
	.burger-check:checked~.burger-icon .burger-sticks:after {
	  transform: rotate(45deg);
	}
	
	.burger-check:checked~.burger-icon:not(.steps) .burger-sticks:before,
	.burger-check:checked~.burger-icon:not(.steps) .burger-sticks:after {
	  top: 0;
	}
	
	.table>:not(:first-child){
		border-top: solid 1px #eeeeee !important;
	}
	
	.orgmenu {
		cursor: pointer;
		text-decoration: none;
		list-style: none;
		color: #556372;
	    font-size: 10.5pt;
    	/* line-height: 2px; */
	}
	
	li {
		line-height: 24.2px;
	}
	
	li::marker {
	    color: #cccccc;
	    font-size: 12pt;
	}
	
	.summary {
		padding-bottom: 8px; 
		/* font-weight: bold;  */
		font-size: 11pt;
		color: #4C4E54;
	}
	
	.unfold {
		padding-top: 10px;
		font-weight: bold;
		font-size: 10pt;
		color: #4c4e54;
		position: relative;
	}
	
	#cntbadge{
	    background-color: #e6e6e6;
	    padding: 0.5em 0.5em;
	    width: 12.5px;
	    height: 15px;
	    font-weight: 600;
	    color: #fbfbfb;
	    display: inline-block;
	    border-radius: 0.25rem;
	    box-shadow: inset 0px 0px 0px 1px rgb(0 0 0 / 4%);
	    position: relative;
	    top: 9.3px;
	    left: 5px;
	}
	  #newCnt{
	    font-size: 5pt;
	    color: #4C4E54;
	    position: relative;
	    top: -10px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-shrink: 0;
	    isolation: isolate;
   }
   
   .unfoldAlert {
   		border: 1px solid #f7f7f7;
	    padding: 6.3px;
	    text-align: center;
	    width: 106px;
	    height: 30px;
	    border-radius: 8px;
	    background-color: #4d4d4d;
	    color: #f2f2f2;
	    font-size: 8.5pt;
	    position: relative;
	    top: 1.3px;
	    left: 194px;
   }
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 모든 체크박스가 체크가 되었다가 그 중 하나만 이라도 체크를 해제하면 전체선택 체크박스에도 체크를 해제하도록 한다.
		$(".chkboxpnum").click(function(){
		      
		   var bFlag = false;
		   $(".chkboxpnum").each(function(){
		      var bChecked = $(this).prop("checked"); // 체크된 체크박스
		      if(!bChecked) { // 체크된 것이 아니라면
		         $("#memberAll").prop("checked",false);
		         bFlag = true;
		         return false;
		      }
		   });
		   
		   if(!bFlag) {
		      $("#memberAll").prop("checked",true);
		   }
		   
		});
	      
		// 찜목록 전체개수 값
		const allCnt = $("input:checkbox[name='pnum']").length;  // 체크여부 상관없는 모든 체크박스개수
		document.getElementById("memberCnt").textContent = allCnt;
	      
		// 프로필 클릭시 구성원 상세정보 보기로 이동
		$(".profile").click(function(){
			location.href= "<%= ctxPath%>/memberInfo_hr.up";
		});
		
		// 메뉴창 커질때 컨텐트 내용물 사이즈 줄어들게 하기
		$("input#burger-check").change(function(){
		    if($("#burger-check").is(":checked")){
		        $(".big").css({'width':'84.48%'});
		        $(".menucontent").css({'visibility':'visible'});
		    }else{
		        $(".big").css({'width':'100%'});
		        $(".menucontent").css({'visibility':'hidden'});
		    }
		});  
		
		// 모든 조직 펼치기
		$(".unfold").click(function(){  // 조직도 확대 아이콘 클릭시
			$(".summary").click();      // 모든 조직의 summary 클릭
		});
		
		/* $(".unfold").hover(function(){
	      	$(".unfoldAlert").css('display':'block');
		});
		$(".unfold").unhover(function(){
	      	$(".unfoldAlert").css('display':'none');
		}); */
			 
			
	});// end of$(document).ready(function(){})--------------------------
	   
	      
	   // Function declaration
	   // 전체선택 체크박스 클릭시
	   function allCheckBox() {
	   
	      var bool = $("#memberAll").is(":checked");
	      /*
	         $("#memberAll").is(":checked"); 은
	           선택자 $("#memberAll") 이 체크되어지면 true를 나타내고,
	           선택자 $("#memberAll") 이 체크가 해제되어지면 false를 나타내어주는 것이다.
	      */
	      
	      $(".chkboxpnum").prop("checked", bool);  // 전체선택 체크박스 체크여부에 따라 개별 선택박스 모두 체크 or 모두 해제
	   }// end of function allCheckBox()-------------------------

</script>

<div class="container">
	<div id="memberInfo_mainList" class="header-nav">구성원</div>
	<hr class="memberInfohr" /><br>
	
	<div class="contentsmargin">
		<form action="#" class="booking-form ml-3" style="float: right;">
			<div class="row" style="padding-top: 11px;">
			
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="font-size: 9pt; padding:6.7px 12px;">
								<option value="">이름</option>
								<option value="">소속</option>
								<option value="">직무</option>
								<option value="">직위</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: -9px;">
							<input type="text" class="form-control" placeholder="검색" style="width:90%; font-size: 9pt; padding:6px 12px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 16%;"></a>
					</div>
				</div>
				<div>
					<span class="arrayIcon">
						<span><ion-icon name="swap-vertical-outline" style="position: absolute; left: 7px; bottom:7px; font-size: 12pt;"></ion-icon></span>
		            </span>
				</div>
				<div>
					<span class="groupIcon">
						<input class="burger-check" type="checkbox" id="burger-check" />
						<label class="burger-icon" for="burger-check"><span class="burger-sticks"></span></label>
						<div class="menu">
							<div class="menucontent" style="width: 340px; visibility: hidden; padding: 27px 0px 10px 38px;">
								<div style="font-size: 12pt; font-weight: bold; color: #4C4E54; padding-bottom: 27px;">
									<span style="padding-right: 190px;">조직도</span>
									<span><i class="fas fa-expand-alt unfold"></i></span>
									<span class="unfoldAlert" style="display: none;">모든 조직 펼치기</span> <%-- 호버 이벤트시 jQuery 효과주기 --%>
								</div>
								
								<details>
									<summary class="summary">IT</summary>
								   	<ul>
								      <li><a href="#" class="orgmenu">개발1팀</a><span id="cntbadge" ><span id="newCnt">1</span></span></li>
								      <li><a href="#" class="orgmenu">개발2팀</a></li>
								      <li><a href="#" class="orgmenu">기술지원팀1팀</a></li>
								    </ul>
								</details>
								<details>
									<summary class="summary">기획</summary>
								   	<ul>
								      <li><a href="#" class="orgmenu">기획1팀</a><span id="cntbadge" ><span id="newCnt">1</span></span></li>
								      <li><a href="#" class="orgmenu">기획2팀</a></li>
								    </ul>
								</details>
							</div>
						</div>
		            </span>
				</div>
			</div>
		</form>
	
	<!-- <hr class="memberInfohr"/> -->
	<%-- 전체 구성원 --%>
	<div style="margin-bottom: 15px; float: left;">
		<span style="margin: 0 12px 0 23px;">
			<input type="checkbox" id="memberAll" onClick="allCheckBox();" />
		</span>
		<span>전체 구성원 &nbsp; <span style="color:#4285f4;" id="memberCnt"></span>명</span>
		<span>
			<button type="button" id="message" style="font-size: 9.5pt"><span><i class="far fa-envelope"></i></span></button>
		</span>
	</div>
	<div class="big">
	 	<table class="table custom-table big" style="float: left;">
	       <colgroup>
		          <col width="5px" />
		          <col width="650px" />
		          <col width="220px" />
	      	</colgroup>
	     	<tbody>
	           <tr>
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
	              <td>
	                <div class="profile" href="#" style="padding: 1px ;">
				      <span class="pic">
					      <span>지은</span></span>
					      <span class="my"><span class="name" style="font-size: 10.8pt;">김지은</span><br>
					      <span class="role" style="font-size: 9pt;">개발자</span>
				      </span>
	                </div>
	              </td> 
	              <td>
	              	<span class="positionIcon">
						<span>IT 개발1팀&nbsp;|&nbsp;대리</span>
		            </span>
	              </td>
	           </tr>
	           <tr>
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
	              <td>
	                <div class="profile" href="#" style="padding: 1px ;">
			      <span class="pic">
				      <span>혜린</span></span>
				      <span class="my"><span class="name" style="font-size: 10.8pt;">진혜린</span><br>
				      <span class="role" style="font-size: 9pt;">개발자</span>
			      </span>
	                </div>
	              </td> 
	              <td>
	              	<span class="positionIcon">
						<span>IT 기술지원팀&nbsp;|&nbsp;사원</span>
		            </span>
	              </td>
	           </tr>
	           <tr>
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
	              <td>
	                <div class="profile" href="#" style="padding: 1px ;">
			      <span class="pic">
				      <span>채영</span></span>
				      <span class="my"><span class="name" style="font-size: 10.8pt;">강채영</span><br>
				      <span class="role" style="font-size: 9pt;">디자이너</span>
			      </span>
	                </div>
	              </td> 
	              <td>
	              	<span class="positionIcon">
						<span>디자인 디자인1팀&nbsp;|&nbsp;과장</span>
		            </span>
	              </td>
	           </tr>
	           <tr>
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
	              <td>
	                <div class="profile" href="#" style="padding: 1px ;">
			      <span class="pic">
				      <span>예은</span></span>
				      <span class="my"><span class="name" style="font-size: 10.8pt;">이예은</span><br>
				      <span class="role" style="font-size: 9pt;">기획자</span>
			      </span>
	                </div>
	              </td> 
	              <td>
	              	<span class="positionIcon">
						<span>기획 기획1팀&nbsp;|&nbsp;부장</span>
		            </span>
	              </td>
	           </tr>
	           <tr>
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
	              <td>
	                <div class="profile" href="#" style="padding: 1px ;">
			      <span class="pic">
				      <span>채영</span></span>
				      <span class="my"><span class="name" style="font-size: 10.8pt;">강채영</span><br>
				      <span class="role" style="font-size: 9pt;">디자이너</span>
			      </span>
	                </div>
	              </td> 
	              <td>
	              	<span class="positionIcon">
						<span>디자인 디자인1팀&nbsp;|&nbsp;과장</span>
		            </span>
	              </td>
	           </tr>
	           <tr>
	              <td><input type="checkbox" name="pnum" class="chkboxpnum" id="pnum${status.index}" value=""/></td>   
	              <td>
	                <div class="profile" href="#" style="padding: 1px ;">
			      <span class="pic">
				      <span>예은</span></span>
				      <span class="my"><span class="name" style="font-size: 10.8pt;">이예은</span><br>
				      <span class="role" style="font-size: 9pt;">기획자</span>
			      </span>
	                </div>
	              </td> 
	              <td>
	              	<span class="positionIcon">
						<span>기획 기획1팀&nbsp;|&nbsp;부장</span>
		            </span>
	              </td>
	           </tr>
	         </tbody>
	 	</table>
	</div>

</div>
