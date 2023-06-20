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
		        <c:when test="${empty sessionScope.sId}">
		        	<!-- 세션 id가 존재하지 않을 경우 로그인 버튼 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='loginForm'">로그인</button>
		        </c:when>
		       <c:otherwise>
		        	<!-- 세션 id가 존재할 경우 세션 아이디에 저장된 회원 닉네임 출력 -->
		            <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='member'">${sessionScope.sId} 님</button>
					<!-- 세션 id가 존재할 경우 예약내역 버튼 활성화 -->
					<button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='memberRSList'">예약내역</button>
		            <!-- 세션 id가 "admin"인 경우 관리자 탭 표시 -->
		            <c:if test="${sessionScope.sId eq 'admin'}">
		                <button type="button" class="btn btn-outline-light text-white border-0 bg-transparent" onclick="location.href='adminMain'">관리자모드</button>
		            </c:if>
		            <!-- 세션 id가 존재할 경우 로그아웃 버튼 출력 -->
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
    
    	<!-- 상단 배너 -->
        <div class="banner">
            <h2 class="banner-title">당신의 예약을 양도해보세요!</h2>
            <p class="banner-description">누군가의 특별한 날을 더욱 특별하게 만들어주세요.</p>
        </div>
       <!-- 상단 배너 --> 
       	
        <div class="row">
        	
        	<!-- 정렬 버튼 -->
			<div class="col-12">
			  <div class="text-center">
			    <button type="button" class="btn btn-warning mx-2" id="PriceLow">가격낮은순</button>
			    <button type="button" class="btn btn-warning mx-2" id="PriceHigh">가격높은순</button>
			    <button type="button" class="btn btn-warning mx-2" id="PriceBy50">50만원이하</button>
			    <button type="button" class="btn btn-warning mx-2" id="RevAsc">예약빠른순</button>
			    <button type="button" class="btn btn-warning mx-2" id="RevDesc">예약느린순</button>
			    <button type="button" class="btn btn-warning mx-2" id="abc">가나다순</button>
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
                      <p>예약 날짜 : <span>${assignment.r_date}</span></p>
                      <p>가격 : <span>${assignment.a_price}원</span></p>
                      예약번호 : <!-- 예약번호 나중에 지울 예정입니다 --> <input type="text" name="r_idx" value="${assignment.r_idx}" readonly="readonly">
                      <div class="d-flex">
	                    <button type="button" class="btn btn-warning btn-chat w-50 mx-2"
	                     id="contactButton" onclick="location.href='<c:url value="assignAgree"/>'">채팅문의</button>
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
       console.log("assignmentList : " + assignmentList);
       
       // 가격낮은순 정렬
       $('#PriceLow').click(() => {
         	assignmentList.sort(function(a, b) {
          		 return a.a_price - b.a_price;
       	 	});
		     console.log(assignmentList);
	         appendList(assignmentList);
       });
       
       // 가격높은순 정렬
       $('#PriceHigh').click(() => {
       		assignmentList.sort((a, b) => {
				return b.a_price - a.a_price;       			
       		});
	       	 console.log(assignmentList);
	         appendList(assignmentList);
       });
       
       // 50만원이하 필터
       $('#PriceBy50').click(() => {
    	  	let newAssignmentList = assignmentList.filter(a => {
    	  		return a.a_price <= 500000;
    	  	});
    	  	 console.log(newAssignmentList);
	         appendList(newAssignmentList);
       });
       
       // 예약빠른순 정렬
       $('#RevAsc').click(() => {
    	   assignmentList.sort((a, b) => {
    		    return Date.parse(a.r_date) - Date.parse(b.r_date);
    	   });
    	    console.log(assignmentList);
	        appendList(assignmentList);
       });
       
       // 예약느린순 정렬
       $('#RevDesc').click(()=>{
    	   assignmentList.sort((a, b) => {
    		    return Date.parse(b.r_date) - Date.parse(a.r_date);
    	   });
    	    console.log(assignmentList);
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
    	   console.log(assignmentList);
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
         console.log(filteredList);
         appendList(filteredList);
       });
       
         // appendList() 
         function appendList(assignmentList) {
        	 
	         let card = $('#assignContainer');
	         card.empty();
	         
	         $.each(assignmentList, (index, data) => {
	           console.log(data);
	           
	           let template = `<div class="col-md-4 mt-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
				               <div class="card">
				               <img src="${pageContext.request.contextPath}/resources/images/${'${data.res_photo1}'}" class="card-img-top" alt="Item Image">
				                 <div class="card-body">1
				                   <h5><span onclick="goToReservationReserve('${"${data.res_idx}"}')">${'${data.res_name}'}</span></h5>
				                   <p>예약 날짜 : <span>${'${data.r_date}'}</span></p>
				                   <p>가격 : <span>${'${data.a_price}'}원</span></p>
				                   예약번호 : <!-- 예약번호 나중에 지울 예정입니다 --> <input type="text" name="r_idx" value="${'${data.r_idx}'}" readonly="readonly">
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