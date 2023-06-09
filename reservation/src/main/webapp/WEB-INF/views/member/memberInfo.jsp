<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
   	<!-- 공통 상단바 구역 -->
<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row">
          <div class="col">
            <h2>마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-2 align-items-center d-flex">
                <!-- 버튼 그룹 -->
                <!-- 프로필 사진 -->
                <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                    <img src="${pageContext.request.contextPath }/resources/images/adminProfile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 40px;">나의 정보 변경</h2>
        	</div>
        </div>
        
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10">
            	<!-- 내정보 수정 폼 시작 -->
                <form action="#" method="post">
                	<table class="table" style="margin-left: 70px; width: 58%;">
						<tbody>
						    <tr>
						    	<th scope="row" width="150"><label for="name">이름</label></th>
						    	<td><input class="form-control" type="text" id="name" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="id">아이디</label></th>
						    	<td><input class="form-control" type="text" id="id" value="hong" aria-label="Disabled input example" disabled readonly></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="passwd">비밀번호</label></th>
						    	<td colspan="2"><input type="password" class="form-control" id="passwd" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="nick">닉네임</label></th>
						    	<td colspan="2"><input class="form-control" type="text" id="nick" value="냠냠" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="birth">생년월일</label></th>
						    	<td colspan="2"><input class="form-control" type="text" id="birth" value="1990-10-01" aria-label="Disabled input example" disabled readonly></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="phone">휴대폰번호</label></th>
						    	<td style="height: 40px; vertical-align: middle;">
							  		<div class="d-flex align-items-center">
							    		<input class="form-control" type="text" id="phone" value="010-1234-5678" aria-label="default input example" style="width: 365px;">
							        	<button type="button" class="btn btn-outline-warning" style="margin-left: 2px;">인증요청</button>
							    	</div>
							    	<div class="mt-2 d-flex align-items-center">
							    		<input class="form-control" type="text" id="verifyPhone" aria-label="default input example" style="width: 365px;">
							        	<button type="button" class="btn btn-outline-warning" style="margin-left: 2px;">인증확인</button>
							    	</div>
								</td>
						    </tr>
						    <tr>
							    <th scope="row"><label for="email">이메일</label></th>
							    <td colspan="2">
							        <div class="input-group">
							            <input type="text" class="form-control rounded" id="email" value="hong" aria-label="default input example" style="width: 120px;">@
							            <input type="text" class="form-control rounded" id="email2" value="hong" aria-label="default input example" style="width: 120px;"> 
							            <div class="input-group-append">
							                <select class="form-select" id="email-domain" style="margin-left: 2px;">
							                	<option value="">직접입력</option>
							                    <option value="gmail.com">gmail.com</option>
							                    <option value="naver.com">naver.com</option>
							                    <option value="daum.net">daum.net</option>
							                </select>
							            </div>
							        </div>
							    </td>
							</tr>
						  </tbody>
                	</table>
					<div style="margin-left:380px;">
					    <button type="submit" class="btn btn-warning" style="color: white;">수정완료</button>
					</div>
                </form>
                <!-- 내정보 수정 폼 끝 -->
            </div>
        </div>
    </div>
 
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 