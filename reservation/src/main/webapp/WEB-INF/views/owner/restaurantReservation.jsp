<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- iamport -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<!-- Sweet Alert 플러그인 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
	
    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/ceoReservation.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantList'">가게리스트 </button>
					<button type="button" class="btn btn-outline-dark text-white active p-3" onclick="location.href='restaurantReservation'">예약관리</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-8">
				<div class="row d-flex justify-content-start" style="margin-left: 90px; margin-top: 60px;">
				<div class="col-10">
			        <!-- 드롭다운 시작 -->
					<div class="row">
						<div class="col-2">
							<div class="dropdown">
								<select class="form-select form-select mb-3" id="restaurantName" name="res_name" aria-label=".form-select example" style="width: 180px;">
										<option selected value="">전체식당</option>
										<c:forEach items="${restaurantList }" var="restaurantList">
										<option value="${restaurantList.res_name }">${restaurantList.res_name }</option>
										</c:forEach>
								</select>
							</div>
						</div>
						<!-- 방문상태 시작 -->
						<div class="col">
							<div class="dropdown" style="margin-left: 90px;">
								<select class="form-select form-select mb-3" id="status" aria-label=".form-select example" style="width: 180px;">
									<option selected value="">전체상태</option>
									<option value="방문예정">방문예정</option>
									<option value="방문완료">방문완료</option>
									<option value="취소">취소</option>
								</select>
							</div>
						</div>
						<div class="col">
							<div class="dropdown">
								<select class="form-select form-select mb-3" aria-label=".form-select example" style="width: 180px;" id="dateFilter">
								  <option value="">전체날짜</option>
								  <c:forEach items="${sortedDates}" var="date">
								    <option>${date}</option>
								  </c:forEach>
								</select>
							</div>
					</div>
					<!-- 방문상태 끝 -->
				</div>
				<!-- 드롭다운 끝 -->
				</div>
        	</div>
                <!-- 내용(추후에 foreach문으로 수정할 부분!) -->
                <div class="col-12">
                <table class="table table-striped text-center" style="margin-left:100px;">
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
                        <tr class = "res">
                            <td>${resList.r_idx }</td>
                            <td>${resList.res_name }</td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="yy-MM-dd"/></td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="HH:mm"/></td>
                            <td>
		                       <c:choose>
	                           		<c:when test="${resList.r_status eq 2 }">
	                           			방문완료
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 3 }">
	                           			취소
	                           		</c:when>
	                           		<c:otherwise>
	                           			방문예정
	                           		</c:otherwise>
	                           	</c:choose>
                            </td>
                            <td><button type="button" class="btn btn-dark" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal${resList.r_idx }">상세보기</button></td>
                        </tr>
                   </c:forEach>
                    </tbody>
                </table> 
                <c:if test="${empty resList }">
                   <h5 style="color: gray; text-align: center;">아직 가게에 예약이 없습니다.</h5>
                </c:if>
            </div>
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
					                        <td>${resList.me_name }</td>
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
			                            		<c:when test="${resList.r_status eq 2 }">
			                            			방문완료
			                            		</c:when>
			                            		<c:when test="${resList.r_status eq 3 }">
			                            			취소
			                            		</c:when>
			                            		<c:otherwise>
			                            			방문예정
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
						    	<c:if test="${resList.r_status eq 1 }">
				        			<button type="button" class="btn btn-outline-warning" onclick="cancel(${resList.r_idx })" id="cancelButton" style="margin-left: 10px;"> 예약 취소</button>
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
 
<script>
  $(document).ready(function() {
    $('#dateFilter, #status, #restaurantName').change(function() {
      var selectedDate = $('#dateFilter').val();
      var selectedStatus = $('#status').val();
      var selectedRestaurant = $('#restaurantName').val();

      $('.res').hide(); // 모든 데이터 숨기기

      $('.res').each(function() {
        var dateCell = $(this).find("td:nth-child(3)");
        var statusCell = $(this).find("td:nth-child(5)");
        var restaurantNameCell = $(this).find("td:nth-child(2)");
        var date = dateCell.text().trim();
        var status = statusCell.text().trim();
        var restaurantName = restaurantNameCell.text().trim();

        var showRow = (selectedDate === '' || date === selectedDate) && (selectedStatus === '' || status === selectedStatus) && (selectedRestaurant === '' || restaurantName === selectedRestaurant);

        $(this).toggle(showRow);
      });
    });
  });
</script>

	<!-- 예약 취소 -->
	<script type="text/javascript">
    function cancel(r_idx) {
        let result = confirm("취소가 확실합니까? \n (취소할 경우 예약을 되돌릴 수 없습니다.)");

        if (result) {

            // 결제정보 조회를 위한 ajax요청
            $.ajax({
                url: '<c:url value="paymentCancel"/>',
                type: 'POST',
                data: { r_idx: r_idx },
                dataType: 'json',
                success: function(response) {
					
                    console.log(JSON.stringify(response));

                    alert('주문번호 ' + JSON.stringify(response.payment_num)
                    		+ '결제 취소를 진행합니다. \n취소하실 금액은 '
                    		+ JSON.stringify(response.payment_total_price) + '원 입니다.');
					
                    // 결제 취소를 위한 ajax요청
                    $.ajax({
                        url: "payCancel",
                        type: "POST",
                        data: {
                            'payment_num': response.payment_num,
                            'payment_total_price': response.payment_total_price,
                            'reason': "테스트 결제 환불"
                        },
                        success: function(data) {
                            // 환불 완료 swal창으로 안내
                            swal({
                                title: "환불 성공!",
                                text: "예약이 성공적으로 취소되었습니다.",
                                icon: "success",
                                button: "확인"
                            }, function() {
                                // 환불 완료 후 전 화면으로 이동
                                location.href = "memberRSList";
                            });
                        },
                        error: function(xhr, status, error) {
                            swal("환불 실패!" + error);
                        }
                    }); // ajax

                //=========================================================================
                	
                },
                error: function(xhr, status, error) {
                    console.log('Ajax 오류 발생했습니다');
                    console.log('상태 코드: ' + xhr.status);
                    console.log('에러 메시지: ' + error);
                }
            }); // ajax
            
        } // if
    }
	</script>



    <hr class="mt-5">
	<%@ include file="../common/common_footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
</body>
</html>