<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row">
          <div class="col">
            <h2>마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-2 align-items-center d-flex">
                <!-- 버튼 그룹 -->
                <!-- 프로필 사진 -->
                <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                    <img src="${pageContext.request.contextPath }/resources/images/adminProfile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>${sessionScope.sId}님 환영합니다</span></p>
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 30px;">내 정보</h2>
            	<div style="margin-left: 40px;">
            		개인정보보호를 위해 회원님의 비밀번호를 다시 한번 확인합니다.
            	</div>
        	</div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10">
                <form action="memberInfo" method="post">
                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="#" class="col-sm-2 col-form-label">아이디</label>
                        <div class="col-md-6">
                            <input type="text" readonly class="form-control-plaintext" name="id" value="${sessionScope.sId}">
                        </div>
                    </div>
                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="#" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="passwd" style="width: 180px;">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-7 mt-5 d-flex justify-content-end">
                            <button type="submit" class="btn btn-warning" style="color: white;">확인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
 
    <!-- 하단 부분 include 처리영역 -->
    	<hr class="mt-5">
		<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 