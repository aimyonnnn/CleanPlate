<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>store_Coupon</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
                        <img src="../images/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
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
              	<h5 class="card-title">쿠폰관리</h5>
				<br>
			<!-- 테이블내용 -->
             <table class="table table-hover" style = "text-align:center;">
			  <thead>
			    <tr>
			      <th scope="col">순서</th>
			      <th scope="col">사용기간</th>
			      <th scope="col">쿠폰명</th>
			      <th scope="col">상세설명</th>
			      <th scope="col">쿠폰관리</th>
			      <th scope="col">선택</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>
						<%
		                session.setAttribute("coupone_Start", "C_start");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_start = (String) session.getAttribute("coupone_Start");
		                out.print(C_start);
		                %> ~
						<%
		                session.setAttribute("coupone_End", "C_end");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_end = (String) session.getAttribute("coupone_End");
		                out.print(C_end);
		                %>		                
		                
				  </td>
			      <td> 5월 어린이 날 예약 이벤트
			      </td>
			      <td> 미성년자를 대상으로 전액 10% 할인   </td>
			      <td>
			      	<button type="button" class="btn btn-outline-dark">발행</button> 
			      </td>
			      <td><input type = "checkbox"></td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>
						<%
		                session.setAttribute("coupone_Start", "C_start2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_start2 = (String) session.getAttribute("coupone_Start");
		                out.print(C_start2);
		                %> ~
						<%
		                session.setAttribute("coupone_End", "C_end2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_end2 = (String) session.getAttribute("coupone_End");
		                out.print(C_end2);
		                %>		                
		                
				  </td>
			      <td> </td>
			      <td> </td>
			      <td>
			      	<button type="button" class="btn btn-outline-dark">발행</button> 
			      </td>
			      <td><input type = "checkbox"></td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>
						<%
		                session.setAttribute("coupone_Start", "C_start3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_start3 = (String) session.getAttribute("coupone_Start");
		                out.print(C_start3);
		                %> ~
						<%
		                session.setAttribute("coupone_End", "C_end3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_end3 = (String) session.getAttribute("coupone_End");
		                out.print(C_end3);
		                %>		                
		                
				  </td>
			      <td> </td>
			      <td> </td>
			      <td>
			      	<button type="button" class="btn btn-outline-dark">발행</button> 
			      </td>
			      <td><input type = "checkbox"></td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>
						<%
		                session.setAttribute("coupone_Start", "C_start4");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_start4 = (String) session.getAttribute("coupone_Start");
		                out.print(C_start4);
		                %> ~
						<%
		                session.setAttribute("coupone_End", "C_end4");
		                session.setMaxInactiveInterval(60*5);
		                
		                String C_end4 = (String) session.getAttribute("coupone_End");
		                out.print(C_end4);
		                %>		                
				  </td>
			      <td> </td>
			      <td> </td>
			      <td>
			      	<button type="button" class="btn btn-outline-dark">발행</button> 
			      </td>
			      <td><input type = "checkbox"></td>
			    </tr>
			   </tbody>
			  </table>
            </div>
            		<br><br>
					<div style="margin:0 auto">
					<input type="submit" value="삭제">
					<input type="button" value="등록" onclick="location.href='store_Couponform.jsp'" >
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