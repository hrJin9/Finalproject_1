<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>    
<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
var socket = null;

$(document).ready(function(){
	sock = new SockJS('/thumbsup/echo');
	socket = sock;
	
	if("${requestScope.alarmvo}" != ""){ // alarmvo를 넘겨줫다면 
		
		sock.onopen = function() {
			if("${requestScope.message}" != "" && "${requestScope.message}".indexOf("완료") != -1){ // 신청을 성공했으면 웹소켓으로 보내 
					
				const ctgy = "${requestScope.alarmvo.ctgy}";
				const ctnt = "${requestScope.alarmvo.ctnt}";
				//const from_Empno = "${sessionScope.loginuser.employee_no}";
				const from_empname = "${sessionScope.loginuser.name_kr}";
				const to_empno = "${requestScope.alarmvo.to_empno}";
				const linkno = "${requestScope.alarmvo.linkno}";
				console.log("data -> "+ctgy+ctnt+from_empname+to_empno+linkno );
				// alarm 테이블에 데이터를 저장하고 소켓으로 메시지를 보낸다
				const alarmData = {"ctgy":ctgy,
									"ctnt":ctnt,
									"from_empname":from_empname,
									"to_empno":to_empno, // 여러명일수있음. 구분자 콤마(,)
									"linkno":linkno
								   }
				$.ajax({ 
					url : '<%= request.getContextPath()%>/addAlarm.up',
					type : 'POST',
					data : JSON.stringify(alarmData),
					contentType: "application/json; charset=utf-8",
					success : function(data){
						// readyState 1일때 webSocket객체 이벤트를 발생시킨다.
						 if (socket.readyState !== 1)
							 return;
						 
						    // 데이터를 전달 받았을때 
							let socketMsg = ctgy+"," +ctnt+ "," +from_empname+","+to_empno +","+linkno;
							socket.send(socketMsg);
							console.log("socket : " + socket);
					},
					error : function(err){
						console.log(err);
					}
				});
			
			
				setTimeout(function() {
					alert("${requestScope.message}"); //메시지 출력
					// 페이지이동
					location.href = "${requestScope.loc}/"; //페이지 이동
					
					opener.location.reload(true); //부모창이 있으면 새로고침
					self.close(); //팝업창 닫기
				}, 3000);
					
			}
		}
	} else {
		if("${requestScope.message}" != ""){
			alert("${requestScope.message}"); //메시지 출력
		}
		// 페이지이동
		location.href = "${requestScope.loc}"; //페이지 이동
		
		opener.location.reload(true); //부모창이 있으면 새로고침
		self.close(); //팝업창 닫기
	}
		

});// end of $(document).ready(function(){})---------------

	function sendsock(){
		
	}
	
	function alertpage(){
	    
	}
</script>