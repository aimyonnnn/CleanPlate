<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>FIND ID/PASSWD</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->
  

	<!-- 아이디/ 비밀번호 찾기 상단 부분 -->
	<div class="container border-bottom mt-lg-5" style="color: #FFC107;">
    	<h2>비밀번호 찾기</h2>
	</div>
	<!-- 아이디/ 비밀번호 찾기 상단 부분 끝 -->

	<!-- 개인회원 / 기업회원  -->
	<div class="container text-center">
    	<div class="row d-flex justify-content-center">
		<div class="col border border-warning p-4" style="border-radius: 5px;">
        	<h1 class="mt-3 text-start" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">${ceo.c_name } 회원님의 임시 비밀번호</h1>
            <div class="border border-warning m-5">
                <h5 class="h5 m-4">${ceo.c_passwd }</h5>
            </div>
     	</div>
		</div>
		<!-- 개인회원 / 기업회원 끝                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     -->

		<!-- 문의칸과 여백  -->
		<div style="height: 80px; width: 100%;"></div>


	</div>
	<!-- 문의하기 끝 -->


    <!-- 하단 부분 include 처리영역 -->
    	<hr class="mt-5">
		<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 