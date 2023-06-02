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
                <div class="container mt-5">
                  <div class="btn-group w-100">
                      <button type="button" class="btn btn-outline-secondary text-black">신고 회원 리스트</button>
                      <button type="button" class="btn btn-outline-secondary text-black">신고 식당 리스트</button>
                  </div>
                </div>

                <table class="table table-striped mt-5 text-center">
                  <thead>
                    <tr>
                      <th scope="col">신고번호</th>
                      <th scope="col">아이디</th>
                      <th scope="col">신고접수일</th>
                      <th scope="col">회원정보</th>
                      <th scope="col">신고사유</th>
                      <th scope="col">처리</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>Otto</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>2주 정지</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>7일 정지</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>2주 정지</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>2주 정지</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>@twitter</td>
                      <td>@twitter</td>
                      <td>@twitter</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>영구 정지</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>@twitter</td>
                      <td>@twitter</td>
                      <td>@twitter</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>보류</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>@twitter</td>
                      <td>@twitter</td>
                      <td>@twitter</td>
                      <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#declaration">상세보기</button></td>
                      <td>2주 정지</td>
                    </tr>
                  </tbody>
                </table>

            <!--내용 구역-->      
            </div>
        </div>
    </div>
    
    <!--모달 구역-->
    <div class="modal" tabindex="-1" id="declaration">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">신고 사유</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>12 번 신고 | 리뷰에 욕설을 남겼습니다</p>
            <input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" >
            <label class="btn btn-secondary" for="option1">3일 정지</label>

            <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
            <label class="btn btn-secondary" for="option2">7일 정지</label>

            <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off" >
            <label class="btn btn-warning" for="option3">2주 정지</label>

            <input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
            <label class="btn btn-danger" for="option4">영구 정지</label>

          
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary">확인</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <!--모달 구역-->


   	<!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 