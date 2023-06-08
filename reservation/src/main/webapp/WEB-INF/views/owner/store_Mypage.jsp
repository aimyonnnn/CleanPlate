<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Store_MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link href="top.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

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
            <h2>점주 마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <!-- 프로필 사진 -->
                <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                    <img src="../image/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                    <p class="d-flex align-items-center"><span>님 환영합니다</span></p>
                    
                </div>
            </div>
            <div class="col-10">
            	<h2 style="margin-left: 40px; margin-top: 40px;">가게 정보</h2>
            </div>
        </div>
        <div class="row">
        <div class="col-2">
            <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
					<button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='CeoMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning active mt-4 text-black p-3" onclick="location.href='StoreMypage'">가게정보 </button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='StoreReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='StoreSales'">매출관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='CeoMypageDelete'">회원탈퇴</button>
            </div>
        </div>
            <!-- 내용 구역 -->
            <!-- 가게내용 페이지 시작 -->
            <div class="col">
                   <form action="#" method="post">
                	<table class="table" style="margin-left: 70px; width: 58%;">
						<tbody>
						    <tr>
						    	<th scope="row" width="150"><label for="name">식당이름</label></th>
						    	<td><input class="form-control" type="text" id="name" value="마제소바" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="passwd">우편번호</label></th>
						    	<td colspan="2"><input type="text" class="form-control" value="00000" id="passwd" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="id">도로명주소</label></th>
						    	<td><input class="form-control" type="text" id="id" value="123456789ab" aria-label="Disabled input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="nick">상세명주소</label></th>
						    	<td colspan="2"><input class="form-control" type="text" id="nick" value="itwill 건물 앞" aria-label="default input example"></td>
						    </tr>
						    <!-- 영업 시간 시작 -->
						    <tr>
						    	<th scope="row"><label for="birth">영업시간</label></th>
						    	<td>
                                <div class="row">
                                    <div class="col-6">
                                        <input class="form-control" type ="time"> <!-- 영업 시작 시간 -->
                                    </div>
                                    <div class="col-6">
                                        <input class="form-control" type ="time"> <!-- 영업 마감 시간 -->
                                    </div>
                                    <div class="col mt-2">
                                        <input type="text" class="form-control" placeholder="브레이크 시간 00:00 ~ 00:00"> <!-- 크레이크 타입 기록 -->
                                    </div>
                                    
                                </div>
						    	</td>
						    </tr>
						    <!-- 영업 시간 끝 -->
						    <tr>
						    	<th scope="row"><label for="birth">정기휴무일</label></th> <!-- select box -->
						    	<td>
									<div class="dropdown">
										<select class="form-select form-select" aria-label=".form-select example" style="width: 180px;">
											<option selected value="planToVisit">없음</option>
											<option value="visited">월요일</option>
											<option value="cancelNoshow">화요일</option>
											<option value="cancelNoshow">수요일</option>
											<option value="cancelNoshow">목요일</option>
											<option value="cancelNoshow">금요일</option>
											<option value="cancelNoshow">토요일</option>
											<option value="cancelNoshow">일요일</option>
										</select>
									</div>
                                </td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="phone">가계 전화번호</label></th>
						    	<td>
							  		<div class="d-flex align-items-center">
							    		<input class="form-control" type="text" id="phone" value="010-1234-5678" aria-label="default input example" style="width: 365px;">
							    	</div>
								</td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="birth">식당 편의 시설</label></th>
						    	<td><input type ="text" class="form-control" placeholder="식당 내 시설을 입력해주세요."></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="birth">테이블</label></th>
						    	<td><button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#talbe">테이블 수정</button></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="birth">메뉴</label></th>
						    	<td><button type="button" class="btn btn-warning" style="color: white;"  data-bs-toggle="modal" data-bs-target="#menu">메뉴 수정</button></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="birth">사진</label></th>
						    	<td><input type="file" class="form-control" style="color: white;"></td>
						    </tr>
						  </tbody>
                	</table>
					<div style="margin-left:380px;">
					    <button type="submit" class="btn btn-warning" style="color: white;">수정완료</button>
					</div>
                </form>	
			  </div>
            </div>
		  </div>
		              <!-- 가게내용 페이지 끝 -->
		  

		  

<!-- Modal -->
<!-- 테이블 모달창 -->
<div class="modal fade" id="talbe" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
          <!-- 테이블 모달 제목 시작 -->
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">테이블규격</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
          <!-- 테이블 모달 제목 끝 -->
      <!-- 테이블 모달 내용 시작 -->
      <div class="modal-body">
		<select style="width:100px;margin-right:10px">
		<option value="1인용" selected>1인용</option>
	    <option value="2인용">2인용</option>
	    <option value="3인용">3인용</option>
	    <option value="4인용">4인용</option>
	  	</select>
        <button class="btn btn-primary">추가</button>
	  	<br>
        <div class="row mt-3 align-items-center">
                   <!-- foreach 문으로 작성 -->
            <div class="col-auto ">2인용</div>
            <div class="col-auto"><input type="number" value="2" class="form-control"></div>
            <div class="col-auto"><button class="btn btn-warning text-white">삭제</button></div>
	  	    
        </div>
      </div>
      <!-- 테이블 모달 내용 끝 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>
<!-- 테이블 모달창 끝 -->

<!-- 메뉴 목록 모달창 -->
<div class="modal fade" id="menu" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">메뉴목록</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
		<!-- 메뉴 목록 내용 시작 -->
        <div class="modal-body">
          <div class="row mt-3 align-items-center">
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col" class="col-5">메뉴명</th>
                    <th scope="col" class="col-3">가격</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody class="table-group-divider">
                <!-- foreach 문으로 작성 -->
                  <tr>
                    <td scope="row">또루뀨막또</td>
                    <td>38000</td>
                    <td>
	                    <button class="btn btn-warning text-white me-1" data-bs-toggle="modal" data-bs-target="#menuPro">수정</button>
	                    <button class="btn btn-warning text-white">삭제</button>
                    </td>
                  </tr>
                  <tr>
                    <td scope="row">또루뀨막또</td>
                    <td>38000</td>
                    <td>
	                    <button class="btn btn-warning text-white me-1" data-bs-toggle="modal" data-bs-target="#menuPro">수정</button>
	                    <button class="btn btn-warning text-white">삭제</button>
                    </td>
                  </tr>
                </tbody>
              </table>
          </div>
        </div>
		<!-- 메뉴 목록 내용 끝 -->
        <div class="modal-footer">
            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#menuPro" style="color: white;">추가</button>
            <button type="button" class="btn btn-primary">저장</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
</div>

<!-- 메뉴 목록 모달 창 끝 -->

<!-- 메뉴 설정 모달창 -->
<div class="modal fade" id="menuPro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">메뉴설정</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <!-- 메뉴 설정 내용 시작 -->
        <div class="modal-body">
          <div class="row mt-3 align-items-center">
            메뉴 이름 : <input type="text" class="form-control">
            메뉴 설명 : <textarea rows="5" cols="30" class="form-control"></textarea>
            메뉴 가격 : <input type="text" class="form-control">
           	메뉴 사진 : <input type="file" class="form-control" multiple="multiple">
          </div>
        </div>
        <!-- 메뉴 설정 내용 끝 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">저장</button>
        </div>
      </div>
    </div>
  </div>
 <!-- 메뉴 설정 모달창 끝 -->
 
    
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 