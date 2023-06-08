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
                    <button type="button" class="btn btn-outline-warning active mt-4 text-black p-3" onclick="location.href='StoreList'">가게리스트 </button>
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
						    	<td><input class="form-control" type="text" id="name" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="id">사업자 번호</label></th>
						    	<td>
						    		<div class="input-group">
								    	<input class="form-control" type="text" id="id" value="123456789ab" aria-label="Disabled input example">
								    	<button type="button" class="btn btn-outline-secondary">인증</button>
							    	</div>
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="passwd">식당소개</label></th>
						    	<td colspan="2"><textarea class="form-control" rows="5" cols="50"></textarea></td>
						    </tr>
						    <tr>
						    	<th>주소</th>
								<td>
								<!-- 다음 api 사용 -->
								<div class="input-group mb-3">
									<input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="button-addon2">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-secondary" id="button-addon2">
								</div>									
									<input type="text" class="form-control" id="sample6_address" placeholder="주소">
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
									<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
								</div>
								</td>
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
							    		<input class="form-control" type="text" id="phone" aria-label="default input example" style="width: 365px;">
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
					    <button type="submit" class="btn btn-warning" style="color: white;">가게추가</button>
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
 
 <!-- 다음 주소 api 스크립트 시작 -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
 <!-- 다음 주소 api 스크립트 끝 -->
    
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 