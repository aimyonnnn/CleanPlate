<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
  <div class="py-5 text-center">
    <h2>회원 관리</h2>
  </div>
<div class="container">

  <form action="adminMemberUpdate" method="post">
    <div>
      <label for="memberIdx">회원 번호</label>
      <input type="text" id="m_idx" name="m_idx" class="form-control" value="${memberVO.m_idx}">
    </div>
    <div>
      <label for="memberId">회원 ID</label>
      <input type="text" id="m_id" name="m_id" class="form-control" value="${memberVO.m_id}">
    </div>
    <div>
      <label for="memberName">이름</label>
      <input type="text" id="m_name" name="m_name" class="form-control" value="${memberVO.m_name}">
    </div>
    <div>
      <label for="memberTel">전화 번호</label>
      <input type="text" id="m_tel" name="m_tel" class="form-control" value="${memberVO.m_tel}">
    </div>
    <div>
      <label for="memberEmail">이메일</label>
      <input type="text" id="m_email" name="m_email" class="form-control" value="${memberVO.m_email}">
    </div>
    <div>
      <label for="memberStatus">회원 상태</label>
      <input type="text" id="m_status" name="m_status" class="form-control" value="${memberVO.m_status}">
    </div>
    <div>
      <label for="memberUserType">회원 타입</label>
      <input type="text" id="userType" name="userType" class="form-control" value="${memberVO.userType}">
    </div>

    <hr class="my-4">

    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="submit">수정하기</button>
        <button class="w-100 btn btn-danger btn-lg" type="button" onclick="location.href='deleteMember'">삭제하기</button>
      </div>
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg"
                onclick="location.href='adminMember'"
                type="button">취소</button>
      </div>
    </div>
  </form>
</div> <!-- /container -->

</body>
</html>