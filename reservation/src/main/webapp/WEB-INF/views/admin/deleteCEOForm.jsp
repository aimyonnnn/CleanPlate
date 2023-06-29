<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  <div class="py-5 text-center">
    <h2>기업 회원 관리</h2>
  </div>
<div class="container">

  <form action="adminCEOMemberUpdate" method="post">
    <div>
      <label for="memberIdx">회원 번호</label>
      <input type="text" id="#" name="#" class="form-control" value="${ceoVO.c_idx}" disabled="disabled">
      <input type="hidden" id="c_idx" name="c_idx" class="form-control" value="${ceoVO.c_idx}">
    </div>
    <div>
      <label for="CEOId">회원 ID</label>
      <input type="text" id="c_id" name="c_id" class="form-control" value="${ceoVO.c_id}">
    </div>
    <div>
      <label for="CEOName">이름</label>
      <input type="text" id="c_name" name="c_name" class="form-control" value="${ceoVO.c_name}">
    </div>
    <div>
      <label for="CEOTel">전화 번호</label>
      <input type="text" id="c_tel" name="c_tel" class="form-control" value="${ceoVO.c_tel}">
    </div>
    <div>
      <label for="CEOEmail">이메일</label>
      <input type="text" id="c_email" name="c_email" class="form-control" value="${ceoVO.c_email}">
    </div>
    <div>
      <label for="CEOStatus">회원 상태</label>
      <input type="text" id="c_status" name="c_status" class="form-control" value="${ceoVO.c_status}" placeholder="상태 1 = 활동중, 상태 2 = 정지, 상태 3 = 탈퇴(요청)">
    </div>
    <hr class="my-4">

    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-info btn-lg" type="submit">수정하기</button>
      </div>
    </div>
      <br>
    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="button" onclick="location.href='deleteCEO?id=${ceoVO.c_id}'">삭제하기</button>
      </div>
    </div>
      <br>
    <div class="row">
      <div class="col">
        <button class="w-100 btn btn-secondary btn-lg" onclick="location.href='adminCEOMember'" type="button">취소</button>
      </div>
    </div>
  </form>
</div> <!-- /container -->

</body>
</html>