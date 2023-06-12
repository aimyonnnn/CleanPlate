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
	<div class="container border-bottom mt-lg-5" style="color: #FFC107;">
    	<h2>아이디 / 비밀번호 찾기</h2>
	</div>
	<div class="container mt-3 mb-3">
    	<h6>가입한 아이디와 비밀번호를 잊으셨습니까?</h6>
	</div>
	<!-- 아이디/ 비밀번호 찾기 상단 부분 끝 -->

	<!-- 개인회원 / 기업회원  -->
	<div class="container mt-5 text-center">
    	<div class="row d-flex justify-content-center">
		<div class="col-md-5 border border-warning p-4" style="border-radius: 5px;">
        	<h1 class="mt-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">개인회원</h1>
	        <div class="btn-group mt-4 w-100">
	          <button type="button" class="btn btn-outline-warning" style="border-radius: 0; font-weight: normal; font-size: 18px; line-height:36px; letter-spacing: -3px;" data-bs-toggle="modal" data-bs-target="#personal-idpw">아이디 / 비밀번호 찾기</button>
	        </div>
     	</div>

		<div class="col-md-5 border border-warning ms-5 p-4" style="border-radius: 5px;">
			<h1 class="mt-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">기업회원</h1>
			<div class="btn-group mt-4 w-100">
				<button type="button" class="btn btn-outline-warning" style="border-radius: 0; font-weight: normal; font-size: 18px; line-height:36px; letter-spacing: -3px;" data-bs-toggle="modal" data-bs-target="#business-idpw">아이디 / 비밀번호 찾기</button>
			</div>
		</div>
		</div>
		<!-- 개인회원 / 기업회원 끝                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     -->

		<!-- 문의칸과 여백  -->
		<div style="height: 80px; width: 100%;"></div>

		<!-- 문의하기 부분 -->
		<div class="container mt-5">
	  		<div class="border border-warning d-flex justify-content-center align-items-center" style="height: 100px; border-radius: 5px;">
				<div class="row">
					<div class="col-12">
						<div class="btn-group">
							<!-- 소설계정 찾기 시작 -->
							<button type="button" class="btn btn-outline-warning me-3">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
									<path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
									<path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
								</svg> 소셜계정 찾기
							</button>
							<!-- 소설계정 찾기 끝 -->
						  
						 	<!-- 자주 묻는 질문 시작 -->
							<button type="button" class="btn btn-outline-warning" style="border-radius: 0;">

								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-text" viewBox="0 0 16 16">
									<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
									<path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
								</svg> 자주묻는 질문
							</button>
						 	<!-- 자주 묻는 질문 끝 -->
						</div>
					</div>
					<!-- cs 텍스트 시작 -->
					<div class="col-12 mt-2">
						<div class="cs-link">
							위 방법으로도 계정을 찾을 수 없다면, Clean Plate 고객센터에 직접 문의 주시기 바랍니다.
						</div>
					</div>
					<!-- cs 텍스트 끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- 문의하기 끝 -->
					

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
	               							<button type="button" id="verifyRequest" class="btn btn-outline-warning">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-warning">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-warning">아이디찾기</button>
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
	               							<button type="button" id="verifyRequest" class="btn btn-outline-warning">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-warning">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-warning">임시비밀번호 발급</button>
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
	               							<button type="button" id="verifyRequest" class="btn btn-outline-warning">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-warning">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-warning">아이디찾기</button>
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
	               							<button type="button" id="verifyRequest" class="btn btn-outline-warning">인증요청</button>
               							</div>
					                </label>
                					<!-- 휴대폰 번호 인증 버튼 -->
	              				</div>
	             				<div class="input-container">
					                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
						        		<div class="input-group mb-3">
						                	<input type="text" id="verifyNum" class="form-control">
	                						<button type="button" id="verifyConfirm" class="btn btn-outline-warning">인증확인</button>
	                					</div>
					                </label>
	              				</div>
	            			</div>
	            				<div class="d-flex justify-content-center mt-1">
                					<button type="submit" class="btn btn-outline-warning">임시비밀번호 발급</button>
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
    	<hr class="mt-5">
		<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 