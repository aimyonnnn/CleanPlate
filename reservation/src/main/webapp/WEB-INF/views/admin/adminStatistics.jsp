<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
	<%--line-awesome icon 사용을 위한 스타일 시트 --%>
	<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <title>admin statistics</title>
    <link href="adminDetail.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="#">
  </head>
  <body>
<!-- --------------------사이드 바 영역----------------------------  -->
   <input type="checkbox" name="" id="sidebar-toggle">
   
    <div class="sidebar">
      <div class="sidebar-brand"></div>

      <div class="sidebar-main"> 
        <div class="sidebar-user">
            <img src="adminProfile.png">
          <div>
            <h3>관리자</h3>
            <span>CleanPlate AdminPage</span>
          </div>
        </div>

        <div class="sidebar-menu">
          <div class="menu-head">
              <span></span>
            </div>
            <ul>
              <li>
                <a href="#">
                  <span class="las la-chart-pie"></span>
                  홈페이지
                </a>
              </li>
              <li>
                <a href="adminMain.jsp">
                  <span class="las la-chart-pie"></span>
                  관리자 메인
                </a>
              </li>
              <li>
                <a href="adminStatistics.jsp">
                  <span class="las la-history"></span>
                  사이트 이용 통계
                </a>
              </li>
            </ul>

          <div class="menu-head">
            <span>MENU</span>
          </div>
          <ul>
            <li>
                <a href="adminMember.jsp">
                 <span class="las la-users"></span>
                 회원 관리
                 </a>
            </li>
            <li>
                <a href="adminStore.jsp">
                 <span class="las la-chair"></span>
                 가게 관리
                 </a>
             </li>
             <li>
                <a href="adminReservation.jsp">
                  <span class="las la-history"></span>
                  예약 관리
                </a>
             </li>
            <li>
              <a href="adminAssignment.jsp">
                  <span class="las la-walking"></span>
                 양도 관리
              </a>
            </li>
           </ul>
           <div class="menu-head">
             <span>Team2</span>
           </div>
            <li><a><span class="las la-laugh"></span>박수민</a></li>
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
					<small>총 방문자 수</small>
					<h2>581</h2>
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
					<small>페이지 뷰</small>
					<h2>3,267</h2>
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
					<h2>30</h2>
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
	<canvas id="totalVisitChart" style="width: 900px; height: 300px;"></canvas>
</div>
<br>
<img width="18" height="18" src="https://img.icons8.com/material-rounded/24/info-squared.png" alt="information--v2"/><small>집계일: 2023.05.30 ~ 2023.06.08</small>
         

<script type="text/javascript">
            var context = document
                .getElementById('totalVisitChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '2023.05.30','2023.05.31','2023.06.01','2023.06.02','2023.06.03','2023.06.04','2023.06.05', '2023.06.06', '2023.06.07', '2023.06.08'
                     ],
                    datasets: [
                        { //데이터
                            label: '총 방문자 수', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                20,21,24,25,26,27,34,35,36,37 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgb(255, 51, 0)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgb(255, 51, 0)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        } ,
                        {
                            label: '페이지 뷰', 
                            fill: false,
                            data: [
                            	27,31,35,41,48,51,69,72,75,81
                            ],
                            backgroundColor: [
                                //색상
                                'rgb(0, 0, 0)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgb(0, 0, 0)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        } ,
                        {
                            label: '가입자 수', 
                            fill: false,
                            data: [
                            	2,7,8,9,10,10,15,21,25,30
                            ],
                            backgroundColor: [
                                //색상
                                'rgb(0, 153, 31)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgb(0, 153, 31)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: { display : false, // y축 텍스트 삭제
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>        
    	</main>
    </div>
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>