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
					<button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='CeoMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary active mt-4 text-black p-3" onclick="location.href='StoreMypage'">가게 등록</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='StoreReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='StoreSales'">매출관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='StoreCoupon'">쿠폰/이벤트</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='CeoMypageDelete'">회원탈퇴</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
              <div class="card" style="margin-top: 20px;">
              
              <div class="card-body" ><br>
              	<h5 class="card-title">매출관리</h5>
				<br>
					  <div class="container">
					    <canvas id="myChart"></canvas>
					  </div>
					
					  <!-- 부트스트랩 -->
					  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
					    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
					    crossorigin="anonymous"></script>

					  <!-- 차트 -->
					  <script>
					    var ctx = document.getElementById('myChart').getContext('2d');
					    var chart = new Chart(ctx, {
// 					     챠트 종류 정하기
					      type: 'line',
					
// 					      챠트데이터
					      data: {
					        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
					        datasets: [{
					          label: 'Total Sales',
					          backgroundColor: 'transparent',
					          borderColor: 'gold',
					          data: [50, 35,15, 40, 40, 50, 45]
					        }]
					      },
					
					    });
					  </script>
  					  <br>
			<!-- 테이블내용 -->
             <table class="table table-hover" style = "text-align:center;">
			  <thead>
			    <tr>
			      <th scope="col">기간</th>
			      <th scope="col">판매액</th>
			      <th scope="col">환불액</th>
			      <th scope="col">총매출</th>
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
		                session.setAttribute("sales_Month", "Input");
		                session.setMaxInactiveInterval(60*5);
		                
		                String Input = (String) session.getAttribute("sales_Month");
		                out.print(Input);
		                %>
				  </td>
			      <td>
			      		<%
		                session.setAttribute("sales_Month", "refund");
		                session.setMaxInactiveInterval(60*5);
		                
		                String refund = (String) session.getAttribute("sales_Month");
		                out.print(refund);
		                %>
			      </td>
			      <td>
			      		<%
		                session.setAttribute("sales_Month", "sales_Total");
		                session.setMaxInactiveInterval(60*5);
		                
		                String sales_Total = (String) session.getAttribute("sales_Month");
		                out.print(sales_Total);
		                %>		      
			      </td>
			    </tr>
			    <tr>
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
						<%
		                session.setAttribute("number_People", "people2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String people2 = (String) session.getAttribute("number_People");
		                out.print(people2);
		                %>
				  </td>
			      <td>
			      		<%
		                session.setAttribute("total_Sales", "sales2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String sales2 = (String) session.getAttribute("total_Sales");
		                out.print(sales2);
		                %>
			      </td>
			      <td>
			      		<%
		                session.setAttribute("sales_Month", "sales_Total2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String sales_Total2 = (String) session.getAttribute("sales_Month");
		                out.print(sales_Total2);
		                %>			      
			      </td>
			    </tr>
			    <tr>
			    <tr>
			      <th scope="row">
			      		<%
		                session.setAttribute("visiting_Date", "visit3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String visit3 = (String) session.getAttribute("visiting_Date");
		                out.print(visit3);
		                %>
			      </th>
			      <td>
						<%
		                session.setAttribute("number_People", "people3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String people3 = (String) session.getAttribute("number_People");
		                out.print(people3);
		                %>
				  </td>
			      <td>
			      		<%
		                session.setAttribute("total_Sales", "sales3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String sales3 = (String) session.getAttribute("total_Sales");
		                out.print(sales3);
		                %>
			      </td>
			      <td>
			      		<%
		                session.setAttribute("sales_Month", "sales_Total3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String sales_Total3 = (String) session.getAttribute("sales_Month");
		                out.print(sales_Total3);
		                %>			      
			      </td>
			    </tr>
			   </tbody>
			   <tfoot>
			   	<tr>
			   	<td>현재까지 총 매출</td>
			   	<td colspan="3"></td>
			   	<td></td>
			   	<td></td>
			   	</tr>
			   </tfoot>
			  </table>
            </div>
            		<br><br>
					<div style="margin:0 auto">
					<input type="button" value="자세히보기" onclick="location.href='StoreSalesinOut'">
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