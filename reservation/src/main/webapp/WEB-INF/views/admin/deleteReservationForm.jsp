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
    <h2>예약 정보 수정</h2>
  </div>

<div class="container">

  <form action="adminReservationUpdate" th:action method="post">
    <div>
      <label for="reservationIdx">예약 번호</label>
      <input type="text" id="reservationIdx" name="reservationIdx" class="form-control" value="1" readonly>
      <%-- 각 text에 DB 연동 후 th:value="${idx 값}" 추가 --%>
    </div>
    <div>
      <label for="memberId">회원 ID</label>
      <input type="text" id="memberId" name="memberId" class="form-control" value="hong2023" readonly>
    </div>
    <div>
      <label for="storeName">가게 이름</label>
      <input type="text" id="storeName" name="storeName" class="form-control" value="동백키친" readonly>
    </div>
    <div>
      <label for="reservationDate">예약 일자</label>
      <input type="text" id="reservationDate" name="reservationDate" class="form-control" value="2023-06-08" readonly>
    </div>
    <div>
      <label for="paymentDate">결제 일자</label>
      <input type="text" id="paymentDate" name="paymentDate" class="form-control" value="2023-06-08" readonly>
    </div>
    <div>
      <label for="tax">결제 금액</label>
      <input type="text" id="tax" name="tax" class="form-control" value="58000" readonly>
    </div>

    <hr class="my-4">

    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="submit">삭제하기</button>
      </div>
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg"
                onclick="location.href='adminReservation.jsp'"
                type="button">취소</button>
      </div>
    </div>
  </form>
</div> <!-- /container -->

</body>
</html>