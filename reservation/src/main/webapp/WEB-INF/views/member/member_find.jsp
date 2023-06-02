<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FIND_ID/PASSWORD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  


  <div class="container border-bottom mt-lg-5">
    <h2 class="fw" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">아이디 / 비밀번호 찾기</h2>
  </div>
  <div class="container mt-3 mb-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">
    <h6>가입한 아이디와 비밀번호를 잊으셨습니까?</h6>
  </div>

  <div class="container mt-5 text-center">
    
    <div class="row d-flex justify-content-center">
      
      <div class="col-md-5 border p-4" style="border-radius: 5px;">
        <h1 class="mt-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">개인회원</h1>
        <div class="btn-group mt-4 w-100">
          <button type="button" class="btn btn-outline-dark" style="border-radius: 0; font-weight: normal; font-size: 18px; line-height:36px; letter-spacing: -3px;" data-bs-toggle="modal" data-bs-target="#personal-idpw">아이디 / 비밀번호 찾기</button>
        </div>
      </div>

    <div class="col-md-5 border ms-lg-5 p-4" style="border-radius: 5px;">
      <h1 class="mt-3" style="border-radius: 5px; font-weight: normal; font-size: 30px; line-height:36px; letter-spacing: -3px;">기업회원</h1>
      <div class="btn-group mt-4 w-100">
        <button type="button" class="btn btn-outline-dark" style="border-radius: 0; font-weight: normal; font-size: 18px; line-height:36px; letter-spacing: -3px;" data-bs-toggle="modal" data-bs-target="#business-idpw">아이디 / 비밀번호 찾기</button>
      </div>

  </div>
</div>

<div style="height: 100px; width: 100%;"></div>

<div class="container mt-5">
  <div class="d-flex justify-content-center align-items-center" style="background-color: #eee; height: 100px;">
   
	<div class="row">
		<div class="col-12">
			<div class="btn-group">
			  <button type="button" class="btn btn-outline-secondary me-3" style="border-radius: 0;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
				  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
				</svg> 로그인
			  </button>
			  <button type="button" class="btn btn-outline-secondary me-3">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
				  <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
				  <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
				</svg> 소셜계정 찾기
			  </button>
			  <button type="button" class="btn btn-outline-secondary" style="border-radius: 0;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-text" viewBox="0 0 16 16">
				  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
				  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
				</svg> 자주묻는 질문
			  </button>
			</div>
		</div>
		
		<div class="col-12 mt-2">
			<div class="cs-link">
			  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
				<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			  </svg> 위 방법으로도 계정을 찾을 수 없다면, Clean Plate 고객센터에 직접 문의 주시기 바랍니다.
			</div>
		</div>
	</div>
	
  </div>
</div>
</div>

<!-- ======================================================================================================================================== -->
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
	          <form action="#" method="post">
	            <div class="container">
                <div class="input-container">
	                <label for="name" style="text-align: left; width: 100%;">이름<br>
	                  <input type="text" id="name" class="form-control" placeholder="이름 입력">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="phone" style="text-align: left; width: 80%;">휴대폰번호<br>
	                  <input type="text" id="phone" class="form-control" placeholder="'_'빼고 숫자만 입력">
	                </label>
	                <!-- 휴대폰 번호 인증 버튼 -->
	                <button type="button" id="verify-phone">인증요청</button>
	              </div>
	              <div class="input-container">
	                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
	                  <input type="text" id="verify-phone" class="form-control">
	                </label>
	              </div>
	            </div>
	            <!-- 인증완료 버튼 -->
	            <div class="d-flex justify-content-center mt-1">
                <button type="button" id="verify-confirm">인증완료</button>
              </div>
	          </form>
	        </div>
	      </div>
        <!-- 비밀번호 찾기 -->
        <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
	      </div>
	      <div class="modal-body">
	        <div>
	          <form action="#" method="post">
	            <div class="container">
                <div class="input-container">
	                <label for="id" style="text-align: left; width: 100%;">아이디<br>
	                  <input type="text" id="id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능">
	                </label>
	              </div>
                <div class="input-container">
	                <label for="name" style="text-align: left; width: 100%;">이름<br>
	                  <input type="text" id="name" class="form-control" placeholder="이름 입력">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="phone" style="text-align: left; width: 80%;">휴대폰번호<br>
	                  <input type="text" id="phone" class="form-control" placeholder="'_'빼고 숫자만 입력">
	                </label>
	                <!-- 휴대폰 번호 인증 버튼 -->
	                <button type="button" id="verify-phone">인증요청</button>
	              </div>
	              <div class="input-container">
	                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
	                  <input type="text" id="verify-phone" class="form-control">
	                </label>
	              </div>
	            </div>
	            <!-- 인증완료 버튼 -->
	            <div class="d-flex justify-content-center mt-1">
                <button type="button" id="verify-confirm">인증완료</button>
              </div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

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
	          <form action="#" method="post">
	            <div class="container">
                <div class="input-container">
	                <label for="crn" style="text-align: left; width: 100%;">사업자등록번호<br>
	                  <input type="text" id="crn" class="form-control" placeholder="사업자등록번호 10자리">
	                </label>
	              </div>
                <div class="input-container">
	                <label for="name" style="text-align: left; width: 100%;">담당자명 (이름)<br>
	                  <input type="text" id="name" class="form-control" placeholder="이름 입력">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="phone" style="text-align: left; width: 80%;">휴대폰번호<br>
	                  <input type="text" id="phone" class="form-control" placeholder="'_'빼고 숫자만 입력">
	                </label>
	                <!-- 휴대폰 번호 인증 버튼 -->
	                <button type="button" id="verify-phone">인증요청</button>
	              </div>
	              <div class="input-container">
	                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
	                  <input type="text" id="verify-phone" class="form-control">
	                </label>
	              </div>
	            </div>
	            <!-- 인증완료 버튼 -->
	            <div class="d-flex justify-content-center mt-1">
                <button type="button" id="verify-confirm">인증완료</button>
              </div>
	          </form>
	        </div>
	      </div>
        <!-- 비밀번호 찾기 -->
        <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
	      </div>
	      <div class="modal-body">
	        <div>
	          <form action="#" method="post">
	            <div class="container">
                <div class="input-container">
	                <label for="id" style="text-align: left; width: 100%;">아이디<br>
	                  <input type="text" id="id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능">
	                </label>
	              </div>
                
	              <div class="input-container">
	                <label for="crn" style="text-align: left; width: 100%;">사업자등록번호<br>
	                  <input type="text" id="crn" class="form-control" placeholder="사업자등록번호 10자리">
	                </label>
	              </div>
                <div class="input-container">
	                <label for="name" style="text-align: left; width: 100%;">담당자명 (이름)<br>
	                  <input type="text" id="name" class="form-control" placeholder="이름 입력">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="phone" style="text-align: left; width: 80%;">휴대폰번호<br>
	                  <input type="text" id="phone" class="form-control" placeholder="'_'빼고 숫자만 입력">
	                </label>
	                <!-- 휴대폰 번호 인증 버튼 -->
	                <button type="button" id="verify-phone">인증요청</button>
	              </div>
	              <div class="input-container">
	                <label for="verify-phone" style="text-align: left; width: 100%;">인증번호<br>
	                  <input type="text" id="verify-phone" class="form-control">
	                </label>
	              </div>
	            </div>
	            <!-- 인증완료 버튼 -->
	            <div class="d-flex justify-content-center mt-1">
                <button type="button" id="verify-confirm">인증완료</button>
              </div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>


<!-- ==================================================================================================================================== -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
