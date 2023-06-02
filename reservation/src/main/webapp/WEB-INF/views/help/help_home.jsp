<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<%@ include file="../common/common_header.jsp" %>
<!-- ==================================================================================================================================== -->
<!-- 상단 부분 inclue넣을꺼니깐 참고용 -->

<!-- 여기부터 공지사항 메뉴 버튼 -->
<div class="container mt-5">
  <div class="row">
    <div class="col">
      <h2 class="display-5 fst-italic fw-bold">Help</h2>
    </div>
  </div>
</div>
<div class="container mt-4">
  <div class="row">
    <div class="col text-center">
      <div class="list-group list-group-horizontal">
        <a href="../help/help_home.jsp" class="list-group-item list-group-item-action active" aria-current="true">
          공지사항
        </a>
        <a href="../help/help_fq.jsp" class="list-group-item list-group-item-action">FAQ</a>
        <a href="../help/help_qa.jsp" class="list-group-item list-group-item-action">Q&A</a>
      </div>
    </div>
    <!-- 게시판 -->
    <div class="row gy-4">
      <div class="col">
        <table class="table">
          <tbody>
            <tr>
              <td class="fs-5">🔉 서버 작업으로 인한 홈페이지 서비스 일시 중단 안내 (5/11 20:00 ~21:00)</td>
              <td>2023-05-24</td>
            </tr>
            <tr>
              <td class="fs-5">🔉 Apple Pay 도입 안내</td>
              <td>2023-05-24</td>
            </tr>
            <tr>
              <td class="fs-5">개인정보 처방침 변경에 대한 안내</td>
              <td>2023-05-24</td>
            </tr>
            <tr>
              <td class="fs-5">물적분할에 따른 개인정보 이전 안내</td>
              <td>2023-05-24</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- 페이지 이동 버튼 -->
    <div class="row my-4">
      <div class="col-12">
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-3">
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button type="button" class="btn btn-outline-primary">Search</button>
        </form>
      </div>
    </div>
  </div>
</div>




<!-- 하단 부분은 나중에 inclue로 넣을꺼니깐 참고 -->
<!-- ==================================================================================================================================== -->

<%@ include file="../common/common_footer.jsp" %>

      
      
      









    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>