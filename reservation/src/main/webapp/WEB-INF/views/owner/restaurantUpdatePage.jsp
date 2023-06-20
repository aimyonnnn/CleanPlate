<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <!-- 이부분은 지우면 안됩니다 -->
    <script  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
        
        // 사업자번호 입력시 자동으로 하이픈 생성
        $(document).ready(function () {
           $(function () {
                    
                    $('#res_brn').keydown(function (event) {
                     // 입력값 변수 지정
                     // 브라우저가 charCode 속성을 지원하지 않는 경우 키 코드 (IE8 및 이전 버전)를 사용
                     var input = event.charCode || event.keyCode || 0;
                     $text = $(this); 
                     if (input !== 8 && input !== 9) {
                         if ($text.val().length == 3) { // 앞 3자리 되면 하이픈
                             $text.val($text.val() + '-');
                         }
                         if ($text.val().length == 6) { // 가운데 2자리(앞,하이픈 포함 6자리) 되면 하이픈
                             $text.val($text.val() + '-');
                         }
                     }
                     // KeyCode아스키코드 8번 => Back Space 9번 => Horizontal Tab
                     // 46번 => Delete 숫자 0~9 (48번~57번) 숫자키패드(96번~105번)외에는 입력불가
                     return (input == 8 || input == 9 || input == 46 || 
                                                (input >= 48 && input <= 57) || (input >= 96 && input <= 105));
                 })
           });
           
           
           // 전화번호 입력시 자동으로 하이픈 생성 
           $(document).on("keyup", "#res_tel", function() { 
        		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
        	});
           
           
        
        });
          
        </script>
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
            	<h2 style="margin-left: 40px; margin-top: 40px;">가게 수정</h2>
            </div>
        </div>
        <div class="row">
          <div class="col-2">
            <!-- 왼쪽 사이드바 버튼들-->
            <!-- 클릭된 버튼은 active 표시함-->
            <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
                    <button type="button" class="btn btn-outline-warning  active text-black p-3" onclick="location.href='restaurantList'">가게리스트 </button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
                    <button type="button" class="btn btn-outline-warning text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
            </div>
        </div>
            <!-- 내용 구역 -->
            <div class="col-10">
                <!-- 가게내용 페이지 시작 -->
                   <form action="restaurantUpdate" method="post">
                	<table class="table" style="margin-left: 70px; width: 58%;">
						<tbody>
                            <tr>
                                <th scope="row"><label for="res_brn">사업자 번호</label></th>
                                <td>
                                    <div class="input-group">
                                    	<!-- 사업자번호 변경 불가-->
                                        <input class="form-control" type="text" name="res_brn" id="res_brn" readonly="readonly" value="${restaurant.res_brn }">
                                    </div>
                                </td>
                            </tr>
						    <tr>
						    	<!-- 가게이름 변경불가? -->
						    	<th scope="row" width="150"><label for="res_name">가게명</label></th>
						    	<td><input class="form-control" type="text" name="res_name" id="res_name" readonly="readonly" value="${restaurant.res_name}"></td>
						    </tr>
                            <tr>
                            	<!-- 너무 빠르게 입력할 경우 인식불가 -->
                                <th scope="row"><label for="res_tel">전화번호</label></th>
                                <td>
                                      <div class="d-flex align-items-center">
                                        <input class="form-control" type="text" name="res_tel" id="res_tel" value="${restaurant.res_tel}" maxlength="13" placeholder="'-'빼고 숫자만 입력">
                                    </div>
                                </td>
                            </tr>
						    <tr>
                                <th><label for="button-addon2">주소</th>
								<td>
								<!-- 다음 api 사용 -->
								<div class="input-group mb-3">
									<input type="text" id="postcode" name="res_postcode"class="form-control" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="button-addon2" value="${restaurant.res_postcode}">
									<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-outline-secondary" id="button-addon2">
								</div>									
                                <input type="text" class="form-control" id="address" name="res_address" placeholder="주소" readonly value="${restaurant.res_address}">
								<div class="input-group mb-3 mt-2">
                                    <input type="text" class="form-control" id="detailAddress" name="res_detailAddress" placeholder="상세주소" value="${restaurant.res_detailAddress}"> 
									<input type="text" class="form-control" id="extraAddress" placeholder="참고항목">
								</div>
								<!-- 우편번호 선택시(주소까지만 입력) 지도 표시 -->
								<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
								</td>
						    </tr>
						    <!-- 영업 시간 시작 -->
						    <tr>
                                <th scope="row"><label for="res_open1">영업시간</label></th>
						    	<td>
	                                <div class="row">
	                                    <div class="col-6">
	                                    	<!-- 영업 시작 시간 -->
	                                        <input class="form-control timepicker" id="timepicker_open" type="text" name="res_open" value="${restaurant.res_open}"> 
	                                    </div>
	                                    <div class="col-6">
	                                   		 <!-- 영업 마감 시간 -->
	                                        <input class="form-control timepicker" id="timepicker_close" type="text" name="res_close" value="${restaurant.res_close}"> 
	                                    </div>
	
	                                </div>
	                                
	                                <!-- 영업시간 24시간으로 표시하는 jQuery -->
	                                <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	                                <script type="text/javascript">
		                                $(document).ready(function () {
			                                $('input.timepicker').timepicker({
			                                    timeFormat: 'HH:mm',
			                                    interval: 60, // 시간 간격
			                                    minTime: '09', // 최소 시간
			                                    maxTime: '22:00', // 최대 시간
			                                    defaultTime: '09', // 기본값
// 			                                    startTime: '09:00', // 시작시간
			                                    dynamic: true,
			                                    dropdown: true,
			                                    scrollbar: true
			                                });
			                                
// 			                                $('#timepicker_open').on('change', function() {
// 			                                  $('#res_open').val($(this).val() + ":00");
// 			                                });
			                                
		                                }); 
	                                </script>
                            	</td>
						    </tr>
						    <tr>
                                <th scope="row">브레이크타임</th> <!-- select box -->
                                <td>
                                	<div class="row">
	                               	   <div class="col-2">
	                                	  <input type="checkbox" id="nobreak"> 없음
	                                   </div>
	                               	   <div class="col-5">
	                                       <input class="form-control timepicker2" type ="text" name="res_breakstart" id="res_breakstart" value="${restaurant.res_breakstart}"> <!-- 브레이크 타임 시작 시간 -->
	                                   </div>
	                                   <div class="col-5">
	                                       <input class="form-control timepicker2" type ="text" name="res_breakend" id="res_breakend" value="${restaurant.res_breakend}"> <!-- 브레이크 타임 시작 시간 -->
	                                   </div>
                                    </div>
                                </td>
	 	                            <!-- 브레이크타임 24시간으로 표시하는 jQuery -->
	                                <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	                                <script type="text/javascript">
		                                $(document).ready(function () {
			                                $('input.timepicker2').timepicker({
			                                    timeFormat: 'HH:mm',
			                                    interval: 60, // 시간 간격
			                                    minTime: '09', // 최소 시간
			                                    maxTime: '22:00', // 최대 시간
// 			                                    defaultTime: '09', // 기본값
// 			                                    startTime: '09:00', // 시작시간
			                                    dynamic: true,
			                                    dropdown: true,
			                                    scrollbar: true
			                                });
			                                
			                                // 체크 박스 선택시 브레이크타임 시간 null값으로 변경, disabled 상태로 바꿔주기
			                                $("#nobreak").change(function() {
			                                    var isChecked = $(this).is(":checked");
			                                    $("#res_breakstart, #res_breakend").prop("disabled", isChecked).val(isChecked ? "" : null);
			                                });
		                                });   
	                                </script>
                                
                            </tr>
						    <!-- 영업 시간 끝 -->
						    <tr>
                                <th scope="row">정기휴무일</th> <!-- select box -->
						    	<td>
                                    <div class="dropdown">
                                        <select name="res_holiday" class="form-select form-select" aria-label=".form-select example" style="width: 180px;">
											<option value="없음" <c:if test="${restaurant.res_holiday eq '없음' }">selected</c:if>>없음</option>
											<option value="월요일" <c:if test="${restaurant.res_holiday eq '월요일' }">selected</c:if>>월요일</option>
											<option value="화요일" <c:if test="${restaurant.res_holiday eq '화요일' }">selected</c:if>>화요일</option>
											<option value="수요일" <c:if test="${restaurant.res_holiday eq '수요일' }">selected</c:if>>수요일</option>
											<option value="목요일" <c:if test="${restaurant.res_holiday eq '목요일' }">selected</c:if>>목요일</option>
											<option value="금요일" <c:if test="${restaurant.res_holiday eq '금요일' }">selected</c:if>>금요일</option>
											<option value="토요일" <c:if test="${restaurant.res_holiday eq '토요일' }">selected</c:if>>토요일</option>
											<option value="일요일" <c:if test="${restaurant.res_holiday eq '일요일' }">selected</c:if>>일요일</option>
										</select>
									</div>
                                </td>
						    </tr>
						    <tr>
                                <th scope="row">가게 편의 시설</th>
						    	<td>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity" value="단체석"
									  <c:if test="${fn:contains(restaurant.res_amenity, '단체석')}">checked</c:if>>
									  <label class="form-check-label" for="amenity">
									    단체석
									  </label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity2" value="주차"
									  <c:if test="${fn:contains(restaurant.res_amenity, '주차')}">checked</c:if>>
									  <label class="form-check-label" for="amenity2">
									    주차
									  </label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity3" value="발렛파킹"
									  <c:if test="${fn:contains(restaurant.res_amenity, '발렛파킹')}">checked</c:if>>
									  <label class="form-check-label" for="amenity3">
									    발렛파킹
									  </label> <br>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity4" value="예약"
									  <c:if test="${fn:contains(restaurant.res_amenity, '예약')}">checked</c:if>>
									  <label class="form-check-label" for="amenity4">
									    예약
									  </label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity5" value="반려동물 동반"
									  <c:if test="${fn:contains(restaurant.res_amenity, '반려동물 동반')}">checked</c:if>>
									  <label class="form-check-label" for="amenity5">
									    반려동물 동반
									  </label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity6" value="장애인 편의시설"
									  <c:if test="${fn:contains(restaurant.res_amenity, '장애인 편의시설')}">checked</c:if>>
									  <label class="form-check-label" for="amenity6">
									    장애인 편의시설
									  </label>
						    	</td>
						    </tr>
						    <tr>
                                <th scope="row"><label for="res_menu">메뉴</label></th>
						    	<td>
						    		<button type="button" id="res_menu" class="btn btn-warning" style="color: white;"  data-bs-toggle="modal" data-bs-target="#menu">메뉴 추가</button>
							 		<div class="row mt-3 align-items-center">
							            <table class="table">
							                <thead>
							                  <tr>
							                    <th scope="col" class="col-5">메뉴 이름</th>
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
								                    <button type="button" class="btn btn-warning text-white me-1" data-bs-toggle="modal" data-bs-target="#menuPro">수정</button>
								                    <button class="btn btn-warning text-white">삭제</button>
							                    </td>
							                  </tr>
							                  <tr>
							                    <td scope="row">또루뀨막또</td>
							                    <td>38000</td>
							                    <td>
								                    <button type="button" class="btn btn-warning text-white me-1" data-bs-toggle="modal" data-bs-target="#menuPro">수정</button>
								                    <button class="btn btn-warning text-white">삭제</button>
							                    </td>
							                  </tr>
							                </tbody>
							              </table>
							          </div>						    		
						    	</td>
						    </tr>
						    <tr>
                                <th scope="row"><label for="birth">가게사진</label></th>
						    	<td><input type="file" name="res_photo" class="form-control" style="color: white;" value="${restaurant.res_photo}" ></td>
						    </tr>
                            <tr>
                                <th scope="row"><label for="res_intro">가게소개</label></th>
                                <td colspan="2"><textarea class="form-control" rows="5" cols="50" name="res_intro" id="res_intro" >${restaurant.res_intro}</textarea></td>
                            </tr>
						  </tbody>
                	</table>
					<div style="margin-left:380px;">
					    <button type="submit" class="btn btn-warning" style="color: white;">가게수정</button>
					</div>
	
					
                </form>	
			  </div>
            </div>
