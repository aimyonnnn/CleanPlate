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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- ScrollMagic -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
    
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

    <!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/main.css" rel="styleSheet" type="text/css">

    <title>Main</title>

</head>
<body>
	
    <!-- ======================================================================================================================== -->
	<!-- top 시작-->
    <div class="container text-black text-white mt-2 position-absolute top-0 start-50 translate-middle-x" style="z-index: 99999; background: transparent;">
      <div class="container d-flex justify-content-between align-items-center">
        <img src="${pageContext.request.contextPath }/resources/images/logo.gif" style="width: 150px; height: 150px;"
        onclick="location.href='<c:url value="/"/>'">
        
        <div class="btn-group">
		    <c:choose>
		        <c:when test="${empty sessionScope.sId}">
		        	<!-- 세션 id가 존재하지 않을 경우 로그인 버튼 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='loginForm'">로그인</button>
		        </c:when>
		        <c:otherwise>
		        	<!-- 세션 id가 존재할 경우 세션 아이디에 저장된 회원 닉네임 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='member'">${sessionScope.sId} 님</button>
					<!-- 세션 id가 존재할 경우 예약내역 버튼 활성화 -->
					<button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='memberRSList'">예약내역</button>
		            <!-- 세션 id가 "admin"인 경우 관리자 탭 표시 -->
		            <c:if test="${sessionScope.sId eq 'admin'}">
		                <button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='adminMain'">관리자모드</button>
		            </c:if>
		            <!-- 세션 id가 존재할 경우 로그아웃 버튼 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='logout'" id="logout">로그아웃</button>
		        </c:otherwise>
		    </c:choose>
		</div>
      </div>
      
      <!-- 로그아웃 버튼 클릭시 브라우저의 세션 스토리지에 있는 nickname, email값 삭제 -->
      <!-- 카카오 로그아웃 -->
  	  <script>
		$('#logout').click(()=>{
			 sessionStorage.removeItem("nickname");
			 sessionStorage.removeItem("email");
			 Kakao.Auth.logout()
		      .then(function() {
		        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
		        deleteCookie();
		      })
		      .catch(function() {
		        alert('Not logged in');
		      });
		});
  	  </script>    

	  <!-- 로그인, 예약내역 버튼 아래 네비바 -->
      <div class="d-flex justify-content-center">
        <nav class="navbar navbar-expand-lg navbar-light fs-5">
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
                <li class="nav-item me-5"><a class="nav-link active" aria-current="page" href ='<c:url value="/" />' style="color: white;">Home</a></li>
                <li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/reservationMain" />' style="color: white;">Reservation</a></li>
                <li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/assignment" />' style="color: white;">Assignment</a></li>
                <li class="nav-item"><a class="nav-link" href ='<c:url value="/" />' style="color: white;">Help</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <!-- top 끝-->
     
	 <!-- 메인 첫번째 이미지 애니메이션 시작 -->
	 <div class="img">
	  <img src="${pageContext.request.contextPath }/resources/images/1.jpg" alt="">
	  <span class="mask a"></span>
	  <span class="mask b"></span>
	  <span class="mask c"></span>
	  <span class="mask d"></span>
	</div>
	<!-- 메인 첫번째 이미지 애니메이션 끝 -->
	
	<!-- 스크롤 내릴 때 텍스트 좌우 스크롤 애니메이션 처리 시작-->
	<div class="wrapper scroll-spy">
	  <div class="inner">
	    <h1 class="back-to-position to-right delay-0">
	      odit fuga dolor fugiat vero omnis? Fugiat deserunt itaque
	    </h1>
	  </div>
	</div>
	<div class="wrapper scroll-spy">
	  <div class="inner2">
	    <h1 class="back-to-position to-left delay-1">
	      Fugiat deserunt itaque odit fuga dolor fugiat vero omnis?
	    </h1>
	  </div>
	</div>
	<!-- 스크롤 내릴 때 텍스트 좌우 스크롤 애니메이션 처리 끝 -->
	
	<!-- 스크롤 이벤트 처리를 위한 자바스크립트 코드 시작 -->
	<script>
	  const spyEls = document.querySelectorAll('.scroll-spy');
	  spyEls.forEach(function(spyEl, index) {
	    new ScrollMagic.Scene({
	      triggerElement: spyEl,
	      triggerHook: 0.8
	    })
	      .setClassToggle(spyEl, 'show')
	      .addTo(new ScrollMagic.Controller());
	  });
	</script>
	<!-- 스크롤 이벤트 처리를 위한 자바스크립트 코드 끝 -->
	
<!-- =========================================================================================================================== -->
	<!-- footer -->
	<footer class="footer">
		<jsp:include page="common/common_footer.jsp"/>
	</footer>
	<!-- footer -->
<!-- =========================================================================================================================== -->

    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
