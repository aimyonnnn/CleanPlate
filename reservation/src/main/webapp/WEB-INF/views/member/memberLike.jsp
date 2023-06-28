<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CLEAN PLATE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 이부분은 지우면 안됩니다 -->
			<script>
			    $(document).ready(function() {
			        function storeValues(resIdx) {
			            var res_idx = resIdx;
			            var m_id = '<c:out value="${sessionScope.sId}" />';
			            //alert(res_idx);
			
			            $.ajax({
			                url: '${pageContext.request.contextPath}/deletecount',
			                data: {
			                    'res_idx': res_idx,
			                    'm_id': m_id
			                },
			                type: 'GET',
			                success: function(response) {
			                    alert("찜 해제 되었습니다.");
			                    location.reload();
			                },
			                error: function(xhr, status, error) {
			                    alert(error);
			                }
			            });
			        }
			        $('button.cancel-btn').click(function() {
			            var resIdx = $(this).attr('data-resname');
			            storeValues(resIdx);
			        });
			    });
			</script>

</head>
</head>


<body>

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/myBookmark.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>
	
    <<!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 36px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberAssignList'">판매 내역</button>
                    <button type="button" class="btn btn-outline-dark active p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
                <table class="table text-center" style="margin-top: 40px; margin-left: 100px; width:70%;" >
                    <thead>
                        <tr>
                            <th>가게사진</th>
                            <th>가게명</th>
                            <th>별점</th>
                            <th>리뷰수</th>
                            <th>찜상태</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:forEach var="like" items="${memberLike}">
						<input type="hidden" id="res_idx" value="${like.res_idx}">
					 <tr>
						 <td>
			                <img src="resources/images/${like.res_photo1}" style="width: 200px; height: auto;">
			            </td>
			            <td><a href="http://localhost:8080/test/getRestaurantInfo?res_idx=${like.res_idx}">${like.res_name}</a></td>
			            <td>${like.rv_scope}</td>
			            <td>${like.count}</td>
			            <td>
						<button type="button" class="btn btn-dark cancel-btn" style="color: white;" data-resname="${like.res_idx}">찜 해제</button>
					</tr>
					</c:forEach>
					</tbody>
                </table>  
            </div>
            <!-- 내용 구역 -->
          </div>

    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
	<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 