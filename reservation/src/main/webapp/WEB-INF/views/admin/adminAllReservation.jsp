<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
	<%--line-awesome icon 사용을 위한 스타일 시트 --%>
	<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>관리자 페이지</title>
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
            <h1>전체 예약</h1>
            <small>전체 예약 내역 기록 페이지</small>
          </div>
        </div> 

    <div class="main">
      <div class="title row">
        <div class="col-7">
          <h5 class="title6">총 예약 기록 데이터 수 :</h5>
          <h5 class="title6">1</h5>
          <%-- th:text="${size() 메서드로 total 받아올 곳} --%>
        </div>
      </div>
    </div>
	<br>
    <div class="nav2">
      <table class="zui-table" style="width:100%">
        <thead>
        <tr>
          <th>#</th>
          <th>Member ID</th>
          <th>이름</th>
          <th>예약 날짜</th>
          <th>예약 시간</th>
          <th>테이블 수</th>
          <th>취소 유무</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <%-- th:each="history : ${histories} --%>
          <td>1</td>
          <%-- th:text="idx 파라미터값"--%>
          <td>hong2023</td>
          <td>홍길동</td>
          <td>2023-06-07</td>
          <td>12:00:00</td>
          <td>3</td>
          <td>N</td>
        </tr>
        </tbody>
      </table>
    </div>
    </main>
      
    </div> 
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>