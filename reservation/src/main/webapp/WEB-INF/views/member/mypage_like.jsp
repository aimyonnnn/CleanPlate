<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
</head>


<body>
   	<!-- 공통 상단바 구역 -->
<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row">
          <div class="col">
            <h2>마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-2 align-items-center d-flex">
                <!-- 버튼 그룹 -->
                <!-- 프로필 사진 -->
                <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                    <img src="../images/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                    
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 40px;">내가 찜한 식당</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-warning active p-3" onclick="location.href='mypage'" style="color: white;">내 정보</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_rslist'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_like'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='mypage_rv'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-warning p-3" onclick="location.href='withdrawal'">회원탈퇴</button>
                </div>
            </div>
            <!-- 내용 구역 -->
            <div class="col-8">

                <!-- 내용 -->
                <table class="table text-center" style="margin-left: 50px;">
                    <thead>
                        <tr>
                            <th></th>
                            <th>가게명</th>
                            <th>별점</th>
                            <th>리뷰수</th>
                            <th>예약</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="..." class="img-thumbnail" alt="가게사진" style="width: 150px; height: 150px;"></td>
                            <td>XX오마카세</td>
                            <td>별점표현</td>
                            <td>리뷰수</td>
                            <td>
                                <button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#Reserve">예약하기</button>
                                <button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#likedelete">찜 취소</button>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="..." class="img-thumbnail" alt="가게사진" style="width: 150px; height: 150px;"></td>
                            <td>XX파인다이닝</td>
                            <td>별점표현</td>
                            <td>리뷰수</td>
                            <td>
                                <button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#Reserve">예약하기</button>
                                <button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#likedelete">찜 취소</button>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>  
                             
            </div>
            <!-- 내용 구역 -->

            </div>

        </div>
    </div>
    
    <!-- 예약하기 버튼 클릭시 모달창 -->
    <div class="modal fade" id="Reserve" tabindex="-1" >
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
    
    
    <!-- 찜 취소 모달창-->
    <div class="modal fade" id="likedelete" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">찜 취소</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              찜을 취소 하시겠습니까?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" style="color: white;">확인</button>
              <button type="button" class="btn btn-warning" style="color: white;"data-bs-dismiss="modal">취소</button>
            </div>
          </div>
        </div>
    </div>

 
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 