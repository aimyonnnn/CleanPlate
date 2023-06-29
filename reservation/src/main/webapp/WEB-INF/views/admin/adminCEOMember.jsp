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
    <title>회원 관리</title>
    <link href="${pageContext.request.contextPath }/resources/css/adminDetail.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="#">
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
            <h1>회원 관리</h1>
            <br>
            <small>기업 회원 관리 페이지</small>
            <br>
          </div>
        </div> 
    <div class="main">
      <div class="title row">
        <div class="col-7">
          <br><h5 class="title6">총 <a style="color: blue;">기업</a> 회원 수 : </h5>
          <h5 class="title6">${ceoList.size() } 명</h5>
        </div>
      </div>
       	  	<br><small onclick="location.href='adminMember'"><i class="la la-gear"></i>일반 회원 관리 페이지 전환</small>
    </div>
	<br>
    <div class="nav2">
      <table class="zui-table" style="width:100%">
        <thead>
        <tr>
          <th>No.</th>
          <th>회원 ID</th>
          <th>이름</th>
          <th>전화 번호</th>
          <th>이메일</th>
          <th>회원 상태</th>
          <th>회원 타입</th>
          <th>회원 관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ceoList }" var="ceo">
        <tr>
          <td>${ceo.c_idx }</td>
          <td>${ceo.c_id }</td>
          <td>${ceo.c_name }</td>
          <td>${ceo.c_tel }</td>
          <td>${ceo.c_email }</td>
        <%-- 회원 상태 판별 --%>
        <c:if test="${ceo.c_status == 1}">
        	<td>활동중</td>
        </c:if>
        <c:if test="${ceo.c_status == 2}">
        	<td>정지</td>
        </c:if>
        <c:if test="${ceo.c_status == 3}">
        	<td>탈퇴</td>
        </c:if>
        	<td>기업회원</td>
        <td><button type="button" class="btn btn-sm btn-primary"
        onclick="location.href='deleteCEOForm?id=${ceo.c_id}'"><i class="la la-gear"></i>정보 수정</button></td>
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