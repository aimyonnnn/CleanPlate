<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Clean Plate</title>
    
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
    <script type="text/javascript" src="/assets/global/js/jquery.bxslider.min.js"></script>
    <!-- 위로가기 버튼 CSS -->
    <style type="text/css">
	    #go-top {
		  display: none;
		  position: fixed;
		  right: 100px;
		  bottom: 50px;
		  outline: 0;
		  border: 0;
		  background: transparent;
		  cursor: pointer;
		  z-index: 9999;
		  color: #ffc107; /* 색상변경*/
		}
		
    </style>

    <!-- 위로가기 버튼 CSS -->
    
<script>
  $(document).ready(function() {

    $("#likeBtn").click(function() {
      var rex_idx = "10001";
      var m_id = "member1";
      var liked="false";

          $.ajax({
            url: '${pageContext.request.contextPath }/toggleLikeStatus',
            type: 'GET',
            data: {'rex_idx': rex_idx, 'm_id': m_id, 'liked':liked},
            async: false,
            success: function(response) {
              if (response == "ok") {
                window.location.reload(true);
                alert("ok");
              } else {
                alert("not ok");
              }
            },
            error: function() {
              alert("error");
            }
          });

          var isLiked = true; 

            if (isLiked) {
                $("#likeBtn").removeClass("liked").addClass("unliked");
             } else {
                $("#likeBtn").removeClass("unliked").addClass("liked");
             }
    });
  });
  </script>
    
