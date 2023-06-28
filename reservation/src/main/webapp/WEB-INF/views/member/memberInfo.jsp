<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
    <script>
	function upOK(){
		// submit 확인 스크립트
   	 	if(confirm('수정하시겠습니까?') == true){ // 확인
       		document.form.submit();
   	 		alert('수정되었습니다.');
    	} else { // 취소
    		alert('취소되었습니다.');
    		return;
   		}
	}
		// email domain selectbox 값 받아오기
        var selectBoxChange = function(value) {
        	$("#changeInput").val(value);
        }
		
		// startPhoneNumber selectbox 값 받아오기
		var selectBoxChange2 = function(value) {
        	$("#changeInput2").val(value);
        }
</script>
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/mypageImage.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-dark active p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberAssignList'">양도 관리</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10 mt-4">
            	<!-- 내정보 수정 폼 시작 -->
                <form action="memberUpdate" method="post">
                	<table class="table" style="margin-left: 140px; margin-top: 35px; width: 58%;">
						<tbody>
						    <tr>
						    	<th scope="row" width="150"><label for="userName">이름</label></th>
						    	<td colspan="2"><input class="form-control" type="text" name="m_name" aria-label="default input example" value="${member.m_name }" placeholder="이름을 입력해주세요." required="required"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="userId">아이디</label></th>
						    	<td colspan="2"><input class="form-control" type="text" name="#" aria-label="Disabled input example"  value="${member.m_id }" readonly="readonly" disabled="disabled" ></td>
						    	<td><input class="form-control" type="hidden" name="m_id" aria-label="Disabled input example"  value="${member.m_id }"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="userPasswd">비밀번호</label></th>
						    	<td colspan="2"><input type="password" class="form-control" name="m_passwd" aria-label="default input example" required="required" placeholder="8~16자리의 영문, 숫자 특수문자 조합만 사용 가능합니다." minlength="8" maxlength="16" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="userNick">닉네임</label></th>
						    	<td colspan="2"><input class="form-control" type="text" name="m_nick" aria-label="default input example" value="${member.m_nick }" placeholder="최대 10글자까지 입력해주세요." required="required"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="userBirth">생년월일</label></th>
						    	<td colspan="2"><input class="form-control" type="text" name="#" value="2023-06-11" aria-label="Disabled input example"  value="${member.m_birth }" readonly="readonly" disabled="disabled"></td>
						    	<td colspan="2"><input class="form-control" type="hidden" name="m_birth" value="2023-06-11" aria-label="Disabled input example"  value="${member.m_birth }"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="userPhone">휴대폰번호</label></th>
						    	<td style="height: 40px; vertical-align: middle;">
							  		<div class="d-flex align-items-center">
							    		<input class="form-control" type="text" name="m_tel" id="m_tel" style="width: 200px" aria-label="default input example" value="${member.m_tel }" required="required">
							        	<br><button type="button" class="btn btn-outline-dark" id="verifyRequest" style="margin-left: 6px;">인증요청</button>
							    	</div>
							    	<div class="mt-2 d-flex align-items-center">
							    		<input class="form-control" type="text" name="verifyNum" id="verifyNum" aria-label="default input example" style="width: 120px;">
							        	<button type="button" class="btn btn-outline-dark" id="verifyConfirm" style="margin-left: 6px;">인증확인</button>
							    	</div>
								</td>
						    </tr>
						    <tr>
							    <th scope="row"><label for="userEmail">이메일</label></th>
							    <td colspan="2">
							        <div class="input-group">
							        	<c:set var="arrEmail" value="${fn:split(member.m_email, '@')}" />
							            <input type="text" class="form-control rounded" name="m_email1" aria-label="default input example" style="width: 120px;" value="${arrEmail[0]}" required="required">
							            &nbsp;@&nbsp;&nbsp;
							            <input type="text" class="form-control rounded" id="changeInput" name="m_email2"  aria-label="default input example" style="width: 120px;" value="${arrEmail[1]}" required="required"> 
							            <div class="input-group-append">
							                <select class="form-select" id="domain" style="margin-left: 6px;" required="required" onchange="selectBoxChange(this.value)">
							                	<option value="">직접입력</option>
							                    <option value="gmail.com" <c:if test="${fn:contains(member.m_email2, 'gmail.com')}">selected</c:if>>gmail.com</option>
							                    <option value="naver.com" <c:if test="${fn:contains(member.m_email2, 'naver.com')}">selected</c:if>>naver.com</option>
							                    <option value="daum.net" <c:if test="${fn:contains(member.m_email2, 'daum.com')}">selected</c:if>>daum.net</option>
							                </select>
							            </div>
							        </div>
							    </td>
							</tr>
						  </tbody>
                	</table>
					<div style="margin-left:420px;">
					    <button type="submit" class="btn btn-dark mt-2" style="color: white;" onclick="upOK()">수정완료</button>
					</div>
                </form>
                <!-- 내정보 수정 폼 끝 -->
            </div>
        </div>
    </div>
    
    <!-- CoolSMS 문자인증 시작 -->
	<script>
	$('#verifyRequest').click(function(){
		let to = $('input[id="m_tel"]').val();
		$.ajax({
			url : '<c:url value="/checkPhone"/>',
			type : "POST",
			data : "to=" + to,
			dataType : "json",
			success : function(data) {
				let checkNum = data;
				alert('checkNum:'+ checkNum);
				$('#verifyConfirm').click(function(){
					let userNum = $('input[id="verifyNum"]').val();		
					if(checkNum == userNum){
						alert('인증 성공하였습니다.');
					}else {
						alert('인증 실패하였습니다. 다시 입력해주세요.');
					}
				});
			},
			error : function() {
				alert("에러")
			}
		});
	});
	</script>
	<!-- CoolSMS 문자인증 끝 -->
 
    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 