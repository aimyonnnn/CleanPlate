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
    <div class="row gy-3 justify-content-center text-center">
        <div class="col-12">
	      <div class="list-group list-group-horizontal">
	        <a href="../help/help_home.jsp" class="list-group-item list-group-item-action" aria-current="true">
	          공지사항
	        </a>
	        <a href="../help/help_fq.jsp" class="list-group-item list-group-item-action">FAQ</a>
	        <a href="../help/help_qa.jsp" class="list-group-item list-group-item-action active">Q&A</a>
	      </div>
        </div>
        <div class="col-6">
            <div class="list-group list-group-horizontal">
                <a href="../help/help_qa_2.jsp" class="list-group-item list-group-item-action">문의하기</a>
                <a href="../help/help_qa.jsp" class="list-group-item list-group-item-action active" aria-current="true">문의내역</a>
            </div>
        </div>
    </div>
</div>

<!-- 문의 내역 영역 -->
<div class="container mt-5">
  <div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <div class="container text-center">
          <div class="row">
            <div class="col-1">
              1
            </div>
            <div class="col-6">
              로그인이 안돼요
            </div>
            <div class="col-2">
              2023-05-22
            </div>
            <div class="col-1"> 
              문의 완료
            </div>
            <div class="col-1"> 
              홍길동
            </div>
          </div>
        </div>
        </button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
          <div class="btn-group-sm text-end" role="group" aria-label="Basic outlined example">
            <a class="btn btn-outline-primary">삭제</a>
            <a class="btn btn-outline-primary">수정</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
        <div class="container text-center">
          <div class="row">
            <div class="col-1">
              1
            </div>
            <div class="col-6">
              로그인이 안돼요
            </div>
            <div class="col-2">
              2023-05-22
            </div>
            <div class="col-1"> 
              문의 완료
            </div>
            <div class="col-1"> 
              홍길동
            </div>
          </div>
        </div>
        </button>
      </h2>
      <div id="collapse1" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
          <div class="btn-group-sm text-end" role="group" aria-label="Basic outlined example">
            <a class="btn btn-outline-primary">삭제</a>
            <a class="btn btn-outline-primary">수정</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
        <div class="container text-center">
          <div class="row">
            <div class="col-1">
              1
            </div>
            <div class="col-6">
              로그인이 안돼요
            </div>
            <div class="col-2">
              2023-05-22
            </div>
            <div class="col-1"> 
              문의 완료
            </div>
            <div class="col-1"> 
              홍길동
            </div>
          </div>
        </div>
        </button>
      </h2>
      <div id="collapse2" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
          <div class="btn-group-sm text-end" role="group" aria-label="Basic outlined example">
            <a class="btn btn-outline-primary">삭제</a>
            <a class="btn btn-outline-primary">수정</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
        <div class="container text-center">
          <div class="row">
            <div class="col-1">
              1
            </div>
            <div class="col-6">
              로그인이 안돼요
            </div>
            <div class="col-2">
              2023-05-22
            </div>
            <div class="col-1"> 
              문의 완료
            </div>
            <div class="col-1"> 
              홍길동
            </div>
          </div>
        </div>
        </button>
      </h2>
      <div id="collapse3" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
          <div class="btn-group-sm text-end" role="group" aria-label="Basic outlined example">
            <a class="btn btn-outline-primary">삭제</a>
            <a class="btn btn-outline-primary">수정</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 페이지 이동 영역 -->
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
  <!-- 검색 영역 -->
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