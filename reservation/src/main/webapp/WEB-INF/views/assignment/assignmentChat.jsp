<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
   	<!-- AOS 라이브러리 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    
    <!-- jQuery CDN -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    
    <!-- 채널톡 API 시작 -->
	<script>
	  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	
	  ChannelIO('boot', {
	    "pluginKey": "1389a4f2-b052-41e3-8f07-442396576322"
	  });
	</script>
	<!-- 채널톡 API 끝 -->
	
	<!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
	<title>Clean Plate</title>
	
    <style>
	.container-main {
	  max-width: 500px;
	  margin: 0 auto;
	  background-color: #f8f9fa;
	  border-radius: 10px;
	  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	  overflow: hidden;
	}
	
	.chat-header {
	  background-color: #007bff;
	  color: #fff;
	  padding: 15px;
	  border-radius: 10px 10px 0 0;
	}
	
	.chat-header h2 {
	  margin: 0;
	  font-size: 18px;
	}
	
	.message-list {
	  height: 400px;
	  overflow-y: auto;
	  padding: 10px;
	}
	
	.message-bubble {
	  display: flex;
	  align-items: flex-start;
	  margin-bottom: 10px;
	}
	
	.message-bubble .sender-avatar {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  background-color: #007bff;
	  margin-right: 10px;
	}
	
	.message-bubble .message-content {
	  flex: 1;
	  background-color: #fff;
	  padding: 10px;
	  border-radius: 10px;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	}
	
	.message-bubble .message-content p {
	  margin: 0;
	}
	
	.message-input {
	  display: flex;
	  align-items: center;
	  background-color: #f8f9fa;
	  border-top: 1px solid #ccc;
	  padding: 10px;
	}
	
	.message-input input[type="text"] {
	  flex: 1;
	  border: none;
	  padding: 8px;
	  border-radius: 5px;
	  background-color: #fff;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	}
	
	.message-input button {
	  background-color: #007bff;
	  color: #fff;
	  padding: 8px 15px;
	  border: none;
	  border-radius: 3px;
	  margin-left: 10px;
	  cursor: pointer;
	}
	
	.chat-buttons {
	  display: flex;
	  justify-content: center;
	  margin-top: 10px;
	}
	
	.chat-buttons button {
	  background-color: #007bff;
	  color: #fff;
	  padding: 6px 12px;
	  border: none;
	  border-radius: 3px;
	  margin: 0 3px;
	  cursor: pointer;
	  transition: background-color 0.3s ease;
	}
	
	.chat-buttons button:hover {
	  background-color: #0056b3;
	}
	
	.message-input button:hover {
	  background-color: #0056b3;
	}
	</style>

</head>
<body style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(${pageContext.request.contextPath }/resources/images/1.jpg); background-size: cover;">

   <div style="height: 100px; width: 100%"></div>
  		
   <div class="container-main" data-aos="flip-left">
        <div class="chat-header">
            <h2>Clean Plate</h2>
        </div>
        <div class="chat-buttons">
            <button type="button" onclick="openSocket();">대화 연결</button>
            <button type="button" onclick="location.href='assignment'">목록으로</button>
        </div>
        <div class="message-list" id="messages"></div>
        <div style="height: 20px; width: 100%"></div>
        <div class="message-input">
            <input type="text" id="sender" value="${sessionScope.sId}" style="display: none;">
            <input type="text" id="messageinput" placeholder="메시지를 입력하세요">
            <button type="button" onclick="send();">메시지 전송</button>
<%--             <button type="button" onclick="location.href='<c:url value='/'/>'">거래 완료</button> --%>
            <button type="button" id="completeButton">거래 완료</button>
<!--             <button type="button" onclick="closeSocket();">연결 종료</button> -->
<!--             <button type="button" onclick="clearText();">채팅내역 삭제</button> -->
        </div>
    </div>
   	
    <script>
    
 	// 양도글을 작성한 사람에게만 거래 완료 버튼이 보이게 함
 	// 거래완료 버튼 클릭 시 세션의 sId값을 판별하여 양도테이블의 상태컬럼을 거래완료 상태로 변경
    $(document).ready(function() {
    	
      // 페이지 로드 시 버튼 숨기기
      $('#completeButton').hide();
      
      // 세션에서 sId값을 가져온다
      var id = '<%=session.getAttribute("sId") %>';
      console.log("양도글을 작성한 회원인지 판별, 양도글을 작성한 회원이면 거래완료 버튼이 보임");

      // 버튼 표시 여부를 확인하는 Ajax 요청
      $.ajax({
        url: '<c:url value="/checkAssignmentWriter"/>', // 작성자 확인을 위한 요청 URL
        type: 'POST',
        dataType: 'json',
        data: {
          id: id
        },
        success: function(response) {
          console.log(response);

          if (response === 1) { // 양도글을 작성한 회원일 때 (리턴값이 1이면!)
            // 양도글 작성자인 경우 거래완료 버튼을 표시함
            console.log("양도글을 작성한 회원 : " + id);
            $('#completeButton').show();
			
            // 거래완료 버틐 클릭 시 Ajax 요청
            $('#completeButton').click(function() {
              alert("거래 완료를 신청한 회원의 정보 입니다. : " + id);

              $.ajax({
                url: '<c:url value="/aassignmentComplete"/>',
                type: 'POST',
                dataType: 'json',
                data: {
                  id: id
                },
                success: function(response) {
                  
                  console.log(response);
                  console.log(typeof response, response); // number 1 리턴

                  if (response === 1) { // 양도 완료
                    alert('양도가 완료되었습니다. 감사합니다.');
                    location.href = '<c:url value="/"/>';
                  } else {
                    alert('양도가 실패하였습니다.');
                  }
                },
                error: function(xhr, status, error) {
                  alert('AJAX 요청이 실패하였습니다.', error);
                }
              });
            });

          }
        },
        error: function(xhr, status, error) {
          console.log('작성자 확인 요청이 실패하였습니다.', error);
        }
      });
    });

    </script>
    
    
    <!-- 웹소켓 자바스크립트 -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            
            ws = new WebSocket("ws://localhost:8089/test/echo.do");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("채팅방이 종료되었습니다");
            }
            
        }
        
        function send(){
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text = "";
        }
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        
  </script>
  
  	<!-- AOS 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script> AOS.init();</script> 
</body>
</html>