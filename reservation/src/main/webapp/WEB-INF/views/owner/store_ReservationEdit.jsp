<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>store_ReservationEdit</title>
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
            <form action="StoreReservation" method="post">
              <div class="card" style="margin-top: 20px;">
              
              <div class="card-body" ><br>
              	<h5 class="card-title">예약수정</h5>

             <table class="table table-hover" style = "text-align:center;">
			  <thead>
			    <tr>
			      <th scope="col">문의번호</th>
			      <th scope="col">예약회원</th>
			      <th scope="col">예약회원연락처</th>
			      <th scope="col">상세메뉴</th>			      
			      <th scope="col">상세주문</th>
			      <th scope="col">예약상태</th>
			      <th scope="col">선택</th>
			    </tr>
			  </thead>
			  <tbody>

			    <tr>
			      <th scope="row">25 </th>
			      <td>
						<%
		                session.setAttribute("member", "meber_id");
		                session.setMaxInactiveInterval(60*5);
		                
		                String meber_id = (String) session.getAttribute("member");
		                out.print(meber_id);
		                %>
				  </td>
			      <td>
			      		<%
		                session.setAttribute("member", "tel");
		                session.setMaxInactiveInterval(60*5);
		                
		                String tel = (String) session.getAttribute("member");
		                out.print(tel);
		                %>
			      </td>
			      <td>LUNCH<br>
			      	  DINNER
			      </td>
			      <td>
			      	<label>&nbsp;성인 한우오마카세</label>

	           		<br>
			      	<label>&nbsp;아동 한우오마카세</label>
	      	
			       </td>
			      <td>예약완료</td>
			      <td><input type = "checkbox"></td>			      
			    </tr>
			    <tr>
			      <th scope="row">25 </th>
			      <td>
						<%
		                session.setAttribute("member", "meber_id2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String meber_id2 = (String) session.getAttribute("member");
		                out.print(meber_id2);
		                %>
				  </td>
			      <td>
			      		<%
		                session.setAttribute("member", "tel2");
		                session.setMaxInactiveInterval(60*5);
		                
		                String tel2 = (String) session.getAttribute("member");
		                out.print(tel2);
		                %>
			      </td>
			      <td>LUNCH<br>
			      	 DINNER
			      </td>
			      <td>
			      	<label>성인 한우오마카세</label>
	           		<br>
			      	<label>아동 한우오마카세</label>
		      	
			       </td>
			      <td>예약취소</td>
			      <td><input type = "checkbox"></td>			      
			    </tr>
			    <tr>
			      <th scope="row">25 </th>
			      <td>
						<%
		                session.setAttribute("member", "meber_id3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String meber_id3 = (String) session.getAttribute("member");
		                out.print(meber_id3);
		                %>
				  </td>
			      <td>
			      		<%
		                session.setAttribute("member", "tel3");
		                session.setMaxInactiveInterval(60*5);
		                
		                String tel3 = (String) session.getAttribute("member");
		                out.print(tel3);
		                %>
			      </td>
			      <td>LUNCH<br>
			      	  DINNER
			      </td>
			      <td>
			      	<label>성인 한우오마카세</label>

	           		<br>
			      	<label>아동 한우오마카세</label>
		      	
			       </td>
			      <td>예약완료</td>
			      <td><input type = "checkbox"></td>
			    </tr>

			   </tbody>
			  </table>
            </div>
            		<br><br>
					<div style="margin:0 auto">
					<input type="button" value="삭제">
					<input type="submit" value="저장">&nbsp;&nbsp;
					</div>
					<br><br>
            </div>
            </form>
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