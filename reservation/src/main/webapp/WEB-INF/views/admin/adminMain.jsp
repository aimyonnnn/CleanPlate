<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
	<%--line-awesome icon 사용을 위한 스타일 시트 --%>
	<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>admin Main</title>
    <link href="${pageContext.request.contextPath }/resources/css/adminDetail.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="#">
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
                <a href="./">
                  <span class="las la-chart-pie"></span>
                  홈페이지
                </a>
              </li>
              <li>
                <a href="adminMain">
                  <span class="las la-chart-pie"></span>
                  관리자 메인
                </a>
              </li>
              <li>
                <a href="adminStatistics">
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
                <a href="adminMember">
                 <span class="las la-users"></span>
                 회원 관리
                 </a>
            </li>
            <li>
                <a href="adminStore">
                 <span class="las la-chair"></span>
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
            <h1>관리자 페이지</h1>
            <small>이용 회원, 예약 통계 확인 및 관리</small>
          </div>
        </div> 

        <div class="cards">
          <div class="card-single">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
                  <span>RESERVATION</span>
                  <small>이번달 총 예약 수</small>
                </div>

                <h2>200</h2>
                  <small>지난달의 예약 수: 10</small><br>
                  <%-- DB 연동 후 small 태그에 th:text="'지난달의 예약 수: '+${지난달의 예약 수 파라미터값}" 추가  --%>
                  <small>n% 증가</small>
                  <%-- 
                  예약이 증가했을 경우 small 태그에
                  th:if="${이번달의 예약 수 파라미터값 >= 지난달의 예약 수 파라미터값}"
                  th:text="'지난달에 비해 '+${이번달의 예약 수 파라미터값/지난달의 예약 수 파라미터값*100}+'% 증가했습니다. '" 추가
                  --%>
                  <small>n% 감소</small>
                  <%-- 
                  예약이 증가했을 경우 small 태그에
                  th:if="${이번달의 예약 수 파라미터값 < 지난달의 예약 수 파라미터값}"
                  th:text="'지난달에 비해 '+${이번달의 예약 수 파라미터값/지난달의 예약 수 파라미터값*100}+'% 감소했습니다. '" 추가
                  --%>
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
                  <span>Store</span>
                  <small>운영중인 가게 수</small>
                </div>

                <h2>${RestaurantList.size()}</h2>

                <small>현재 운영중인 총 가게 수입니다.</small>
              </div>
              <div class="card-chart success">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>

          <div class="card-single">
            <div class="card-flex">
              <div class="card-into">
                <div class="card-head">
                  <span>Total</span>
                  <small>총 예약 수</small>
                </div>

                <h2>1000</h2>

                <small>취소된 예약을 제외한 모든 예약 건수를 포함한 값입니다.</small>
              </div>
              <div class="card-chart yellow">
                <span class="las la-chart-line"></span>
              </div>
            </div>
          </div>
        </div>

        <div class="jobs-grid">
          <div class="analytics-card">
            <div class="analytics-head">
              <h3>오늘 총 예약 수</h3>
            </div>

            <form th:action method="post" class="analytics-chart">
              <div class="chart-circle">
                <h1>N명</h1>
              </div>
            </form>
          </div>

          <div class="jobs">
            <h2>최근 예약
                <small>
                    <a href="adminAllReservation.jsp">전체 예약 확인하기</a>
                    <span class="las la-arrow-right"></span>
                </small>
            </h2>
            
            <div class="table-responsive">
            <table width="100%">
              <tbody>
              <tr>
                  <td><div><span class = "indicator"></span></div></td>
                  <td><div th:text="">아이디 :</div></td>
                  <%-- DB 연동 후 th:text 내에 "'컬럼명: '+${파라미터명}" 추가 --%>
                  <td><div th:text="">테이블 수 :</div></td>
                  <td><div th:text="">날짜 :</div></td>
                  <td><div th:text="">시간 :</div></td>
                  <td><div><button type="button"
                                   onclick="location.href='#'"
                  >관리</button></div></td>
                </tr>
              </tbody>
            </table>                
          </div>
        </div>
       </div>
      </main>
    </div> 
    
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>