<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.google.gson.Gson" %>
      
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Assignment</title>
    
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
	 
	/* 위로가기 버튼 추가 */
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
</head>
<body style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(${pageContext.request.contextPath }/resources/images/1.jpg); background-size: cover;">
  
  	<!-- 위로 가기 버튼 -->
   	<button id="go-top"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
	  class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
	  <path fill-rule="evenodd"
	    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
	</svg></button>
	
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
                <li class="nav-item"><a class="nav-link" href ='<c:url value="/Notice" />' style="color: white;">Help</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
      <!-- 네비바 끝 -->
    
    <!-- container 시작 -->
    <div class="container">
    
    	<!-- 상단 배너 -->
<!--         <div class="banner"> -->
<!--             <h2 class="banner-title">당신의 예약을 양도해보세요!</h2> -->
<!--             <p class="banner-description">누군가의 특별한 날을 더욱 특별하게 만들어주세요.</p> -->
<!--         </div> -->
       <!-- 상단 배너 --> 
       
       <!-- 검색 버튼 -->
		<div class="input-group mb-4" style="width: 800px; margin: 0 auto;">
		  <input type="text" class="form-control" placeholder="식당을 검색하세요" id="restaurantName" name="restaurantName">
		  <button class="btn btn-outline-secondary bg-white text-dark" type="button" id="restaurantSearch" name="restaurantSearch">검색</button>
       	</div>
       	
        <div class="row">
        	
        	<!-- 정렬 버튼 -->
			<div class="col-12">
			  <div class="text-center">
			    <button type="button" class="btn btn-warning mx-2" id="PriceLow">가격낮은순</button>
			    <button type="button" class="btn btn-warning mx-2" id="PriceHigh">가격높은순</button>
			    <button type="button" class="btn btn-warning mx-2" id="RevAsc">예약빠른순</button>
			    <button type="button" class="btn btn-warning mx-2" id="abc">가게이름순</button>
			    <button type="button" class="btn btn-danger mx-2" id="today">TODAY</button>
			  </div>
			</div>
			<!-- 정렬 버튼 -->
						 
            <!-- 반복문으로 양도게시판 리스트 출력 시작 -->
            <div id="assignContainer" class="row">
                <c:forEach var="assignment" items="${assignmentList}">
                <div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
                  <div class="card">
                    <img src="${pageContext.request.contextPath }/resources/images/${assignment.res_photo1}" class="card-img-top" alt="Item Image">
                    <div class="card-body">
                      <!-- 가게명 클릭시 가게 상세정보 페이지로 이동 -->
                      <h5>
					    <span onclick="goToReservationReserve('${assignment.res_idx}')">
					      ${assignment.res_name}
					    </span>
					  </h5>
					  <!-- 가게명 클릭시 가게 상세정보 페이지로 이동 -->
                      <p>예약 날짜 : <span><fmt:formatDate value="${assignment.r_date }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></span></p>
                      <p>가격 : <span>${assignment.a_price}원</span></p>
                      예약번호 : <input type="text" name="r_idx" value="${assignment.r_idx}" readonly="readonly" style="border: none;">
                      <div class="d-flex">
	                    <button type="button" class="btn btn-warning btn-chat w-50 mx-2"
	                     id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'
	                     + '?r_idx=${assignment.r_idx}&r_date=${assignment.r_date}&a_price=${assignment.a_price}&res_name=${assignment.res_name}&a_sellerId=${assignment.a_sellerId}'">채팅문의</button>
						<button type="button" class="btn btn-warning btn-chat w-50 mx-2" id="payButton"
						onclick="location.href='<c:url value="assignmentPayment"/>' 
						+ '?r_idx=${assignment.r_idx}&r_date=${assignment.r_date}&a_price=${assignment.a_price}&res_name=${assignment.res_name}&a_sellerId=${assignment.a_sellerId}'">바로구매</button>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
            <!-- 반복문으로 양도게시판 리스트 출력 끝 -->
            
        </div>
       </div>
       <!-- container 끝 -->
       
	   <!--  필터 기능 시작 -->	       
      <script>
      
   	   // JSON 데이터 가져오기
       let assignmentList = <%= new Gson().toJson(request.getAttribute("assignmentList")) %>;
