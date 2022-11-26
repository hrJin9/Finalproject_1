<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>    

    
<style type="text/css"> 

	
	.currentPage{color:black;}
	
	#payroll_mainList a:hover{
		color: #000000;
		cursor: pointer;
	}
	
 		
	#payroll_mainList {
		position: relative;
		display: flex; 
		width: 640px;
		font-size: 18pt;
		font-weight: bold;
	} 
	
	#payroll_mainList a {
		display: block; 
		width: 13%;
		padding: 0.7em 0 0.3em 0;
		color: black !important;
		text-decoration: none;
		margin-right: 4%;
		color: #D2D6D9;
	}
	
	
	.iscurrent{ 
		color: black;
	}
	
	#payroll_subList{
		position: relative;
		display: flex;
		font-size: 11pt;
		font-weight: bold;
	}
	
	#payroll_subList a {
		display: block;
		width: 110px;
		padding: .9em 0;
		color: black !important;
		text-align: center;
		text-decoration: none;
		color: #D2D6D9;
		border-radius: 12px;
	}
	
	.payroll_subList_underline {
		position: absolute;
		left: 0;
		bottom: -1px;
		width: 105px;
		height: 2px;
		background: #333;
		transition: all .3s ease-in-out;
		margin-right: 5%;
		margin-left: 4px;
	}
	
	#payroll_subList a:nth-child(1).iscurrent ~ .payroll_subList_underline {
		left: 0%;
	}
	#payroll_subList a:nth-child(2).iscurrent ~ .payroll_subList_underline {
		left: 10.5%; /* width랑 margin-left랑 합친거 */
	}
 
 
 
  
    
  
 
 	.insight-box{
 	
 	    border: solid 1px rgba(0,0,0,.1);
	    border-radius: 12px;
	    width: 45%;
	    height: 300px;
	    display: inline-block;
	    margin-right: 0.33%;
	    padding: 20px 20px;
 	
 	}
 	.text-muted{
 		font-size: 12px; 
 	}  
 	.subtext{   
 		margin-right: 10px;
 		font-weight: bold !important; 
 	} 
     
 	.square {   
	  width: 10px; 
   	  height: 10px;  
	  display: inline-block;
	  margin-right: 5px; 
	}
	  
	.emo{
	   font-size: 30px;
       margin-top: 8px;
       margin-right: 5px; 
	}  
	 
	
	<!-- 막대 그래프 -->   
	.zt-skill-bar {
        color: #eee;   
        font-size: 11px;
        line-height: 25px; 
        height: 25px;
        margin-bottom: 5px; 
        
 
        background-color: #eee;

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;

    }

    .zt-skill-bar * {
        webkit-transition: all 0.5s ease; 
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }

    .zt-skill-bar div {  
        background-color: #639bf9;  
        position: relative;
        padding-left: 25px;
        width: 0; 
 
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px; 
           -ms- border-radius: 2px;
                border-radius: 50px;
    }

    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px; 

        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }  

    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px; 

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }
	
       

</style>
 
<script type="text/javascript">

