<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

   <!-- jQuery CDN -->
   <script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer">
  </script>

  <!-- AOS 라이브러리 -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

  <!-- 채널톡 API 시작 -->
  <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
  "pluginKey": "1389a4f2-b052-41e3-8f07-442396576322"
  });
  </script>
  <!-- 채널톡 API 끝 -->  

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- font-awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

  <!-- css -->
  <link href="${pageContext.request.contextPath }/resources/css/storeDashBoard.css" rel="styleSheet" type="text/css">

  <title>Hello, world!</title>
</head>

<body>

  <!-- 좌측 파란색 사이드바 시작 -->
  <div class="sidebar">
    <div>
      <i class="fas fa-home me-2" onclick="location.href='<c:url value="/"/>'"></i>
      <span onclick="location.href='<c:url value="/"/>'">Home</span>
    </div>
    <!-- <div>
      <i class="fas fa-car me-2"></i>
      <span>History</span>
    </div> -->
  </div>
  <!-- 좌측 파란색 사이드바 끝 -->
  
  <!-- 우측 내용 시작-->
  <div class="content">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar">
          <form class="d-flex">
            <input class="form-control input-animation" placeholder="Search">
            <button class="btn btn-outline-secondary input-button" type="submit">검색</button>
          </form>
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <!-- <li class="nav-item">
              <a class="nav-link" href="#">
                <span class="badge bg-danger">5</span>
                <i class="fas fa-bell"></i>
              </a>
            </li> -->
            <li class="nav-item">
              <a class="nav-link" href="#">${sessionScope.sId }님 환영합니다</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
   
    <div class="container my-5"><!-- container 시작-->
      <h4 class="my-4">매출관리</h4>

      <div class="row" data-aos="fade-right"><!-- row 시작 -->

        <!-- 카드 1개 이미지 시작 -->
        <div class="col-lg-3">
          <div class="card" style="border-left: 3px solid #1a202e">
            <div class="card-body d-flex justify-content-between">
              <div>
                <p class="card-text mb-2">오늘 총 예약 수</p>
                <h4>8</h4>
              </div>
              <i class="fas fa-calendar" style="font-size: 30px; margin-top: 20px"></i>
            </div>
          </div>
        </div>
        <!-- 카드 1개 이미지 끝 -->

        <div class="col-lg-3">
          <div class="card" style="border-left: 3px solid #1a202e">
            <div class="card-body d-flex justify-content-between">
              <div>
                <p class="card-text mb-2">이번 달 총 예약 수</p>
                <h4>78</h4>
              </div>
              <i class="fas fa-calendar" style="font-size: 30px; margin-top: 20px"></i>
            </div>
          </div>
        </div>

        <div class="col-lg-3">
          <div class="card" style="border-left: 3px solid #1a202e">
            <div class="card-body d-flex justify-content-between">
              <div>
                <p class="card-text mb-2">일간 매출</p>
                <h4>$2,500,000</h4>
              </div>
              <i class="fas fa-calendar" style="font-size: 30px; margin-top: 20px"></i>
            </div>
          </div>
        </div>

        <div class="col-lg-3">
          <div class="card" style="border-left: 3px solid #1a202e">
            <div class="card-body d-flex justify-content-between">
              <div>
                <p class="card-text mb-2">주간 매출</p>
                <h4>$9,000,000</h4>
              </div>
              <i class="fas fa-calendar" style="font-size: 30px; margin-top: 20px"></i>
            </div>
          </div>
        </div>

      </div><!-- row 끝 -->
    </div><!-- container 끝-->

    <div class="container mt-3"><!-- container 시작-->
      <div class="row"><!-- row 시작-->

        <!-- myChart 시작 -->
        <div class="col-lg-6" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
          <div class="card">
            <div class="card-header">
              <span>최근 1주일 예약 수</span>
            </div>
            <div class="card-body">
              <canvas id="myChart"></canvas>
            </div>
          </div>
        </div>
        <!-- myChart 끝 -->

        <!-- myChart2 시작 -->
        <div class="col-lg-6" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
          <div class="card">
            <div class="card-header">
              <span>최근 1주일 매출 금액</span>
            </div>
            <div class="card-body">
              <canvas id="myChart2"></canvas>
            </div>
          </div>
        </div>
        <!-- myChart2 시작 -->

        <!-- myChart3 시작 -->
        <div class="col-lg-6 my-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
          <div class="card">
            <div class="card-header">
              <span>주단위 매출 금액</span>
            </div>
            <div class="card-body">
              <canvas id="myChart3"></canvas>
            </div>
          </div>
        </div>
        <!-- myChart3 시작 -->

        <!-- myChart4 시작 -->
        <div class="col-lg-6 my-5" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
          <div class="card">
            <div class="card-header">
              <span>최근 3개월 매출 금액</span>
            </div>
            <div class="card-body">
              <canvas id="myChart4"></canvas>
            </div>
          </div>
        </div>
        <!-- myChart4 시작 -->

      </div>
    </div>

  </div> <!-- 우측 내용 끝-->


  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <script>
    // myChart
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
          label: '# of Votes',
          data: [5, 2, 3, 5, 4, 8, 20],
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgba(255, 99, 132, 1)',
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

    // myChart2
    var ctx2 = document.getElementById('myChart2').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'line',
      data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
          label: '# of Votes',
          data: [2500000, 2000000, 1500000, 2000000, 1500000, 3000000, 3500000],
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(54, 162, 235, 1)',
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

    // myChart3
    var ctx3 = document.getElementById('myChart3').getContext('2d');
    var myChart3 = new Chart(ctx3, {
      type: 'line',
      data: {
        labels: ['1주', '2주', '3주', '4주', '5주'],
        datasets: [{
          label: '# of Votes',
          data: [2500000, 2000000, 1500000, 2000000, 1500000, 3000000, 3500000],
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(54, 162, 235, 1)',
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

    // myChart4
    var ctx4 = document.getElementById('myChart4').getContext('2d');
    var myChart4 = new Chart(ctx4, {
      type: 'bar',
      data: {
        labels: ['4월', '5월', '6월'],
        datasets: [{
          label: '# of Votes',
          data: [15000000, 13000000, 16000000],
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(54, 162, 235, 1)',
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

  <!-- AOS 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script> AOS.init();</script> 
  <!-- Bootstrap CDN -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>