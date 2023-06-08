<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>store_Sales</title>
		<link href="top.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	    
		
    <!-- 이부분은 지우면 안됩니다 -->

</head>
<body>
	<!-- 공통 상단바 구역 -->
	<jsp:include page="../common/common_header.jsp"/>
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
            <div class="col-md-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <!-- 프로필 사진 -->
                    <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                        <img src="../image/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                        <p class="d-flex align-items-center"><span>님 환영합니다</span></p>

                    </div>
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_Mypage.jsp'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Mypage.jsp'">가게 관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Reservation.jsp'">예약관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Sales.jsp'">매출관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_MypageDelete.jsp'">회원탈퇴</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-8">
              <div class="card" style="margin-top: 20px;">
			  <div class="card-body" ><br>
              	<h5 class="card-title">매출관리</h5>
				  <div class="container">
				    <div class="form-group">
				      <label for="selectBox" >점주 소유 가게</label>
				      <select class="form-control" id="selectBox" onchange="updateTable()">
				        <option value="option0" selected disabled>가게를 선택해주세요</option>
				        <option value="option1" >가게 이름 1</option>
				        <option value="option2">가게 이름 2</option>
				        <option value="option3">가게 이름 3</option>
				      </select>
				    </div>
				    <div>
			  <!-- 막대 차트구역 -->
			  <canvas id="chart"></canvas>
			  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			  <script>
			    // 데이터 정보
			    const data = {
			      option1: [
			        { name: "전 달 판매액", price: 100000 },
			        { name: "이번달 판매액", price: 150000 },
			        { name: "전달 대비 증가액", price: 50000 }
			      ],
			      option2: [
			        { name: "전 달 판매액", price: 200000 },
			        { name: "이번달 판매액", price: 180000 },
			        { name: "전달 대비 증가액", price: -20000 }
			      ],
			      option3: [
			        { name: "전 달 판매액", price: 300000 },
			        { name: "이번달 판매액", price: 400000 },
			        { name: "전달 대비 증가액", price: 100000 }
			      ]
			    };
			
			    let myChart; // 차트 객체 변수
			
			    // 셀렉트 박스 변경 이벤트 처리
			    const selectBox = document.getElementById("selectBox");
			    const chartCanvas = document.getElementById("chart");
			
			    selectBox.addEventListener("change", function() {
			      const selectedCategory = selectBox.value;
			      const selectedData = data[selectedCategory];
			
			      if (myChart) {
			        // 차트 객체가 존재하면 제거
			        myChart.destroy();
			      }
			
			      // 차트 데이터 생성
			      const chartData = {
			        labels: selectedData.map(item => item.name),
			        datasets: [{
			          label: "금액",
			          data: selectedData.map(item => item.price),
			          backgroundColor: "rgba(75, 192, 192, 0.2)",
			          borderColor: "rgba(75, 192, 192, 1)",
			          borderWidth: 1
			        }]
			      };
			
			      // 차트 옵션
			      const chartOptions = {
			        scales: {
			          y: {
			            beginAtZero: true
			          }
			        }
			      };
			
			      // 차트 생성
			      myChart = new Chart(chartCanvas, {
			        type: "bar",
			        data: chartData,
			        options: chartOptions
			      });
			    });
			    
			  </script>
			  
			  <!-- 표 구역 -->
			    <table class="table" style = "text-align: center">
			      <thead>
			        <tr>
			          <th>전달 판매액</th>
			          <th>이번달 판매액</th>
			          <th>전달 대비 증가액</th>
			        </tr>
			      </thead>
			      <tbody id="tableBody">
			        <tr>
			          <td id="previousSales"></td>
			          <td id="currentSales"></td>
			          <td id="salesIncrease"></td>
			        </tr>
			      </tbody>
			    </table>
			    
			      <table class="table" style="text-align: center">
			         <thead>
				        <tr>
				          <th>최대 판매 메뉴</th>
				          <th>최소 판매 메뉴</th>
				          <th>예약이 가장 많았던 날</th>
				        </tr>
				     </thead>
				      <tbody id="tableBody2">
			        <tr>
			          <td id="maxsaleMenu"></td>
			          <td id="minsaleMenu"></td>
			          <td id="maxReservation"></td>
			        </tr>
			       </tbody>
			       </table>
			  </div>


			  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			  <script>
			    // 셀렉트 박스 변경 시 표 이벤트
			    function updateTable() {
			      var selectedOption = $("#selectBox").val();
			      var selectEliment = document.getElementById("selectBox");
			      var charContainer = document.getElementById("chartContainer");
			
			      // 선택한 옵션에 따라 표의 내용 변경 - 판매 통계
			      if (selectedOption == "option1") {
			        $("#previousSales").text("100,000원");
			        $("#currentSales").text("150,000원");
			        $("#salesIncrease").text("50,000원");
			      } else if (selectedOption == "option2") {
			        $("#previousSales").text("200,000원");
			        $("#currentSales").text("180,000원");
			        $("#salesIncrease").text("-20,000원");
			      } else if (selectedOption == "option3") {
			        $("#previousSales").text("300,000원");
			        $("#currentSales").text("400,000원");
			        $("#salesIncrease").text("100,000원");
			      }
			      
			      // 선택한 옵션에 따라 표의 내용 변경2 - 메뉴 및 예약통계
			      if (selectedOption == "option1") {
			        $("#maxsaleMenu").text("LUNCH set1");
			        $("#minsaleMenu").text("DINNER set3");
			        $("#maxReservation").text("6월 22일");
			      } else if (selectedOption == "option2") {
			        $("#maxsaleMenu").text("DINNER set2");
			        $("#minsaleMenu").text("LUNCH set1");
			        $("#maxReservation").text("5월 2일");
			      } else if (selectedOption == "option3") {
			        $("#maxsaleMenu").text("LUNCH set1");
			        $("#minsaleMenu").text("DINNER set1");
			        $("#maxReservation").text("6월 14일");
			      }
			    }
			  </script>
			  <br>
			  
			  <!-- 꺾은선 그래프 -->
			  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			  <h5 class="card-title">판매 및 환불 통계</h5>
			  <div class="chart-container">
		      <canvas id="lineChart"></canvas>
		       </div>		  
			<script>
				//데이터 정보
		        var option1Data = {
		            labels: ["January", "February", "March", "April", "May", "June"],
		            salesData: [50, 100, 80, 200, 150, 250],
		            refundData: [20, 30, 40, 50, 60, 70]
		        };
		        var option2Data = {
		            labels: ["January", "February", "March", "April", "May", "June"],
		            salesData: [100, 200, 150, 300, 250, 400],
		            refundData: [50, 60, 20, 80, 90, 10]
		        };
		        var option3Data = {
		            labels: ["January", "February", "March", "April", "May", "June"],
		            salesData: [10, 440, 150, 200, 250, 100],
		            refundData: [150, 60, 370, 80, 90, 100]
		        };
		
		        var lineChart = new Chart(document.getElementById("lineChart"), {
		            type: "line",
		            data: {
		                datasets: [
		                    {
		                        label: "Sales",
		                        data: option1Data.salesData,
		                        backgroundColor: "rgba(54, 162, 235, 0.5)",
		                        borderColor: "rgba(54, 162, 235, 1)",
		                        borderWidth: 1
		                    },
		                    {
		                        label: "Refunds",
		                        data: option1Data.refundData,
		                        backgroundColor: "rgba(255, 99, 132, 0.5)",
		                        borderColor: "rgba(255, 99, 132, 1)",
		                        borderWidth: 1
		                    }
		                ]
		            },

		        });
		        

		        // 셀렉트 박스의 선택 변경 이벤트 
		        document.getElementById("selectBox").addEventListener("change", function() {
		            var selectedOption = this.value;
		            if(selectedOption == "option0") {
		            	display:none
		            }
					else if(selectedOption == "option1") {
		                lineChart.data.labels = option1Data.labels;
		                lineChart.data.datasets[0].data = option1Data.salesData;
		                lineChart.data.datasets[1].data = option1Data.refundData;
		            } else if (selectedOption == "option2") {
		                lineChart.data.labels = option2Data.labels;
		                lineChart.data.datasets[0].data = option2Data.salesData;
		                lineChart.data.datasets[1].data = option2Data.refundData;
		            } else if (selectedOption == "option3") {
		                lineChart.data.labels = option3Data.labels;
		                lineChart.data.datasets[0].data = option3Data.salesData;
		                lineChart.data.datasets[1].data = option3Data.refundData;
		            }
		            lineChart.update();
		        });   
		        

		        
		    </script>
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
</body>
</html> 