(function( $ ) {
    "use strict";
    $(function() {
        function animated_contents() {
            $(".zt-skill-bar > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');

                $this.css({'width' : skills + '%'});

            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
}(jQuery)); 



	$(document).ready(function(){ 
	
		 
		  
		   
		
		 
	}); //end of ready	 
	 
	
 
</script>
 
 
<div class="insight-container"> 
 
<nav id="payroll_mainList" class="margin-container">
	<a id="payroll" class="header-main">인사이트</a>
	<div class="list_underline"></div>
</nav>  
 
<nav id="payroll_subList" class="margin-container"> 
	<a id="payroll-list"  class="header-sub" style="width: 72px;">회사성장</a> 
	<div class="payroll_subList_underline" style="width: 65px;"></div> 
</nav> 
<hr class="HRhr" style="margin-top: 0px;"/> 
<div class="ml-1 margin-container">
			<div class="insight-box"> 
				<div> 
					<div>전체 구성원 수</div> 
					<div class='text-muted'>주 단위 · 2022.10.10 ~ 2022.11.10</div>  
					<div style="display: flex; margin-top: 20px;"> 
						<h4 class="subtext">70명</h4>       
						<div style="margin-top: 1%;color: #4285f4">5명 <i class="fa-solid fa-caret-up"></i></div>    
					</div>  
				</div>			 
			</div>  
			<div class="insight-box">
				<div>  
					<div>조직장별 평균 구성원수</div>  
					<div class='text-muted'>기준·재직 구성원</div> 
					<div style="display: flex; margin-top: 20px;"> 
						<h4 class="subtext">2.5명</h4>     
					</div> 
				</div>	 
			</div> 
			<div class="insight-box" style=" margin-top: 1%;"> 
				<div>     
					<div>평균 근속기간 분포</div>   
					<div class='text-muted'>기준·모든 기간</div>   
					<h4 class="subtext" style="margin-top: 20px;">0.5년</h4>     
					<div class='text-muted' style="position: absolute; font-size: 11pt;">    
						<div class="mt-4">12 ~ 24개월</div>     
						<div class="mt-1">3개월 미만</div>     
						<div class="mt-1">3 ~ 6개월</div>       
						<div class="mt-1">-</div>       
					</div>     
				</div>			   
			</div>   
			<div class="insight-box" style=" margin-top: 1%;">   
				<div>  
					<div>전체 구성원 성비</div>      
					<div class='text-muted'>기준·재직 구성원</div>   
					<h4 class="subtext" style="margin-top: 20px;">2.5명</h4>        
					<div class='text-muted' style="float: right;">   
						<div class="mt-5"><div class="square" style="background-color: #4441ba;"></div>여자 35명</div>     
						<div><div class="square" style="background-color: #5bcff5;"></div>남자 35명</div>    
					</div> 
				</div>	 
			</div>   
		</div>    
		 
		   
		

 
<nav id="payroll_subList" class="margin-container">  
	<a id="payroll-list"  class="header-sub" style="margin-top: 5%;">근무시간·휴가</a> 
	<div class="payroll_subList_underline" style=""></div>  
</nav>
<hr class="HRhr" style="margin-top: 0px;"/>
<div class="ml-1 margin-container">
			<div class="insight-box">  
				<div> 
					<div>주 평균 근무시간</div> 
					<div class='text-muted'>주 단위 · 2022.10.10 ~ 2022.11.10</div>  
					<div style="display: flex; margin-top: 20px;"> 
						<h4 class="subtext">13.4시간</h4>     
						<div style="margin-top: 1%;color: #4285f4;">13.4시간 <i class="fa-solid fa-caret-up"></i></div>    
					</div>  
				</div>			 
			</div>   
			<div class="insight-box">   
				<div> 
					<div>주 평균 초과근무시간</div>  
					<div class='text-muted'>주 단위 · 2022.10.10 ~ 2022.11.10</div>   
					<div style="display: flex; margin-top: 20px;">  
						<h4 class="subtext">1.1시간</h4>     
						<div style="margin-top: 1%;color: #4285f4;">1.1시간 <i class="fa-solid fa-caret-up"></i></div>    
					</div>  
				</div>			   
			</div>  
</div> 
  

<nav id="payroll_subList" class="margin-container">      
	<a id="payroll-list"  class="header-sub"  style="margin-top: 5%;">항목별 비교 </a>  
	<div class="payroll_subList_underline" style=""></div> 
</nav>
<hr class="HRhr" style="margin-top: 0px;"/>
 <div class="ml-1 margin-container"> 
			<div class="insight-box" style="width: 90%; margin-bottom: 20px;">       
				<div style="display: flex;align-items: center;">     
					<p class="emo">&#x1F465;</p>      
					<div>    
						<div>조직별 구성원 수</div>    
						<div class='text-muted'>기준·재직 구성원</div>      
					</div>        
				</div>	    
				<div class="zt-span6 last">
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="75" style="margin-top: 10px;color: white;">IT<span>15명</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="80" style="margin-top: 10px;color: white;">기획<span>20명</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="70" style="margin-top: 10px;color: white;">인사<span>10명</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="76" style="margin-top: 10px;color: white;">회계<span>16명</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="85" style="margin-top: 10px;color: white;">서비스<span>25명</span></div></div>
		    	</div>		    
			</div>    
			<div class="insight-box" style="width: 90%; margin-bottom: 20px;">      
				<div style="display: flex;align-items: center;">     
					<p class="emo">&#x1F4BC;</p>      
					<div>   
						<div>조직별 평균 연봉</div>  
						<div class='text-muted'>기준·재직 구성원</div>     
					</div>    
				</div>	       
				<div class="zt-span6 last"> 
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="75" style="margin-top: 10px;color: white;">IT<span>7,500</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="80" style="margin-top: 10px;color: white;">기획<span>8,000</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="70" style="margin-top: 10px;color: white;">인사<span>7,000</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="76" style="margin-top: 10px;color: white;">회계<span>7,600</span></div></div>
					<div class="zt-skill-bar" style="background-color: #eee;border-radius: 50px;"><div data-width="85" style="margin-top: 10px;color: white;">서비스<span>8,000</span></div></div>
		    	</div>		    
			</div> 
 </div> 

 



</div>