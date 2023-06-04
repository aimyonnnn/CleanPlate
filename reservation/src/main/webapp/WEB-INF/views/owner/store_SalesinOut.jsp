<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>store_Sales</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<link href="top.css" rel="stylesheet" type="text/css">

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
            <h2>점주 마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <!-- 프로필 사진 -->
                    <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                        <img src="../image/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                        <p class="d-flex align-items-center"><span>님 환영합니다</span></p>

                    </div>
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_Mypage.jsp'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary active mt-4 text-black p-3" onclick="location.href='../store/store_Mypage.jsp'">가게 등록</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Reservation.jsp'">예약관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Sales.jsp'">매출관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Coupon.jsp'">쿠폰/이벤트</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_MypageDelete.jsp'">회원탈퇴</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
              <div class="card" style="margin-top: 20px;">
              
              <div class="card-body" ><br>
              	<h5 class="card-title">판매액</h5>
				<br>
					  <div class="container">
					   <canvas id="myChart2"></canvas>
					  </div>
					
					  <!-- 부트스트랩 -->
					  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
					    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
					    crossorigin="anonymous">
					  	</script>
					    
					  <!-- 차트 -->
						  <script>
						  data = {
						        datasets: [{
						            backgroundColor: ['gold','lightyellow','lightgray','gray'],
						            data: [50, 40, 10,40]
						        }],       
// 						       마우스오버
						        labels: ['어른LUNCH','어른DINNER','아동LUNCH','아동DINNER'] 
						    };
						
						
// 						 도넛모양만들기
						  var ctx2 = document.getElementById("myChart2");
						  var myDoughnutChart = new Chart(ctx2, {
						      type: 'doughnut',
						      data: data,
						      options: {}
						  });
						  </script>
  					  <br>
			<!-- 테이블내용 -->
             <table class="table table-hover" style = "text-align:center;">
			  <thead>
			    <tr>
			      <th scope="col">날짜</th>
			      <th scope="col">메뉴</th>
			      <th scope="col">총수량</th>
			      <th scope="col">결제방법</th>			      
			      <th scope="col">선택</th>			      
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">
			      		<%
		                session.setAttribute("visiting_Date", "visit");
		                session.setMaxInactiveInterval(60*5);
		                
		                String visit = (String) session.getAttribute("visiting_Date");
		                out.print(visit);
		                %>
			      </th>
			      <td>
			      		<%
		                session.setAttribute("menuList", "LUNCH");
		                session.setMaxInactiveInterval(60*5);
		                
		                String LUNCH = (String) session.getAttribute("menuList");
		                out.print(LUNCH);
		                %>
		                (3),
		                <%
		                session.setAttribute("menuList", "DINNER");
		                session.setMaxInactiveInterval(60*5);
		                
		                String DINNER = (String) session.getAttribute("menuList");
		                out.print(DINNER);
		                %> (2)
				  </td>
			      <td>
						5
			      </td>
			      <td>
						무통장입금
			      </td>
			      <td>
			      	<input type = "checkbox">
			      </td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row">
			      		<%
		                session.setAttribute("visiting_Date", "visit2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String visit2 = (String) session.getAttribute("visiting_Date");
		                out.print(visit2);
		                %>
			      </th>
			      <td>

				  </td>
			      <td>
					
			      </td>
			      <td>
						카카오페이
			      </td>
			      <td>
			      	<input type = "checkbox">
			      </td>
			      <td></td>
			    </tr>			   
			    </tbody>
			  </table>
            </div>
            		<br><br>
					<div style="margin:0 auto">
					<input type="button" value="삭제" >
					<input type="submit" value="저장" onclick="location.href='store_Sales.jsp'">&nbsp;&nbsp;
					</div>
					<br><br>
            </div>
            
              <div class="card" style="margin-top: 20px;">
              
              <div class="card-body" ><br>
              	<h5 class="card-title">환불액</h5>
				<br>
					  <div class="container">
					   <canvas id="myChart3"></canvas>
					  </div>
					
					  <!-- 부트스트랩 -->
					  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
					    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
					    crossorigin="anonymous">
					  	</script>
					    
					  <!-- 차트 -->
						  <script>
						  data = {
						        datasets: [{
						            backgroundColor: ['red','pink','blue','skyblue'],
						            data: [10, 40, 30,5]
						        }],       
// 						       마우스오버
						        labels: ['건강이상','일정변경','단순변심','천재지변'] 
						    };
						
						
// 						 도넛모양만들기
						  var ctx3 = document.getElementById("myChart3");
						  var myDoughnutChart = new Chart(ctx3, {
						      type: 'doughnut',
						      data: data,
						      options: {}
						  });
						  </script>
  					  <br>
			<!-- 테이블내용 -->
             <table class="table table-hover" style = "text-align:center;">
			  <thead>
			    <tr>
			      <th scope="col">날짜</th>
			      <th scope="col">취소사유</th>
			      <th scope="col">결제방법</th>			      
			      <th scope="col">선택</th>			      
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">
			      </th>
			      <td>
			            일정변경
				  </td>
			      <td>
						무통장입금
			      </td>
			      <td>
			      	<input type = "checkbox">
			      </td>
			    <tr>
			      <th scope="row">
			      </th>
			      <td>
			            천재지변
				  </td>
			      <td>
						무통장입금
			      </td>
			      <td>
			      	<input type = "checkbox">
			      </td>
			    <tr>
			      <th scope="row">
			      </th>
			      <td>
			            단순변심
				  </td>
			      <td>
						카카오페이
			      </td>
			      <td>
			      	<input type = "checkbox">
			      </td>
	   
			    </tbody>
			  </table>
            </div>
            		<br><br>
					<div style="margin:0 auto">
					<input type="button" value="삭제" >
					<input type="submit" value="저장" onclick="location.href='store_Sales.jsp'">&nbsp;&nbsp;
					</div>
					<br><br>
            </div>
            
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