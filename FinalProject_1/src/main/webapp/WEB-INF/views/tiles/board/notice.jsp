<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="board_header.jsp"%>
<style type="text/css">


p {
	color: darken(#ccc, 10%);
	font-weight: 300;
}
a {
	transition: .3s all ease;
	&, &:hover {
		text-decoration: none!important;
	}
}
.content {
	padding: 7rem 0;
}
h2 {
	font-size: 20px;
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


.table thead th {
	padding-top:0;
	border: none;
	border-bottom: 1px solid #8a8d8f;
}
.boardth{
	position: relative;
	top: -6px;
}
.table td{
	font-size: 10pt;
    border-bottom: 1px solid #eef2f6;
    padding-left: 22px;
}
.table {
    color: #4c4e54;
}
table tr{
	padding-left: 10px;
}
table tr:hover {
	background-color: #f4f8f9;
}
.topnotice{
	background-color: #f9f9f9;
}


.form-control{
	font-size: 12pt;
}


</style>

<script type="text/javascript">

$(document).ready(function(){
	
	/* 북마크 표시 */
	  $('.bookmark').click(function(e) {
		  	const $this = $(this);

		  	if ( $this.hasClass('icon-star-empty') ) {
		  		$this.removeClass('icon-star-empty');
		  		$this.addClass('icon-star-full');
		  	} else {
		  		$this.removeClass('icon-star-full');
		  		$this.addClass('icon-star-empty');
		  	}
		  	e.preventDefault();
	});
	  
	
	/* 게시물뷰 링크 이동 */
	 $('.titlefirst').click(function() {
		
	});
	
	
	
	
  
});//end of ready


</script>
<div class="container col-9 mt-5">
	<div class="row">
      <div class="table-responsive">
      	 
      	 <div style="display: inline-block;float: right;">
      	 	 <a href="#" class="btn "style="font-size: 9pt;padding-left:20px;padding-right:20px;border-color:white; background-color:#4d4f53;color:white">글쓰기</a>
      	 </div>
         <form action="#" class="booking-form ml-3"  style="float: left;margin-bottom: 0;">
			<div class="row" style="margin-right:0;">
				<div class=" mr-2">
					<div class="form-group">
						<div class="form-field">
							<div class="select-wrap">
								<select name="" id="" class="form-control" style="font-size: 9pt;padding:6px 12px;">
								<option>태그선택</option>
								<option value="">제목</option>
								<option value="">작성자</option>
								<option value="">팀</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="">
					<div class="form-group">
						<div class="form-field">
							<!-- <div class="icon"><span class="fa fa-search"></span></div> --> 
							<input type="text" class="form-control" placeholder="제목/작성자/팀으로 검색" style="width:190%; font-size: 9pt; padding:6px 12px;">
						</div>
					</div>
				</div>
				<div class="align-items-end mt-1 mr-4">
					<div class="form-group" style="font-size: 10pt;margin-bottom:0;">
						<a href="#" class="btn icon icon-search" style="color:#76787a; background-color: white;font-size: 0.8rem;position: relative;left: 100px;"></a>
					</div>
				</div>
			</div>
		</form>


        <table class="table custom-table">
          <thead>
            <tr>
              <th width="80%"scope="col"/>
              <th width="6%"scope="col"/>
            </tr>
          </thead>
          <tbody>
            <tr class="topnotice"><!-- 공지 상단에 고정 -->
              <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
              <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
              <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr class="topnotice">
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr>
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr >
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
            		<span class="newbadge">n</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr >
              <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>
            <tr >
               <td>
              	<div class="titlefirst">
              		<span class="title">[코로나 문진표] 11/15일자 결과 공유</span>
              		<span class="icon icon-attachment" style="color:#4c4e54;font-size: 10pt;position: relative; left:2px;"></span> 
              	</div>  
              	<div>
              		<span class="categorybadge">문진표공유</span>
              		<span class="teamname">EX</span>
            		<span class="writedate">11.16</span>
              		<span class="icon icon-bubble2" style="color:#4c4e54;padding:0 auto;font-size: 10pt;position: relative; left:15px;top:2px;"></span> <span style="position: relative; left:8px;top:1px;">11</span>
              	</div>	
              </td>
              <td>
              	<a href="#" class="bookmark icon icon-star-empty"></a>
              </td>
            </tr>

            
          </tbody>
        </table>
      </div>
		

	</div>
	
</div>
