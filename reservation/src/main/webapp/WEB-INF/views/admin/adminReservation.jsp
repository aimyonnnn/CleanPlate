<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
	<%--line-awesome icon 사용을 위한 스타일 시트 --%>
	<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>예약 관리</title>
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
            <li><a><span class="las la-chess-king"></span>박수민</a></li>
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
            <h1>예약 관리</h1>
            <br>
            <small>예약 관리 페이지</small>
          </div>
        </div> 

    <div class="main">
      <div class="title row">
        <div class="col-7">
          <h5 class="title6">총 예약 건수 :</h5>
          <h5 class="title6">${reservationList.size() } 개</h5>
        </div>
      </div>
    </div>
	<br>
    <div class="nav2">
      <table class="zui-table" style="width:100%">
        <thead>
        <tr>
          <th>#</th>
          <th>예약 인원</th>
          <th>예약 일자</th>
          <th>총 금액</th>
          <th>예약 상태</th>
          <th>예약 회원번호</th>
          <th>예약 식당번호</th>
          <th>예약 관리</th>
        </tr>
        </thead>
<!--         1-방문예정, 2-방문완료, 3-취소, 4-양도', -->
        <tbody>
        <c:forEach items="${reservationList }" var="reservation">
        <tr>
          <td>${reservation.r_idx }</td>
          <td>${reservation.r_personnel }명</td>
          <td>${reservation.r_date }</td>
          <td>${reservation.r_amount }원</td>
          <%-- 예약 상태 판별 --%>
          <c:if test="${reservation.r_status == 1}">
         	 <td>방문예정</td>
          </c:if>
          <c:if test="${reservation.r_status == 2}">
         	 <td>방문완료</td>
          </c:if>
          <c:if test="${reservation.r_status == 3}">
         	 <td>취소</td>
          </c:if>
          <c:if test="${reservation.r_status == 4}">
         	 <td>양도</td>
          </c:if>
          <%-- 예약 상태 판별 --%>
          <td>${reservation.m_idx }</td>
          <td>${reservation.res_idx }</td>
        <td><button type="button" class="btn btn-sm btn-primary"
        onclick="location.href='deleteReservationForm?idx=${reservation.r_idx}'">정보 수정</button></td>
        </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    </main>
      
    </div> 
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>