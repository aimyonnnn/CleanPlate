<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>memberAssignList</title>
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
<%@ include file="../common/common_header.jsp" %>

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
		    <h2 style="margin-left: 40px; margin-top: 30px;">양도관리</h2>
		        <!-- 드롭다운 시작 -->
		        <div class="row">
		        	<div class="col-2">
				        <div class="dropdown" style="margin-left: 40px;">
							<select class="form-select form-select mb-3" id="status" aria-label=".form-select example" style="width: 180px;">
								<option selected value="">전체상태</option>
								<option value="판매중">판매중</option>
								<option value="판매완료">판매완료</option>
								<option value="판매실패">판매실패</option>
							</select>
						</div>
					</div>
				</div>
			</div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼 구역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='memberAssignList'">양도 관리</button>
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
                            <th>판매금액</th>
                            <th>상태</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${aList }">
                        <tr class="res">
                            <td>${list.r_idx }</td>
                            <td>${list.a_price}원</td>
                            <td>
                            	<!--  -->
	                            <c:choose>
	                           		<c:when test="${list.a_status eq 1}">
	                           			판매중
	                           		</c:when>
	                           		<c:when test="${list.a_status eq 2}">
	                           			판매완료
	                           		</c:when>
	                           		<c:otherwise>
	                           			판매실패
	                           		</c:otherwise>
	                           	</c:choose>
	                            <!--  -->
                            </td>
                            <td>
                            	<!-- 양도상태가 2-양도완료 & 결제상태가 1-결제완료인경우 정산하기 출력 -->
                            	<!-- 양도상태가 2-양도완료 & 결제상태가 2-결제취소인경우 정산완료 출력 -->
                            	<c:choose>
                            		<c:when test="${list.a_status eq 2}">
                            			<button type="button" class="btn btn-warning" style="margin-left: 10px; color: white;" onclick="cancelAndCalculate(${list.r_idx }, ${list.a_price})">정산하기</button>
                            		</c:when>
                            		<c:otherwise>
		                            	<button type="button" class="btn btn-outline-warning" style="margin-left: 10px;" data-bs-toggle="modal" data-bs-target="#assignmentModal${list.r_idx }">양도하기</button>
                            		</c:otherwise>
                            	</c:choose> 
                            	<!--  -->                       
                            </td>
                        </tr>
                   </c:forEach>
                    </tbody>
                </table> 
            </div>
        </div>
    </div>

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
                            <th>
                               <!--  -->
	                           <c:choose>
				                    <c:when test="${resList.r_status eq 5}">
								     	수정할 가격을 입력하세요
								    </c:when>
	                           		<c:when test="${resList.r_status eq 1}">
								  		판매할 가격을 입력하세요
								    </c:when>
								    <c:otherwise>
								    	기타
								    </c:otherwise>
	                           </c:choose>
	                           <!--  -->
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${resList.r_idx }</td>
                            <td>${resList.res_name }</td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="yy-MM-dd"/></td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="HH:mm"/></td>
                            <td>
	                           	<!-- r_status가 1-방문예정, 2-방문완료, 3-취소, 4-양도완료, 5-판매중, 6-판매실패 -->
							    <c:choose>
						           <c:when test="${resItem.r_status eq 1}">방문예정</c:when>
						           <c:when test="${resItem.r_status eq 2}">방문완료</c:when>
						           <c:when test="${resItem.r_status eq 3}">취소</c:when>
						           <c:when test="${resItem.r_status eq 4}">양도완료</c:when>
						           <c:when test="${resItem.r_status eq 5}">판매중</c:when>
						           <c:when test="${resItem.r_status eq 5}">판매실패</c:when>
							    </c:choose>
						     </td>
						     <td>
						     	<!-- -->
					     	    <c:choose>
				                    <c:when test="${resList.r_status eq 5}">
								        <div>
								        	<input type="text" class="salesValue2" id="salesValue2${resList.r_idx}" placeholder="가격을 입력하세요">
								        </div>
								    </c:when>
								    <c:when test="${resList.r_status eq 1}">
								    	<input type="text" class="salesValue" id="salesValue${resList.r_idx}" placeholder="가격을 입력하세요">
								    </c:when>
	                           </c:choose>
	                           <!-- -->
					     	 </td>
                        </tr>
                   </tbody>
            </table>
	            <div class="d-flex justify-content-center">
	            	<a>양도한 예약은 양도 게시판에 등록되며, 고객센터를 통해서만 취소가 가능합니다.</a> 
	            </div>
	         <div class="mt-3 d-flex justify-content-center">
	         
	          <!--  ====================================== 예약상태에 따른 동적 버튼 생성하기 ====================================== -->
			  <!-- 예약상태가 "1-방문예정" 일 경우 "예약 양도하기" 버튼 활성화 -->
			  <!-- 예약상태가 "5-판매중" 일 경우 가격을 수정할 수 있도록 "가격 수정" 버튼 활성화 -->
			  <!-- 가격 입력 필드와 가격 수정 버튼을 함께 표시 -->
			  <c:choose>
				    <c:when test="${resList.r_status eq 1}">
	   					<button type="button" class="btn btn-outline-warning" id="assignmentButton" onclick="redirectToAssignment(${resList.r_idx})">양도하기</button>
				    </c:when>
				    <c:when test="${resList.r_status eq 5}">
			            <button type="button" class="btn btn-outline-warning" onclick="updatePrice(${resList.r_idx})">수정하기</button>
				    </c:when>
				    <c:otherwise>
				    	 <button type="button" class="btn btn-danger" id="assignmentButton"
					     onclick="alert('이미 취소 또는 완료된 예약입니다.')">이미 취소 또는 완료된 예약입니다.</button>
				    </c:otherwise>
			  </c:choose>
	          <!--  ====================================== 예약상태에 따른 동적 버튼 생성하기 ====================================== -->
	          
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
	<!-- 두번째 양도 관련 모달창 끝 -->

 	<!-- 가격 수정을 위한 ajax요청 -->
 	<script>
	    function updatePrice(r_idx) {
	    	
	        var salesValue =$("#salesValue2" + r_idx).val();
	        console.log(salesValue);
	        
	        // 확인 메시지 출력
	        var confirmation = confirm('입력한 금액이 맞습니까?');
	        
	        if (confirmation) {
	        	
	        	// ======================================== ajax ========================================
		        $.ajax({
		            url: '<c:url value="modifySalesPrice"/>',
		            method: "POST",
		            data: {
		            	r_idx: r_idx,
		                salesValue: salesValue
		            },
		            dataType: "text",
		            success: function(response) {
		            	
						console.log(response);
						
						if(response === '1') {
			                alert("가격이 성공적으로 업데이트되었습니다.");
			                location.href='<c:url value="memberAssignList"/>'
			                
						} else if (response === '0') {
							alert("예약금액 보다 높게 판매할 수 없습니다. 가격을 다시 입력해주세요");
						}
						
		            },
		            error: function(xhr, status, error) {
		                console.error("가격 업데이트 오류:", error);
		            }
		        }); // ajax
	        } // if
	    } // updatePrice
	</script>
 	
 	<!--  -->
 	<script>
 	// 양도 금액 입력 시 유효성 검사
 	$(document).ready(function() {
	  	$('.salesValue').on('input', function() {	
	    var value = $(this).val();
	    // 값에서 숫자가 아닌 문자를 빈 문자열로 대체함!
	    // 이렇게 하면 입력 필드에는 숫자 값만 입력됨
	    $(this).val(value.replace(/[^0-9]/g, ''));
	 	});
	});
	
 	// 양도 게시판에 글 등록하기
 	function redirectToAssignment(r_idx) {
 		
 	   // id 속성명이 salesValue + r_idx 값을 변수에 저장! => 동적으로 바뀌어야 하는 부분임!
 	   // 원래 코드에서는 모든 .salesValue 입력란의 값을 가져오려고 했으나 수정된 코드에서는
 	   // 해당 예약의 입력란 값을 정확하게 가져오는 방식으로 변경함!
 	   var value = $('#salesValue' + r_idx).val();

	   // 확인 메시지 출력
	   var confirmation = confirm('입력한 금액이 맞습니까?');
	   
	   // 아무값도 입력하지 않았을 때 리턴시켜서 다시 입력하게 하기!
	   // 입력된 값에서 앞뒤 공백을 제거한 결과가 빈 문자열인지를 확인함
	   // 즉, 값이 공백으로만 이루어져 있다면 조건이 참이됨!
	   if (value.trim() === '') {
	        alert('판매 가격을 정확하게 입력해주세요.');
	        return;
	   }
		
	   if (confirmation) {
	      var url = '<c:url value="registAssignment?r_idx=' + r_idx + '&salesValue=' + value + '"/>';
	      window.location.href = url;
   	   }
  	}
 	</script>
 	
 	<!--  -->
 	<script>
	 	<!-- 모달창에서 닫기버튼 클릭 시 현재 페이지로 돌아가기 -->
	 	$(document).on("click", "#closeButton", function(event){
	 	    // 예약 양도 페이지로 이동
	 		window.location.href = "memberAssignList";
	 	});
 	</script>
 	
	<!-- 판매금액 정산하기 - 부분취소 -->
	<script type="text/javascript">
	function cancelAndCalculate(r_idx, a_price) {
		
		 let result = confirm("예약번호 " + r_idx + "번의 판매내역 정산을 하시겠습니까? \n결제금액의 5퍼센트를 차감 후 카드 부분취소가 진행됩니다.");
		 
		 if(result) {
			 
			 // 결제정보 조회를 위한 ajax요청
	            $.ajax({
	                url: '<c:url value="paymentCancel2"/>',
	                type: 'POST',
	                data: { r_idx: r_idx },
	                dataType: 'json',
	                success: function(response) {
						
	                    console.log(JSON.stringify(response));
						
	                    var refundAmount = a_price * 0.95; // 가격이 수정된 금액을 기준으로 수수료 5% 차감
	                    
	                    if(JSON.stringify(response.p_status) == 2) { // 이미 결제 취소가 된 경우 return
	                    	
							alert('이미 정산이 완료된 예약입니다.');
							return
							
	                    } else { // 결제 취소 시!
	                    	
		                    alert('주문번호 ' + JSON.stringify(response.payment_num)
		                    		+ '판매금액 정산을 진행합니다. \n수수료 차감 후 최종 정산금액은 '
		                    		+ refundAmount + '원 입니다.');
	                    }
	                    
	                    // 판매금액 정산을 위한 ajax요청 - 부분취소
	                    $.ajax({
	                        url: "payCancel2",
	                        type: "POST",
	                        data: {
	                            'payment_num': response.payment_num,
	                            'payment_total_price': response.payment_total_price,
	                            'reason': "테스트 결제 환불"
	                        },
	                        success: function(data) {
	                            // 환불 완료 swal창으로 안내
	                            swal({
	                                title: "정산 완료!",
	                                text: "판매금액이 성공적으로 정산되었습니다.",
	                                icon: "success",
	                                button: "확인"
	                            }, function() {
	                                // 환불 완료 후 전 화면으로 이동
	                                location.href = "memberAssignList";
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