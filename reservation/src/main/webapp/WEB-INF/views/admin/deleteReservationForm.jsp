<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="py-5 text-center">
    <h2>예약 관리</h2>
  </div>

<div class="container">

  <form action="adminReservationUpdate" method="post">
    <div>
      <label for="reservationIdx">예약 번호</label>
      <input type="text" id="reservationIdx" name="reservationIdx" class="form-control" value="${reservationVO.r_idx}">
    </div>
    <div>
      <label for="reservationPersonnel">예약 인원</label>
      <input type="text" id="reservationPersonnel" name="reservationPersonnel" class="form-control" value="${reservationVO.r_personnel}">
    </div>
    <div>
      <label for="reservationDate">예약 일자</label>
      <input type="text" id="reservationDate" name="reservationDate" class="form-control" value="${reservationVO.r_date}">
    </div>
    <div>
      <label for="storeName">요청사항</label>
      <input type="text" id="storeName" name="storeName" class="form-control" value="${reservationVO.r_request}" style="width: 350px; height: 200px">
    </div>
    <div>
      <label for="paymentDate">총 금액</label>
      <input type="text" id="paymentDate" name="paymentDate" class="form-control" value="${reservationVO.r_amount}">
    </div>
    <div>
      <label for="tax">예약 상태</label>
      <input type="text" id="tax" name="tax" class="form-control" value="${reservationVO.r_status}">
    </div>
    <hr class="my-4">

    <div class="row">
      <div class="col">
<button class="w-100 btn btn-danger btn-lg" type="submit">수정하기</button>
        <button class="w-100 btn btn-danger btn-lg" type="button" onclick="location.href='deleteReservation'">삭제하기</button>
      </div>
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