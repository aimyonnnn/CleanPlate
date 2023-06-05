<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Clean Plate</title>
<!-- login.css 추가 -->
<link href="${pageContext.request.contextPath }/resources/css/member_login.css" rel="stylesheet">
</head>
<body>
<%@ include file="../common/common_header.jsp" %>
	<!-- 로그인 시작 -->
	<div class="form personalLogin">
		<form action="LoginPro" method="post">
			<div class="form-header">
			    <div class="personalButton">개인회원</div>
			    <div class="businessButton">기업회원</div>
			</div>
		    <!-- 로그인 유지, 아이디 저장 체크박스 -->
          	<div class="checkbox-container">
				<input type="checkbox" id="keepLoggedIn" name="keepLoggedIn">
				<label for="keepLoggedIn">로그인 유지</label>
				<span class="spacing"></span>
				<input type="checkbox" id="rememberBusinessId" name="rememberBusinessId">
				<label for="rememberBusinessId">아이디 저장</label>
	      	</div>
	      	<!-- 아이디, 비번 입력 -->
		  	<div class="form-elements">
		    	<div class="form-element">
		      		<input type="text" placeholder="아이디">
		    	</div>
		    	<div class="form-element">
		    		<input type="password" placeholder="비밀번호">
		    	</div>
		    	<div class="form-element">
		    		<button type="submit" id="submit-btn">로그인</button>
		    	</div>
			</div>
		</form>
	   	<!-- 회원가입, 아이디/비밀번호 찾기 -->
	   	<div class="signup-forgotten">
	           <a href="#" class="join" data-bs-toggle="modal" data-bs-target="#personal-modal">회원가입</a> | 
	           <a href="../member/member_find.jsp" class="forgotten">아이디/비밀번호 찾기</a>
	    </div>
	</div>
	
	<!-- 개인회원 모달창 -->
	<div class="modal fade" id="personal-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">개인회원가입</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div>
	          <form action="#" method="post">
	            <div class="container">
	              <h3>Clean Plate로 식당 예약 간편하게!</h3>
	              <div class="input-container">
	                <label for="id" style="width: 100%;">아이디<br>
	                  <input type="text" id="id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="password1" style="width: 100%;">비밀번호<br>
	                  <input type="password" id="password1" class="form-control" placeholder="8~16자리/영문 대소문자,숫자,특수문자 조합">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="password2" style="width: 100%;">비밀번호 확인<br>
	                  <input type="password" id="password2" class="form-control">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="name" style="width: 100%;">이름<br>
	                  <input type="text" id="name" class="form-control" placeholder="이름 입력">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="nickname" style="width: 100%;">닉네임<br>
	                  <input type="text" id="nickname" class="form-control" placeholder="10자리 / 영문, 숫자, 특수문자'_' 사용가능">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="birth" style="width: 100%;">생년월일<br>
	                  <input type="text" id="birth" class="form-control" placeholder="YYYYMMDD">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="gender" style="width: 100%;">성별<br></label>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" name="gender" id="female">
	                  <label class="form-check-label" for="female">
	                    여성
	                  </label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" name="gender" id="male">
	                  <label class="form-check-label" for="male">
	                    남성
	                  </label>
	                </div>
	              </div>
	              <div class="input-container">
	                <label for="phone" style="width: 80%;">휴대폰번호<br>
	                  <input type="text" id="phone" class="form-control" placeholder="'_'빼고 숫자만 입력">
	                </label>
	                <!-- 휴대폰 번호 인증 버튼 -->
	                <button type="button" id="verify-phone">인증요청</button>
	              </div>
	              <div class="input-container">
	                <label for="email" style="width: 100%;">이메일<br>
	                  <input type="text" id="email" class="form-control">
	                </label>
	              </div>
	              <!-- 약관 -->
	              <div class="cont_division">
	                <span class="terms_agree"><strong>약관</strong></span>
	                <div class="agree_box">
	                  <ul class="agree_article">
	                    <li>
	                      <div class="InpBox">
	                        <div class="form-check">
	                          <input class="form-check-input" type="checkbox" id="agreeAllPersonal">
	                          <label class="form-check-label" for="agreeAllPersonal">
	                            <strong class="all_agree">전체 동의</strong>
	                          </label>
	                        </div>
	                        <input type="hidden" name="hidden_check_all" value="0" id="hidden_check_all">
	                      </div>
	                    </li>
	                  </ul>
	                  <ul class="agree_article depth2">
	                    <li>
	                      <div class="agree_desc">
	                        <div class="InpBox">
	                          <div class="form-check">
	                            <input class="form-check-input" type="checkbox" id="agree_rule1">
	                            <label class="form-check-label" for="agree_rule1">
	                              <span><strong>(필수) 개인회원 약관에 동의</strong></span>
	                            </label>
	                          </div>
	                        </div>
	                      </div>
	                      <a href="/zf_user/help/terms-of-service/person" class="view_indetail" target="_blank">
	                        <span class="blind">개인회원 약관 상세보기</span>
	                      </a>
	                    </li>
	                    <li>
	                      <div class="agree_desc">
	                        <div class="InpBox">
	                          <div class="form-check">
	                            <input class="form-check-input" type="checkbox" id="agree_take1">
	                            <label class="form-check-label" for="agree_take1">
	                              <span><strong>(필수) 개인정보 수집 및 이용에 동의</strong></span>
	                            </label>
	                          </div>
	                        </div>
	                      </div>
	                      <a id="popupClausePrivacyPerson" href="/zf_user/popup/privacy-policy?category=person_privacy_req" class="view_indetail popup_clause_open" target="_blank">
	                        <span class="blind">개인정보 수집 및 이용에 동의 약관 상세보기</span>
	                      </a>
	                    </li>
	                  </ul>
	                </div>
	              </div>
	              <div class="input-container">
	                <label class="dormancy" for="dormancy_term">정보 보유기간<br></label>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term99" name="dormancy_term" value="99">
	                  <label class="form-check-label" for="dormancy_term99">탈퇴 시</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term5" name="dormancy_term" value="5">
	                  <label class="form-check-label" for="dormancy_term5">5년</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term3" name="dormancy_term" value="3">
	                  <label class="form-check-label" for="dormancy_term3">3년</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term1" name="dormancy_term" value="1">
	                  <label class="form-check-label" for="dormancy_term1">1년</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term0" name="dormancy_term" value="0">
	                  <label class="form-check-label" for="dormancy_term0">탈퇴시 내 계정정보는 파기됩니다</label>
	                </div>
	              </div>
	              <div class="input-container">
	                <label for="agree_privacy">개인정보 수집 및 이용에 대한 안내 및 동의<br></label>
	                <textarea id="agree_privacy" rows="5" readonly style="width: 100%;">본인은 [개인정보 수집 및 이용]안내 및 본인의 동의에 대하여 모두 확인하였으며, 동의합니다.
	                
	이용자는 개인정보 제공에 동의하지 않거나 개인정보 기재를 거부할 권리가 있으나, 이 경우 회원 가입 및 이용이 제한될 수 있습니다.</textarea>
	              </div>
	            </div>
	            <!-- 회원가입 버튼 -->
				<div class="d-flex justify-content-center mt-1">
					<button type="button" id="signup-button">회원가입</button>
				</div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 개인회원 모달창 끝 -->
	
	<!-- 기업회원 모달창 -->
	<div class="modal fade" id="business-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">기업회원가입</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div>
	          <form action="#" method="post">
	            <div class="container">
	              <h3>Clean Plate로 식당 예약 간편하게!</h3>
	              <div class="input-container">
	                <label for="crn" style="width: 100%;">사업자등록번호<br>
	                  <input type="text" id="crn" class="form-control" placeholder="사업자등록번호 10자리">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="id" style="width: 100%;">아이디<br>
	                  <input type="text" id="id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="password1" style="width: 100%;">비밀번호<br>
	                  <input type="password" id="password1" class="form-control" placeholder="8~16자리/영문 대소문자,숫자,특수문자 조합">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="password2" style="width: 100%;">비밀번호 확인<br>
	                  <input type="password" id="password2" class="form-control">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="name" style="width: 100%;">이름<br>
	                  <input type="text" id="name" class="form-control" placeholder="이름 입력">
	                </label>
	              </div>
	              <div class="input-container">
	                <label for="phone" style="width: 80%;">휴대폰번호<br>
	                  <input type="text" id="phone" class="form-control" placeholder="'_'빼고 숫자만 입력">
	                </label>
	                <!-- 휴대폰 번호 인증 버튼 -->
	                <button type="button" id="verify-phone">인증요청</button>
	              </div>
	              <div class="input-container">
	                <label for="email" style="width: 100%;">이메일<br>
	                  <input type="text" id="email" class="form-control">
	                </label>
	              </div>
	              <!-- 약관 -->
	              <div class="cont_division">
	                <span class="terms_agree"><strong>약관</strong></span>
	                <div class="agree_box">
	                  <ul class="agree_article">
	                    <li>
	                      <div class="InpBox">
	                        <div class="form-check">
	                          <input class="form-check-input" type="checkbox" id="agreeAllPersonal">
	                          <label class="form-check-label" for="agreeAllPersonal">
	                            <strong class="all_agree">전체 동의</strong>
	                          </label>
	                        </div>
	                        <input type="hidden" name="hidden_check_all" value="0" id="hidden_check_all">
	                      </div>
	                    </li>
	                  </ul>
	                  <ul class="agree_article depth2">
	                    <li>
	                      <div class="agree_desc">
	                        <div class="InpBox">
	                          <div class="form-check">
	                            <input class="form-check-input" type="checkbox" id="agree_rule1">
	                            <label class="form-check-label" for="agree_rule1">
	                              <span><strong>(필수) 개인회원 약관에 동의</strong></span>
	                            </label>
	                          </div>
	                        </div>
	                      </div>
	                      <a href="/zf_user/help/terms-of-service/person" class="view_indetail" target="_blank">
	                        <span class="blind">개인회원 약관 상세보기</span>
	                      </a>
	                    </li>
	                    <li>
	                      <div class="agree_desc">
	                        <div class="InpBox">
	                          <div class="form-check">
	                            <input class="form-check-input" type="checkbox" id="agree_take1">
	                            <label class="form-check-label" for="agree_take1">
	                              <span><strong>(필수) 개인정보 수집 및 이용에 동의</strong></span>
	                            </label>
	                          </div>
	                        </div>
	                      </div>
	                      <a id="popupClausePrivacyPerson" href="/zf_user/popup/privacy-policy?category=person_privacy_req" class="view_indetail popup_clause_open" target="_blank">
	                        <span class="blind">개인정보 수집 및 이용에 동의 약관 상세보기</span>
	                      </a>
	                    </li>
	                  </ul>
	                </div>
	              </div>
	              <div class="input-container">
	                <label class="dormancy" for="dormancy_term">정보 보유기간<br></label>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term99" name="dormancy_term" value="99">
	                  <label class="form-check-label" for="dormancy_term99">탈퇴 시</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term5" name="dormancy_term" value="5">
	                  <label class="form-check-label" for="dormancy_term5">5년</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term3" name="dormancy_term" value="3">
	                  <label class="form-check-label" for="dormancy_term3">3년</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term1" name="dormancy_term" value="1">
	                  <label class="form-check-label" for="dormancy_term1">1년</label>
	                </div>
	                <div class="form-check">
	                  <input class="form-check-input" type="radio" id="dormancy_term0" name="dormancy_term" value="0">
	                  <label class="form-check-label" for="dormancy_term0">탈퇴시 내 계정정보는 파기됩니다</label>
	                </div>
	              </div>
	              <div class="input-container">
	                <label for="agree_privacy">개인정보 수집 및 이용에 대한 안내 및 동의<br></label>
	                <textarea id="agree_privacy" rows="5" readonly style="width: 100%;">본인은 [개인정보 수집 및 이용]안내 및 본인의 동의에 대하여 모두 확인하였으며, 동의합니다.
	                
	이용자는 개인정보 제공에 동의하지 않거나 개인정보 기재를 거부할 권리가 있으나, 이 경우 회원 가입 및 이용이 제한될 수 있습니다.</textarea>
	              </div>
	            </div>
	            <!-- 회원가입 버튼 -->
				<div class="d-flex justify-content-center">
					<button type="button" id="signup-button">회원가입</button>
				</div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 기업회원 모달창 끝 -->
	
	<footer class="footer">
<%@ include file="../common/common_footer.jsp" %>
	</footer>
	

	<!-- 버튼이 동작하기 위한 자바스크립트 코드 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(function() {
	  // 개인회원 클릭 시
	  $(".personalButton").click(function() {
	    $(".form").removeClass("businessLogin").addClass("personalLogin");
	    $('.join').attr('data-bs-target', '#personal-modal');
	  });
	
	  // 기업회원 클릭 시
	  $(".businessButton").click(function() {
	    $(".form").removeClass("personalLogin").addClass("businessLogin");
	    $('.join').attr('data-bs-target', '#business-modal');
	  });
	  
	});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>