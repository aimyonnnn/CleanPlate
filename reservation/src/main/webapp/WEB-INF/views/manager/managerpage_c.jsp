<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Managerpage</title>
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
            <h2>관리자페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
						<!-- 사이드바 위 여백 -->
                    </div>
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../manager/managerpage.jsp'">공지사항</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../manager/managerpage_ceo.jsp'">점주관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../manager/managerpage_c.jsp'">쿠폰관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../manager/managerpage_de.jsp'">신고 경고/정지</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
                <!-- 내용 -->
                <div class="row align-items-center ">
                  <div class="col d-flex justify-content-end">
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#coupon">쿠폰등록</button>
                  </div>
                    <table class="table table-striped mt-5 text-center">
                        <thead>
                            <tr>
                                <th>쿠폰명</th>
                                <th>종료일</th>
                                <th>남은 갯수</th>
                                <th>쿠폰내용</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>신규회원 쿠폰</td>
                                <td>가입일로부터 1달</td>
                                <td>50</td>
                                <td>모든 가게에서 10% 할인</td>
                                <td>
                                    <button type="button" class="btn btn-outline-secondary text-black p-3">수정</button>
                                    <button type="button" class="btn btn-outline-secondary text-black p-3">삭제</button>
                                </td>
                            </tr>
                            <tr>
                                <td>10000원 할인 쿠폰</td>
                                <td>2023-06-10</td>
                                <td>20</td>
                                <td>50000원 이상 주문시 10000원 할인</td>
                                <td>
                                    <button type="button" class="btn btn-outline-secondary text-black p-3">수정</button>
                                    <button type="button" class="btn btn-outline-secondary text-black p-3">삭제</button>
                                </td>
                            </tr>
                        </tbody>
                    </table> 
                    
                </div>


            <!-- 내용 영역 -->
            </div>
        </div>
    </div>
    
   	<!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 쿠폰등록 입력창 -->
    <div class="modal fade" id="coupon" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">쿠폰등록</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="input-group mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default">쿠폰이름</span>
              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default">갯수</span>
              <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default">종료일</span>
              <input type="datetime" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary">등록</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 