</head>
<body>
   	<!-- 위로 가기 버튼 -->
   	<button id="go-top"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
	  class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
	  <path fill-rule="evenodd"
	    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
	</svg></button>
	<!-- 위로 가기 버튼 -->
	
	<script>
	var backToTop = () => {
		  // Scroll | button show/hide
		  window.addEventListener('scroll', () => {
		    if (document.querySelector('html').scrollTop > 100) {
		      document.getElementById('go-top').style.display = "block";
		    } else {
		      document.getElementById('go-top').style.display = "none";
		    }
		  });
		  // back to top
		  document.getElementById('go-top').addEventListener('click', () => {
		    window.scrollTo({
		      top: 0,
		      left: 0,
		      behavior: 'smooth'
		    });
		  })
		};
		backToTop();
	</script>
   	<!-- 위로 가기 버튼 -->

	<!-- 가게 상세페이지 시작 -->
	<div class="container-fluid w-50">
		<h3 class="fs-2 fw-bold mt-3 text-center">명월관</h3>
		<!-- 이미지 슬라이드 시작 -->
		<div id="carouselExampleControls" class="mt-4 carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath }/resources/storeimages/myung1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath }/resources/storeimages/myung2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath }/resources/storeimages/myung3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	<!-- 이미지 슬라이드 끝 -->
	
	<!-- 가게 메인 소개 -->
	<div class="mb-2 text-center" style="padding-top:30px">
		 <h5 class="fw-bold p-2">HANWOO BEEF BARBECUE RESTAURANT, MYONGWOLGWAN 명월관</h5>
		 <p style="font-size: 14px;">한우 숯불구이 전문점 명월관은 최상급 한우와 최고급 참숯만을 사용하여 차별화된 한우 맛을 선보입니다.<br>단청 무늬 한옥의 단아한 멋 과 모던함이 돋보이는 실내 인테리어 그리고 한강이 내려다 보이는 아름다운 야외 정원을 갖추고 있어 특별한 날을 위한 최고의 장소 입니다.</p>
	</div>
	<!-- 가게 메인 소개 끝 -->
	<hr>
	
	<!-- 찜하기 버튼 -->
	  <button id="likeBtn" class="unliked">찜하기</button>
	<!-- 찜하기 버튼 -->  
	<!-- 가게 정보 -->
	<div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" colspan="2">
						<h3 class="fw-bold mt-2 p-2 text-center">INFORMATION</h3>
						<button type="button" class="btn btn-outline-secondary text-black rounded-0 float-end">문의하기</button>
					</th>
				</tr>
			</thead>
			<tbody class="table-group-divider" style="border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6;">
			    <tr>
					<td style="border-right: 1px solid #dee2e6; width: 50%;">
					    <dl class="row">
					    	<dt class="col-sm-3">운영 시간</dt>
					        <dd class="col-sm-9">· 11:00 ~ 21:00</dd>
					        <dt class="col-sm-3">휴식 시간</dt>
					        <dd class="col-sm-9">· 15:00 ~ 16:00</dd>
					        <dt class="col-sm-3">정기 휴무일</dt>
					        <dd class="col-sm-9">· 월요일</dd>
					        <dt class="col-sm-3">위치</dt>
					        <dd class="col-sm-9">· 서울특별시 광진구 워커힐로 177 워커힐호텔</dd>
					        <dt class="col-sm-3">예약 및 문의</dt>
					        <dd class="col-sm-9">· 1670-0006</dd>
					    </dl>
					</td>
			      <td>
			      	<dl class="row">
			      		<dt class="col-sm-3">총 좌석 수</dt>
			      		<dd class="col-sm-9">
						    <dl class="row">
						        <dd class="col-sm-12">· 30석</dd>
						        <dd class="col-sm-12">· 8 테이블</dd>
						        <dd class="col-sm-12">· 테이블 당 최대 4인 수용 가능 (단체석 별도 문의)</dd>
					      		<dd><button type="button" class="btn btn-danger rounded-0 mt-3" style="width: 90%;">지금 예약하기</button></dd>
						    </dl>
						</dd>
			      	</dl>
			      </td>
			    </tr>
			    <tr>
			      <td colspan="2">
			      	<dl class="mt-2">
			      		<dt>가게 편의시설</dt>
			      		<dd>· 단체석 / 예약 / 주차 </dd>
			      		<dd>· 명월관 내 주차장은 명월관 이용 고객에 한해 이용하실 수 있으며, 고객 요청 시 유료 발렛 서비스를 제공합니다.</dd>
			      	</dl>
			      </td>
			    </tr>
			</tbody>
		</table>
		<ul class="list-unstyled">
        	<li>· 명월관의 예약 접수는 2개월 전 1일 오전 10시부터 가능합니다. 예) 9월 예약 : 7월1일 오전 10시 이후</li>
        </ul>
		<!-- 가게 정보 끝 -->
		
		<!-- 메뉴 시작 -->
		<div>
			<h3 class="fw-bold mt-2 p-2">MENU</h3>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td><img src="https://www.walkerhill.com/assets/vistawalkerhillseoul/global/images/etc/menu_myongwolgwan0102.jpg" class="d-block" alt="..."></td>
						<td>
							<dl class="row">
								<dt class="mt-3">한우 모둠 한상 런치 스페셜</dt>
					        	<dd class="mt-3">최상의 우육을 선별하여 명월관의 노하우로 숙성 시켰습니다. 이 특별한 한우 모둠 한상은 명월관의 최고급 참숯과 만나 은은한 참숯의 향과 함께 입안 가득 깊은 풍미와 감칠맛을 느끼실수 있습니다.</dd>
								<dt class="mt-3">250,000원</dt>
							</dl>
						</td>
				    </tr>
					<tr>
						<td><img src="https://www.walkerhill.com/assets/vistawalkerhillseoul/global/images/etc/menu_myongwolgwan0102.jpg" class="d-block" class="d-block" alt="..."></td>
						<td>
							<dl class="row">
								<dt class="mt-3">한우 모둠 한상 디너 스페셜</dt>
					        	<dd class="mt-3">최상의 우육을 선별하여 명월관의 노하우로 숙성 시켰습니다. 이 특별한 한우 모둠 한상은 명월관의 최고급 참숯과 만나 은은한 참숯의 향과 함께 입안 가득 깊은 풍미와 감칠맛을 느끼실수 있습니다.</dd>
								<dt class="mt-3">31 0,000원</dt>
							</dl>
						</td>
				    </tr>
				</tbody>
			</table>
		</div>
		<!-- 메뉴 끝 -->
		
		<!-- 리뷰 시작 -->
		<div>
			<h3 class="fw-bold mt-2 p-2">REVIEW</h3>
			<table class="table table-bordered REVIEW">
				<tbody>
					<c:forEach items="${reviewList }" var="reviewList">
						<tr>
							<td><img src="https://www.walkerhill.com/assets/vistawalkerhillseoul/global/images/etc/menu_myongwolgwan0102.jpg" class="d-block" alt="..."></td>
							<td>
								<dl class="row">
									<dt class="mt-3">★★★★☆(별점)</dt>
						        	<dd class="mt-3">${reviewList.m_nick }</dd>
									<dt class="mt-3">${reviewList.rv_comment }</dt>
								</dl>
							</td>
					    </tr>
				    </c:forEach>
					<tr>
						<td><img src="https://www.walkerhill.com/assets/vistawalkerhillseoul/global/images/etc/menu_myongwolgwan0102.jpg" class="d-block" alt="..."></td>
						<td>
							<dl class="row">
								<dt class="mt-3">★★★★★(별점)</dt>
					        	<dd class="mt-3">소고기(닉네임)</dd>
								<dt class="mt-3">최상의 우육을 선별하여 명월관의 노하우로 숙성 시켰습니다. 이 특별한 한우 모둠 한상은 명월관의 최고급 참숯과 만나 은은한 참숯의 향과 함께 입안 가득 깊은 풍미와 감칠맛을 느끼실수 있습니다.(리뷰내용)</dt>
							</dl>
						</td>
				    </tr>
					<tr>
						<td><img src="https://www.walkerhill.com/assets/vistawalkerhillseoul/global/images/etc/menu_myongwolgwan0102.jpg" class="d-block" alt="..."></td>
						<td>
							<dl class="row">
								<dt class="mt-3">★★★★★(별점)</dt>
					        	<dd class="mt-3">소고기(닉네임)</dd>
								<dt class="mt-3">최상의 우육을 선별하여 명월관의 노하우로 숙성 시켰습니다. 이 특별한 한우 모둠 한상은 명월관의 최고급 참숯과 만나 은은한 참숯의 향과 함께 입안 가득 깊은 풍미와 감칠맛을 느끼실수 있습니다.(리뷰내용)</dt>
							</dl>
						</td>
				    </tr>
				</tbody>
			</table>
			<div style="text-align: center;">
			<img id="load" src="${pageContext.request.contextPath }/resources/images/more.png" style="width: 50px; height: 50px;">
			</div>
		</div>
		    <script>
		    $('.REVIEW tr').css("display", "none");

		 // 초기에 보이도록 설정할 행의 개수를 변수에 저장합니다.
		 var initialRowCount = 5;

		 // 처음에 보이도록 설정할 행을 선택합니다.
		 $(".REVIEW tr").slice(0, initialRowCount).css("display", "table-row");

		 $("#load").click(function(e) {
		   e.preventDefault();

		   // 이미 보이는 행의 개수를 세어 변수에 저장합니다.
		   var visibleRowCount = $(".REVIEW tr:visible").length;

		   // 추가적으로 보여줄 행의 개수를 변수에 저장합니다.
		   var increment = 5;

		   // 추가적으로 보여줄 행을 선택합니다.
		   $(".REVIEW tr").slice(visibleRowCount, visibleRowCount + increment).fadeIn(200).css('display', 'table-row');

		   // 모든 행이 보여졌는지 확인합니다.
		   if ($(".REVIEW tr").length <= visibleRowCount + increment) {
		     $('#load').fadeOut(0);
		   }
		 });
			</script>
		<!-- 리뷰 끝 -->
		
		<!-- 찾아오는 길 시작 -->
		<div class="mb-5">
			<h3 class="fw-bold mt-2 p-2">GETTING HERE</h3>
			<div id="map" style="width:100%;height:500px;"></div>
			<!-- 카카오API -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	082bc23de092d792956cd62812f9a103&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('서울특별시 광진구 워커힐로 177', function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
			<!-- 카카오API -->
		</div>
		<!-- 찾아오는 길 끝 -->
	</div>
	<!-- 가게 정보 끝 -->
	</div>
	<!-- 가게 상세페이지 끝 -->
	
	<!-- footer -->
	<footer class="footer">
		<jsp:include page="../common/common_footer.jsp"/>
	</footer>
	<!-- footer -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 
</body>
</html>