<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

    
<style type="text/css"> 
.admin_container {
	width: 90%;
	margin: 0 auto;
}

/* 상단 nav바  */	
#admin_mainList a:hover{
	color: #000000;
	cursor: pointer;
}

#dayoff_subList a:hover{
	background-color: rgba(200,200,200, .2);
	cursor: pointer;
}
	
#admin_mainList {
	position: relative;
	display: flex;
	width: 77%;
	font-size: 18pt;
	font-weight: bold;
}

#admin_mainList a {
	display: block;
	padding: 0.7em 0 0.9em 0;
	text-decoration: none;
	margin-right: 4%;
	color: #4d4f53;
}

#dayoff_subList a:nth-child(1).iscurrent ~ .dayoff_subList_underline {
	left: 0%;
}
#dayoff_subList a:nth-child(2).iscurrent ~ .dayoff_subList_underline {
	left: 15%; /* width랑 margin-left랑 합친거 */
}
	

/* 검색 */
#searchCondition, #cntselect {
    display: block;
    width: 100%;
    font-size: 10pt;
    font-weight: 500;
    line-height: 1.5;
    color: #4d4f53;
    background-clip: padding-box;
    border: solid 1px rgba(0,0,0,0.1);
    border-radius: 0.25rem;
}

.form-control{
	font-size: 10pt !important;
	border: solid 1px rgba(0,0,0,0.1);
}
	
.row >*{
	width: auto;
	padding: 0;
}


	/* 테이블 */
.custom-table{
    border-collapse: collapse;
    border-radius: 5px;
    border-style: hidden;
    box-shadow: 0 0 0 1px rgb(0 0 0 / 10%);
    width: 100%;
    font-size: 11pt;
    color: rgb(77, 79, 83);
    text-align: left;
    font-weight: 400;
}

.custom-table th {
	background-color : #FBFBFB;
	border-radius: 5px;
	padding: 10px 20px;
	border-bottom: solid 1px rgba(0,0,0,0.1);
	border-right: solid 1px rgba(0,0,0,0.1);
}


.custom-table td {
	padding: 7px 20px;
	border: solid 1px rgba(0,0,0,0.1);
}

