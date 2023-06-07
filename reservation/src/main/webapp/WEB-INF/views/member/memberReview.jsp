<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 40px;">내가 쓴 리뷰</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='member'" style="color: white;">내 정보</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 구역 -->
            <div class="col-10">
                
                <!-- 내용 -->
                <div class="row align-items-center" style="margin-left: 50px;">
                    <div class="card ms-3 me-5 mt-5 align-items-center" style="width: 20rem;">
                        <img src="..." width="150" height="150" class="card-img-top" alt="리뷰사진">
                        <div class="card-body">
                          <h5 class="card-title">오마카세</h5>
                          <p class="card-text">리뷰내용</p>
                          <a href="#" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#reviewmodify">수정</a>
                          <a href="#" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#reviewdelete">삭제</a>
                        </div>
                    </div>
                    <div class="card ms-3 me-5 mt-5 align-items-center" style="width: 20rem;">
                        <img src="..." width="150" height="150" class="card-img-top" alt="리뷰사진">
                        <div class="card-body">
                          <h5 class="card-title">파인다이닝</h5>
                          <p class="card-text">리뷰내용</p>
                          <a href="#" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#reviewmodify">수정</a>
                          <a href="#" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#reviewdelete">삭제</a>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>
    
    
    <!-- 수정 버튼 클릭시 리뷰 수정 모달창-->
    <div class="modal" id="reviewmodify" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">리뷰 수정</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="#" method="post" enctype="multipart/form-data">
                   <b>리뷰 사진</b> <input type="file" name="file"><br>
                   <b>별점</b> <br>
                   <b>내용</b> <br> 
                   <textarea cols="50" rows="5" name="content"></textarea>
                </form>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" style="color: white;">수정</button>
              <button type="button" class="btn btn-warning" style="color: white;"data-bs-dismiss="modal">취소</button>
            </div>
          </div>
        </div>
    </div>


    <!-- 삭제 버튼 클릭시 리뷰 삭제 모달창-->
    <div class="modal" id="reviewdelete" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">리뷰 삭제</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              선택하신 리뷰를 삭제 하시겠습니까?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" style="color: white;">삭제</button>
              <button type="button" class="btn btn-warning" style="color: white;" data-bs-dismiss="modal">취소</button>
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