<!-- 다음 api -->   
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=001f863eaaba2072ed70014e7f424f2f&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
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
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<!-- 다음 api -->        
		</div>
        <!-- 가게내용 페이지 끝 -->
		  

		  


<!-- 메뉴 추가 모달창 -->
<div class="modal fade" id="menu" tabindex="-1" aria-labelledby="menu" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="menu">메뉴 추가</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
		<!-- 메뉴 추가 내용 시작 -->
		<form action="menuInsert" method="post">
	        <div class="modal-body">
			         <div class="container d-flex justify-content-center p-3 modal-content border-0">
							<table>
								<tr>
									<th>메뉴 이름</th>
									<td><input type="text" class="form-control" name="menu_name"></td>
								</tr>
								<tr>
									<th>메뉴 가격</th>
									<td><input type="text" pattern="" class="form-control" name="menu_price" placeholder="숫자만 입력"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
								</tr>
								<tr>
									<th>메뉴 설명</th>
									<td><textarea rows="5" cols="30" class="form-control" name="menu_intro"></textarea></td>
								</tr>
								<tr>
									<th>메뉴 사진</th>
									<td><input type="file" name="menu_photo" class="form-control" multiple="multiple"></td>
								</tr>
							</table>
					</div>
		   </div>
			<!-- 메뉴 추가 내용 끝 -->
    	   <div class="modal-footer">
            <button type="submit" class="btn btn-warning" id="storeMenuInsert" style="color: white;">추가</button>
          	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
       	   </div>
		</form>
      </div>
    </div>
</div>
<!-- 메뉴 추가 모달창 -->

<!-- 메뉴 수정 모달창 -->
<div class="modal fade" id="menuPro" tabindex="-1" aria-labelledby="menuPro" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="menu">메뉴 수정</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
		<!-- 메뉴 수정 내용 시작 -->
        <div class="modal-body">
	         <div class="container d-flex justify-content-center p-3 modal-content border-0">
				<form action="#" method="get">
					<table>
						<tr>
							<th>메뉴 이름</th>
							<td><input type="text" class="form-control"></td>
						</tr>
						<tr>
							<th>메뉴 가격</th>
							<td>
								<input type="text" class="form-control" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
							</td>
						</tr>
						<tr>
							<th>메뉴 설명</th>
							<td><textarea rows="5" cols="30" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>메뉴 사진</th>
							<td><input type="file" class="form-control" multiple="multiple"></td>
						</tr>
					</table>
				</form>
			</div>
        </div>
		<!-- 메뉴 수정 내용 끝 -->
        <div class="modal-footer">
            <button type="submit" class="btn btn-warning" id="storeMenuInsert" style="color: white;" >수정</button>
          	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
</div>
<!-- 메뉴 수정 모달창 -->


    
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 