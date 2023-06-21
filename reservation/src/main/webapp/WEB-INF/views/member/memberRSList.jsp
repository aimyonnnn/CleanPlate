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
						<select class="form-select form-select mb-3" id="status" aria-label=".form-select example" style="width: 180px;">
							<option selected value="">전체상태</option>
							<option value="방문예정">방문예정</option>
							<option value="방문완료">방문완료</option>
							<option value="취소">취소</option>
							<option value="양도">양도</option>
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
                            <td>
                            <button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal${resList.r_idx }">상세보기</button>
                            <button type="button" class="btn btn-outline-warning" style="margin-left: 10px;" data-bs-toggle="modal" data-bs-target="#assignmentModal${resList.r_idx }">예약 양도하기</button>
                            </td>
                            
                        </tr>
                   </c:forEach>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>
 
 	<!-- 예약내역 출력 첫번째 모달창 -->
 	<c:forEach var="resList" items="${resList }">
	 <div class="modal fade" id="rsListModal${resList.r_idx }" tabindex="-1" aria-labelledby="rsListModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="rsListModalLabel">예약 내역</h1>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
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
					                        <th>인원</th>
					                        <td>${resList.r_personnel } 명</td>
					                    </tr>
					                    <tr>
					                        <th>예약자</th>
					                        <td>${resList.m_name } 님</td>
					                    </tr>
					                    <tr>
					                        <th>예약코스</th>
					                        <td>${resList.me_name }</td>
					                    </tr>
					                    <tr>
					                        <th>예약비용</th>
					                        <td>${resList.r_amount } 원</td>
					                    </tr>
					                    <tr>
					                        <th>테이블 수</th>
					                        <td>${resList.r_tables } 개</td>
					                    </tr>
					                    <c:forEach var="rsList" items="${rsList }">
						                   <c:if test="${rsList.res_idx eq resList.res_idx }">
						                    <tr>
						                        <th>[오시는길]</th>
						                        <td>
					                        		${rsList.res_address } <br>
					                        		${rsList.res_detailAddress }
						                        </td>
						                    </tr>
						                    <tr>
						                        <th>[편의시설]</th>
						                        <td>
						                        	${rsList.res_amenity } <br>
					                        		${rsList.res_amenity_info }
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
						                    </c:if>
					                    </c:forEach>
		                			</tbody>
		           				 </table>
		            			<!-- 예약내역 테이블 끝 -->
		        			</div>
						    <div class="d-flex justify-content-center">
				        		<button type="button" class="btn btn-outline-warning" onclick="cancel(${resList.r_idx })">예약 취소하기</button>
				        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
						    </div>
					</div>
					<!-- 예약내역 내용 끝-->
					</div>
	      		</div>
	    	</div>
		</div>
	</div>
</div>
</c:forEach>
	<!-- 예약내역 출력 첫번째 모달창 끝 -->
 	
 	<!-- 두번째 양도 관련 모달창 -->
 	<c:forEach var="resList" items="${resList }">
	<div class="modal fade" id="assignmentModal${resList.r_idx }" tabindex="-1" aria-labelledby="assignmentModalLabel" aria-hidden="true">
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
                            <th>판매가격 입력</th>
                        </tr>
                    </thead>
                    <tbody>
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
                            <td><input type="text" id="salesValue"></td>
                        </tr>
                   </tbody>
            </table>
	            <div class="d-flex justify-content-center">
	            	양도한 예약은 양도 게시판에 등록되며, 고객센터를 통해서만 취소가 가능합니다. 
	            </div>
	         <div class="mt-3 d-flex justify-content-center">
        		<button type="button" class="btn btn-outline-warning" id="assignmentButton" onclick="redirectToAssignment('${resList.r_idx}',  $('#salesValue').val())">예약 양도하기</button>
        		<button type="button" class="btn btn-secondary" id="closeButton" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
		     </div>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
	<!-- 두번째 양도 관련 모달창 끝 -->
 	
 	<!-- 양도 관련 스크립트 -->
 	<script>
 	// 양도 금액 입력 시 유효성 검사
 	$(document).ready(function() {
 		  $('#salesValue').on('input', function() {
 		    var value = $(this).val();
 		    $(this).val(value.replace(/[^0-9]/g, ''));
 		  });
 		});
 	
 	// 양도 게시판에 insert
 	function redirectToAssignment(r_idx, salesValue) {
 	    var url = '<c:url value="registAssignment?r_idx=' + r_idx + '&salesValue=' + salesValue + '"/>';
 	    window.location.href = url;
 	}
 	</script>
 	
 	<script>
	 	<!-- 모달창에서 취소버튼 클릭 시 환불 페이지로 넘어가기 -->
	 	$(document).on("click", "#cancelButton", function(event){
	 	    // 예약 환불 페이지로 이동
	 		window.location.href = '<c:url value="환불페이지"/>';
	 	});
	 	<!-- 모달창에서 닫기버튼 클릭 시 현재 페이지로 돌아가기 -->
	 	$(document).on("click", "#closeButton", function(event){
	 	    // 예약 양도 페이지로 이동
	 		window.location.href = "memberRSList";
	 	});
 	</script>
 	
 	<script type="text/javascript">
	$(document).ready(function() {
		  $("#status").on("change", function() {
		    var selectedStatus = $("#status").val();
	
		    $("table tbody tr").each(function() {
		      var statusCell = $(this).find("td:nth-child(5)");
		      var status = statusCell.text().trim();
	
		      var showRow = (selectedStatus === "" || status === selectedStatus);
	
		      $(this).toggle(showRow);
		    });
		  });
		});
	</script>
	
<script type="text/javascript">
	function noShow(r_idx) {
		let result = confirm("노쇼가 확실합니까?");
		if(result){
			location.href='resCancel?r_idx=' + r_idx + '&r_status=4';
		}
	}
	
	function cancel(r_idx) {
		let result = confirm("취소가 확실합니까? \n (취소할 경우 예약을 되돌릴 수 없으며 다시 예약해야합니다.)");
		if(result){
			alert("취소가 완료되었습니다.");
			location.href='resCancel?r_idx=' + r_idx + '&r_status=3';
		}
	}
</script>
 
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 