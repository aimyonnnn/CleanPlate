<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Store_MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link href="top.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

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
            <div class="col-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <!-- 프로필 사진 -->
                <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                    <img src="../image/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                    
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 40px;">가게 리스트</h2>
                <button type="button" class="btn btn-warning" style="margin-left: 40px; color: white;" onclick="location.href='StoreInsertPage'">가게 등록</button>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼들-->
                <!-- 클릭된 버튼은 active 표시함-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='CeoMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='StoreList'">가게리스트 </button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='StoreReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='StoreSales'">매출관리</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='CeoMypageDelete'">회원탈퇴</button>
                </div>
            </div>
            <!-- 내용 구역 -->
            <!-- 가게리스트  페이지 시작 -->
                <div class="col-8">
                    <!-- 내용(추후에 foreach문으로 수정할 부분!) -->
                    <table class="table table-striped text-center" style="margin-left:50px;">
                        <thead>
                            <tr>
                                <th>식당이름</th>
                                <th>전화번호</th>
                                <th>식당주소</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>동백키친</td>
                                <td>010-1234-5678</td>
                                <td>부산 부산진구 동천로107번길</td>
                                <td><button type="button" class="btn btn-warning" style="color: white;" onclick="location.href='StoreUpdatePage'">수정</button></td>
                            </tr>
                            <tr>
                                <td>동백키친</td>
                                <td>010-1234-5678</td>
                                <td>부산 부산진구 동천로107번길</td>
                                <td><button type="button" class="btn btn-warning" style="color: white;" onclick="location.href='StoreUpdatePage'">수정</button></td>
                            </tr>
                            <tr>
                                <td>동백키친</td>
                                <td>010-1234-5678 </td>
                                <td>부산 부산진구 동천로107번길</td>
                                <td><button type="button" class="btn btn-warning" style="color: white;" onclick="location.href='StoreUpdatePage'">수정</button></td>
                            </tr>
                        </tbody>
                    </table> 
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