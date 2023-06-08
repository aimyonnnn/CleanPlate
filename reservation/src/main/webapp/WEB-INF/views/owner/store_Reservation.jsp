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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
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
            <h2>점주 마이페이지</h2>
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
		    <h2 style="margin-left: 40px; margin-top: 30px;">예약관리</h2>
		        <!-- 드롭다운 시작 -->
			<div class="row">
				<!-- 가계선택 -->
				<div class="col-2">
					<div class="dropdown" style="margin-left: 40px;">
						<select class="form-select form-select mb-3" aria-label=".form-select example" style="width: 180px;">
							<option selected value="planToVisit">전체예약</option>
							<option value="visited">칸다소바(서면점)</option>
							<option value="cancelNoshow">칸다소바(전포점)</option>
						</select>
					</div>
				</div>
				<!-- 가계선택 끝 -->
				<!-- 방문상태 시작 -->
				<div class="col">
					<div class="dropdown" style="margin-left: 40px;">
						<select class="form-select form-select mb-3" aria-label=".form-select example" style="width: 180px;">
							<option selected value="planToVisit">전체상태</option>
							<option value="visited">방문예정</option>
							<option value="cancelNoshow">방문완료</option>
							<option value="cancelNoshow">취소/노쇼</option>
						</select>
					</div>
				</div>
				<!-- 방문상태 끝 -->
			</div>
				<!-- 드롭다운 끝 -->
			</div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼 구역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='CeoMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning mt-4 text-black p-3" onclick="location.href='StoreList'">가게리스트 </button>
                    <button type="button" class="btn btn-outline-warning active text-black p-3" onclick="location.href='StoreReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='StoreSales'">매출관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='CeoMypageDelete'">회원탈퇴</button>
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
                            <td>취소/노쇼 </td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal2">상세보기</button></td>
                        </tr>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>
 
 	<!-- 예약관리 첫번째 모달창 (방문예정 상태) -->
	 <div class="modal fade" id="rsListModal" tabindex="-1" aria-labelledby="rsListModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="rsListModalLabel">예약 내역</h1>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
	        		<!-- 예약관리 내용 시작-->
					<div class="container">
					    <div class="row">
	        				<div class="col-md-12" style="text-align: center;">
	            			<h1 style="color: #FFC107;">예약</h1>
				            <hr>
				            <h3 style="font-weight: bold;">키친동백</h3>
	        				</div>
							<!-- 예약관리 테이블 시작 -->
					        <div class="col-md-12">
					            <table class="mt-3 table d-flex justify-content-center">
					                <tbody>
										<tr>
					                        <th>예약번호</th>
					                        <td>000001</td>
					                    </tr>
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
					                        <th>상태</th>
					                        <td>방문예정</td>
					                    </tr>
										<tr>
					                        <th>메뉴</th>
					                        <td>
												또루꾸 막또 1개<br>
												또루꾸 막또 2개<br>
											</td>
					                    </tr>
		                			</tbody>
		           				 </table>
		            			<!-- 예약관리 테이블 끝 -->
		        			</div>
						    <div class="d-flex justify-content-center">
				        		<button type="button" class="btn btn-outline-warning" id="cancelButton">예약 취소하기</button>
				        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
						    </div>
					</div>
					<!-- 예약관리 내용 끝-->
	      		</div>
	    	</div>
		</div>
	</div>
</div>
	<!-- 예약관리 출력 첫번째 모달창 끝 -->

	<!-- 예약관리 출력 두번째 모달창 시작 (방문완료 및 취소/노쇼) -->
	<!-- 구현 작업시 하나의 모달로 처리할 것 -->
	<div class="modal fade" id="rsListModal2" tabindex="-1" aria-labelledby="rsListModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="rsListModalLabel">예약 내역</h1>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
	        		<!-- 예약관리 내용 시작-->
					<div class="container">
					    <div class="row">
	        				<div class="col-md-12" style="text-align: center;">
	            			<h1 style="color: #FFC107;">예약</h1>
				            <hr>
				            <h3 style="font-weight: bold;">키친동백</h3>
	        				</div>
							<!-- 예약관리 테이블 시작 -->
					        <div class="col-md-12">
					            <table class="mt-3 table d-flex justify-content-center">
					                <tbody>
										<tr>
					                        <th>예약번호</th>
					                        <td>000002</td>
					                    </tr>
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
					                        <th>상태</th>
					                        <td>취소/노쇼</td>
					                    </tr>
										<tr>
					                        <th>메뉴</th>
					                        <td>
												또루꾸 막또 1개<br>
												또루꾸 막또 2개<br>
											</td>
					                    </tr>
										<tr>
											<th>취소사유</th>
											<td>노쇼</td>
										</tr>
		                			</tbody>
		           				 </table>
		            			<!-- 예약관리 테이블 끝 -->
		        			</div>
						    <div class="d-flex justify-content-center">
				        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
						    </div>
					</div>
					<!-- 예약관리 내용 끝-->
	      		</div>
	    	</div>
		</div>
	</div>
</div>
	<!-- 예약관리 출력 두번째 모달창 끝 -->
 	
 	
 	

 
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 
