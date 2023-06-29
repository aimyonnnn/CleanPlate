<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
	<%--line-awesome icon 사용을 위한 스타일 시트 --%>
	<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <title>관리자 페이지</title>
    <link href="${pageContext.request.contextPath }/resources/css/adminDetail.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="#">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  </head>
  <body>
<!-- --------------------사이드 바 영역----------------------------  -->
   <input type="checkbox" name="" id="sidebar-toggle">
   
    <div class="sidebar">
      <div class="sidebar-main"> 
        <div class="sidebar-user">
            <img src="${pageContext.request.contextPath }/resources/images/adminProfile.png">
          <div>
            <span>관리자 페이지</span>
          </div>
      	</div>

        <div class="sidebar-menu">
          <div class="menu-head">
              <span></span>
            </div>
            <ul>
              <li>
                <a href="./">
                  <span class="las la-home"></span>
                  홈페이지
                </a>
              </li>
              <li>
                <a href="adminMain">
                  <span class="las la-user"></span>
                  관리자 메인
                </a>
              </li>
              <li>
                <a href="adminStatistics">
                  <span class="las la-chart-line"></span>
                  주간 데이터 통계
                </a>
              </li>
            </ul>

          <div class="menu-head">
            <span>MENU</span>
          </div>
          <ul>
            <li>
                <a href="adminMember">
                 <span class="las la-users"></span>
                 회원 관리
                 </a>
            </li>
            <li>
                <a href="adminStore">
                 <span class="las la-store"></span>
                 가게 관리
                 </a>
             </li>
             <li>
                <a href="adminReservation">
                  <span class="las la-history"></span>
                  예약 관리
                </a>
             </li>
            <li>
              <a href="adminAssignment">
                  <span class="las la-exchange-alt"></span>
                 양도 관리
              </a>
            </li>
            <li>
              <a href="adminReview">
                  <span class="las la-comment-dots"></span>
                 리뷰 관리
              </a>
            </li>
           </ul>
           <div class="menu-head">
             <span>2 TEAM</span>
           </div>
            <li><a><span class="las la-crown"></span>박수민</a></li>
            <li><a><span class="las la-laugh"></span>김민진</a></li>
            <li><a><span class="las la-laugh"></span>김보희</a></li>
            <li><a><span class="las la-laugh"></span>이재승</a></li>
            <li><a><span class="las la-laugh"></span>김묘정</a></li>
            <li><a><span class="las la-laugh"></span>이건무</a></li>
        </div>
      </div>
    </div>
<!-- ------------------------------------------------------------------ -->
    <div class="main-content">
      <header>
        <div class="menu-toggle">
          <label for="sidebar-toggle">
            <span class="las la-bars"></span>
          </label>
        </div>
      </header>

     <main>
        <div class="page-header">
          <div>
            <h1>데이터 통계</h1>
            <br>
            <small>누적된 총 데이터와 오늘 날짜를 기준으로 6일 이전까지의 1주일간의 데이터를 가져옵니다.</small>
          </div>
        </div> 

<%-- 카드 영역 --%> 
<div class="cards">
          <div class="card-single">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>일일 예약 수</small>
					<h2>${adminReservationCount0.count} 건</h2>
                </div>
              </div>
              <div class="card-chart danger">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
          <div class="card-single">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>일일 결제 금액</small>
					<h2><fmt:formatNumber value="${adminPaymentCount0.count*100}" /> 원</h2>
                </div>
              </div>
              <div class="card-chart black">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
         
          <div class="card-single">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>일일 가입자 수</small>
					<h2>${adminMemberCount0.count} 명</h2>
                </div>
              </div>
              <div class="card-chart success">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
         </div>
         <br>

<%-- <canvas id="dailyReservation" width="300px" height="450px"></canvas> --%>

<div class="card-single">
	<div class="card-flex">
	<!-- 일일 라인 차트가 그려질 부분 -->
	<canvas id="dailyChart" width="900px" height="300px"></canvas>
	</div>
</div>
<br>
<!-- 6일 전, 오늘 날짜 데이터 -->
<jsp:useBean id="javaDate" class="java.util.Date" />
<fmt:formatDate var="nowDate" value="${javaDate}" pattern="yyyy-MM-dd"/>
<c:set var="sixDayAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*6)%>"/>
<fmt:formatDate value="${sixDayAgo}" pattern="yyyy-MM-dd" var="sixDayAgoStr"/>

<img width="18" height="18" src="https://img.icons8.com/material-rounded/24/info-squared.png" alt="information--v2"/>
<small>집계일: ${sixDayAgoStr } ~ ${nowDate }</small>

