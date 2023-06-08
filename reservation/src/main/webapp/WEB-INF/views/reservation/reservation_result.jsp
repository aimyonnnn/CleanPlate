<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <!-- 이부분은 지우면 안됩니다 -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css">
	<title>Clean plate</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 이부분은 지우면 안됩니다 -->
<body>
	<!-- TOP 시작 -->
	<header>
		<%@ include file="../common/common_header.jsp" %>
	</header>
	<!-- TOP 끝 -->

	<!-- 예약내역 내용 시작-->
	<div class="container">
	    <div class="row">
	        <div class="col-md-12" style="text-align: center;">
	            <h1 style="color: #FFC107;">예약 안내</h1>
	            <hr>
	            <h3 style="font-weight: bold;">키친동백</h3>
	        </div>
	    </div>
	    <div class="row">
	        <div class="mt-2 col-md-12">
	            <img src="https://lh3.googleusercontent.com/p/AF1QipNY1MlSKhc_HLzeW1-s9SauzPn9woiO3QmNd9eA=s680-w680-h510" 
	                 class="rounded mx-auto d-block" height="300px" width="500px">
	        </div>
	    </div>
	    <div class="container">
		    <div class="row">
		        <div class="col-md-12">
		        	<!-- 예약내역 테이블 시작 -->
		            <table class="mt-3 table d-flex justify-content-center">
		                <tbody>
		                    <tr>
		                        <th>날짜</th>
		                        <td>2023년 05월 23일</td>
		                    </tr>
		                    <tr>
		                        <th>시간</th>
		                        <td>오후 17:00</td>
		                    </tr>
		                    <tr>
		                        <th>인원</th>
		                        <td>5명</td>
		                    </tr>
		                    <tr>
		                        <th>예약자</th>
		                        <td>홍길동</td>
		                    </tr>
		                    <tr>
		                        <th>[오시는길]</th>
		                        <td>부산광역시 해운대구 달맞이길 117번가길 85</td>
		                    </tr>
		                    <tr>
		                        <th>[편의시설]</th>
		                        <td>
		                        	발렛비<br>
		                            -런치 1시간 30분 기준 3,000원<br>
		                            -디너 4시간 기준 5,000원
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>[안내사항]</th>
		                        <td>
		                            예약 변경 및 취소는 예약일 기준 일주일 전까지만 가능합니다.<br>
		                            그 이후로는 환불 및 날짜변경이 불가하니 변동사항 있으실 경우<br>
		                            사전에 레스토랑으로 연락 주시기 바랍니다.
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <!-- 예약내역 테이블 끝 -->
		        </div>
		        <!-- 예약내역 버튼 -->
		        <div class="d-flex justify-content-center">
		        	<button type="button" class="btn btn-outline-warning mb-2" id="cancelButton">예약 취소하기</button>
			        <button type="button" class="btn btn-outline-warning mb-2" style="margin-left: 10px;" data-bs-toggle="modal" data-bs-target="#assignmentModal">예약 양도하기</button>
		        	<button type="button" id="mainButton" class="btn btn-outline-secondary mb-2" style="margin-left: 5px;">메인으로 가기</button>
		        </div>
		    </div>
		</div>
	</div>
	<!-- 예약내역 내용 끝-->
	
	<!-- 양도 관련 모달창 -->
	<div class="modal fade" id="assignmentModal" tabindex="-1" aria-labelledby="assignmentModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="assignmentModalLabel">예약 양도</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table table-striped text-center">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>식당</th>
                            <th>날짜</th>
                            <th>시간</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>000001</td>
                            <td>동백키친</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>방문예정</td>
                        </tr>
                   </tbody>
            </table>
	            <div class="d-flex justify-content-center">
	            	양도한 예약은 양도 게시판에 등록되며, 고객센터를 통해서만 취소가 가능합니다. 
	            </div>
	         <div class="mt-3 d-flex justify-content-center">
        		<button type="button" class="btn btn-outline-warning" id="assignmentButton">예약 양도하기</button>
        		<button type="button" class="btn btn-secondary" id="closeButton" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
		     </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 양도 관련 모달창 끝 -->
	
	<script>
	 	<!-- 모달창에서 취소버튼 클릭 시 환불 페이지로 넘어가기 -->
	 	$(document).on("click", "#cancelButton", function(event){
	 	    // 예약 환불 페이지로 이동
	 		window.location.href = '<c:url value="환불페이지"/>';
	 	});
	 	<!-- 모달창에서 취소버튼 클릭 시 양도 페이지로 넘어가기 -->
	 	$(document).on("click", "#assignmentButton", function(event){
	 	    // 예약 양도 페이지로 이동
	 		window.location.href = '<c:url value="양도페이지"/>';
	 	});
	 	
	 	<!-- 버튼 클릭 시 메인화면으로 가기 -->
	 	$("#mainButton").click(function() {
	 	    window.location.href = '<c:url value="/" />';
	 	});
 	</script>
	
    <!-- footer -->
	<footer class="footer">
		<%@ include file="../common/common_footer.jsp" %>
	</footer>
    <!-- footer -->
</body>
</html>
