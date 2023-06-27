<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <!-- 이부분은 지우면 안됩니다 -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css">
	<title>Clean plate</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 이부분은 지우면 안됩니다 -->
<body>
	<!-- TOP 시작 -->
	<header>
		<%@ include file="../common/common_header.jsp" %>
	</header>
	<!-- TOP 끝 -->

	<!-- 예약내역 내용 시작-->
	<div class="container">
	    <div class="row">
	        <div class="col-md-12" style="text-align: center;">
	        	<img src="${pageContext.request.contextPath }/resources/images/reservation.png" style="margin-top: 15px; width: 100px; height: 100px;">
	            <p class="mt-4 mb-4" style="font-size: 30px; line-height:36px; letter-spacing: -3px;">예약이 완료되었습니다.</p>
	        </div>
	    </div>
	    <div class="row">
	        <div class="mt-2 col-md-12 text-center">
	            <img src="${pageContext.request.contextPath }/resources/upload/${reservation.res_photo1}" width="100" height="100"
	                 class="rounded mx-auto d-block" height="300px" width="500px">
	            <h2 class="mt-4 mb-4 fw-bold" style="line-height:36px; letter-spacing: -3px;">${reservation.res_name }</h2>
	        </div>
	    </div>
	    <div class="container">
		    <div class="row">
		        <div class="col-md-12">
		        	<!-- 예약내역 테이블 시작 -->
		            <table class="mt-3 table d-flex justify-content-center">
		                <tbody>
		                    <tr>
		                        <th>예약번호</th>
		                        <td>${reservation.r_idx }</td>
		                    </tr>
		                    <tr>
		                        <th>날짜</th>
		                        <td><fmt:formatDate value="${reservation.r_date }" pattern="yyyy년 MM월 dd일"/></td>
		                    </tr>
		                    <tr>
		                        <th>시간</th>
		                        <td><fmt:formatDate value="${reservation.r_date }" pattern="HH시 mm분"/></td>
		                    </tr>
		                    <tr>
		                        <th>인원</th>
		                        <td>${reservation.r_personnel } 명</td>
		                    </tr>
		                    <tr>
		                        <th>예약자</th>
		                        <td>${reservation.m_name } 님</td>
		                    </tr>
		                    <tr>
		                        <th>예약코스</th>
		                        <td>${reservation.me_name }</td>
		                    </tr>
		                    <tr>
		                        <th>예약비용</th>
		                        <td>${reservation.r_amount } 원</td>
		                    </tr>
		                    <tr>
		                        <th>테이블 수</th>
		                        <td>${reservation.r_tables } 개</td>
		                    </tr>
		                    <tr>
		                        <th>[오시는길]</th>
		                        <td>${reservation.res_address } ${reservation.res_detailAddress }</td>
		                    </tr>
		                    <tr>
		                        <th>[편의시설]</th>
		                        <td>
		                        	${reservation.res_amenity} <br>
		                            ${reservation.res_amenity_info }
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>[안내사항]</th>
		                        <td>
		                            예약 변경 및 취소는 예약일 기준 일주일 전까지만 가능합니다.<br>
		                            그 이후로는 환불 및 날짜변경이 불가하니 변동사항 있으실 경우<br>
		                            사전에 레스토랑으로 연락 주시기 바랍니다.
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <!-- 예약내역 테이블 끝 -->
		        </div>
		        <!-- 예약내역 버튼 -->
		        <div class="d-flex justify-content-center">
			        <button type="button" class="btn btn-outline-warning mb-2" style="margin-left: 10px;" id="reservationList">나의 예약내역 바로가기</button>
		        	<button type="button" id="mainButton" class="btn btn-outline-secondary mb-2" style="margin-left: 5px;">메인으로 가기</button>
		        </div>
		    </div>
		</div>
	</div>
	<!-- 예약내역 내용 끝-->
	
	<script>
	<!-- 마이페이지 예약내역 바로가기 -->
	$("#reservationList").click(function() {
 	    window.location.href = '<c:url value="memberRSList" />';
 	});
	<!-- 마이페이지 예약내역 바로가기 끝 -->
	
 	<!-- 버튼 클릭 시 메인화면으로 가기 -->
 	$("#mainButton").click(function() {
 	    window.location.href = '<c:url value="/" />';
 	});
 	</script>
	
    <!-- footer -->
	<footer class="footer">
		<%@ include file="../common/common_footer.jsp" %>
	</footer>
    <!-- footer -->
</body>
</html>
