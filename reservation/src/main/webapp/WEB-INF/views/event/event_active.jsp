<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <!-- 이부분은 지우면 안됩니다 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>activeMain</title>
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
    <div class="col-11 text-center" >
      <div class="list-group list-group-horizontal" >
        <a class="list-group-item list-group-item-action active bg-dark border border-dark-subtle" aria-current="true">
          진행중인 이벤트
        </a>
        <a href="event_closed.jsp" class="list-group-item list-group-item-action">종료된 이벤트</a>
        <a href="event_join.jsp" class="list-group-item list-group-item-action">응모한 이벤트</a>
      </div>
    </div>
  </div>
</div>
<!-- 메인 메뉴 바 영역 끝 -->	

<br>

<!-- 메인 뷰 영역 -->
<div class="container-md">
<div class="row row-cols-1 row-cols-md-3 g-4">
<!-- 이벤트 하나 당 해당 영역 카드 하나로 묶음 => "col" 클래스명으로 시작과 끝 -->
  <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <!-- 이벤트 미리보기 이미지는 여기에서 수정 -->
      <div class="card-body">
        <h5 class="card-title">종료된 이벤트-이동가능</h5>
        <p class="card-text">2023-05-01 ~ 2023-05-26</p>
        <a href="../event/event_view.jsp" class="stretched-link"></a>
        <!-- 해당 카드 영역 내 어디든 클릭 시 해당 이벤트 링크로 이동 -->
      </div>
    </div>
  </div>
<!-- 이벤트 하나 당 해당 영역 카드 하나로 묶음 -->
  <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card h-100">
      <img src="../images/event_sample.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Event title</h5>
        <p class="card-text">이벤트 기간 작성</p>
        <a href="#" class="stretched-link"></a>
      </div>
    </div>
  </div>
</div>
</div>

<!-- 메인 뷰 영역 끝 -->

<!-- 페이지 컨트롤 바 영역 -->
<div class="container-md">
<nav aria-label="...">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
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