<br>
<!-- 누적 라인 차트가 그려질 부분 -->
        <div class="cards">
          <div class="card-single" onclick="totalReservation()">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>완료된 예약 수</small>
					<h2>${adminReservationTotalCount0.count} 건</h2>
                </div>
              </div>
              <div class="card-chart danger">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
          <div class="card-single" onclick="totalPay()">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>누적 결제 금액</small>
					<h2><fmt:formatNumber value="${adminPaymentTotalCount0.count*100 }" /> 원</h2>
                </div>
              </div>
              <div class="card-chart black">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
         
          <div class="card-single" onclick="totalJoinMember()">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>총 가입자 수</small>
					<h2>${adminMemberTotalCount0.count } 명</h2>
                </div>
              </div>
              <div class="card-chart success">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
         </div>
         <br>
         
<%-- <canvas id="dailyTotalResrvation" width="300px" height="450px"></canvas>          --%>
         
<div class="card-single">
	<div class="card-flex">
		<canvas id="totalChart" width="900px" height="300px"></canvas>
	</div>
</div>
<br>
<img width="18" height="18" src="https://img.icons8.com/material-rounded/24/info-squared.png" alt="information--v2"/>
<small>집계일: ${sixDayAgoStr } ~ ${nowDate }</small>
<!-- 
카드 클릭 시 해당 항목 상세 차트 띄우기, 라인 차트 날짜 클릭 시 해당 날짜의 데이터를 막대 형식으로 띄우기
 -->

<!-- 일일 라인 차트 스크립트  -->
<script type="text/javascript">
			// 라인 차트 영역
			var now = moment();
            var context = document
                .getElementById('dailyChart')
                .getContext('2d');
            var dailyChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	labels: [ moment().subtract(6, 'day').format('YYYY.MM.DD')
                		, moment().subtract(5, 'day').format('YYYY.MM.DD')
                		, moment().subtract(4, 'day').format('YYYY.MM.DD')
                		, moment().subtract(3, 'day').format('YYYY.MM.DD')
                		, moment().subtract(2, 'day').format('YYYY.MM.DD')
                		, moment().subtract(1, 'day').format('YYYY.MM.DD')
                		, now.format('YYYY.MM.DD') ],
                    datasets: [{ 
                        data: [${adminReservationCount6.count}
                        	 , ${adminReservationCount5.count}
                        	 , ${adminReservationCount4.count}
                        	 , ${adminReservationCount3.count}
                        	 , ${adminReservationCount2.count}
                        	 , ${adminReservationCount1.count}
                        	 , ${adminReservationCount0.count}],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '예약 수',
                        borderColor: 'rgb(255, 51, 0)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(255, 51, 0)',
                      }, { 
                        data: [${adminPaymentCount6.count}
                        	 , ${adminPaymentCount5.count}
                        	 , ${adminPaymentCount4.count}
                        	 , ${adminPaymentCount3.count}
                        	 , ${adminPaymentCount2.count}
                        	 , ${adminPaymentCount1.count}
                        	 , ${adminPaymentCount0.count}],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '결제 금액(X100원)',
                        borderColor: 'rgb(0, 0, 0)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(0, 0, 0)',
                      }, { 
                        data: [${adminMemberCount6.count}
                       		 , ${adminMemberCount5.count}
                       		 , ${adminMemberCount4.count}
                       		 , ${adminMemberCount3.count}
                       		 , ${adminMemberCount2.count}
                       		 , ${adminMemberCount1.count}
                       		 , ${adminMemberCount0.count}],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '가입자 수',
                        borderColor: 'rgb(0, 153, 31)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(0, 153, 31)',
                      }
                    ]
                  },
                options: {
                	title : {
                		display : true,
                		text : "일일 데이터 차트"
                	},
                    scales: {
                        yAxes: [{
                                ticks: { display : false, // y축 텍스트 삭제
                                    beginAtZero: true,
                                    autoSkip: false
                                }
                            }]
                    }
                }
            });   
            
            document.getElementById("dailyChart").onclick = function(evt) {
                var activePoints = dailyChart.getElementsAtEvent(evt);

                if(activePoints.length > 0)
                {
                    var clickedElementindex = activePoints[0]["_index"];

                    var label = dailyChart.data.labels[clickedElementindex];
                    console.log("label : " + label);

                    var value = dailyChart.data.datasets[0].data[clickedElementindex];
                    console.log("value : " + value);
                }
            }
            // --------------------------------------------------------------------------
            
            // 일일 예약 시간대 분포 파이 차트 영역
            var dailyResrvation =  new Chart(document.getElementById("dailyReservation"), {
        	    type: 'pie',
        	    data: {
        	      labels: ["11:00 ~ 13:59시"
        	    	  	 , "14:00 ~ 16:59시"
        	    	  	 , "17:00 ~ 19:59시"
        	    	  	 , "20:00 ~ 23:00시"],
        	      datasets: [{
        	        label: "예약 인원",
        	        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
        	        data: [ 25,25,25,25
        	      		  ]
        	      }]
        	    },
        	    options: {
        	      responsive: false,
        	      title: {
        	        display: true,
        	        text: '일일 예약 시간대 분포'
        	      }
        	    }
        	});
            // --------------------------------------------------------------------------
        </script>   
             
