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
          <div class="h-50 p-3 col-md-6" style="padding: 20px">
          <!-- 슬라이드 시작-->
          <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://lh3.googleusercontent.com/p/AF1QipMzJUvfyEBWxCebpalhYC1Mgu_4Y0NYVDOomGex=s680-w680-h510" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                </div>
              </div>
              <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/p/AF1QipNetwbRnhfH74bX9lJF0vyMS4W9xcgHQmP7bng3=s680-w680-h510" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                </div>
              </div>
              <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/p/AF1QipOzWStJWn4HPyYzPnk0JyYR6PN_Wcrut4AC3AA8=s680-w680-h510" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
          <!-- 슬라이드 끝-->
          </div>

          <!-- 가게 -->
           <div class="col-md-6 ">
            <div class="container">
              <div class="row border border-3" >
                <!-- 가게 제목 -->
                <div class="h-50 p-3 col " style="background-color: white">
                  <h1>키친동백</h1>
                  <button type="button" class="btn btn-warning">즐겨찾기</button>
                </div>
                <!-- 가게 제목 -->
                <!-- 즐겨 찾기 -->
                <div class="col" style="background-color: white;">
                  <!-- <button type="button" class="btn btn-warning">즐겨찾기</button> -->
                </div>
                <!-- 즐겨 찾기 -->
                <!-- 예약 하기 -->
                <div class="col" style="background-color:  white; margin: auto;">
                  <!-- modal 버튼-->
                  <button type="button" class="btn btn-danger w-100 p-3" data-bs-toggle="modal" data-bs-target="#Reserve">
                    예약 하기
                  </button>
                  <!-- modal 버튼-->
                  <!-- Modal 창 -->
                  <div class="modal fade" id="Reserve" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">예약 하기</h5>
                        </div>
                        <div class="modal-body">
                          <div class="row g-0 text-center">
                            <div class="col-sm-6 col-md-12"><h3><b>동백 키친</b></h3></div><br><br>
                            <hr class="my-2">
                          </div>
                          <!-- modal center -->
                          <div class="row g-0 text-center">
                            <!-- 드롭다운 (인원수, 날짜선택)-->
                            <div class="col-sm-6 col-md-5">
                              <!-- 인원수 선택 -->
                              <div class="dropdown">
                                  <button class="btn btn-secondary dropdown-toggle" id="mystatus" type="button" data-bs-toggle="dropdown" aria-expanded="true">
                                    인원수를 선택해주세요.
                                  </button>
                                  <ul id="mytype" class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">2명</a></li>
                                    <li><a class="dropdown-item" href="#">3명</a></li>
                                    <li><a class="dropdown-item" href="#">4명</a></li>
                                    <li><a class="dropdown-item" href="#">5명</a></li>
                                    <li><a class="dropdown-item" href="#">6명</a></li>
                                    <li><a class="dropdown-item" href="#">7명</a></li>
                                    <li><a class="dropdown-item" href="#">8명</a></li>
                                    <li><a class="dropdown-item" href="#">9명</a></li>
                                    <li><a class="dropdown-item" href="#">10명</a></li>
                                  </ul>
                                </div>
                                <!-- 인원수 텍스트 표시 하는 스크립트 -->
                                <script>
                                  $('#mytype li > a').on('click', function() {
                                  // 버튼에 선택된 항목 텍스트 넣기 
                                  $('#mystatus').text($(this).text());
                                  });
                                </script>
                            </div>
                            <!-- 인원수 선택 -->
                            <!-- 예약일 선택-->
                            <div class="col-sm-6 col-md-5">
                              
                              <style>
                                input[type='date']::before {
                                  content: attr(data-placeholder);
                                  width: 100%;
                                }
                              </style>
                              <input type="date" data-placeholder="날짜를 선택하세요."></input>
                            </div>
                            <!-- 예약일 선택-->

                          </div>
                          <br>
                          
                          <div class="row g-0 text-center">
                            <!-- 메뉴1 -->
                            <div class="row g-0 text-center border border-3">
                              <div class="col-sm-6 col-md-5" style="background-color: white;">
                                <h3>쉐프 테이스팅 코스</h3>
                              </div>
                              <div class="col-sm-3 col-md-2" style="background-color: white;">
                                <h3>88,000원</h3>
                              </div>
                              <div class="col-sm-3 col-md-5" style="background-color: white;">
                                <button type ="button" class="btn btn-primary" onclick="fnCalCount('p',this);">+</button>
                                <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center; width: 10%;"/>
                                <button type="button" class="btn btn-primary" onclick="fnCalCount('m', this);">-</button>
                                <button type="button" class="btn btn-primary"> 삭제 </button>
                              </div>
                            </div>
                            <!-- 메뉴1 -->
                            <!-- 메뉴2 -->
                            <div class="row g-0 text-center border border-3">
                              <div class="col-sm-6 col-md-5" style="background-color: white;">
                                <h3>쉐프 테이스팅 코스</h3>
                              </div>
                              <div class="col-sm-3 col-md-2" style="background-color: white;">
                                <h3>88,000원</h3>
                              </div>
                              <div class="col-sm-3 col-md-5" style="background-color: white;">
                                <button type ="button" class="btn btn-primary" onclick="fnCalCount('p',this);">+</button>
                                <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center; width: 10%;"/>
                                <button type="button" class="btn btn-primary" onclick="fnCalCount('m', this);">-</button>
                                <button type="button" class="btn btn-primary"> 삭제 </button>
                              </div>
                            </div>
                            <!-- 메뉴2 -->
                            <!-- 메뉴3 -->
                            <div class="row g-0 text-center border border-3">
                              <div class="col-sm-6 col-md-5" style="background-color: white;">
                                <h3>쉐프 테이스팅 코스</h3>
                              </div>
                              <div class="col-sm-3 col-md-2" style="background-color: white;">
                                <h3>88,000원</h3>
                              </div>
                              <div class="col-sm-3 col-md-5" style="background-color: white;">
                                <button type ="button" class="btn btn-primary" onclick="fnCalCount('p',this);">+</button>
                                <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center; width: 10%;"/>
                                <button type="button" class="btn btn-primary" onclick="fnCalCount('m', this);">-</button>
                                <button type="button" class="btn btn-primary"> 삭제 </button>
                              </div>
                            </div>
                            <!-- 메뉴3 -->
                            <!-- 메뉴4 -->
                            <div class="row g-0 text-center border border-3">
                              <div class="col-sm-6 col-md-5" style="background-color: white;">
                                <h3>쉐프 테이스팅 코스</h3>
                              </div>
                              <div class="col-sm-3 col-md-2" style="background-color: white;">
                                <h3>88,000원</h3>
                              </div>
                              <div class="col-sm-3 col-md-5" style="background-color: white;">
                                <button type ="button" class="btn btn-primary" onclick="fnCalCount('p',this);">+</button>
                                <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center; width: 10%;"/>
                                <button type="button" class="btn btn-primary" onclick="fnCalCount('m', this);">-</button>
                                <button type="button" class="btn btn-primary"> 삭제 </button>
                              </div>
                            </div>
                            <!-- 메뉴4 -->
                          </div>
                          <!-- 주문 메뉴 및 총 금액 -->
                          <div class="row g-0 ">
                            <div class="row g-0 border border-3">
                              <div class="col-sm-6 col-md-12" style="background-color: white; vertical-align: top; text-align: left;">
                                <p>
                                  <h3 >주문메뉴 : </h3>
                                </p>
                              </div>
                              <div class="col-sm-6 col-md-12" style="background-color: white; text-align: left;">
                                <h3 style="color: red">총금액 : </h3>
                              </div>
                            </div>
                          </div>
                          <!-- 주문 메뉴 및 총 금액 -->
                          <!-- modal center -->
                        <div class="modal-footer">
                          <button type="button" class="btn btn-warning" onclick="location.href='../reservation/reservation_result.jsp' ">카카오 결제하기</button>
                          <button type="button" class="btn btn-primary" onclick="location.href='../reservation/reservation_result.jsp' ">결제하기</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>
                  <!-- Modal 창 -->
                  </div>
                <!-- 예매 하기 -->
              </div>
              <!-- 가게 정보 -->
              <div class="row" >
                <div class="h-50 p-3 col " style="background-color: white">
                  해운대구 달맞이 길에 위치한 스테이크 전문점입니다.<br>
                  주소 : 부산광역시 해운대구 달맞이길117번가길 85<br>
                  별점 : 4.78<br>
                  연락처 : 051-731-0022<br>
                  <span class="text-warning">#스테이크 #달맞이길 #해운대</span>
                </div>
              </div>
              <!-- 가게 정보 -->
            </div>
            <!-- 가게 -->
            <!-- 지도 -->
           <div class="row">
            
               <!-- 지도 시작 -->
                <div style=" font:normal normal 400 12px/normal dotum, sans-serif; width:500px; height:282px; color:#333; position:relative; margin: auto;">
                  <div style="height: 250px;"><a href="https://map.kakao.com/?urlX=996325.0&amp;urlY=466935.0&amp;itemId=27607804&amp;q=%ED%82%A4%EC%B9%9C%EB%8F%99%EB%B0%B1&amp;srcid=27607804&amp;map_type=TYPE_MAP&amp;from=roughmap" target="_blank">
                    <img class="map" src="http://t1.daumcdn.net/roughmap/imgmap/27a6e46c0a284d2f6e2a99f12dd6e205c28d2cfa22636813e8ee38b39281e37a" 
                    width="498px" height="248px" style="border:1px solid #ccc;"></a></div><div style="overflow: hidden; padding: 7px 11px; border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 0px 0px 2px 2px; background-color: rgb(249, 249, 249);">
                      <a href="https://map.kakao.com" target="_blank" style="float: left;"><img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵" style="display:block;width:72px;height:16px"></a><div style="float: right; position: relative; top: 1px; font-size: 11px;">
                        <a target="_blank" href="https://map.kakao.com/?from=roughmap&amp;srcid=27607804&amp;confirmid=27607804&amp;q=%ED%82%A4%EC%B9%9C%EB%8F%99%EB%B0%B1&amp;rv=on" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">로드뷰</a>
                        <span style="width: 1px;padding: 0;margin: 0 8px 0 9px;height: 11px;vertical-align: top;position: relative;top: 2px;border-left: 1px solid #d0d0d0;float: left;"></span><a target="_blank" href="https://map.kakao.com/?from=roughmap&amp;eName=%ED%82%A4%EC%B9%9C%EB%8F%99%EB%B0%B1&amp;eX=996325.0&amp;eY=466935.0" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">길찾기
                        </a><span style="width: 1px;padding: 0;margin: 0 8px 0 9px;height: 11px;vertical-align: top;position: relative;top: 2px;border-left: 1px solid #d0d0d0;float: left;"></span><a target="_blank" href="https://map.kakao.com?map_type=TYPE_MAP&amp;from=roughmap&amp;srcid=27607804&amp;itemId=27607804&amp;q=%ED%82%A4%EC%B9%9C%EB%8F%99%EB%B0%B1&amp;urlX=996325.0&amp;urlY=466935.0" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">
                          지도 크게 보기</a></div></div></div>
              </div>
              <!-- 지도 끝-->
             </div>
           </div>
  <!-- tab 메뉴-->
    <div class="row">
        <nav>
          <div class="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">가게 소개</button>
            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">메뉴</button>
            <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">리뷰</button>
          </div>
        </nav>
        <!-- 식당소개 -->
        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
            <div id="store-1">
              <div class="col-sm-6 col-md-12 border border-3" style="background-color: white; padding: 30px;">
                해운대 바다와 동백섬 그리고 광안대교까지 한눈에 볼 수 있는 멋진 전망의 장소입니다.<br>
							  1층에서 3층까지 층별로 다른 전문 사진작가분 의 작품을 전시하여 갤러리와 같은 분위기입니다. <br>
							  품격있는 분위기의 장소에 맛있는 음식까지, 특별한 날, 특별한 식사를 위한 장소로 꼭 추천드립니다.<br>
							  서비스 옵션: 매장 내 식사 · 테이크아웃이 안 됨 · 배달이 안 됨<br>
							  주소: 부산광역시 해운대구 달맞이길117번가길 85
              </div>
              <div class="col-sm-6 col-md-12 border border-3" style="background-color: white; padding: 30px;">
							영업시간: <br>
							화요일	오전 11:00~오후 10:00<br>
							수요일	오전 11:00~오후 10:00<br>
							목요일	오전 11:00~오후 10:00<br>
							금요일	오전 11:00~오후 10:00<br>
							토요일<br>
							(부처님 오신 날)<br>
							오전 11:00~오후 10:00<br>
							시간이 달라질 수 있음<br>
							일요일	오전 11:00~오후 10:00<br>
							월요일	오전 11:00~오후 10:00<br>
              </div>
              <div class="col-sm-6 col-md-12 border border-3" style="background-color: white; padding: 30px;">
							새로운 영업시간 제안<br>
							연락처: 051-731-0022<br>
              </div>
							</div>
            </div>
          <!-- 식당소개 끝-->
          <!-- 메뉴 시작 -->
          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
            <div class="row g-0">
              <!-- 메뉴 1 -->
              <div class="col-sm-6 col-md-3 border border-3" style="background-color: white; padding: 30px;">
                <img src="https://lh3.googleusercontent.com/p/AF1QipMLJThb0IPLORax_Y4HGbkbccgi7JUzdPyyqEKP=s680-w680-h510" 
                          class="rounded mx-auto d-block" height="200px" width="200px">
								셀러리악 퓨레, 가지구이, 버섯과 꽈리고추볶음을 곁들인 한우스테이크<br>
								<h4>가격 : 30,000원</h4>
              </div>
              <!-- 메뉴 2 -->
              <div class="col-6 col-md-3 border border-3" style="background-color: white; padding: 30px;">
                <img src="https://lh3.googleusercontent.com/p/AF1QipMT4O-sZxS3Xz02tBvFnsmhaLg6Jhvd2Y7lB1x8=s680-w680-h510" 
                          class="rounded mx-auto d-block" height="200px" width="200px">
								셀러리악 퓨레, 가지구이, 버섯과 꽈리고추볶음을 곁들인 한우스테이크<br>
								<h4>가격 : 30,000원</h4>
              </div>
              <!-- 메뉴 3 -->
              <div class="col-sm-6 col-md-3 border border-3" style="background-color: white; padding: 30px;">
                <img src="https://lh3.googleusercontent.com/p/AF1QipMF3TGr0MXHrkrjqPmxNtJtDP3ZYN6y7dvjjw_F=s680-w680-h510" 
                          class="rounded mx-auto d-block" height="200px" width="200px">
								셀러리악 퓨레, 가지구이, 버섯과 꽈리고추볶음을 곁들인 한우스테이크<br>
								<h4>가격 : 30,000원</h4>
              </div>
              <!-- 메뉴 4 -->
              <div class="col-6 col-md-3 border border-3" style="background-color: white; padding: 30px;">
                <img src="https://lh3.googleusercontent.com/p/AF1QipPeWy-JkY4BEkxMK2rBHXaytrOE5fIHw4L7MyWJ=s680-w680-h510" 
                          class="rounded mx-auto d-block" height="200px" width="200px">
								셀러리악 퓨레, 가지구이, 버섯과 꽈리고추볶음을 곁들인 한우스테이크<br>
								<h4>가격 : 30,000원</h4>
              </div>
            </div>
          </div>
          <!-- 메뉴 끝 -->
          <!-- 리뷰 시작-->
          <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
            <!-- 리뷰1 -->
            <div class="row g-0 border border-3">
              <div class="col-sm-6 col-md-3" style="background-color: white; padding: 2%; vertical-align: middle;">
                <img src="https://lh3.googleusercontent.com/p/AF1QipP1W7o3WMfMwHRO8osgBezLvRRPkPCJb0lS9nXO=s680-w680-h510" height="200px" width="200px"
                          class="rounded mx-auto d-block">
              </div>
              <div class="col-6 col-md-9 " style="background-color: white; padding: 20px;">
                <h3>4.4<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F233D823757ED52EC01" 
                            height="40px" width="200px"></h3><br>
                 <p>
                  가성비 좋은 파인 다이닝. 해운대가 내려다보이는 자리는 늘 예약하기 어렵지만 <br>
                  다른 공간들도 모두 충분히 매력적입니다.
                  서빙도 세심하고 친절합니다. 다만 제 입에는 간이 좀 쎄서 그 부분은 미리 서버에게 <br>
                  말하면 충분히 조절 가능 합니다. 안먹거나 안맞는 음식도 미리 말해주세요.
                 </p>
              </div>
            </div>
            <!-- 리뷰1 -->
            <!-- 리뷰2 -->
            <div class="row g-0 border border-3">
              <div class="col-sm-6 col-md-3" style="background-color: white; padding: 2%; vertical-align: middle;">
                <img src="https://lh3.googleusercontent.com/p/AF1QipP1W7o3WMfMwHRO8osgBezLvRRPkPCJb0lS9nXO=s680-w680-h510" height="200px" width="200px"
                          class="rounded mx-auto d-block">
              </div>
              <div class="col-6 col-md-9" style="background-color: white; padding: 20px">
                <h3>4.4<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F233D823757ED52EC01" 
                            height="40px" width="200px"></h3><br>
                 <p>
                  가성비 좋은 파인 다이닝. 해운대가 내려다보이는 자리는 늘 예약하기 어렵지만 <br>
                  다른 공간들도 모두 충분히 매력적입니다.
                  서빙도 세심하고 친절합니다. 다만 제 입에는 간이 좀 쎄서 그 부분은 미리 서버에게 <br>
                  말하면 충분히 조절 가능 합니다. 안먹거나 안맞는 음식도 미리 말해주세요.
                 </p>
              </div>
            </div>
            <!-- 리뷰2 -->
          </div>
          <!-- 리뷰 끝-->
        </div>
      </div>
    </div>
    
 <!-- tab 내용 -->

<!-- 메인 메뉴 바 영역 끝 -->
     <!-- tab 메뉴 끝-->
<!-- Center 끝-->

<!-- footer -->
	<footer class="footer">
<%@ include file="../common/common_footer.jsp" %>
	</footer>
<!-- footer -->
</body>
</html>
