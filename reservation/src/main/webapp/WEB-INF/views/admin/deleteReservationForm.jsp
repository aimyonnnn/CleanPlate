<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  <div class="py-5 text-center">
    <h2>예약 관리</h2>
  </div>

<div class="container">

  <form action="adminReservationUpdate" method="post">
    <div>
      <label for="reservationIdx">예약 번호</label>
      <input type="text" id="#" name="#" class="form-control" value="${reservationVO.r_idx}" disabled="disabled">
      <input type="hidden" id="r_idx" name="r_idx" class="form-control" value="${reservationVO.r_idx}">
    </div>
    <div>
      <label for="reservationPersonnel">예약 인원</label>
      <input type="text" id="r_personnel" name="r_personnel" class="form-control" value="${reservationVO.r_personnel}">
    </div>
    <div>
      <label for="reservationDateUpdate">예약 일자</label>
      <input type="timestamp" id="r_date" name="r_date" class="form-control" value="${reservationVO.r_date}">
    </div>
    <div>
      <label for="storeName">요청사항</label>
      <input type="text" id="r_request" name="r_request" class="form-control" value="${reservationVO.r_request}" style="width: 100%; height: 200px">
    </div>
    <div>
      <label for="paymentDate">총 금액</label>
      <input type="text" id="r_amount" name="r_amount" class="form-control" value="${reservationVO.r_amount}">
    </div>
    <div>
      <label for="tax">예약 상태</label>
      <input type="text" id="r_status" name="r_status" class="form-control" value="${reservationVO.r_status}">
    </div>
    <hr class="my-4">

    <div class="row">
      <div class="col">
<button class="w-100 btn btn-info btn-lg" type="submit">수정하기</button>
<%--         <button class="w-100 btn btn-danger btn-lg" type="button" onclick="location.href='deleteReservation?idx=${reservationVO.r_idx}'">삭제하기</button> --%>
      <!-- 예약은 바로 삭제가 아닌 status로 취소 상태만 판별 -->
      </div>
   	</div>
   	<br>
    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg"
                onclick="location.href='adminReservation'"
                type="button">취소</button>
      </div>
   </div>
  </form>
</div> <!-- /container -->

</body>
</html>