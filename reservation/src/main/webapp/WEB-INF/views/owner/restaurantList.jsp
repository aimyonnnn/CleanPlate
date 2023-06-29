<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/ceoList.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
					<button type="button" class="btn btn-outline-dark text-white active p-3" onclick="location.href='restaurantList'">가게리스트 </button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <!-- 가게리스트  페이지 시작 -->
                <div class="col-9">
                <button type="button" class="btn btn-dark" style="margin-top: 60px; margin-left: 90px; color: white;" onclick="location.href='restaurantInsertPage'">가게 등록</button>
                    <!-- 내용(추후에 foreach문으로 수정할 부분!) -->
                    <table class="table table-striped text-center" style="margin-left:100px;">
                        <thead>
                            <tr>
                                <th>사업자번호</th>
                                <th>가게명</th>
                                <th>전화번호</th>
                                <th>주소</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                   			<c:forEach var="restaurant" items="${restaurantList }">
	                        	<tr>
	                                <td>${restaurant.res_brn }</td>
	                                <!-- 가게명 클릭시 가게 상세정보 페이지로 이동 -->
	                                <td><a href='getRestaurantInfo?res_idx=${restaurant.res_idx}'>${restaurant.res_name }</a></td>
	                                <td>${restaurant.res_tel }</td>
	                                <td>${restaurant.res_address } ${restaurant.res_detailAddress }</td>
	                                <!-- 수정 버튼 클릭시 파라미터로 사업자번호 전달 -->
	                                <td><button type="button" class="btn btn-dark" style="color: white;" onclick="location.href='restaurantUpdatePage?res_idx=${restaurant.res_idx}'">수정</button></td>
	                        	</tr>
	                        	<!-- 가게 사진 출력 확인용  -->
<!-- 	                        	<tr> -->
<!-- 	                        		<th>가게 사진</th> -->
<!-- 	                        		<td class="td_right"> -->
<%-- 	                        			<c:if test="${not empty restaurant.res_photo1 }"> --%>
<%-- 			                        		<img src="${pageContext.request.contextPath }/resources/upload/${restaurant.res_photo1 }" width="100" height="100"> --%>
<%-- 	                        			</c:if> --%>
<%-- 	                        			<c:if test="${not empty restaurant.res_photo2 }"> --%>
<%-- 			                        		<img src="${pageContext.request.contextPath }/resources/upload/${restaurant.res_photo2 }" width="100" height="100"> --%>
<%-- 	                        			</c:if> --%>
<%-- 	                        			<c:if test="${not empty restaurant.res_photo3 }"> --%>
<%-- 			                        		<img src="${pageContext.request.contextPath }/resources/upload/${restaurant.res_photo3 }" width="100" height="100"> --%>
<%-- 	                        			</c:if> --%>
<!-- 									</td> -->
<!-- 	                        	</tr> -->
	                        </c:forEach>
                        </tbody>
                    </table> 
                </div>
        </div>
            </div>
 
    
    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
	<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 