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
        <img src="${pageContext.request.contextPath}/resources/images/logo.gif" style="width: 150px; height: 150px">
        <div>
        	
            <c:choose>
                <c:when test="${empty sessionScope.sId}">
                	<!-- 세션 id가 존재하지 않을 경우 로그인 버튼 출력 -->
                    <button type="button" class="btn btn-outline-light text-black me-2 border-0" onclick="location.href='loginForm'">로그인</button>
                </c:when>
                <c:otherwise>
                    <!-- 세션 id가 존재할 경우 세션 아이디에 저장된 회원 닉네임 출력 -->
                    <button type="button" class="btn btn-outline-light text-black me-2 border-0" onclick="location.href='member'">${sessionScope.sId} 님</button>
			  		<!-- 세션 id가 존재할 경우 예약내역 버튼 활성화 -->
			  		<button type="button" class="btn btn-outline-light text-black border-0 bg-transparent" onclick="location.href='memberRSList'">예약내역</button>
                	<!-- 세션 id가 존재할 경우 로그아웃 버튼 출력 -->
                    <button type="button" class="btn btn-outline-light text-black border-0" onclick="location.href='logout'" id="logout">로그아웃</button>
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
						<li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/" />'>Reservation</a></li>
						<li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/assignment" />'>Assignment</a></li>
						<li class="nav-item"><a class="nav-link" href ='<c:url value="/" />'>Help</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
  	
  	<!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
