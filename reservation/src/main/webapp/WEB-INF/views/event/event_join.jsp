<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <!-- 이부분은 지우면 안됩니다 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>joinEvent</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
<meta charset="UTF-8">
</head>
<body>
<!-- top include 처리 부분  -->
<%@ include file="../common/common_header.jsp" %>
<!-- top include 처리 부분 끝  -->

<!-- 메인 메뉴 바 영역 -->
<div class="container">
  <div class="row">
    <div class="col">
      <h2 class="display-5 fst-italic fw-bold">Event</h2>
    </div>
  </div>
</div>
<div class="container-md">
    <div class="row  row-cols-1 row-cols-md-1 g-4">
    <div class="col-11 text-center">
      <div class="list-group list-group-horizontal" data-bs-theme="dark">
        <a href="event_active.jsp" class="list-group-item list-group-item-action">진행중인 이벤트</a>
        <a href="event_closed.jsp" class="list-group-item list-group-item-action">종료된 이벤트</a>
        <a href="#" class="list-group-item list-group-item-action active  bg-dark border border-dark-subtle" aria-current="true">
          응모한 이벤트
        </a>
      </div>
    </div>
  </div>
</div>
<!-- 메인 메뉴 바 영역 끝 -->	

<br>

<!-- 메인 뷰 영역 -->
<div class="container-md">
<table class="table">
  <thead>
    <tr>
      <th scope="col">작성일</th>
      <th scope="col">제목</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">2023-05-23</th>
      <td colspan="2"><a class="nav-link" href="">'내가 꿈꾸는 맛집 여행' 이벤트 당첨자 발표
<!-- href에 해당 이벤트 링크 연결 -->
      <span class="badge text-bg-info">new</span></a></td>
<!-- 최신 글의 경우 new badge 표시 -->
    </tr>
    <tr>
      <th scope="row">2023-05-21</th>
      <td colspan="2"><a class="nav-link" href="">'친구 초대하고 PalaTable 더블 쿠폰 받으세요!' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-20</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable이 점주님들을 응원합니다!' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-19</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable 만족도 조사' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-19</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable 만족도 조사' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-19</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable 만족도 조사' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-19</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable 만족도 조사' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-19</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable 만족도 조사' 이벤트 당첨자 발표</a></td>
    </tr>
    <tr>
      <th scope="row">2023-05-19</th>
      <td colspan="2"><a class="nav-link" href="">'PalaTable 만족도 조사' 이벤트 당첨자 발표</a></td>
    </tr>
  </tbody>
</table>
</div>
<!-- 메인 뷰 영역 끝 -->

<!-- 페이지 컨트롤 바 영역 -->
<div class="container-md">
<nav aria-label="...">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled" >
      <span class="page-link">처음</span>
    </li>
    <li class="page-item active" aria-current="page">
      <span class="page-link">1</span>
    </li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <!-- 클릭 시 2페이지로 이동 -->
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <!-- 클릭 시 3페이지로 이동 -->
    <li class="page-item">
      <a class="page-link" href="#">다음</a>
    </li>
  </ul>
</nav>
</div>
<!-- 페이지 컨트롤 바 영역 끝 -->

<!-- ==================================================================================================================================== -->
<!-- 하단 부분은 나중에 inclue로 넣을꺼니깐 참고 -->
<!-- ==================================================================================================================================== -->

<!-- bottom include 처리 영역 -->
<hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
<!-- bottom include 처리 영역 끝 -->

<!-- 이부분은 지우면 안됩니다 -->
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>