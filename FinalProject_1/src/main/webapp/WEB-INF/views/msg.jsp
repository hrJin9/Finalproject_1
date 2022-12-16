<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
    
<script>
$(document).ready(function(){
	
	if("${requestScope.message}" != ""){
		
		if("${requestScope.message}".indexOf("완료") != -1){ // 신청을 성공했으면 웹소켓으로 보내 
			
			var AlarmData = {"receiverNo":"100021",
							 "callerName":"김지은",
							 "url":"<%= request.getContextPath()%>/approval.up",
							 "content":"결재신청"
			}
			$.ajax({
				type : 'post',
				url : '<%= request.getContextPath()%>/addAlarm.up',
				data : JSON.stringify(AlarmData),
				contentType: "application/json; charset=utf-8",
				dataType : 'text',
				success : function(data){
					if(socket){
/* 						let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq; */
						let socketMsg = "approval_add," + "김지은" +","+ "100021" +","+ "100021" +","+ "2039129038";
						console.log("msgmsg : " + socketMsg);
						
						alert("${requestScope.message}"); //메시지 출력
						
						socket.send(socketMsg);
					}

				},
				error : function(err){
					console.log(err);
				}
			});
		}
		
		
	}
	// 페이지이동
	location.href = "${requestScope.loc}"; //페이지 이동
	
	opener.location.reload(true); //부모창이 있으면 새로고침
	self.close(); //팝업창 닫기

});// end of $(document).ready(function(){})---------------
	
</script>