<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- CSS -->
    <link rel="stylesheet" href="" />
    
     <!-- Link Swiper's CSS -->
     <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
     <style>
       .mySwiper {
         width: 100%;
         height: 300px;
       }
       .swiper-slide {
         display: flex;
         justify-content: center;
         align-items: center;
       }

       .list-group-item:hover{
        background-color: #eee;
       }

      </style>
      <!-- Link Swiper's CSS -->

  	  <!-- aos 라이브러리-->
      <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  </head>
  <body>
<!-- ======================================================================================================================== -->
 	


 
<!-- =============================================================================================================== -->
<!-- =============================================================================================================== -->
<!-- 상단 이미지 슬라이드 추가시 필요한 라이브러리 -->
<!-- <div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <div class="swiper-slide">Slide 1</div>
    <div class="swiper-slide">Slide 2</div>
    <div class="swiper-slide">Slide 3</div>
  </div>
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>
</div> -->

<!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
  var swiper = new Swiper(".mySwiper", {
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev"
    }
  });
</script> -->
<!-- 상단 이미지 슬라이드 추가시 필요한 라이브러리 -->

<!-- =============================================================================================================== -->

<div style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(../images/1.jpg); background-size: cover;">
  
  <!-- top 시작-->
    <div class="container text-black text-white mt-2 position-absolute top-0 start-50 translate-middle-x" style="z-index: 99999; background: transparent; position: relative;" >
      <div class="container d-flex justify-content-between align-items-center">
        <img src="../images/logo.gif" style="width: 120px; height: 120px">
        
        <div class="btn-group">
          <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent" onclick="location.href='../member/member_login.jsp'">로그인</button>
          <!-- <button type="button" class="btn btn-outline-light text-white me-2 border-0 bg-transparent">회원가입</button> -->
          <button type="button" class="btn btn-outline-light text-white border-0 bg-transparent">예약내역</button>
        </div>
      </div>

	  <!-- 로그인, 예약내역 버튼 아래 네비바 -->
      <div class="d-flex justify-content-center">
        <nav class="navbar navbar-expand-lg navbar-light fs-5">
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
                <li class="nav-item me-5"><a class="nav-link active" aria-current="page" href="../main.jsp" style="color: white;">Home</a></li>
                <li class="nav-item me-5"><a class="nav-link" href="../reservation/reservation_main.jsp" style="color: white;">Reservation</a></li>
                <li class="nav-item me-5"><a class="nav-link" href="../event/event_active.jsp" style="color: white;">Event</a></li>
                <li class="nav-item"><a class="nav-link" href="../help/help_home.jsp" style="color: white;">Help</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <br>
    <!-- top 끝-->
<div style="position: relative; top: 150px;">

<div class="container">
    <div class="row  row-cols-1 row-cols-md-1 g-4">
    <div class="col-12 text-center" >
      <div class="list-group list-group-horizontal">
        <a href="#"class="list-group-item list-group-item-action" aria-current="true">예약많은순</a>
        <a href="#" class="list-group-item list-group-item-action">리뷰순</a>
        <a href="#" class="list-group-item list-group-item-action">평점순</a>
      </div>
    </div>
  </div>
</div>

<div class="container mt-5 sticky-top d-flex justify-content-center" style="top: 50px;">
  <div class="input-group mb-3" style="height: 50px; width: 50%;">
      <input type="text" class="form-control" placeholder="식당, 음식으로 검색하세요" aria-label="Recipient's username" aria-describedby="button-addon2" style="border: 3px solid;">
      <button class="btn btn-outline-secondary btn-lg bg-white shadow-lg" type="button" id="button-addon2" style="border: 3px solid black;">검색</button>
    </div>
  </div>
  
  
<div class="container">
  <div class="row">

    <div class="col-md-12 my-3" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">키친동백</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text"><h5>부산광역시 해운대구 달맞이길117번가길 85</h5></p>
                <p class="card-text">#파인다이닝 #2인 #3인 #예약 #부산 #다이닝코스</p>
                <a href="../reservation/reservation_reserve.jsp" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">광안다이닝</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">이플다이닝</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="../reservation/reserve.jsp" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">다이닝룸</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">레플랑시</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">르도헤 </h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">키친동백</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">키친동백</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-right" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">키친동백</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 my-3" data-aos="fade-left" data-aos-offset="500" data-aos-easing="ease-in-sine">
      <div class="card mb-3" style="max-width: 100%; height: 350px;">
        <div class="d-flex">
            <div class="row g-0">
            <div class="col-md-4">
              <div class="d-flex flex-column justify-content-center align-self-center">
                  <img src="../images/r2.jpg" class="img-fluid rounded-start mt-1 ms-1" alt="..." style="height: 90%;">
                  <div class="btn-group">
                    <button class="btn btn-danger mt-2 ms-1 w-100 p-2">예약하기</button>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h1 class="card-title">키친동백</h1>
                <p class="card-text">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi nisi consectetur saepe, natus, reiciendis quidem a excepturi libero beatae perspiciatis iure. Tenetur, saepe illum error iusto vitae autem doloremque. Officia.
                </p>
                <p class="card-text">부산광역시 해운대구 달맞이길117번가길 85</p>
                <a href="" class="stretched-link"></a>
              </div>
          </div>
          </div>
        </div>
      </div>
    </div>


    </div>
  </div>
</div>


</div>

<!-- 좌우 슬라이드 처리를 위한 aos 라이브러리 -->
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
  AOS.init();
</script>      
<!-- 좌우 슬라이드 처리를 위한 aos 라이브러리 -->


<!-- bottom include 처리 영역 -->
<%@ include file="../common/common_footer.jsp" %>
<!-- bottom include 처리 영역 끝 -->

    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>