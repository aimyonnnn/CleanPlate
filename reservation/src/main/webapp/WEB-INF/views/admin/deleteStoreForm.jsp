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
    <h2>가게 관리</h2>
  </div>

<div class="container">

  <form action="adminRestaurantUpdate" method="post">
    <div>
      <label for="restaurantIdx">가게 번호</label>
      <input type="text" id="res_idx" name="res_idx" class="form-control" value="${restaurantVO.res_idx }">
    </div>
    <div>
      <label for="restaurantBrn">사업자등록번호</label>
      <input type="text" id="res_brn" name="res_brn" class="form-control" value="${restaurantVO.res_brn }">
    </div>
    <div>
      <label for="restaurantName">가게 이름</label>
      <input type="text" id="res_name" name="res_name" class="form-control" value="${restaurantVO.res_name }">
    </div>
    <div>
      <label for="ceoIdx">점주 이름</label>
      <input type="text" id="c_idx" name="c_idx" class="form-control" value="${restaurantVO.c_name }">
    </div>
    <div>
      <label for="restaurantTel">가게 전화번호</label>
      <input type="text" id="res_tel" name="res_tel" class="form-control" value="${restaurantVO.res_tel }">
    </div>
    <div>
      <label for="restaurantAdress">가게 주소</label>
      <input type="text" id="restaurantAdress" name="restaurantAdress" class="form-control" value="${restaurantVO.res_address }, ${restaurantVO.res_detailAddress }">
    </div>

    <hr class="my-4">

   <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="submit">수정하기</button>
        <button class="w-100 btn btn-danger btn-lg" type="button" onclick="location.href='deleteStore'">삭제하기</button>
      </div>
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg"
                onclick="location.href='adminStore'"
                type="button">취소</button>
      </div>
    </div>
  </form>
</div> <!-- /container -->

</body>
</html>