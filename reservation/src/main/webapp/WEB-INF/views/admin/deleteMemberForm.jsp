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
    <h2>회원 정보 수정</h2>
  </div>

<div class="container">

  <form action="" th:action method="post">
    <div>
      <label for="memberIdx">회원 번호</label>
      <input type="text" id="memberIdx" name="memberIdx" class="form-control" value="1" readonly>
      <%-- 각 text에 DB 연동 후 th:value="${idx 값}" 추가 --%>
    </div>
    <div>
      <label for="memberId">회원 ID</label>
      <input type="text" id="memberId" name="memberId" class="form-control" value="hong2023" readonly>
    </div>
    <div>
      <label for="memberName">이름</label>
      <input type="text" id="memberName" name="memberName" class="form-control" value="홍길동" readonly>
    </div>
    <div>
      <label for="memberTel">전화 번호</label>
      <input type="text" id="memberTel" name="memberTel" class="form-control" value="010-1234-1234" readonly>
    </div>
    <div>
      <label for="MemberEmail">이메일</label>
      <input type="text" id="MemberEmail" name="MemberEmail" class="form-control" value="zz@zz.com" readonly>
    </div>
    <div>
      <label for="reservations">총 예약 수</label>
      <input type="text" id="reservations" name="reservations" class="form-control" value="10" readonly>
    </div>

    <hr class="my-4">

    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="submit">삭제하기</button>
      </div>
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg"
                onclick="location.href='adminMember.jsp'"
                type="button">취소</button>
      </div>
    </div>
  </form>
</div> <!-- /container -->

</body>
</html>