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
      <div class="sidebar-brand"></div>

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
                  사이트 이용 통계
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
           </ul>
           <div class="menu-head">
             <span>Team2</span>
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
            <h1>사이트 이용 통계</h1>
            <br>
            <h3>실시간 분석</h3>
          </div>
        </div> 

<%-- 카드 영역 --%> 
        <div class="cards">
          <div class="card-single">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
					<small>총 예약 수</small>
					<h2>${reservationList.size() } 건</h2>
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
					<small>총 결제 금액</small>
					<h2><fmt:formatNumber value="${total }" /> 원</h2>
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
					<small>가입자 수</small>
					<h2>${memberList.size() } 명</h2>
                </div>
              </div>
              <div class="card-chart success">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
         </div>
         <br>
<%-- ------------- --%>    


<div>
	<!--차트가 그려질 부분-->
	<canvas id="totalChart" style="width: 900px; height: 300px;"></canvas>
</div>
<br>
<!-- 6일 전, 오늘 날짜 데이터 -->
<jsp:useBean id="javaDate" class="java.util.Date" />
<fmt:formatDate var="nowDate" value="${javaDate}" pattern="yyyy-MM-dd"/>
<c:set var="sixDayAgo" value="<%=new Date(new Date().getTime() - 60*60*24*1000*6)%>"/>
<fmt:formatDate value="${sixDayAgo}" pattern="yyyy-MM-dd" var="sixDayAgoStr"/>

<img width="18" height="18" src="https://img.icons8.com/material-rounded/24/info-squared.png" alt="information--v2"/><small>집계일: ${sixDayAgoStr } ~ ${nowDate }</small>

<script type="text/javascript">
			var now = moment();
            var context = document
                .getElementById('totalChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형	태
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
                        data: [70, 90, 44, 60, 83, 90, 95],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '결제 금액(X1000)',
                        borderColor: 'rgb(0, 0, 0)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(0, 0, 0)',
                      }, { 
                        data: [10, 21, 60, 44, 17, 21, 17],
                        fill: false,
                        pointRadius: 3,
                        lineTension: 0,
                        label: '가입자',
                        borderColor: 'rgb(0, 153, 31)',
                        borderWidth: 1,
                        backgroundColor: 'rgb(0, 153, 31)',
                      }
                    ]
                  },
                options: {
                	title : {
                		display : true,
                		text : "사이트 이용 통계"
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
        </script>        
    	</main>
    </div>
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>