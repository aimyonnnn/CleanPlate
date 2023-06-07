<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <img src="../images/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                    
                </div>
            </div>
            <div class="col-10">
		    <h2 style="margin-left: 40px; margin-top: 30px;">예약내역</h2>
		        <!-- 드롭다운 시작 -->
		        <div class="dropdown" style="margin-left: 40px;">
				  <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
				    방문예정
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <li><a class="dropdown-item" href="#">방문완료</a></li>
				    <li><a class="dropdown-item" href="#">취소/노쇼</a></li>
				  </ul>
				</div>
				<!-- 드롭다운 끝 -->
			</div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼 구역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='mypage_rslist'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_like'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_rv'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='withdrawal'">회원탈퇴</button>
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
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000001</td>
                            <td>동백키친</td>
                            <td>23-05-23</td>
                            <td>17:00</td>
                            <td>예약중</td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>000002</td>
                            <td>동백키친</td>
                            <td>23-05-20</td>
                            <td>12:00</td>
                            <td>이용완료</td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                        </tr>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>
 
 	<!-- 확인 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="exampleModalLabel">예약 내역</h1>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
	        		<!-- Center 시작-->
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
					</div>
					<!-- Center 끝-->
					</div>
	        		
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        		<button type="button" class="btn btn-warning" style="color: white;" id="withdrawButton">예약 취소하기</button>
	      		</div>
	    	</div>
		</div>
	<!-- 확인 모달 끝 -->
 
 	<!-- 모달창에서 예약 취소 후 취소 확인 페이지로 넘어가기 -->
	<script>
	  $("#withdrawButton").click(function() {
	    // 예약 취소 페이지로 이동
	    window.location.href = "/mypage";
	  });
	  
	  // 드롭박스 적용 스크립트
	  $(function() {
	     $('.dropdown-toggle').dropdown();
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