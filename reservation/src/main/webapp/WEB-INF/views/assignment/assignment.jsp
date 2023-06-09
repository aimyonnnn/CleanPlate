<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Assignment</title>
    <!-- AOS 라이브러리 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
    
    body {
        background-color: #f8f9fa;
    }
    .container {
    margin-top: 50px;
    }

    .card {
        border: none;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-img-top {
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .card-title {
        font-size: 24px;
        font-weight: bold;
        margin-top: 15px;
        margin-bottom: 20px;
        color: #333;
        text-align: center;
    }

    .card-text {
        color: #555;
    }

    .card-price {
        font-size: 16px;
        font-weight: bold;
        margin-top: 10px;
    }

    .btn-deal,
    .btn-chat {
        margin-top: 15px;
    }

    .banner {
        background-color: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 30px;
        text-align: center;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .banner-title {
        font-size: 32px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
    }

    .banner-description {
        font-size: 18px;
        color: #555;
    }
 
</style>
</head>
<body style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(${pageContext.request.contextPath }/resources/images/1.jpg); background-size: cover;">
  
     <div class="d-flex justify-content-end mt-5 me-5">
	      <div class="btn-group">
		    <c:choose>
		        <c:when test="${empty sessionScope.sId}">
		        	<!-- 세션 id가 존재하지 않을 경우 로그인 버튼 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='member'">로그인</button>
		        </c:when>
		        <c:otherwise>
		        	<!-- 세션 id가 존재할 경우 세션 아이디에 저장된 회원 닉네임 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='member'">${sessionScope.sId} 님</button>
					<!-- 세션 id가 존재할 경우 예약내역 버튼 활성화 -->
					<button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='memberRSList'">예약내역</button>
		            <!-- 세션 id가 존재할 경우 로그아웃 버튼 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='logout'" id="logout">로그아웃</button>
		        </c:otherwise>
		    </c:choose>
		</div>
     </div> 
        
    <div class="container">
        <div class="banner">
            <h2 class="banner-title">당신의 예약을 양도해보세요!</h2>
            <p class="banner-description">누군가의 특별한 날을 더욱 특별하게 만들어주세요.</p>
        </div>
        <div class="row">

            <div class="col-4"  data-aos="fade-up" data-aos-anchor-placement="center-bottom">
                <div class="card">
                    <img src="https://via.placeholder.com/200" class="card-img-top" alt="Item Image">
                    <div class="card-body">
                        <h5 class="card-title">광안 다이닝 2인권</h5>
                        <p class="card-text">광안 다이닝 2인권을 양도합니다</p>
                        <p class="card-date">예약 날짜 : <span>6/29일 오후 3시</span></p>
                        <p class="card-price">가격 : <span>500,000원</span></p>
                        <button type="button" class="btn btn-success btn-chat w-100" id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'">채팅으로 문의하기</button>
                    </div>
                </div>
            </div>

            <div class="col-4"  data-aos="fade-up" data-aos-anchor-placement="center-bottom">
                <div class="card">
                    <img src="https://via.placeholder.com/200" class="card-img-top" alt="Item Image">
                    <div class="card-body">
                        <h5 class="card-title">광안 다이닝 2인권</h5>
                        <p class="card-text">광안 다이닝 2인권을 양도합니다</p>
                        <p class="card-date">예약 날짜 : 6/29일 오후 3시</p>
                        <p class="card-price">가격 : 500,000원</p>
                        <button type="button" class="btn btn-success btn-chat w-100" id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'">채팅으로 문의하기</button>
                    </div>
                </div>
            </div>

            <div class="col-4"  data-aos="fade-up" data-aos-anchor-placement="center-bottom">
                <div class="card">
                    <img src="https://via.placeholder.com/200" class="card-img-top" alt="Item Image">
                    <div class="card-body">
                        <h5 class="card-title">광안 다이닝 2인권</h5>
                        <p class="card-text">광안 다이닝 2인권을 양도합니다</p>
                        <p class="card-date">예약 날짜 : 6/29일 오후 3시</p>
                        <p class="card-price">가격 : 500,000원</p>
                        <button type="button" class="btn btn-success btn-chat w-100" id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'">채팅으로 문의하기</button>
                    </div>
                </div>
            </div>

        </div>
       </div>
    
	  <div style="height: 300px; width: 100%"></div>
 	
 	<!-- AOS 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script> AOS.init();</script> 
</body>
</html>