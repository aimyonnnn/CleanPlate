<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>FIND ID/PASSWD</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->
  

	<!-- 아이디/ 비밀번호 찾기 상단 부분 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/findImage.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>
	<div class="container mt-3 mb-5">
    	<h5 style="font-size: 22px; line-height:36px; letter-spacing: -3px;">가입한 아이디와 비밀번호를 잊으셨습니까?</h5>
	</div>
	<!-- 아이디/ 비밀번호 찾기 상단 부분 끝 -->

	<!-- 개인회원 / 기업회원  -->
	<div class="container text-center">
    	<div class="row d-flex justify-content-center">
		<div class="col-md-5 border border-dark p-4" style="border-radius: 5px;">
        	<h1 class="mt-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:70px; letter-spacing: -3px;">개인회원</h1>
	        <div class="btn-group mt-4 bg-dark w-100">
	          <button type="button" class="btn btn-outline-dark text-white" style="border-radius: 0; font-weight: normal; font-size: 18px; line-height:36px; letter-spacing: -3px;" data-bs-toggle="modal" data-bs-target="#personal-idpw">아이디 / 비밀번호 찾기</button>
	        </div>
     	</div>

		<div class="col-md-5 border border-dark ms-5 p-4" style="border-radius: 5px;">
			<h1 class="mt-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:70px; letter-spacing: -3px;">기업회원</h1>
			<div class="btn-group mt-4 bg-dark w-100">
				<button type="button" class="btn btn-outline-dark text-white" style="border-radius: 0; font-weight: normal; font-size: 18px; line-height:36px; letter-spacing: -3px;" data-bs-toggle="modal" data-bs-target="#business-idpw">아이디 / 비밀번호 찾기</button>
			</div>
		</div>
		</div>
		<!-- 개인회원 / 기업회원 끝                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     -->

		<!-- 문의칸과 여백  -->
		<div style="height: 80px; width: 100%;"></div>
	</div>					

  <!-- 개인회원 아이디 / 비밀번호 찾기 모달창 -->
	<div class="modal fade" id="personal-idpw" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="exampleModalLabel">개인회원 아이디찾기</h1>
	        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
	        		<div>
	        			<!-- 개인회원 아이디 찾기 폼 시작 -->
	          			<form action="memberIdFind" method="post">
	          			<!-- 인증을 성공했는지에 대한 판별값 (post방식으로 넘어가 controller로 처리) -->
	          				<input type="hidden" class="isVerify" value="0" name="isVerify">
	            			<div class="container">
                				<div class="input-container">
					                <label for="name" style="text-align: left; width: 100%;">이름<br>
					                	<input type="text" id="name" name="m_name" class="form-control" placeholder="이름 입력">
					                </label>
	              				</div>
	              				<div class="input-container">
					                <label for="phone" style="text-align: left; width: 100%;">휴대폰번호<br>
					                	<div class="input-group mb-3">
						                	<input type="text" id="phone" name="m_tel" class="form-control" placeholder="'_'빼고 숫자만 입력">
	               							<button type="button" id="verifyRequest" class="btn btn-outline-dark">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-dark">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-dark">아이디찾기</button>
              					</div>
                				<!-- 휴대폰 번호 인증 끝 -->
	          			</form>
	        			<!-- 개인회원 아이디 찾기 폼 끝 -->
					</div>
				</div>

				
				<!-- 개인회원 비밀번호 찾기 폼 시작 -->
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
				</div>
				<div class="modal-body">
					<div>
						<form action="memberPasswdFind" method="post">
						<!-- 인증을 성공했는지에 대한 판별값 (post방식으로 넘어가 controller로 처리) -->
						<input type="hidden" class="isVerify" value="0" name="isVerify">
							<div class="container">
								<div class="input-container">
					                <label for="id" style="text-align: left; width: 100%;">아이디<br>
					                	<input type="text" id="id" name="m_id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능">
					                </label>
	              				</div>
								<div class="input-container">
					                <label for="name" style="text-align: left; width: 100%;">이름<br>
					                	<input type="text" id="name" name="m_name" class="form-control" placeholder="이름 입력">
					                </label>
								</div>
	              				<div class="input-container">
					                <label for="phone" style="text-align: left; width: 100%;">휴대폰번호<br>
					                	<div class="input-group mb-3">
						                	<input type="text" id="phone" name="m_tel" class="form-control" placeholder="'_'빼고 숫자만 입력">
	               							<button type="button" id="verifyRequest" class="btn btn-outline-dark">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-dark">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-dark">임시비밀번호 발급</button>
              					</div>
							<!-- 휴대폰 번호 인증 버튼 -->
						</form>
						<!-- 개인회원 비밀번호 찾기 폼 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 개인회원 아이디/비밀번호 찾기 모달창 끝 -->


	<!-- 기업회원 아이디/비밀번호 찾기 모달창 -->
	<div class="modal fade" id="business-idpw" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">기업회원 아이디찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<!-- 기업회원 아이디 찾기 폼 시작 -->
						<form action="ceoIdFind" method="post">
						<!-- 인증을 성공했는지에 대한 판별값 (post방식으로 넘어가 controller로 처리) -->
						<input type="hidden" class="isVerify" value="0" name="isVerify">
							<div class="container">
								<div class="input-container">
					                <label for="name" style="text-align: left; width: 100%;">담당자명 (이름)<br>
					                	<input type="text" id="name" name="c_name" class="form-control" placeholder="이름 입력">
					                </label>
								</div>
	              				<div class="input-container">
					                <label for="phone" style="text-align: left; width: 100%;">휴대폰번호<br>
					                	<div class="input-group mb-3">
						                	<input type="text" id="phone" name="c_tel" class="form-control" placeholder="'_'빼고 숫자만 입력">
	               							<button type="button" id="verifyRequest" class="btn btn-outline-dark">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-dark">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-dark">아이디찾기</button>
              					</div>
							<!-- 휴대폰 번호 인증 버튼 끝 -->
						</form>
						<!-- 기업회원 아이디 찾기 폼 끝 -->
					</div>
				</div>
        	
        	<!-- 기업회원 비밀번호 찾기 -->
        	<div class="modal-header">
	        	<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
			</div>
			<div class="modal-body">
	       		<div>
	       			<!-- 기업회원 비밀번호 찾기 폼 시작 -->
	          		<form action="ceoPasswdFind" method="post">
	          		<!-- 인증을 성공했는지에 대한 판별값 (post방식으로 넘어가 controller로 처리) -->
	          		<input type="hidden" class="isVerify" value="0" name="isVerify">
	            		<div class="container">
							<div class="input-container">
				                <label for="id" style="text-align: left; width: 100%;">아이디<br>
				                	<input type="text" id="id" name="c_id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능">
				                </label>
							</div>
							<div class="input-container">
				                <label for="name" style="text-align: left; width: 100%;">담당자명 (이름)<br>
				                	<input type="text" id="name" name="c_name" class="form-control" placeholder="이름 입력">
				                </label>
							</div>
	              				<div class="input-container">
					                <label for="phone" style="text-align: left; width: 100%;">휴대폰번호<br>
					                	<div class="input-group mb-3">
						                	<input type="text" id="phone" name="c_tel" class="form-control" placeholder="'_'빼고 숫자만 입력">
	               							<button type="button" id="verifyRequest" class="btn btn-outline-dark">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-dark">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-dark">임시비밀번호 발급</button>
              					</div>
			            <!-- 휴대폰 번호 인증 끝 -->
					</form>
					<!-- 기업회원 비밀번호 찾기 폼 끝 -->
				</div>
			</div>
	    	</div>
		</div>
	</div>
	<!-- 기업회원 아이디/비밀번호 찾기 모달창 끝 -->

	<!-- CoolSMS 문자인증 시작 -->
	<script>
	$('#verifyRequest').click(function(){
		let to = $('input[id="phone"]').val();
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
						$('.isVerify').val('1'); // 인증성공시 값을 1로변경해 진행할 수 있음
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
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 