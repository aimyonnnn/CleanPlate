<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- jQuery CDN -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    
</head>
<body>
 <h1>테스트 페이지 입니다.</h1>
 <h1>가게 상세 보기 페이지 입니다.</h1>
 <h1>${restaurantInfo.res_name}</h1>
 
	<table border="1">
    <tr>
        <th>res_idx</th>
        <th>res_brn</th>
        <th>res_name</th>
        <th>res_tel</th>
        <th>res_address</th>
        <th>res_detailAddress</th>
        <th>res_openinghours</th>
        <th>res_breaktime</th>
        <th>res_dayoff</th>
        <th>res_amenity</th>
        <th>res_amenity_info</th>
        <th>res_photo1</th>
        <th>res_photo2</th>
        <th>res_photo3</th>
        <th>res_intro</th>
        <th>c_idx</th>
    </tr>
    <tr>
        <td>${restaurantInfo.res_idx}</td>
        <td>${restaurantInfo.res_brn}</td>
        <td>${restaurantInfo.res_name}</td>
        <td>${restaurantInfo.res_tel}</td>
        <td>${restaurantInfo.res_address}</td>
        <td>${restaurantInfo.res_detailAddress}</td>
        <td>${restaurantInfo.res_openinghours}</td>
        <td>${restaurantInfo.res_breaktime}</td>
        <td>${restaurantInfo.res_dayoff}</td>
        <td>${restaurantInfo.res_amenity}</td>
        <td>${restaurantInfo.res_amenity_info}</td>
        <td>${restaurantInfo.res_photo1}</td>
        <td>${restaurantInfo.res_photo2}</td>
        <td>${restaurantInfo.res_photo3}</td>
        <td>${restaurantInfo.res_intro}</td>
        <td>${restaurantInfo.c_idx}</td>
    </tr>
</table>

  	
  	<p>사진 출력 테스트</p>
  	<img src="${pageContext.request.contextPath }/resources/images/${restaurantInfo.res_photo1}">
</body>
</html>