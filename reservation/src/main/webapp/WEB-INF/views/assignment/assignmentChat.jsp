<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Clean Plate</title>
    <style>
    
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 20px;
    }

    .container-main {
        max-width: 600px;
		margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        justify-content: center;
	    align-items: center;
	    height: 100%;
    }

    .chat-header {
        text-align: center;
        margin-bottom: 20px;
    }

    .chat-buttons {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .chat-buttons button {
        margin-left: 10px;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .chat-buttons button:hover {
        background-color: #0056b3;
    }

    .message-input {
        display: flex;
        margin-bottom: 20px;
    }

    .message-input input[type="text"] {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    .message-input button {
        margin-left: 10px;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .message-input button:hover {
        background-color: #0056b3;
    }

    .message-list {
        border: 1px solid #ccc;
        padding: 10px;
        height: 300px;
        overflow-y: scroll;
        background-color: #f9f9f9;
        border-radius: 3px;
    }

    .message-list p {
        margin: 0;
        padding: 10px;
        background-color: #fff;
        border-radius: 3px;
        margin-bottom: 5px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
    }
	</style>
	
</head>
<body>

   <div style="height: 100px; width: 100%"></div>
  		
   <div class="container-main">
        <div class="chat-header">
            <h2>Clean Plate</h2>
        </div>
        <div class="chat-buttons">
            <button type="button" onclick="openSocket();">채팅방 참여하기</button>
            <button type="button" onclick="closeSocket();">채팅방 종료하기</button>
            <button type="button" onclick="location.href='<c:url value='/'/>'">홈으로 이동</button>
        </div>
        <div class="message-input">
            <input type="text" id="sender" value="${sessionScope.kId}" style="display: none;">
            <input type="text" id="messageinput" placeholder="메시지를 입력하세요">
            <button type="button" onclick="send();">메시지 전송</button>
            <button type="button" onclick="clearText();">채팅내역 삭제</button>
        </div>
        <div class="message-list" id="messages"></div>
    </div>
    
    <!-- 웹소켓 자바스크립트 -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            
            ws = new WebSocket("ws://localhost:8080/echo.do");
            
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
</body>
</html>