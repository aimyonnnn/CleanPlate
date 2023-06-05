<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common_header.css" />

    <title>Main</title>

</head>
<body>
	
	<div class="container bg-white text-black mt-2">
      <div class="container d-flex justify-content-between align-items-center">
        <img src="${pageContext.request.contextPath }/resources/images/logo.gif" style="width: 150px; height: 150px">
        <div>
          <button type="button" class="btn btn-outline-light text-black me-2" onclick="location.href='LoginForm'">로그인</button>
          <button type="button" class="btn btn-outline-light text-black">예약내역</button>
        </div>
      </div>
    </div>
    
    
	<div class="d-flex justify-content-center">
		<nav class="navbar navbar-expand-lg navbar-light fs-5 fw-bold">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav gnb">
						<li class="nav-item me-5"><a class="nav-link active" aria-current="page" href="../main.jsp">Home</a></li>
						<li class="nav-item me-5"><a class="nav-link" href="../reservation/reservation_main.jsp">Reservation</a></li>
						<li class="nav-item me-5"><a class="nav-link" href="../event/event_active.jsp">Event</a></li>
						<li class="nav-item"><a class="nav-link" href="../help/help_home.jsp">Help</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

  	
  	<!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
