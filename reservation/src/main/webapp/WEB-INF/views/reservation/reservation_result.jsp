<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <!-- 이부분은 지우면 안됩니다 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css">
<script src="../js/jquery-3.7.0.js"></script>

<style>
    /* Make the image fully responsive */
    .carousel-inner img {
        width: 100%;
        height: 100%;
    }
</style>

<title>Clean plate</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 이부분은 지우면 안됩니다 -->
<!-- TOP 시작 -->
<body>
<header>
<%@ include file="../common/common_header.jsp" %>
</header>
<!-- TOP 끝 -->
<!-- Center 시작-->
<div class="container">
    <div class="row">
        <div class="h-50 p-3 col-md-12 padding: 20px" style="text-align: center;">
            <h1><b style="color: cornflowerblue;">예약 안내</b></h1>
            <hr>
            <h2><b>동백 키친</b></h2>
        </div>
        <!-- 가게사진 -->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-12" >
                <img src="https://lh3.googleusercontent.com/p/AF1QipNY1MlSKhc_HLzeW1-s9SauzPn9woiO3QmNd9eA=s680-w680-h510" 
                          class="rounded mx-auto d-block" height="300px" width="500px">
            </div>
        </div>
        <!-- 날짜 -->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3" ></div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4><b>날짜</b></h4>
            </div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4>2023년 05월 25일</h4>
            </div>
            <div class="h-50 p-3 col-md-3"> </div>
        </div>
        <!-- 시간 -->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3" ></div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4><b>시간</b></h4>
            </div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4>오후 7:00</h4>
            </div>
            <div class="h-50 p-3 col-md-3"> </div>
        </div>
        <!-- 인원 -->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3"> </div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4><b>인원</b></h4>
            </div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4>5명</h4>
            </div>
            <div class="h-50 p-3 col-md-3"> </div>
        </div>
        <!-- 예약자 -->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3"> </div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4><b>예약자</b></h4>
            </div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4>Team2</h4>
            </div>
            <div class="h-50 p-3 col-md-3"> </div>
        </div>
        <!-- 오시는길 -->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3"></div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
            <h4><b>[오시는길]</b></h4>
            </div>
            <div class="h-50 p-3 col-md-5" style="text-align: left;">
                <h4>부산광역시 해운대구 달맞이길117번가길 85</h4>
            </div>
            <div class="h-50 p-3 col-md-1"> </div>
        </div>   
        <!--발렛비 안내-->
        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3"></div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
            <h4><b>[발렛비 안내]</b></h4>
            </div>
            <div class="h-50 p-3 col-md-5" style="text-align: left;">
                <h4>런치 1시간30분기준 3,000원</h4>
                <h4>디너 4시간기준 5,000원</h4>
            </div>
            <div class="h-50 p-3 col-md-1"> </div>
        </div>

        <div class="row" style="text-align: center;">
            <div class="h-50 p-3 col-md-3"></div>
            <div class="h-50 p-3 col-md-3" style="text-align: left;">
                <h4><b>[안내사항]</b></h4>
            </div>
            <div class="h-50 p-3 col-md-5" style="text-align: left;">
                <h4>예약 변경 및 취소는 예약일 기준 일주일 전까지만 가능합니다.</h4>
                <h4>그 이후로는 환불 및 날짜변경이 불가하니 변동사항 있으실 경우</h4>
                <h4>사전에 레스토랑으로 연락 주시기 바랍니다.</h4>
                <br>
                <br>
            </div>
            <div class="h-50 p-3 col-md-1"> </div>
        </div>      
    </div>
</div>
<!-- Center 끝-->
<!-- footer -->
	<footer class="footer">
<%@ include file="../common/common_footer.jsp" %>
	</footer>
<!-- footer -->
</body>
</html>