//        console.log("assignmentList : " + assignmentList);
       
       // 리뷰 JSON 가져오기
       let reviewScores = <%= new Gson().toJson(request.getAttribute("reviewScores")) %>;
       
       // 가격낮은순 정렬
       $('#PriceLow').click(() => {
         	assignmentList.sort(function(a, b) {
          		 return a.a_price - b.a_price;
       	 	});
// 		     console.log(assignmentList);
	         appendList(assignmentList);
       });
       
       // 가격높은순 정렬
       $('#PriceHigh').click(() => {
       		assignmentList.sort((a, b) => {
				return b.a_price - a.a_price;       			
       		});
// 	       	 console.log(assignmentList);
	         appendList(assignmentList);
       });
       
       // 예약빠른순 정렬
       $('#RevAsc').click(() => {
    	   assignmentList.sort((a, b) => {
    		   return new Date(a.r_date) - new Date(b.r_date);
    	   });
//     	    console.log(assignmentList);
	        appendList(assignmentList);
       });
       
       // 가게명 가나다순 정렬
       $('#abc').click(() => {
    	   assignmentList.sort((a, b) => {
    			if(a.res_name > b.res_name) {
    				return 1
    			} else {
    				return -1
    			}
    	   });
//     	   console.log(assignmentList);
	       appendList(assignmentList);
       });
       
       // 당일예약 필터
       $('#today').click(() => {
         let filteredList = assignmentList.filter(a => {
           let today = new Date();
           let reservationDate = new Date(a.r_date);
           return (
             today.getFullYear() === reservationDate.getFullYear() &&
             today.getMonth() === reservationDate.getMonth() &&
             today.getDate() === reservationDate.getDate()
           );
         });
//          console.log(filteredList);
         appendList(filteredList);
       });
       
         // appendList() 
         function appendList(assignmentList) {
        	 
	         let card = $('#assignContainer');
	         card.empty();
	         
	         $.each(assignmentList, (index, data) => {
// 	           console.log(data);
	           
	           let template = `<div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
				               <div class="card">
				               <img src="${pageContext.request.contextPath}/resources/images/${'${data.res_photo1}'}" class="card-img-top" alt="Item Image">
				                 <div class="card-body">
				                   <h5><span onclick="goToReservationReserve('${"${data.res_idx}"}')">${'${data.res_name}'}</span></h5>
				                   <p>예약 날짜 : <span>${'${data.r_date}'}</span></p>
				                   <p>가격 : <span>${'${data.a_price}'}원</span></p>
				                   예약번호 : <input type="text" name="r_idx" value="${'${data.r_idx}'}" readonly="readonly" style="border: none;">
				                   <div class="d-flex">
				                    <button type="button" class="btn btn-warning btn-chat w-50 mx-2"
				                    	id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'">채팅문의</button>
			                    	<button type="button" class="btn btn-warning btn-chat w-50 mx-2" id="payButton"
			    						onclick="location.href='<c:url value="assignmentPayment"/>' 
			    						+ '?r_idx=${"${data.r_idx}"}&r_date=${"${data.r_date}"}&a_price=${"${data.a_price}"}&res_name=${"${data.res_name}"}&a_sellerId=${"${data.a_sellerId}"}'">바로구매</button>
			                      </div>
				                 </div>
				               </div>
				             </div> `;
				             
	           card.append(template);
	         });
         }
         
         <!-- 가게 상세정보 페이지로 이동 -->
  	     function goToReservationReserve(res_idx) {
  		    location.href = "<c:url value='/getRestaurantInfo'/>?res_idx=" + res_idx;
  		  }
         
	 </script>
	 
	 <script>
      	// 검색 버튼 클릭 시 <input>의 식당 이름을 가져와서 ajax 요청 후 실시간 출력하기
      	// 한글자 입력할 때 마다 조회됨!
      	$(()=>{
      		
      		$('#restaurantName').on('input', () => {
      			var resName = $('#restaurantName').val();
//       			console.log(resName);
      			
      			 $.ajax({
      	                url: '<c:url value="/getRestaurantName"/>',
      	                type: 'POST',
      	                dataType: 'json',
      	                data: {
      	                  name: resName
      	                },
      	                success: function(response) {
//       	                console.log(response);
      	                
      	                let card = $('#assignContainer');
      		         	card.empty();
      		         
      		        	$.each(assignmentList, (index, data) => {
//       		            console.log(data);
      		           
      		            let template = `<div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
      					               <div class="card">
      					               <img src="${pageContext.request.contextPath}/resources/images/${'${data.res_photo1}'}" class="card-img-top" alt="Item Image">
      					                 <div class="card-body">
      					                   <h5><span onclick="goToReservationReserve('${"${data.res_idx}"}')">${'${data.res_name}'}</span></h5>
      					                   <p>예약 날짜 : <span>${'${data.r_date}'}</span></p>
      					                   <p>가격 : <span>${'${data.a_price}'}원</span></p>
      					                   예약번호 : <input type="text" name="r_idx" value="${'${data.r_idx}'}" readonly="readonly" style="border: none;">
      					                   <div class="d-flex">
      					                    <button type="button" class="btn btn-warning btn-chat w-50 mx-2"
      					                    	id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'
      					                    	+ '?r_idx=${"${data.r_idx}"}&r_date=${"${data.r_date}"}&a_price=${"${data.a_price}"}&res_name=${"${data.res_name}"}&a_sellerId=${"${data.a_sellerId}"}'">채팅문의</button>
      				                    	<button type="button" class="btn btn-warning btn-chat w-50 mx-2" id="payButton"
      				    						onclick="location.href='<c:url value="assignmentPayment"/>' 
      				    						+ '?r_idx=${"${data.r_idx}"}&r_date=${"${data.r_date}"}&a_price=${"${data.a_price}"}&res_name=${"${data.res_name}"}&a_sellerId=${"${data.a_sellerId}"}'">바로구매</button>
      				                      </div>
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
	 

	<!-- 하단 여백을 주기 위한 div 박스 -->
	<div style="height: 300px; width: 100%"></div>
 	
 	<!-- AOS 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script> AOS.init();</script>
	<!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</body>
</html>