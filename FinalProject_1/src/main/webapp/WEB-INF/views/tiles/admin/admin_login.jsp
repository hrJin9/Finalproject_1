<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

    
<style type="text/css"> 

	
	#memberInfo_mainList {
		position: relative;
		display: flex;
		width: 11%;
		font-size: 18pt;
		font-weight: bold;
		margin: 4px 0 0 70px;
		padding: 0.7em 0 0.9em 0;
		color: #333;
	}

	hr.memberInfohr{
		width: 100%;
		background-color: rgba(0,0,0, .3) !important;
		border: none; 
		height: 1px;
	}
	






		
	.custom-table {
		min-width: 900px;
		thead {
			tr, th {
				border-top: none;
				border-bottom: none!important;
			}
		}
		tbody {
			th, td {
				color: #777;
				font-weight: 400;
	      font-weight: 300;
			}
		}
	}
	
	.table>:not(:first-child) {
	       border-top: 1.5px solid #cfcfcf;
	}
	 
	
	 
	
	/* Custom Checkbox */
	.control {
	  display: block;
	  position: relative;
	  margin-bottom: 25px;
	  cursor: pointer; }
	
	.control input {
	  position: absolute;
	  z-index: -1;
	  opacity: 0; }
	
	.control__indicator {
	  position: absolute;
	  top: 2px;
	  left: 0;
	  height: 15px;
	  width: 15px;
	  border-radius: 3px;
	  border: 2px solid #ccc;
	  background: transparent; }
	
	.control--radio .control__indicator {
	  border-radius: 50%; }
	
	.control:hover input ~ .control__indicator,
	.control input:focus ~ .control__indicator {
	  border: 2px solid #007bff; }
	
	.control input:checked ~ .control__indicator {
	  border: 2px solid #007bff;
	  background: #007bff; }
	
	.control input:disabled ~ .control__indicator {
	  background: #e6e6e6;
	  opacity: 0.6;
	  pointer-events: none;
	  border: 2px solid #ccc; }
	
	
	.control input:checked ~ .control__indicator:after {
	  display: block;
	  color: #fff; }
	
	.control--checkbox .control__indicator:after {
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate(-50%, -52%);
	  -ms-transform: translate(-50%, -52%);
	  transform: translate(-50%, -52%); 
	  }
	
	.control--checkbox input:disabled ~ .control__indicator:after {
	  border-color: #7b7b7b; }
	
	.control--checkbox input:disabled:checked ~ .control__indicator {
	  background-color: #007bff;
	  opacity: .2;
	  border: 2px solid #007bff; }
	
	.table thead th {
		border-bottom: none;
		text-align: center; 
	}
	.boardth{
		position: relative;
		top: -6px;
	}
	.table td, .table th {
		font-size: 11pt;
	    border-top: 1px solid #eef2f6;
	}
	.table {
	    color: #4c4e54;
	}
	table td{
		font-size: 11pt;
		text-align: center; 
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
	
	
	.menu-heading {
		font-size: 14px;
		color: lighten($black, 70%);
		padding-left: 20px;
		padding-right: 20px;
	}
	hr {
		display: block; height: 1px;
	   border: 0; border-top: 1px solid darken($light, 5%);
	   margin: .5em 0; padding: 0;
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
	



/* 검색 */
   

#mycontent > div > div.container.mt-5 > div > form > div > div.form-group > div > div > select{

    position: absolute;
    width: 5%;
    text-align: center;
    left: 164px;

}




div.option {
    border: 1px solid #e6e6e6;
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
    border: 1px solid #545454d9; 
    top: 34%;
    left: 19.5%;
    z-index: 2;
    overflow:hidden;
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
 
 .search-period-wr .filter-input-box:first-child {
    margin: 10px 30px 0 0;
}
.search-period-wr .filter-input-box {
    overflow: hidden;
    display: inline-block;
    margin: 10px 0 0 0;
    padding: 7px 44px 0 10px;
    height: 32px;
    width: auto;
}
.filter-input-box {
    position: relative;
    height: 40px;
    margin-top: 10px;
    padding: 10px 15px 10px 15px;
    background: #fff;
    border: 1px solid #ddd;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-border-radius: 4px;
    border-radius: 4px;
    width: 100%;
    font-size: 13px;
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
  
  
  

.selectbox {
  position: relative;
  width: 200px;
  border: 1px solid #999;
  z-index: 1;
}

.selectbox:before {
  content: "";
  position: absolute;
  top: 50%;
  right: 15px;
  width: 0;
  height: 0;
  margin-top: -1px;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid #333;
}

.selectbox label {
  position: absolute;
  top: 1px;
  left: 5px;
  padding: .8em .5em;
  color: #999;
  z-index: -1;
}

.selectbox select {
  width: 100%;
  height: auto;
  line-height: normal;
  font-family: inherit;
  padding: .8em .5em;
  border: 0;
  opacity: 0;
  filter:alpha(opacity=0);
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
  
  
  
  
/* 검색 끝 */




</style>

<script type="text/javascript">

	$(document).ready(function(){ 
	
		 
		var selectTarget = $('.selectbox select');

		 selectTarget.on('blur', function(){
		   $(this).parent().removeClass('focus');
		 });

		  selectTarget.change(function(){
		    var select_name = $(this).children('option:selected').text();

		  $(this).siblings('label').text(select_name);
		  });
 
		  
		  
		
		
	}); //end of ready	

</script>
 

<div class="container">
<div id="memberInfo_mainList">멤버 접근 로그</div>
<hr class="memberInfohr" style="margin-top: 0px;"/>
 
  
 
<div class="container mt-5" style="padding-right: 5%;">
	<div class="row"> 
		  
		 
		 
		<form action="#" class="booking-form ml-3"  style="float: left;margin-bottom: 1%;">
			<div class="row" >
				<div class="form-group" style="margin-right: 1rem;margin-left: 1rem;">
						<div class="form-field">
							<div class="select-wrap">
								<select name="" id="" class="form-control" style="font-size: 9pt;padding:6px 12px;position: absolute;width: 5%;text-align: center;left: 684px;font-size: 11pt;">
								<option>태그선택</option>  
								<option value="">이름</option>
				 				<option value="">소속</option>
								</select>
							</div>    
						</div>
					</div>  
				<div class="">  
					<div class="form-group">  
						<div class="form-field">
							<!-- <div class="icon"><span class="fa fa-search"></span></div> -->  
							<input type="text" class="form-control" placeholder="이름/소속으로 검색" style="font-size: 9pt; padding:6px 12px; width: 30%; position: absolute; left: 50%;font-size: 11pt;">
						</div>
					</div>  
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 10pt;margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white;font-size: 0.8rem;position: relative;left: 83%;"></a>
					</div>
				</div>  
				 
				<div class="form-field">  
					<div class="select-wrap">   
						<i class="fa-solid fa-sort" style="position: absolute;left: 90%;top: 19%;z-index: 1;color: #6e6e6e;"></i> 
						<select name="" id="" class="form-control" style="font-size: 9pt;padding:6px 12px;position: absolute;width: 10%;left: 1252px; top: 17.8%;font-size: 11pt;">
						<option value="">10개씩 보기</option> 
		 				<option value="">20개씩 보기</option>  
		 				<option value="">30개씩 보기</option> 
						</select> 
					</div>     
				</div>     
			</div>   
		</form>
		      
		<hr style="margin: 1% 0 1% 0;;">    
		 
		<div class="payroll-download" style="width: 15%; margin: 0 0 2% 85%;"> 
			<i class="fa-solid fa-download" style="font-size: 10pt; display:inline-block;"></i>
			<div>목록 다운로드</div>
		</div>  
		      
     
        <table class="table custom-table">   
          <thead>   
            <tr>
              <th class="boardth" width="15%"scope="col"><button type="button" style="border: none; background-color: #ffff;">시간<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button></th>     
              <th class="boardth" width="12%" scope="col"><button type="button" style="border: none; background-color: #ffff;">이름<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button></th>  
              <th class="boardth" width="12%" scope="col"><button type="button" data-bs-toggle="dropdown" style="border: none; background-color: #ffff;">소속<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button>  
				  <div class="dropdown-menu">
					      <h5 class="dropdown-header">소속</h5>
					      <a class="dropdown-item" href="#">인사·총무</a>
					      <a class="dropdown-item" href="#">회계·재무</a>
					      <a class="dropdown-item" href="#">법무</a>
					      <a class="dropdown-item" href="#">감사</a> 
					      <a class="dropdown-item" href="#">업무지원</a>
					      <a class="dropdown-item" href="#">경영지원</a> 
				  </div>
			  </th>
              <th class="boardth" width="12%" scope="col"><button type="button" style="border: none; background-color: #ffff;">상태<i class="fa-solid fa-angle-down" style="margin-left: 10px; color: #d4d4d4;"></i></button></th>  
              <th class="boardth" width="12%"scope="col">유형</th>
              <th class="boardth" width="12%"scope="col">IP</th> 
              <th class="boardth" width="12%"scope="col">디바이스</th> 
              <th class="boardth" width="12%"scope="col">브라우저</th>
            </tr> 
          </thead>
          <tbody>
            <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td> 
              <td>영업본부</td> 
              <td style="background-color: light green;">로그인 성공</td> 
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
             <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
            <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
            <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
            <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
            <tr> 
              <td>2020-12-25(금) 00:17</td>
              <td>김상후</td>
              <td>영업본부</td>
              <td>로그인 성공</td>
              <td>USER</td>
              <td>210.178.232.1</td>
              <td>PC</td>
              <td>Chrom</td>
            </tr> 
             
          </tbody>  
        </table>
      </div>
		
 
	</div>
	
 





</div>