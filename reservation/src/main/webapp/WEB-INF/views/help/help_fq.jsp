<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/help.css" rel="styleSheet" type="text/css">
</head>
<body>
<%@ include file="../common/common_header.jsp" %>

<!-- ==================================================================================================================================== -->
<!-- 상단 부분 inclue넣을꺼니깐 참고용 -->


<!-- 여기부터 공지사항 메뉴 버튼 -->
<div class="container mt-5">
  <div class="row">
    <div class="col">
      <h2 class="display-5 fst-italic fw-bold">Help</h2>
    </div>
  </div>
</div>
<div class="container mt-4">
    <div class="row gy-3 justify-content-center text-center">
        <div class="col-12">
	      <div class="list-group list-group-horizontal">
	        <a href="../help/help_home.jsp" class="list-group-item-dark list-group-item-action" aria-current="true">
	          공지사항
	        </a>
	        <a href="../help/help_fq.jsp" class="list-group-item-dark list-group-item-action active">FAQ</a>
	        <a href="../help/help_qa.jsp" class="list-group-item-dark list-group-item-action">Q&A</a>
	      </div>
        </div>
<!-- 서브메뉴버튼 -->
        <div class="col-6">
            <div class="list-group list-group-horizontal">
                <a href="FAQ" class="list-group-item-dark list-group-item-action active" aria-current="true">회원</a>
                <a href="../help/help_fq_2.jsp" class="list-group-item-dark list-group-item-action">점주</a>
            </div>
        </div>
    </div>
</div>
<!-- FAQ 목록 페이지 -->
<div class="container my-5">
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					Q. 아이디, 비밀번호를 분실했어요!
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionExample">
				<div class="accordion-body">
                A. 
				아이디나 패스워드를 잊어버리셨나요? <br>
				홈페이지 메인 로그인 화면 하단에 보이는 [아이디/비밀번호 찾기] 버튼을 통해 가입 당시 등록하신 이름과 휴대폰번호를 입력하시면 아이디와 비밀번호를 찾을 수 있습니다.<br>
				[아이디 찾기]<br>
				아이디를 분실한 경우 [아이디 찾기]에서 개인정보보호를 위하여 본인 여부를 확인 후 아이디를 확인하실 수 있습니다.<br>
				​[비밀번호 찾기]<br>​
				비밀번호를 분실한 경우 [비밀번호 찾기]에서 개인정보보호를 위하여 본인 여부를 확인한 후, 임시 비밀번호를 발급해드립니다.<br>​
				임시로 발송된 비밀번호로 로그인하신 후 [마이페이지] - [내 정보] - [나의 정보 변경]에서 비밀번호를 꼭 변경해 주세요.<br>
                
				</div>
			</div>
		</div>
        <div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					Q. 회원탈퇴는 어디서 하나요?
				</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					A. 로그인 후 [마이페이지] - [회원탈퇴]를 이용하시면 회원탈퇴가 가능합니다.<br>
					패스워드를 입력 후 일치하면 회원탈퇴를 진행 하실 수 있습니다.<br>​
					혹시 서비스 이용에 문제가 있거나 마음에 들지 않아 탈퇴하려고 하시나요?<br>
					개선사항을 알려주시면 말씀해주신 내용을 최대한 빠르게 확인하겠습니다.<br>
					* 회원 탈퇴시 개인정보는 삭제되며, 작성하신 글은 데이터베이스에서 삭제 되지 않습니다. <br>
				</div>
			</div>
        </div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					Q.  로그인이 안돼요!
				</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse bg-light" data-bs-parent="#accordionExample">
	            <div class="accordion-body">
	                A. 로그인 버튼을 누르세요
	            </div>
			</div>
        </div>
    </div>
    <!-- 페이지 이동 영역 -->
    <div class="row my-4">
        <div class="col-12">
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- 서치 영역 -->
      <div class="row justify-content-center">
        <div class="col-3">
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button type="button" class="btn btn-outline-dark">Search</button>
          </form>
        </div>
      </div>
    </div>




<!-- 하단 부분은 나중에 inclue로 넣을꺼니깐 참고 -->
<!-- ==================================================================================================================================== -->

<%@ include file="../common/common_footer.jsp" %>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>