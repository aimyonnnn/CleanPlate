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
                    <img src="../images/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                    
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                </div>
            </div>
            <div class="col-10"></div>
        </div>
        <div class="row">
            <div class="col-2">
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='member'" style="color: white;">내 정보</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_rslist'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_like'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_rv'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_d'">회원탈퇴</button>
                </div>
            </div>
            <!-- 내용 구역 -->
            <div class="col-md-8" style="margin-left: 5rem;">

                <!-- 내용 -->
                <table class="table  mt-5 text-center" >
                    <thead>
                        <tr>
                            <th></th>
                            <th>가게명</th>
                            <th>별점</th>
                            <th>리뷰수</th>
                            <th>예약</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="..." class="img-thumbnail" alt="가게사진" style="width: 150px; height: 150px;"></td>
                            <td>XX오마카세</td>
                            <td>별점표현</td>
                            <td>리뷰수</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning p-3">예약하기</button>
                                <button type="button" class="btn btn-outline-warning p-3" data-bs-toggle="modal" data-bs-target="#likedelete">찜 취소</button>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="..." class="img-thumbnail" alt="가게사진" style="width: 150px; height: 150px;"></td>
                            <td>XX파인다이닝</td>
                            <td>별점표현</td>
                            <td>리뷰수</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning p-3">예약하기</button>
                                <button type="button" class="btn btn-outline-warning p-3" data-bs-toggle="modal" data-bs-target="#likedelete">찜 취소</button>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>  
                             
            </div>
            <!-- 내용 구역 -->

            </div>

        </div>
    </div>
    
    <!-- 찜 취소 모달창-->
    <div class="modal fade" id="likedelete" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">찜 취소</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              찜을 취소 하시겠습니까?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-warning p-3">확인</button>
              <button type="button" class="btn btn-outline-warning p-3" data-bs-dismiss="modal">취소</button>
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