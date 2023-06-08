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
    <h2>가게 정보 수정</h2>
  </div>

<div class="container">

  <form action="" th:action method="post">
    <div>
      <label for="storeIdx">가게 번호</label>
      <input type="text" id="storeIdx" name="storeIdx" class="form-control" value="1" readonly>
      <%-- 각 text에 DB 연동 후 th:value="${idx 값}" 추가 --%>
    </div>
    <div>
      <label for="storeImg">가게 대표이미지</label>
      <input type="image" id="storeImg" name="storeImg" class="form-control" src="#">
      <%-- 각 text에 DB 연동 후 th:value="${idx 값}" 추가 --%>
    </div>
    <div>
      <label for="StoreName">가게 이름</label>
      <input type="text" id="storeName" name="storeName" class="form-control" value="동백키친" readonly>
    </div>
    <div>
      <label for="ownerId">점주 ID</label>
      <input type="text" id="ownerId" name="ownerId" class="form-control" value="hong2023" readonly>
    </div>
    <div>
      <label for="ownerName">점주 이름</label>
      <input type="text" id="ownerName" name="ownerName" class="form-control" value="홍길동" readonly>
    </div>
    <div>
      <label for="storeTel">전화 번호</label>
      <input type="text" id="storeTel" name="storeTel" class="form-control" value="010-1234-1234" readonly>
    </div>
    <div>
      <label for="storeAdress">가게 주소</label>
      <input type="text" id="storeAdress" name="storeAdress" class="form-control" value="부산진구 123-12344" readonly>
    </div>
    <div>
      <label for="storeDate">가게 등록일</label>
      <input type="text" id="storeDate" name="storeDate" class="form-control" value="2023-06-07" readonly>
    </div>

    <hr class="my-4">

    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="submit">삭제하기</button>
      </div>
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg"
                onclick="location.href='adminStore.jsp'"
                type="button">취소</button>
      </div>
    </div>
  </form>
</div> <!-- /container -->

</body>
</html>