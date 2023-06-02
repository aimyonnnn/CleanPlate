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
      <h2 class="display-5 fst-italic">Event</h2>
    </div>
  </div>
</div>
<div class="container-md">
    <div class="row row-cols-1 row-cols-md-1 g-4">
    <div class="col-11 text-center" >
      <div class="list-group list-group-horizontal" >
        <a href="#" class="list-group-item list-group-item-action active bg-dark border border-dark-subtle" aria-current="true">
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
<br>

<div class="container-md gap-2 col-6 mx-auto">
<div class="d-grid gap-2 col-8 mx-auto">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item active" aria-current="page">이벤트 대상 구분 영역</li>
    <!-- 글자 크기 작고 희미하게 처리되어 있음 ex)일반 회원 -->
  </ol>
  <h1 class="fw-bold">이벤트 타이틀 들어갈 영역</h1>
<!-- 이벤트 타이틀이 들어갈 영역 -->
<span class="badge text-bg-success">진행중</span>
<!-- 진행중인 이벤트의 경우 "진행중", 종료된 이벤트의 경우 "종료" 뱃지 표시 예정(script) -->
<span class="text-secondary ">yyyy. mm. dd. ~ yyyy. mm. dd.</span>
<!-- 이벤트 시작~종료일이 들어갈 영역 -->
</nav>
<br>
<img src="../images/event_ViewTest1.png" style="width: 700px; height: 850px;" >
<!-- 이벤트 사진이 들어갈 영역 -->
<!-- 이벤트에 들어갈 모든 사진은 700X850 px 유지할 것 -->
<br>
<div class="text-sm-start">
<!-- 이벤트 설명이 필요한 경우 작성 -->
				Lorem ipsum dolor sit amet, consectetur
				adipiscing elit. Quisque vel ligula eu nulla elementum luctus. Nunc
				sit amet risus sed quam faucibus feugiat. Nulla facilisi. Aliquam
				scelerisque sem eu iaculis efficitur. Proin ligula neque, tristique
				a ullamcorper sed, laoreet vel velit. Nullam egestas risus quis
				neque lacinia, et auctor odio posuere. Pellentesque vitae dolor
				metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Curabitur gravida consequat urna, maximus sodales elit placerat id.
				Quisque eu erat et eros fringilla porta. Aliquam erat volutpat. Sed
				sed justo venenatis, scelerisque ex quis, ultricies purus. Class
				aptent taciti sociosqu ad litora torquent per conubia nostra, per
				inceptos himenaeos. Donec eget enim ut ante sollicitudin lobortis
				sed vitae mi. Fusce blandit, risus eu eleifend convallis, augue dui
				congue tellus, nec ornare ante velit sed nisi. Vivamus sed fermentum
				odio, sed lobortis odio. Proin gravida lectus quis rutrum fringilla.
				Donec scelerisque ante felis, eget pretium mi scelerisque at. Donec
				pretium augue sit amet odio cursus, in fringilla tortor placerat.
				Nam egestas metus eu erat suscipit eleifend. Aenean rhoncus cursus
				est, sed bibendum urna molestie et. Nam quis turpis eget ex
				hendrerit vulputate eu malesuada leo. Integer ultricies dui sit amet
				placerat placerat. Aenean porttitor nisl suscipit molestie dapibus.
				Maecenas commodo orci eu elit iaculis, et eleifend ex mollis. In
				condimentum eu odio et fermentum. Etiam tristique arcu sit amet
				massa ultricies, in egestas sem lacinia. Cras cursus ut turpis
				aliquam malesuada. Aliquam sed magna sit amet enim viverra congue
				sagittis eu sem. Aenean est sapien, scelerisque sed hendrerit et,
				tincidunt et nulla. Praesent at ipsum id metus auctor maximus.
				Vivamus vitae venenatis nulla. Nunc laoreet aliquam neque, id
				accumsan ante. Suspendisse potenti. Proin id efficitur eros. Aliquam
				eget turpis vitae risus facilisis dictum. Ut non suscipit tortor.
				Phasellus tristique porttitor tristique. Aenean nec nibh turpis.
				Maecenas malesuada ut lectus at aliquet. Fusce nisi tortor, feugiat
				vel orci nec, condimentum interdum felis. Suspendisse hendrerit quam
				justo, quis sodales nunc blandit eu. Sed varius elit sed est
				scelerisque consequat. Ut sodales sodales malesuada. Phasellus sed
				condimentum velit. Nullam sed velit neque. Mauris lacinia, lectus et
				consequat sodales, metus ante pulvinar nisi, volutpat fringilla ante
				nisl vitae nisl. Praesent a orci at nibh tincidunt hendrerit in non
				nulla. Suspendisse varius nisl et lectus tincidunt, non tincidunt
				velit tristique.
<!-- ----------------------------------------------------------------------------------- -->
</div>
<br>
  <button class="btn btn-outline-secondary" type="button" onclick="">목록으로</button>
<!-- onclick 시 history.back() 메서드 호출 시킬 영역 -->
</div>
</div>
<br>

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