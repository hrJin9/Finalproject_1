<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
</style>
<script>
</script>
<div class="mgc-container">
	<div class="mgc-header">
		<div class="mgc-header-left">
			<div class="mgc-subject">
				<span><i class="far fa-star"></i></span>
				<span id="">메시지 제목</span>
				<span><i class="fas fa-paperclip"></i></span> <!-- 첨부파일 있을 때만 -->
			</div>
			<div class="mgc-from">
				<div>보낸 사람</div>
				<div><span class="pic" style="height: 25px; width: 25px;"><span style="font-size: 7pt;">지은</span></span></div>
				<div><span>김지은</span>·<span>마케팅</span></div>
			</div>
			<div class="mgc-to">
				<div>받는 사람</div>
				<div><span>김지은</span>·<span>마케팅</span></div>
				<div>, <span>김지은</span>·<span>마케팅</span></div>
				<div>, <span>김지은</span>·<span>마케팅</span></div>
				<div>, <span>김지은</span>·<span>마케팅</span></div>
				<div> 외 7명</div>
			</div>
		</div>
		<div class="mgc-header-right">
			<button type="button" class="mgc-writebtn button">
				<span><i class="fas fa-reply"></i></span>
				<span>답장하기</span>
			</button>
			<div id="mgc-date">2022. 11. 13(화) 오후 1:45</div>
		</div>
	</div>
	<hr class="HRhr" style="margin:0px;"/>
	<div class="mgc-body">
		<div class="mgc-content">어쩌구저쩌구.....메시지 내용</div>
		<!-- 첨부파일, 관련메시지 아코디언 시작 -->
		<div class="accordion" id="accordionPanelsStayOpenExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
		      <button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
					<div><i class="fas fa-paperclip"></i></div>
					<div>첨부파일 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
		      <div class="accordion-body mgc-attach">
		      	<div>
			      	<span><i class="fas fa-download"></i></span>
			      	<span>첨부파일명</span>
			      	<span>(10MB)</span>
		      	</div>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
		      <button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
				<div><i class="fas fa-envelope-open-text"></i></div>
				<div>관련 메시지 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
		      <div class="accordion-body">
		        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 첨부파일, 관련메시지 아코디언 끝 -->
		<!-- 
		<hr class="HRhr" style="margin:0px;"/>
		<div class="mgc-attach mgc-more">
			<div><i class="fas fa-paperclip"></i></div>
			<div>첨부파일 <span>1</span></div> 없으면 0이라고 뜸
			<div><i class="fas fa-chevron-down"></i></div>
			<div><i class="fas fa-chevron-up"></i></div>
		</div>
		
		
		<div class="mgc-attachc">
			
		</div>
		<hr class="HRhr" style="margin:0px;"/>
		<div class="mgc-ref mgc-more">
			<div><i class="fas fa-envelope-open-text"></i></div>
			<div>관련 메시지 <span>1</span></div> 없으면 0이라고 뜸
			<div><i class="fas fa-chevron-down"></i></div>
			<div><i class="fas fa-chevron-up"></i></div>
		</div>
		<div class="mgc-refc">
			
		</div>
		 -->
		
	</div>




</div>