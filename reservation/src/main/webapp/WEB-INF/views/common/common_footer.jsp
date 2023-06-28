<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <!-- 이부분은 지우면 안됩니다 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>footer</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
<footer class="container-fluid">
    <div class="container-fluid">
        <div class="row mb-4 align-items-center">
            <div class="col-md-auto d-flex">
                <h5 class="fw-bold fs-3 fst-italic mx-auto">
                    <img src="${pageContext.request.contextPath}/resources/images/logoPNG.png" style="width: 100px; height: 100px;" onclick="location.href='<c:url value='/' />'">
                    Clean Plate
                </h5>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-4 mt-4">
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">(주) Clean Plate, 부산광역시 부산진구 동천로 109 삼한골든게이트 7층 | Team2</li>
                    <li class="nav-item mb-2">대표이사 Team2 | 사업자 번호 : 123-4567890</li>
                    <li class="nav-item mb-2">통신판매번호 : 제2023-부산진구-1234호</li>
                    <li class="nav-item mb-2">개인정보책임자 : Team2 | 이메일 admin@admin.com</li>
                </ul>
            </div>
        </div>
        <div class="d-flex flex-column flex-sm-row justify-content-between py-2 my-2">
            <p>&copy; 2023 Company, Inc. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>