<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>store_Couponform</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link href="top.css" rel="stylesheet" type="text/css">

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
            <h2>점주 마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <!-- 프로필 사진 -->
                    <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                        <img src="../image/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                        <p class="d-flex align-items-center"><span>님 환영합니다</span></p>

                    </div>
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_Mypage.jsp'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary active mt-4 text-black p-3" onclick="location.href='../store/store_Mypage.jsp'">가게 등록</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Reservation.jsp'">예약관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Sales.jsp'">매출관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Coupon.jsp'">쿠폰/이벤트</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_MypageDelete.jsp'">회원탈퇴</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
              <div class="card" style="margin-top: 20px;">
              
              <div class="card-body" ><br>
              	<h5 class="card-title">쿠폰발행</h5>
				<br>
				<div style = "float : left">
					발행인
					<input type="text" placeholder="파인다이닝"><br>
	                <br>쿠폰이름
	                <input type="text" placeholder="이름을 입력해주세요" style="width:300px;"><br>
	                <br>쿠폰내용
	                <br><textarea rows="5" cols="50" placeholder = "쿠폰의 사용 조건을 입력해주세요."> </textarea><br>
	                <br>발행일
	                <input type ="date" value = "2023-05-05"><br>
	                <br>발행기간
	                <input type ="date">~<input type ="date"><br>											
	            </div>  

				<div style = "float : right">
					이미지 업로드
					<input type="file" value="" class="real-upload" accept="image/*">											
	            </div>  
	            
              </div>
            		<br><br>
					<div style="margin:0 auto">
					<input type="submit" value="저장" onclick="location.href='store_Coupon.jsp'">&nbsp;&nbsp;
					</div>
					<br><br>
            </div>
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