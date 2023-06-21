<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.google.gson.Gson" %>
      
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>reservation_main</title>
    
    <!-- AOS 라이브러리 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    
    <!-- jQuery CDN -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/main.css" rel="styleSheet" type="text/css">
    
    <!-- 채널톡 API 시작 -->
	<script>
	  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	
	  ChannelIO('boot', {
	    "pluginKey": "1389a4f2-b052-41e3-8f07-442396576322"
	  });
	</script>
	<!-- 채널톡 API 끝 -->
    
    <style>
    
    body {
        background-color: #f8f9fa;
    }
    .container {
    	margin-top: 30px;
    }

    .card {
        border: none;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-img-top {
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .card-title {
        font-size: 24px;
        font-weight: bold;
        margin-top: 15px;
        margin-bottom: 20px;
        color: #333;
        text-align: center;
    }

    .card-text {
        color: #555;
    }

    .card-price {
        font-size: 16px;
        font-weight: bold;
        margin-top: 10px;
    }

    .btn-deal,
    .btn-chat {
        margin-top: 15px;
    }

    .banner {
        background-color: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 30px;
        text-align: center;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .banner-title {
        font-size: 32px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
    }

    .banner-description {
        font-size: 18px;
        color: #555;
    }
    .card-body p {
		margin-top: 3px;
 		margin-bottom: 3px;
	}
    
   /* 텍스트양이 많아서 글자가 넘칠 때 ... 으로 표시 */
	.ellipsis {
	  white-space: nowrap;      /* 줄바꿈 방지 */
	  overflow: hidden;         /* 넘치는 부분 감추기 */
	  text-overflow: ellipsis;  /* 넘치는 부분에 ... 표시 */
	  max-width: 200px;         /* 표시할 최대 너비 설정 */
	}

	/* 마우스를 올리면 전체 텍스트가 보임 */
	.ellipsis:hover {
	  white-space: normal;  /* 줄바꿈 허용하여 전체 텍스트 표시 */
	  overflow: visible;   /* 넘치는 텍스트 표시 */
	  max-width: none;     /* 최대 너비 제한 해제 */
	}
	 
</style>
</head>
<body style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(${pageContext.request.contextPath }/resources/images/1.jpg); background-size: cover;">
  
     <div class="d-flex justify-content-end mt-5 me-5">
	      <div class="btn-group">
	      
			<c:choose>
				<c:when test="${empty sessionScope.sId and empty sessionScope.cId}">
					<button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='loginForm'">로그인</button>
				</c:when>
				<c:otherwise>
				<c:choose>
					<c:when test="${not empty sessionScope.sId and sessionScope.sId ne 'admin'}">
						<button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='member'">${sessionScope.sId} 님</button>
						<button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='memberRSList'">예약내역</button>
					</c:when>
					<c:when test="${sessionScope.sId eq 'admin'}">
						<button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='adminMain'">관리자모드</button>
					</c:when>
					<c:when test="${not empty sessionScope.cId}">
						<button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='restaurantReservation'">${sessionScope.cId} 점주님</button>
						<button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='storeDashBoard'">매출관리</button>
					</c:when>
				</c:choose>
					<button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='logout'" id="logout">로그아웃</button>
			</c:otherwise>
			</c:choose>
		    
		</div>
     </div> 
     
     <!-- 네비바 시작 -->
      <div class="d-flex justify-content-center">
        <nav class="navbar navbar-expand-lg navbar-light fs-5">
          <div class="container-fluid">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button"
              data-bs-toggle="collapse" data-bs-target="#navbarNav"
              aria-controls="navbarNav" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav gnb">
                <li class="nav-item me-5"><a class="nav-link active" aria-current="page" href ='<c:url value="/" />' style="color: white;">Home</a></li>
                <li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/reservationMain" />' style="color: white;">Reservation</a></li>
                <li class="nav-item me-5"><a class="nav-link" href ='<c:url value="/assignment" />' style="color: white;">Assignment</a></li>
                <li class="nav-item"><a class="nav-link" href ='<c:url value="/" />' style="color: white;">Help</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
      <!-- 네비바 끝 -->
      
    
    <!-- container 시작 -->
    <div class="container">
    
    	<!-- 검색 버튼 -->
		<div class="input-group mb-3" style="width: 800px; margin: 0 auto;">
		  <input type="text" class="form-control" placeholder="식당을 검색하세요" id="restaurantName" name="restaurantName">
		  <button class="btn btn-outline-secondary bg-white text-dark" type="button" id="restaurantSearch" name="restaurantSearch">검색</button>
		   <div class="d-inline-block mx-2">
		      <select class="form-select" id="districtSelect">
		        <option selected disabled>지역선택</option>
				<option value="해운대구">해운대구</option>
				<option value="부산진구">부산진구</option>
				<option value="동래구">동래구</option>
				<option value="연제구">연제구</option>
				<option value="사상구">사상구</option>
				<option value="강서구">강서구</option>
				<option value="금정구">금정구</option>
				<option value="사하구">사하구</option>
				<option value="수영구">수영구</option>
				<option value="영도구">영도구</option>
				<option value="중구">중구</option>
				<option value="북구">북구</option>
				<option value="동구">동구</option>
				<option value="남구">남구</option>
				<option value="서구">서구</option>
		      </select>
		    </div>
		</div>
        <!-- 검색 버튼 -->
        
	    <!-- 정렬 버튼 -->
		<div class="col-12 mt-4">
		  <div class="text-center">
		    <button type="button" class="btn btn-warning mx-2" id="storeName">가게이름순</button>
		    <button type="button" class="btn btn-warning mx-2" id="openEarly">오픈시간순</button>
		    <button type="button" class="btn btn-warning mx-2" id="reviewHigh">평점높은순</button>
<!-- 		    <button type="button" class="btn btn-warning mx-2" id="reviewLow">평점낮은순</button> -->
<!-- 		    <button type="button" class="btn btn-warning mx-2" id="reservationMany">예약많은순</button> -->
		   
		  </div>
		</div>
		<!-- 정렬 버튼 -->
		
	   <script>
	   // 식당 JSON 가져오기
       let restaurantList = <%= new Gson().toJson(request.getAttribute("restaurantList")) %>;
       console.log("restaurantList : " + restaurantList);
       
       // 리뷰 JSON 가져오기
       let reviewScores = <%= new Gson().toJson(request.getAttribute("reviewScores")) %>;
       console.log("reviewScores : " + reviewScores);
       
       // 지역 선택에 따른 가게 목록 필터링
       $('#districtSelect').change(function() {
         var selectedDistrict = $(this).val();
         filterRestaurantList(selectedDistrict);
       });
       
       // 선택한 지역에 따라 가게 목록 필터링하여 출력
       function filterRestaurantList(district) {
         var filteredList = restaurantList.filter(function(restaurant) {
           return restaurant.res_detailAddress.includes(district);
         });
         appendList(filteredList);
       }

       // 가게명 가나다순 정렬
       $('#storeName').click(() => {
    	   restaurantList.sort((a, b) => {
    			if(a.res_name > b.res_name) {
    				return 1
    			} else {
    				return -1
    			}
    	   });
    	   console.log(restaurantList);
	       appendList(restaurantList);
       });
       
      // 오픈시간 빠른순 정렬
      $('#openEarly').click(() => {
	  restaurantList.sort((a, b) => {
	      // a.res_open과 b.res_open을 시간 형식(HH:MM)으로 비교하여 오름차순 정렬
	      return a.res_openinghours.localeCompare(b.res_openinghours, undefined, { numeric: true });
	  });
		  console.log(restaurantList);
	      appendList(restaurantList);
	  });
      
      // 평점 높은순 정렬
	  $('#reviewHigh').on('click', () => {
		  reviewScores.sort((a, b) => {
	        return b.average_score - a.average_score;
	    });
		  console.log(reviewScores);
	      appendList(reviewScores);
	  });
      
//       // 평점 낮은순 정렬
// 	  $('#reviewLow').on('click', () => {
// 		  reviewScores.sort((a, b) => {
// 	        return a.average_score - b.average_score;
// 	    });
// 		  console.log(reviewScores);
// 	      appendList(reviewScores);
// 	  });
      
       // appendList() 
       function appendList(restaurantList) {
      	 
       let card = $('#shopList');
	   card.empty();
	         
  	   $.each(restaurantList, (index, data) => {
       console.log(data);
         
       let template = `<div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
              <div class="card">
              <img src="${pageContext.request.contextPath}/resources/images/${'${data.res_photo1}'}" class="card-img-top" alt="Item Image">
                <div class="card-body">
                  <h5 class="card-title"><!-- 가게 이름 -->${'${data.res_name}'}</h5>
                  <p class="card-content ellipsis"><!-- 가게소개 -->${'${data.res_intro}'}</p>
                  <p>주소 : ${'${data.res_address}'} ${'${data.res_detailAddress}'}</p>
                  <p>영업 시간 : ${'${data.res_openinghours}'}</p>
                  <button type="button" class="btn btn-warning btn-chat w-100" id="reservationButton"
                	  onclick="goToReservationReserve('${"${data.res_idx}"}')">예약하기</button>
                </div>
              </div>
            </div> `;
				             
         card.append(template);
        });
       }
       
       </script>
      
      <!-- row 시작 --> 
      <div class="row container-fluid w-100" id="shopList">
      		  
			  <!-- 반복문으로 양도게시판 리스트 출력 시작 -->
			  <c:forEach var="restaurant" items="${restaurantList}">
				  <div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
				    <div class="card">
				      <img src="${pageContext.request.contextPath }/resources/images/${restaurant.res_photo1}" class="card-img-top" alt="Item Image">
				      <div class="card-body">
				        <h5 class="card-title"><!-- 가게 이름 -->${restaurant.res_name}</h5>
				        <p class="card-content ellipsis"><!-- 가게 소개 -->${restaurant.res_intro}</p>
				        <p>주소 : ${restaurant.res_address} ${restaurant.res_detailAddress}</p>
				        <p>영업 시간 : ${restaurant.res_openinghours}</p>
				        <button type="button" class="btn btn-warning btn-chat w-100" id="contactButton" onclick="goToReservationReserve('${restaurant.res_idx}')">예약하기</button>
				      </div>
				    </div>
				  </div>
			 </c:forEach>
	        <!-- 반복문으로 양도게시판 리스트 출력 끝 -->
			  
        </div><!-- row 끝 --> 
			
	 <!-- 실시간 검색을 위한 ajax 요청 -->		
	 <script>
      	// 검색 버튼 클릭 시 <input>의 식당 이름을 가져와서 ajax 요청 후 실시간 출력하기
      	// 한글자 입력할 때 마다 조회됨!
      	$(()=>{
      		
      		$('#restaurantName').on('input', () => {
      			var resName = $('#restaurantName').val();
      			console.log(resName);
      			
      			 $.ajax({
      	                url: '<c:url value="/getRestaurantName"/>',
      	                type: 'POST',
      	                dataType: 'json',
      	                data: {
      	                  name: resName
      	                },
      	                success: function(response) {
      	                console.log(response);
      	                
      	                let card = $('#shopList');
      	                card.empty();
      	                
      	                $.each(response, (index, data) => {
      	     	        console.log(data);
      	     	           
     	     	            let template = `<div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
     	     				               <div class="card">
     	     				            	<img src="${pageContext.request.contextPath}/resources/images/${'${data.res_photo1}'}" class="card-img-top" alt="Item Image">
     	     				                 <div class="card-body">
     	     				                   <h5 class="card-title"><!-- 가게 이름 -->${'${data.res_name}'}</h5>
     	     				                   <p class="card-content ellipsis"><!-- 가게소개 -->${'${data.res_intro}'}</p>
     	     				                   <p>주소 : ${'${data.res_address}'}</p>
     	     				                   <p>영업 시간 : ${'${data.res_openinghours}'}</p>
     	     				                   <button type="button" class="btn btn-warning btn-chat w-100" id="reservationButton" 
     	     				                	 onclick="goToReservationReserve('${"${data.res_idx}"}')">예약하기</button>
     	     				                 </div>
     	     				               </div>
     	     				             </div> `;
     	     				             
     	     	            card.append(template);
      	     	         });
      	                
      	                },
      	                error: function(xhr, status, error) {
      	                  alert('AJAX 요청이 실패하였습니다.', error);
      	             	}
      	            });
      			
      		}); // click
      		
      	}); // ready
        </script>		
		
		<script>
		
		 <!-- AssignmentController-->
		 <!-- 예약하기 클릭 시 가게 상세정보 페이지로 이동 -->
  	     function goToReservationReserve(res_idx) {
  		    location.href = "<c:url value='/getRestaurantInfo'/>?res_idx=" + res_idx;
  	     }
		</script>
	
	</div><!-- container 끝 -->
	
	<!-- 하단 여백을 주기 위한 div 박스 -->
	<div style="height: 300px; width: 100%"></div>
	
	<!-- 좌우 슬라이드 처리를 위한 aos 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script>AOS.init();</script>
	
	<!-- include -->      
	<%-- <jsp:include page="../common/common_footer.jsp"></jsp:include> --%>

    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>