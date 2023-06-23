<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CDN -->
    
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common_header.css" />
	
	<!-- jQuery CDN-->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
	
    <title>top</title>
    
    <!-- 채널톡 API 시작 -->
	<script>
	  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	
	  ChannelIO('boot', {
	    "pluginKey": "1389a4f2-b052-41e3-8f07-442396576322"
	  });
	</script>
	<!-- 채널톡 API 시작 -->
    
    <script>
     // 로그아웃 버튼 클릭시 브라우저의 세션 스토리지에 있는 nickname, email값 삭제
     // 카카오 로그아웃
      $(()=>{
  		$('#logout').click(()=>{
			 sessionStorage.removeItem("nickname");
			 sessionStorage.removeItem("email");
			 Kakao.Auth.logout()
			  .then(function(response) {
			    console.log(Kakao.Auth.getAccessToken()); // null
			  })
			  .catch(function(error) {
			    console.log('Not logged in.');
			  });
		});
      })
  	</script>    

</head>
<body>
	
	<div class="container bg-white text-black mt-2">
    <div class="container d-flex justify-content-between align-items-center">
        <img src="${pageContext.request.contextPath}/resources/images/logo.gif" style="width: 150px; height: 150px;" onclick="location.href='<c:url value="/"/>'">
        <div>
        	
           <c:choose>
			  <c:when test="${empty sessionScope.sId and empty sessionScope.cId}">
			    <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='loginForm'">로그인</button>
			  </c:when>
			  <c:otherwise>
			    <c:choose>
			      <c:when test="${not empty sessionScope.sId and sessionScope.sId ne 'admin'}">
			        <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='member'">${sessionScope.sId} 님</button>
			        <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='memberRSList'">예약내역</button>
			      </c:when>
			      <c:when test="${sessionScope.sId eq 'admin'}">
			        <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='adminMain'">관리자모드</button>
			      </c:when>
			      <c:when test="${not empty sessionScope.cId}">
			        <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='restaurantReservation'">${sessionScope.cId} 점주님</button>
			        <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='storeDashBoard'">매출관리</button>
			      </c:when>
			    </c:choose>
			    <button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='logout'" id="logout">로그아웃</button>
			  </c:otherwise>
			</c:choose>
            
        </div>
    </div>
	</div>
    
	<div class="d-flex justify-content-center">
		<nav class="navbar navbar-expand-lg navbar-light fs-5 fw-bold">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav gnb">
						<li class="nav-item me-5"><a class="nav-link active" aria-current="page"  href ='<c:url value="/" />'>Home</a></li>
						<li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/reservationMain" />'>Reservation</a></li>
						<li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/assignment" />'>Assignment</a></li>
						<li class="nav-item"><a class="nav-link" href ='<c:url value="/" />'>Help</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
  	
  	<!-- Bootstrap CDN -->
</body>
</html>
