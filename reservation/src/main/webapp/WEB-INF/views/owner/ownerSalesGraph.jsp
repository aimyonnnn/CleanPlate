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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<h1>${getSalesList }</h1>
    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-2 align-items-center d-flex">
                <!-- 버튼 그룹 -->
                <!-- 프로필 사진 -->
                <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                    <img src="${pageContext.request.contextPath }/resources/images/adminProfile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 30px;">매출관리</h2>
        	</div>
        </div>
        <div class="row">
            <div class="col-2">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning  active text-black p-3" onclick="location.href='restaurantList'">가게리스트 </button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10">
                <!-- 가게 선택 셀렉트 박스 -->
                <form action="/test/storeSalesGraph" method="get" id="salesForm">
                    <div class="form-group">
                        <label for="storeSelect">가게 선택 :</label>
                        <button type="submit" class="btn btn-outline-warning p-1">상세보기</button><br>
                        <select class="form-control" id="storeSelect" name="store" style="width: 30%">
                            <option value="store0" selected>가게를 선택하세요.</option>
                            <option value="store1">가게1</option>
                            <option value="store2">가게2</option>
                        </select>
                    </div>
                </form>

                <!-- 이번달 매출, 저번달 매출, 매출 증가량 -->
                <h3>월별 매출 내역</h3>
                <div class="inline">
                    <div class="col-md-6 a1234" >
                        <h6>1. 이번 달 매출: <span id="thisMonthSales"><%= request.getAttribute("thisMonthSales") %></span></h6>
                    </div>
                    <div class="col-md-6">
                        <h6>2. 저번 달 매출: <span id="lastMonthSales"><%= request.getAttribute("lastMonthSales") %></span></h6>
                    </div>
                    <div class="col-md-6">
                        <h6>3. 매출 증감: <span id="salesGrowth"><%= request.getAttribute("salesGrowth") %></span></h6>
                    </div>
                </div>
                
                <!-- 그래프 표시 영역 -->
                <canvas id="salesChart" width="400" height="200"></canvas>

                <!-- 가장 많이 판매된 메뉴와 가장 많은 매출이 발생한 날 -->
                <h2>최다 판매 메뉴와 판매일</h2>
                <div class="inline">
                    <div class="col-md-6">
                        <h6>1. 최고 판매 메뉴: <span id="bestsellingMenu">${bestsellingMenu}</span></h6>
                    </div>
                    <div class="col-md-6">
                        <h6>2. 최다 예약일: <span id="highestRevenueDay">${highestRevenueDay}</span></h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
	<footer class="footer">
		<jsp:include page="../common/common_footer.jsp"/>
	</footer>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0"></script>
    <!-- 이부분은 지우면 안됩니다 -->
<script>

$(document).ready(function () {
    // 가게 선택 폼 제출
    $('#salesForm').submit(function () {
    	console.log("1");
//         event.preventDefault(); // 폼 제출 이벤트 중지
        var store = $('#storeSelect').val(); // 선택된 가게
        if (store == 'store0') {
        	console.log("2");
            // 가게를 선택하지 않은 경우
            alert('가게를 선택하세요.');
        } else {
        	console.log("3");
            // 선택된 가게에 대한 데이터 요청
            $.ajax({
                url: '<c:url value="sales"/>', // 데이터 요청을 보낼 URL
                type: 'GET',
                data: { store: store }, // 선택된 가게 정보 전송
                dataType : "json",
                success: function (data) {
                	console.log("4");
                    // 서버로부터 받은 데이터를 업데이트
                    $('#thisMonthSales').text(data.thisMonthSales);
                    $('#lastMonthSales').text(data.lastMonthSales);
                    $('#salesGrowth').text(data.salesGrowth);
                    $('#bestsellingMenu').text(data.bestsellingMenu);
                    $('#highestRevenueDay').text(data.highestRevenueDay);

                    // 차트 업데이트
                    salesChart.data.datasets[0].data = [data.thisMonthSales, data.lastMonthSales];
                    salesChart.update();
                },
                error: function () {
                    alert('데이터를 가져오는 중에 오류가 발생했습니다.');                            
                }
            });
        }
    });
});

// 그래프 생성 및 데이터 설정
var ctx = document.getElementById('salesChart').getContext('2d');
var salesChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['This Month', 'Last Month'],
        datasets: [{
            label: 'Sales',
            data: [${thisMonthSales}, ${lastMonthSales}],
            backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)'],
            borderColor: ['rgba(75, 192, 192, 1)', 'rgba(54, 162, 235, 1)'],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>



</body>
</html> 