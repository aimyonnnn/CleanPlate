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
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='manager'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='managerpage_n'">공지사항</button>
                    <button type="button" class="btn btn-outline-secondary acitve text-black p-3" onclick="location.href='managerpage_ceo'">점주관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='managerpage_de'">신고 경고/정지</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
                <!-- 내용 -->
       			<div class="container mt-5">
                	<div class="btn-group w-100">
                   		<button type="button" class="btn btn-outline-secondary text-black">입점 가게 리스트</button>
                    	<button type="button" class="btn btn-outline-secondary text-black">입점 승인 요청</button>
                    	<button type="button" class="btn btn-outline-secondary text-black">입점 거절 리스트</button>
                	</div>
             	</div>
            
               <table class="table table-striped mt-5 text-center">
                <thead>
                  <tr>
                    <th scope="col">가게번호</th>
                    <th scope="col">가게명</th>
                    <th scope="col">입점신청일</th>
                    <th scope="col">점주명</th>
                    <th scope="col">등록정보</th>
                    <th scope="col">점주정보</th>
                    <th scope="col">승인</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>Otto</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td>@twitter</td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#staticBackdrop">상세보기</button></td>
                    <td><button type="button" class="btn btn-secondary text-white" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                    <td><button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">승인</button></td>
                  </tr>
                </tbody>
              </table>
             	

			<!--  내용 구역 -->
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