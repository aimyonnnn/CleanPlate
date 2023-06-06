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
            <div class="col-md-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <!-- 프로필 사진 -->
                    <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                        <img src="../images/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                        <p class="d-flex align-items-center"><span>님 환영합니다</span></p>

                    </div>
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary active text-black p-3" onclick="location.href='mypage_rs'" style="color: white;">예약 내역</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='mypage_like'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='mypage_rv'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='mypage_d'">회원탈퇴</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
                <!-- 내용(수정할 부분!) -->
                <table class="table table-striped mt-5 text-center">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>식당</th>
                            <th>날짜</th>
                            <th>시간</th>
                            <th>상태</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>칸다소바</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000002</td>
                            <td>대독장</td>
                            <td>23-05-20</td>
                            <td>12:00</td>
                            <td>이용완료</td>
                            <td><button type="button" class="btn btn-outline-secondary text-black p-3">상세보기</button></td>
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