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
				<span id="">메시지 제목ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴ</span> <!-- 20자 이내로 제한줘야됨 -->
				<span class="mgc-header-attach"><i class="fas fa-paperclip"></i></span> <!-- 첨부파일 있을 때만 -->
			</div>
			<div class="mgc-from mgc-people">
				<div>보낸 사람</div>
				<div>
					<span class="pic" style="height: 25px; width: 25px; margin-right: 5px;">
						<span style="font-size: 7pt;">지은</span>
					</span>
				</div>
				<div><span>김지은</span>·<span>마케팅</span></div>
			</div>
			<div class="mgc-to mgc-people">
				<div>받는 사람</div>
				<div><span>김지은</span>·<span>마케팅</span></div>
				<div>, <span>김지은</span>·<span>마케팅</span></div>
				<div>, <span>김지은</span>·<span>마케팅</span></div>
				<div>, <span>김지은</span>·<span>마케팅</span></div>
				<div> 외 7명</div>
			</div>
		</div>
		<div class="mgc-header-right">
			<button type="button" class="mgc-writebtn button gradientbtn"> <!-- 메시지 보낸사람이 본인이라면 이 버튼이 뜨면 안됨! -->
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
		<div class="accordion mgc-ac" id="accordionPanelsStayOpenExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
		      <button class="accordion-button collapsed mgc-more" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
					<div><i class="fas fa-paperclip"></i></div>
					<div>첨부파일 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
		      <div class="accordion-body mgc-attach mgc-ac-content">
		      	<div>
			      	<span><i class="fas fa-download"></i></span>
			      	<span>첨부파일명</span>
			      	<span>(10MB)</span>
		      	</div>
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
				<div>주고받은 메시지 <span>1</span></div> <!-- 없으면 0이라고 뜸 -->
		      </button>
		    </h2>
		    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
		      <div class="accordion-body mgc-ac-content mgc-ac-ref">
		      		<div class="mg-read mg-now"> <!-- 현재 보고있는 파일인 경우 mg-now 추가  -->
		      			<span><i class="fas fa-envelope-open"></i></span>
		      			<span>메시지 제목</span>
		      			<span>2022. 11. 13(화) 오후  1:00</span>
		      		</div>
		      		<!-- 읽은 메시지 -->
		      		<div class="mg-read">
		      			<span><i class="fas fa-envelope-open"></i></span>
		      			<span>메시지 제목</span>
		      			<span>2022. 11. 13(화) 오후  1:00</span>
		      		</div>
		      		<!-- 안읽은 메시지 -->
		      		<div class="mg-unread">
		      			<span><i class="fas fa-envelope"></i></span>
		      			<span>메시지 제목</span>
		      			<span>2022. 11. 13(화) 오후  1:00</span>
		      		</div>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 첨부파일, 관련메시지 아코디언 끝 -->
	</div>
</div>