<!-- 누적 라인 차트 스크립트 -->
<script type="text/javascript">
			var now = moment();
            var context = document
                .getElementById('totalChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	labels: [ moment().subtract(6, 'day').format('YYYY.MM.DD')
                		, moment().subtract(5, 'day').format('YYYY.MM.DD')
                		, moment().subtract(4, 'day').format('YYYY.MM.DD')
                		, moment().subtract(3, 'day').format('YYYY.MM.DD')
                		, moment().subtract(2, 'day').format('YYYY.MM.DD')
                		, moment().subtract(1, 'day').format('YYYY.MM.DD')
                		, now.format('YYYY.MM.DD') ],
                    datasets: [{ 
                        data: [${adminReservationTotalCount6.count}
                        	 , ${adminReservationTotalCount5.count}
                        	 , ${adminReservationTotalCount4.count}
                        	 , ${adminReservationTotalCount3.count}
                        	 , ${adminReservationTotalCount2.count}
                        	 , ${adminReservationTotalCount1.count}
                        	 , ${adminReservationTotalCount0.count}],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '완료된 예약 수',
                        borderColor: 'rgb(255, 51, 0)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(255, 51, 0)',
                      }, { 
                        data: [${adminPaymentTotalCount6.count}
                        	 , ${adminPaymentTotalCount5.count}
                        	 , ${adminPaymentTotalCount4.count}
                        	 , ${adminPaymentTotalCount3.count}
                        	 , ${adminPaymentTotalCount2.count}
                        	 , ${adminPaymentTotalCount1.count}
                        	 , ${adminPaymentTotalCount0.count}],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '누적 결제 금액(X100원)',
                        borderColor: 'rgb(0, 0, 0)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(0, 0, 0)',
                      }, { 
                        data: [${adminMemberTotalCount6.count}
                       		 , ${adminMemberTotalCount5.count}
                       		 , ${adminMemberTotalCount4.count}
                       		 , ${adminMemberTotalCount3.count}
                       		 , ${adminMemberTotalCount2.count}
                       		 , ${adminMemberTotalCount1.count}
                       		 , ${adminMemberTotalCount0.count}],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '총 가입자 수',
                        borderColor: 'rgb(0, 153, 31)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(0, 153, 31)',
                      }
                    ]
                  },
                options: {
                	title : {
                		display : true,
                		text : "누적 데이터 차트"
                	},
                    scales: {
                        yAxes: [{
                                ticks: { display : false, // y축 텍스트 삭제
                                    beginAtZero: true,
                                    autoSkip: false
                                }
                            }]
                    }
                }
            });
            // 누적 예약 시간대 분포 파이 차트 영역
            var dailyTotalResrvation =  new Chart(document.getElementById("dailyTotalResrvation"), {
        	    type: 'pie',
        	    data: {
        	      labels: ["11:00 ~ 13:59시"
        	    	  	 , "14:00 ~ 16:59시"
        	    	  	 , "17:00 ~ 19:59시"
        	    	  	 , "20:00 ~ 23:00시"],
        	      datasets: [{
        	        label: "예약 인원",
        	        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
        	        data: [ 25,25,25,25
//         	        	${adminDailyReservaionPie11.count}
//         	       		  ,${adminDailyReservaionPie14.count}
//         	     		  ,${adminDailyReservaionPie17.count}
//         	      		  ,${adminDailyReservaionPie20.count}
        	      		  
        	      		  ]
        	      }]
        	    },
        	    options: {
        	      responsive: false,
        	      title: {
        	        display: true,
        	        text: '완료된 예약 시간대 분포'
        	      }
        	    }
        	});
        </script>        
    	</main>
    </div>
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>