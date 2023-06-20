<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<select class="form-select form-select mb-3" id="restaurantName" name="res_name" aria-label=".form-select example" style="width: 180px;">
								<option selected value="">전체식당</option>
								<c:forEach items="${restaurantList }" var="restaurantList">
								<option value="${restaurantList.res_name }">${restaurantList.res_name }</option>
								</c:forEach>
						</select>
					</div>
				</div>
				<!-- 가계선택 끝 -->
				<!-- 방문상태 시작 -->
				<div class="col">
					<div class="dropdown" style="margin-left: 40px;">
						<select class="form-select form-select mb-3" id="status" aria-label=".form-select example" style="width: 180px;">
							<option selected value="">전체상태</option>
							<option value="방문예정">방문예정</option>
							<option value="방문완료">방문완료</option>
							<option value="취소">취소</option>
							<option value="양도">양도</option>
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
					<button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning  text-black p-3" onclick="location.href='restaurantList'">가게리스트 </button>
                    <button type="button" class="btn btn-outline-warning active text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
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
                    <c:forEach items="${resList }" var="resList" >
                        <tr>
                            <td>${resList.r_idx }</td>
                            <td>${resList.res_name }</td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="yy-MM-dd"/></td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="HH:mm"/></td>
                            <td>
	                            <c:choose>
	                           		<c:when test="${resList.r_status eq 1 }">
	                           			방문예정
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 2 }">
	                           			방문완료
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 3 }">
	                           			취소
	                           		</c:when>
	                           		<c:otherwise>
	                           			양도
	                           		</c:otherwise>
	                           	</c:choose>
                            </td>
                            <td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal${resList.r_idx }">상세보기</button></td>
                        </tr>
                   </c:forEach>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>

 	<!-- 예약관리 첫번째 모달창 (방문예정 상태) -->
 	<c:forEach var="resList" items="${resList }">
	 <div class="modal fade" id="rsListModal${resList.r_idx }" tabindex="-1" aria-labelledby="rsListModalLabel" aria-hidden="true">
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
				            <h3 style="font-weight: bold;">${resList.res_name }</h3>
	        				</div>
							<!-- 예약관리 테이블 시작 -->
					        <div class="col-md-12">
					            <table class="mt-3 table d-flex justify-content-center">
					                <tbody>
										<tr>
					                        <th>예약번호</th>
					                        <td>${resList.r_idx }</td>
					                    </tr>
					                    <tr>
					                        <th>날짜</th>
					                        <td><fmt:formatDate value="${resList.r_date }" pattern="yyyy년MM월dd일"/></td>
					                    </tr>
					                    <tr>
					                        <th>시간</th>
					                        <td><fmt:formatDate value="${resList.r_date }" pattern="HH시mm분"/></td>
					                    </tr>
					                    <tr>
					                        <th>예약코스</th>
					                        <td>${resList.cr_type }</td>
					                    </tr>
					                    <tr>
					                        <th>예약비용</th>
					                        <td>${resList.r_amount }</td>
					                    </tr>
					                    <tr>
					                        <th>테이블 수</th>
					                        <td>${resList.r_tables }</td>
					                    </tr>
					                    <tr>
					                        <th>인원</th>
					                        <td>${resList.r_personnel }</td>
					                    </tr>
					                    <tr>
					                        <th>예약자</th>
					                        <td>${resList.m_name }</td>
					                    </tr>
										<tr>
					                        <th>상태</th>
					                        <td>
					                        <c:choose>
			                            		<c:when test="${resList.r_status eq 1 }">
			                            			방문예정
			                            		</c:when>
			                            		<c:when test="${resList.r_status eq 2 }">
			                            			방문완료
			                            		</c:when>
			                            		<c:when test="${resList.r_status eq 3 }">
			                            			취소
			                            		</c:when>
			                            		<c:otherwise>
			                            			양도
			                            		</c:otherwise>
			                            	</c:choose>
					                        </td>
					                    </tr>
					                    <tr>
					                    	<th>요청사항</th>
					                    	<td>${resList.r_request }</td>
					                    </tr>
		                			</tbody>
		           				 </table>
		            			<!-- 예약관리 테이블 끝 -->
		        			</div>
						    <div class="d-flex justify-content-center">
						    	<c:if test="${resList.r_status eq 1  }">
				        			<button type="button" class="btn btn-outline-warning" onclick="location.href='resCancel?r_idx=${resList.r_idx }'" id="cancelButton" style="margin-left: 10px;"> 예약 취소</button>
				        		</c:if>
				        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
						    </div>
					</div>
					<!-- 예약관리 내용 끝-->
	      		</div>
	    	</div>
		</div>
	</div>
</div>
</c:forEach>
	<!-- 예약관리 출력 첫번째 모달창 끝 -->	
 
<script type="text/javascript">
$(document).ready(function() {
	  $("#status, #restaurantName").on("change", function() {
	    var selectedStatus = $("#status").val();
	    var selectedRestaurant = $("#restaurantName").val();

	    $("table tbody tr").each(function() {
	      var statusCell = $(this).find("td:nth-child(5)");
	      var restaurantNameCell = $(this).find("td:nth-child(2)");
	      var status = statusCell.text().trim();
	      var restaurantName = restaurantNameCell.text().trim();

	      var showRow = (selectedStatus === "" || status === selectedStatus) && (selectedRestaurant === "" || restaurantName === selectedRestaurant);

	      $(this).toggle(showRow);
	    });
	  });
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