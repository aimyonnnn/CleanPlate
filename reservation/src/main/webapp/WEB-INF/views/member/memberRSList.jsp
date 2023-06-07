<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
                    <img src="../images/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                    
                </div>
            </div>
            <div class="col-10">
		    <h2 style="margin-left: 40px; margin-top: 30px;">예약내역</h2>
		        <!-- 드롭다운 시작 -->
		        <div class="dropdown" style="margin-left: 40px;">
				  <select class="form-select form-select mb-3" aria-label=".form-select example" style="width: 130px;">
					  <option selected value="planToVisit">방문예정</option>
					  <option value="visited">방문완료</option>
					  <option value="cancelNoshow">취소/노쇼</option>
					</select>
				</div>
				<!-- 드롭다운 끝 -->
			</div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼 구역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
            </div>
            <!-- 내용 -->
            <div class="col-md-8">
                <!-- 내용(추후에 foreach문으로 수정할 부분!) -->
                <table class="table table-striped text-center" style="margin-left:50px;">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>식당</th>
                            <th>날짜</th>
                            <th>시간</th>
                            <th>상태</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>000001</td>
                            <td>동백키친</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>방문예정</td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000002</td>
                            <td>동백키친</td>
                            <td>23-05-24</td>
                            <td>12:00</td>
                            <td>방문예정</td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal">상세보기</button></td>
                        </tr>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>
 
 	<!-- 예약내역 출력 첫번째 모달창 -->
	<div class="modal fade" id="rsListModal" tabindex="-1" aria-labelledby="rsListModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="rsListModalLabel">예약 내역</h1>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
	        		<!-- Content 시작-->
					<div class="container">
					    <div class="row">
					        <div class="h-50 p-3 col-md-12 padding: 20px" style="text-align: center;">
					            <h1><b style="color: cornflowerblue;">예약 안내</b></h1>
					            <hr>
					            <h2><b>동백 키친</b></h2>
					        </div>
					        <!-- 가게사진 -->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-12" >
					                <img src="https://lh3.googleusercontent.com/p/AF1QipNY1MlSKhc_HLzeW1-s9SauzPn9woiO3QmNd9eA=s680-w680-h510" 
					                          class="rounded mx-auto d-block" height="300px" width="500px">
					            </div>
					        </div>
					        <!-- 날짜 -->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3" ></div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4><b>날짜</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4>2023년 05월 25일</h4>
					            </div>
					            <div class="h-50 p-3 col-md-3"> </div>
					        </div>
					        <!-- 시간 -->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3" ></div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4><b>시간</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4>오후 7:00</h4>
					            </div>
					            <div class="h-50 p-3 col-md-3"> </div>
					        </div>
					        <!-- 인원 -->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3"> </div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4><b>인원</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4>5명</h4>
					            </div>
					            <div class="h-50 p-3 col-md-3"> </div>
					        </div>
					        <!-- 예약자 -->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3"> </div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4><b>예약자</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4>Team2</h4>
					            </div>
					            <div class="h-50 p-3 col-md-3"> </div>
					        </div>
					        <!-- 오시는길 -->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3"></div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					            <h4><b>[오시는길]</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-5" style="text-align: left;">
					                <h4>부산광역시 해운대구 달맞이길117번가길 85</h4>
					            </div>
					            <div class="h-50 p-3 col-md-1"> </div>
					        </div>   
					        <!--발렛비 안내-->
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3"></div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					            <h4><b>[발렛비 안내]</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-5" style="text-align: left;">
					                <h4>런치 1시간30분기준 3,000원</h4>
					                <h4>디너 4시간기준 5,000원</h4>
					            </div>
					            <div class="h-50 p-3 col-md-1"> </div>
					        </div>
					
					        <div class="row" style="text-align: center;">
					            <div class="h-50 p-3 col-md-3"></div>
					            <div class="h-50 p-3 col-md-3" style="text-align: left;">
					                <h4><b>[안내사항]</b></h4>
					            </div>
					            <div class="h-50 p-3 col-md-5" style="text-align: left;">
					                <h4>예약 변경 및 취소는 예약일 기준 일주일 전까지만 가능합니다.</h4>
					                <h4>그 이후로는 환불 및 날짜변경이 불가하니 변동사항 있으실 경우</h4>
					                <h4>사전에 레스토랑으로 연락 주시기 바랍니다.</h4>
					                <br>
					                <br>
					            </div>
					            <div class="h-50 p-3 col-md-1"> </div>
					        </div>      
					    </div>
					    <div class="d-flex justify-content-center">
			        		<button type="button" class="btn btn-outline-warning" id="cancelButton">예약 취소하기</button>
			        		<button type="button" class="btn btn-outline-warning" style="margin-left: 10px;" data-bs-toggle="modal" data-bs-target="#assignmentModal">예약 양도하기</button>
			        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
					    </div>
					</div>
					<!-- Content 끝-->
					</div>
	        		
	      		</div>
	    	</div>
		</div>
	<!-- 예약내역 출력 첫번째 모달창 끝 -->
 	
 	<!-- 두번째 양도 관련 모달창 -->
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
	<!-- 두번째 양도 관련 모달창 끝 -->
 	
 	
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
	 	<!-- 모달창에서 닫기버튼 클릭 시 현재 페이지로 돌아가기 -->
	 	$(document).on("click", "#closeButton", function(event){
	 	    // 예약 양도 페이지로 이동
	 		window.location.href = "memberRSList";
	 	});
 	</script>
 
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 