.custom-table th > div {
	cursor:pointer;
}
	
	.custom-dropdown {
	border: none!important;
	> a {
		color: $black;
		.arrow {
			display: inline-block;
			position: relative;
			transition: .3s transform ease;
		}
	}
	&.show {
		> a {
			.arrow {
				transform: rotate(-180deg);
			}
		}
	}
	
	.btn {
		&:active, &:focus {
			box-shadow: none!important;
			outline: none;
		}	
		&.btn-custom {
			border: 1px solid #efefef;	
		}
	}
	
	.dropdown-menu {
		border: 1px solid transparent!important;
		box-shadow: 0 15px 30px 0 rgba($black, .2);
		margin-top: -10px!important;
		padding: 20px 0;
		opacity: 0;
		border-radius: 0;
		background: $white;
		// right: auto!important;
		// left: auto!important;
		transition: .3s margin-top ease, .3s opacity ease, .3s visibility ease;
		visibility: hidden;
		&.active {
			opacity: 1;
			visibility: visible;
			margin-top: 0px!important;
		}
	
		a {
			// border-bottom: 1px solid rgba($black, .1);
			font-size: 14px;
			padding: 8px 20px;
			position: relative;
			color: $black;
			&:last-child {
				border-bottom: none;
			}
			.icon {
				margin-right: 15px;
				display: inline-block;
			}
			&:hover, &:active, &:focus {
				background: $light;
				color: $black;
				.number {
					color: $white;
				}
			}
	
			.number {
				padding: 2px 6px;
				font-size: 11px;
				background: $orange;
				position: absolute;
				top: 50%;
				transform: translateY(-50%);
				right: 15px;
				border-radius: 4px;
				color: $white;
			}
		}		
	}

</style>

<script type="text/javascript">

	$(document).ready(function(){ 
	
	}); //end of ready	

</script>
 
  
<nav id="admin_mainList" class="margin-container">
	<a id="memberlogin_mainList" style="color: rgb(77, 79, 83);" class="header-nonsub">멤버 접근 로그</a>
	<div class="list_underline"></div>
</nav>
<hr class="HRhr" style="margin-top: 0px;"/><br>

<div class="admin_container">
	<div class="contentsmargin">
		<div style="display: inline-block;">
      	 	<a id="write" class="btn" style="font-size: 10pt; vertical-align: middle; padding: 6.5px 17px; border: 1px solid rgba(0,0,0,0.1); border-radius:5px; background-color:white; color:#212529; margin-left: 3px;">
		       	<span><i class="fa-solid fa-download"></i></span>
		       	<span>목록 다운로드</span>
      	 	</a>
      	 </div>
		
		<%-- 검색 --%>
		<form class="booking-form ml-3" style="float: right;">
			<div class="row" style="padding-bottom: 20px;">
				<%-- 검색 --%>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<select name="searchCondition" id="searchCondition" style="padding:7.3px 12px;">
								<option value="">이름</option>
								<option value="">소속</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<div class="form-group">
						<div class="form-field" style="padding-left:5px; margin-right: 14px;">
							<input type="text" class="form-control" placeholder="검색" style="width:105%; font-size: 9pt; padding:6px 6px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group seachIcon" style="font-size: 10pt; margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white; font-size: 0.8rem; padding: 0.375rem; position: absolute; right: 10.5%;"></a>
					</div>
				</div>
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field" style="padding-right:10px;">
							<select name="cntselect" id="cntselect" style="padding:7.3px 12px;">
								<option value="">20</option>
								<option value="">40</option>
								<option value="">80</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</form>
		 
		 
     	<%-- 전체 구성원 로그내역 --%>
     	<div style="margin-bottom: 15px; float: left;">
		</div>
		<table class="custom-table">   
	    	<thead>   
	            <tr>
	              <th class="boardth" width="15%"scope="col"><div style="border: none;">접근시간<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></div></th>     
	              <th class="boardth" width="9%" scope="col"><div style="border: none;">이름<span style="margin-left: 10px; color: #b3b3b3; font-size: 16px; font-weight: bold; position:relative; top: 3.5px;"><ion-icon name="swap-vertical-outline"></ion-icon></span></div></th>  
	              <th class="boardth" width="11%" scope="col"><div data-bs-toggle="dropdown" style="border: none;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div>  
					  <div class="dropdown-menu">
					      <a class="dropdown-item" href="#">인사·총무</a>
					      <a class="dropdown-item" href="#">회계·재무</a>
					      <a class="dropdown-item" href="#">법무</a>
					      <a class="dropdown-item" href="#">감사</a> 
					      <a class="dropdown-item" href="#">업무지원</a>
					      <a class="dropdown-item" href="#">경영지원</a> 
					      <a class="dropdown-item" href="#">영업</a> 
					      <a class="dropdown-item" href="#">마케팅·홍보</a> 
					      <a class="dropdown-item" href="#">기획</a> 
					      <a class="dropdown-item" href="#">IT</a> 
					      <a class="dropdown-item" href="#">디자인</a> 
					      <a class="dropdown-item" href="#">연구·R&D</a> 
					      <a class="dropdown-item" href="#">구매</a> 
					      <a class="dropdown-item" href="#">무역</a> 
					      <a class="dropdown-item" href="#">생산</a> 
					      <a class="dropdown-item" href="#">서비스</a> 
					  </div>
				  </th>
	              <th class="boardth" width="15%"scope="col">페이지 URL</th> 
	              <th class="boardth" width="12%" scope="col"><div data-bs-toggle="dropdown" style="border: none;">유형<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></div>
	              	<div class="dropdown-menu">
					      <a class="dropdown-item" href="#">USER</a>
					      <a class="dropdown-item" href="#">ADMIN</a>
					  </div>
				  </th>
	              <th class="boardth" width="12%"scope="col">IP</th> 
	            </tr> 
			</thead>
			<tbody>
	            <tr> 
	              <td>2020-12-25(금) 14:07:23</td>
	              <td>김상후</td> 
	              <td>영업</td> 
	              <td>/admin_login.up</td> 
	              <td>USER</td>
	              <td>210.178.232.1</td>
	            </tr> 
	            <tr> 
	              <td>2020-12-25(금) 14:07:23</td>
	              <td>김상후</td> 
	              <td>영업</td> 
	              <td>/admin_attendanceList_usage.up</td> 
	              <td>USER</td>
	              <td>210.178.232.1</td>
	            </tr> 
	            <tr> 
	              <td>2020-12-25(금) 14:07:23</td>
	              <td>김상후</td> 
	              <td>영업</td> 
	              <td>/admin_attendanceList_holding.up</td> 
	              <td>USER</td>
	              <td>210.178.232.1</td>
	            </tr> 
	            <tr> 
	              <td>2020-12-25(금) 14:07:23</td>
	              <td>김상후</td> 
	              <td>영업</td> 
	              <td>/admin_memberList.up</td> 
	              <td>USER</td>
	              <td>210.178.232.1</td>
	            </tr> 
	            <tr> 
	              <td>2020-12-25(금) 14:07:23</td>
	              <td>김상후</td> 
	              <td>영업</td> 
	              <td>/admin_login.up</td> 
	              <td>USER</td>
	              <td>210.178.232.1</td>
	            </tr> 
	    	</tbody>        
		</table>
     	
	</div>
</div>