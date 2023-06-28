<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.test.vo.MenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/ceoList.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
					<button type="button" class="btn btn-outline-dark text-white active p-3" onclick="location.href='restaurantList'">가게리스트 </button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10 mt-4">
                <!-- 가게 수정 페이지 시작 -->
                <!-- 파일 업로드 enctype="multipart/form-data" -->
                   <form action="restaurantUpdate" id="restaurant" method="post" enctype="multipart/form-data">
<!--                    <input type="hidden" name=""> -->
                	<table class="table" style="margin-left: 140px; margin-top: 35px; width: 58%;">
						<tbody>
                            <tr>
                                <th scope="row"><label for="res_brn">사업자 번호</label></th>
                                <td>
                                    <div class="input-group">
		                            	<!-- hidden으로 res_idx 전달 -->
		                            	<input type="hidden" value="${restaurant.res_idx}" name="res_idx">
                                        <!-- 사업자번호 변경 불가-->
                                        <input class="form-control" type="text" name="res_brn" id="res_brn" readonly="readonly" value="${restaurant.res_brn }">
                                    </div>
                                </td>
                            </tr>
						    <tr>
						    	<!-- 가게이름 글자수 제한 100자리 -->
						    	<th scope="row" width="150"><label for="res_name">가게명</label></th>
						    	<td><input class="form-control" type="text" name="res_name" id="res_name" aria-label="default input example" maxlength="100" required value="${restaurant.res_name}"></td>
						    </tr>
                            <tr>
                            	<!-- 너무 빠르게 입력할 경우 인식불가 -->
                                <th scope="row"><label for="res_tel">전화번호</label></th>
                                <td>
                                      <div class="d-flex align-items-center">
                                        <input class="form-control" type="text" name="res_tel" id="res_tel" maxlength="13" placeholder="'-'빼고 숫자만 입력" required value="${restaurant.res_tel}">
                                    </div>
                                </td>
                            </tr>
						    <tr>
                                <th scope="row"><label for="addfind">주소</label></th>
								<td>
								<!-- 다음 api 사용 -->
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="address" name="res_address" placeholder="주소" readonly required value="${restaurant.res_address}">
									<input type="button" onclick="DaumPostcode()" value="주소 찾기" class="btn btn-dark text-white"  id="addfind">
								</div>									
                                
								<div class="input-group mb-3 mt-2">
                                    <input type="text" class="form-control" id="detailAddress" name="res_detailAddress" placeholder="상세주소" value="${restaurant.res_detailAddress}"> 
									<input type="text" class="form-control" id="extraAddress" placeholder="참고항목">
								</div>
								<!-- 불러온 주소로 지도 표시 -->
								<div id="map" style="width:300px; height:300px; margin-top:10px;"></div>
								</td>
						    </tr>
						    <!-- 영업 시간 시작 -->
						    <tr>
                                <th scope="row"><label for="res_open">영업시간</label></th>
						    	<td>
	                                <!-- res_openinghours -->
	                                <div class="row">
	                                    <div class="col-4">
	                                        <input class="form-control timepicker" id="res_open" type="text" name="res_open" value="${fn:split(restaurant.res_openinghours, '-')[0]}" style="text-align: center;"> 
	                                    </div>
	                                    <div class="col-1">
	                                    	<b style="font-size: large;">-</b>
	                                    </div>
	                                    <div class="col-4">
	                                        <input class="form-control timepicker" id="res_close" type="text" name="res_close" style="text-align: center;" value="${fn:split(restaurant.res_openinghours, '-')[1]}"> 
	                                    </div>
	
	                                </div>
                            	</td>
                            	
						    </tr>
						    <tr>
                                <th scope="row">브레이크타임</th>
                                  <td>
                                	<div class="row">
	                                   <!-- res_breaktime -->
	                               	   <div class="col-4">
	                                       <input class="form-control timepicker2" type ="text" name="res_breakstart" id="res_breakstart"
	                                       <c:if test="${empty restaurant.res_breaktime}">disabled</c:if> value="${fn:split(restaurant.res_breaktime, '-')[0]}" style="text-align: center;"> 
	                                   </div>
	                               	   <div class="col-1">
	                                	  <b style="font-size: large;">-</b>
	                                   </div>
	                                   <div class="col-4">
	                                       <input class="form-control timepicker2" type ="text" name="res_breakend" id="res_breakend" 
	                                       <c:if test="${empty restaurant.res_breaktime}">disabled</c:if> value="${fn:split(restaurant.res_breaktime, '-')[1]}" style="text-align: center;"> 
	                                   </div>
	                               	   <div class="col-2">  
	                                	  <input type="checkbox" <c:if test="${empty restaurant.res_breaktime}">checked</c:if> class="form-check-input" id="nobreak" >없음
	                                   </div>
                                    </div>
                                </td>
                            </tr>
	 	                            <!-- 24시간으로 표시하는 jQuery -->
	                                <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	                                <script type="text/javascript">
		                                $(document).ready(function () {
		                                	// 영업시간 
			                                $('input.timepicker').timepicker({ 
			                                    timeFormat: 'HH:mm',
			                                    interval: 30, // 시간 간격
			                                    minTime: '09', // 최소 시간
			                                    maxTime: '22:00', // 최대 시간
// 			                                    defaultTime: '09', // 기본값
			                                    startTime: '09:00', // 시작시간
			                                    dynamic: true,
			                                    dropdown: true,
			                                    scrollbar: true
			                                });
		                                	
		                                	// 브레이크타임
			                                $('input.timepicker2').timepicker({
			                                    timeFormat: 'HH:mm',
			                                    interval: 60, // 시간 간격
			                                    minTime: '09', // 최소 시간
			                                    maxTime: '22:00', // 최대 시간
// 			                                    defaultTime: '09', // 기본값
			                                    startTime: '09:00', // 시작시간
			                                    dynamic: true,
			                                    dropdown: true,
			                                    scrollbar: true
			                                });
			                                
		                                	
		                                	// 기본 checked 상태이므로 브레이크타임 disabled처리
		                                    var isChecked = $("#nobreak").is(":checked");
   											$("#res_breakstart, #res_breakend").prop("disabled", isChecked).val(isChecked ? "" : null);
		                                	
			                                // 없음(체크 박스) 선택시 브레이크타임 시간 null값으로 변경, disabled 상태로 바꿔주기
			                                // 해제시 disabled 상태 해제
			                                $("#nobreak").change(function() {
			                                    var isChecked = $(this).is(":checked");
			                                    $("#res_breakstart, #res_breakend").prop("disabled", isChecked).val(isChecked ? "" : null);
			                                });
			                                

			                                
		                                });   
	                                </script>
                                
						    <tr>
						    	<th scope="row"><label for="res_total_table">총 테이블 수</label></th>
						    	<td>
						    		<input type="text" class="form-control" id="res_total_table" name="res_total_table" placeholder="숫자만 입력" 
						    		onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required value="${restaurant.res_total_table}">
						    	</td>
						    </tr>
						    <tr>
                                <th scope="row">휴무일</th> 
						    	<td>
                                    <div class="dropdown">
                                        <select name="res_dayoff" class="form-select" style="width: 180px;">
											<option value="" <c:if test="${restaurant.res_dayoff eq '없음' }">selected</c:if>>없음</option>
											<option value="1" <c:if test="${restaurant.res_dayoff eq '1' }">selected</c:if>>월요일</option>
											<option value="2" <c:if test="${restaurant.res_dayoff eq '2' }">selected</c:if>>화요일</option>
											<option value="3" <c:if test="${restaurant.res_dayoff eq '3' }">selected</c:if>>수요일</option>
											<option value="4" <c:if test="${restaurant.res_dayoff eq '4' }">selected</c:if>>목요일</option>
											<option value="5" <c:if test="${restaurant.res_dayoff eq '5' }">selected</c:if>>금요일</option>
											<option value="6" <c:if test="${restaurant.res_dayoff eq '6' }">selected</c:if>>토요일</option>
											<option value="7" <c:if test="${restaurant.res_dayoff eq '7' }">selected</c:if>>일요일</option>
										</select>
									</div>
                                </td>
						    </tr>
						    <tr>
                                <th scope="row">편의 시설</th>
						    	<td>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity" value="단체석"
									  <c:if test="${fn:contains(restaurant.res_amenity, '단체석')}">checked</c:if>>
									  <label class="form-check-label" for="amenity">단체석</label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity2" value="주차"
									  <c:if test="${fn:contains(restaurant.res_amenity, '주차')}">checked</c:if>>
									  <label class="form-check-label" for="amenity2">주차</label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity3" value="발렛파킹"
									  <c:if test="${fn:contains(restaurant.res_amenity, '발렛파킹')}">checked</c:if>>
									  <label class="form-check-label" for="amenity3">발렛파킹</label> <br>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity4" value="예약"
									  <c:if test="${fn:contains(restaurant.res_amenity, '예약')}">checked</c:if>>
									  <label class="form-check-label" for="amenity4">예약</label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity5" value="반려동물 동반"
									  <c:if test="${fn:contains(restaurant.res_amenity, '반려동물 동반')}">checked</c:if>>
									  <label class="form-check-label" for="amenity5">반려동물 동반</label>
									  <input class="form-check-input" type="checkbox" name="res_amenity" id="amenity6" value="장애인 편의시설"
									  <c:if test="${fn:contains(restaurant.res_amenity, '장애인 편의시설')}">checked</c:if>>
									  <label class="form-check-label" for="amenity6">장애인 편의시설</label>
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="res_amenity_info">편의시설 설명</label></th>
						    	<td colspan="2"><textarea class="form-control" rows="5" cols="50" name="res_amenity_info" id="res_amenity_info">${restaurant.res_amenity_info}</textarea></td>
						    </tr>
						    <tr>
								<th scope="row"><label for="menu">메뉴</label></th>
						    	<td id="td_menu">
						    		<button type="button" id="menu" class="btn btn-dark" style="color: white;" >메뉴 추가</button><br>
						    		<a style="font-size: small; font-weight: normal;">버튼을 클릭하여 메뉴를 추가해주세요</a><br>
						    		
							 		<div class="row mt-3 align-items-center">
							            <table class="table" id="menuList">
							                <thead>
							                  <tr>
							                    <th scope="col" class="col-4">메뉴 이름</th>
							                    <th scope="col" class="col-4">가격</th>
							                    <th scope="col" class="col-4"></th>
							                  </tr>
							                </thead>
							                <tbody id="menuTable">
							                  <c:forEach items="${menuList }" var="menu">
<%-- 								                  	<input type="hidden" value="${menu.me_name }" name="me_name">				                     --%>
<%-- 								                  	<input type="hidden" value="${menu.me_price }" name="me_price"> --%>
<%-- 								                  	<input type="hidden" value="${menu.me_context }" name="me_context">				                     --%>
<%-- 								                  	<input type="file" value="${menu.me_photo }" name="me_file" style="display:none;"> --%>
								                  <tr>
								                  	<td scope="col" class="col-4">${menu.me_name }</td>
								                  	<td scope="col" class="col-4">${menu.me_price }</td>		
								                  	<td scope="col" class="col-4">
								                  		<button type="button" class="btn btn-dark" style="color: white;" onclick="location.href = 'menuDelete?me_idx=${menu.me_idx }'">삭제</button>
								                  	</td>		
								                  				                    
								                  </tr>
							                  </c:forEach>
							                </tbody>
							              </table>
							          </div>						    		
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row">
						    		<label for="t_time">예약 시간</label>
						    	</th>
						    	<td id="td_Time">
					    			<c:forEach items="${timeList }" var="time">
							    		<div class="d-inline-flex align-items-center">
							    		<!-- 시간은 time으로 저장되어있어서 00:00:00 출력됨 -->
							    		<!-- : 으로 문자열 분리 -->
											<input class="form-control timepicker3" type ="text" name="t_time" id="t_time" 
											style="text-align: center; width: 200px;" value="${fn:split(time.t_time, ':')[0]}:${fn:split(time.t_time, ':')[1]}">
							    		</div>
					    			</c:forEach>
						    		<div class="d-inline-flex align-items-center">
<!-- 										<input class="form-control timepicker3" type ="text" name="t_time" id="t_time" style="text-align: center; width: 200px;" placeholder="클릭하여 시간 선택"> -->
							    		<button type="button" id="t_timeInsert" class="btn btn-dark" style="margin-left: 6px;" >추가</button>
						    		</div>
						    	</td>
						    </tr>
						    <tr>
                                <th scope="row">
                                	가게사진<br>
                                	<a style="font-size: small; font-weight: normal;">(사진 1장 선택 필수)</a>
                                </th>
						    	<td>
						    		<!-- 가게 사진 있을 경우 이미지 보여주고 삭제버튼 -->
						    		<!-- 가게 사진 없을 경우 업로드 버튼 -->
						    		<div class="row">
							    		<c:choose>
							    			<c:when test="${empty restaurant.res_photo1 }">
							    				<div class="col m-1">
										    		<input type="file" name="res_file1" class="form-control" accept="image/*" onchange="checkFileExtension(event)">
							    				</div>
							    			</c:when>
							    			<c:otherwise>
							    				<div class="row m-1">
								    				<div class="col">
									    				<b>파일명 :</b> ${fn:split(restaurant.res_photo1, '_')[1] }<br>
								    				</div>
								    				<div class="col">
									    				<img src="${pageContext.request.contextPath }/resources/upload/${restaurant.res_photo1 }" width="150" height="150">
								    					<input type="file" name="res_file1" style="display: none;">
								    				</div>
								    				<div class="col">
											    		<input type="button" class="btn btn-dark" value="삭제" onclick="location.href='restaurantPhotoDelete?res_idx=' + ${restaurant.res_idx} + '&res_photo1=' + '${restaurant.res_photo1}'">
								    				</div>
							    				</div>
							    			</c:otherwise>
							    		</c:choose>
									</div>
						    		<div class="row">
							    		<c:choose>
							    			<c:when test="${empty restaurant.res_photo2 }">
							    				<div class="col m-1">
										    		<input type="file" name="res_file2" class="form-control" accept="image/*" onchange="checkFileExtension(event)">
							    				</div>
							    			</c:when>
							    			<c:otherwise>
							    				<div class="row m-1">
								    				<div class="col" style="align-content: center;">
									    				<b>파일명 :</b> ${fn:split(restaurant.res_photo2, '_')[1] }<br>
								    				</div>
								    				<div class="col">
									    				<img src="${pageContext.request.contextPath }/resources/upload/${restaurant.res_photo2 }" width="150" height="150">
								    					<input type="file" name="res_file2" style="display: none;">
								    				</div>
								    				<div class="col">
											    		<input type="button" class="btn btn-dark" value="삭제" >
								    				</div>
							    				</div>
							    			</c:otherwise>
							    		</c:choose>
							    	</div>
							    		<c:choose>
							    			<c:when test="${empty restaurant.res_photo3 }">
							    				<div class="col m-1">
										    		<input type="file" name="res_file3" class="form-control" accept="image/*" onchange="checkFileExtension(event)">
							    				</div>
							    			</c:when>
							    			<c:otherwise>
							    				<div class="row m-1">
								    				<div class="col">
									    				<b>파일명 :</b> ${fn:split(restaurant.res_photo3, '_')[1] }<br>
								    				</div>
								    				<div class="col">
									    				<img src="${pageContext.request.contextPath }/resources/upload/${restaurant.res_photo3 }" width="150" height="150">
								    					<input type="file" name="res_file3" style="display: none;">
								    				</div>
								    				<div class="col">
											    		<input type="button" class="btn btn-dark" value="삭제" >
								    				</div>
							    				</div>
							    			</c:otherwise>
							    		</c:choose>
						    	</td> 
						    	 <!-- 이미지 파일만 넣을 수 있도록 하는 자바 스크립트 -->
								 <script>
								    function checkFileExtension(event) {
								      const fileInput = event.target;
								      const file = fileInput.files[0];
								      const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
								
								      const fileName = file.name;
								      const fileExtension = fileName.split('.').pop().toLowerCase();
								
								      if (!allowedExtensions.includes(fileExtension)) {
								        alert('등록이 불가능한 파일입니다.');
								        fileInput.value = '';
								      }
								    }
								 </script>	
						    </tr>
                            <tr>
                                <th scope="row"><label for="res_intro">가게소개</label></th>
                                <td colspan="2"><textarea class="form-control" rows="5" cols="50" name="res_intro" id="res_intro">${restaurant.res_intro}</textarea></td>
                            </tr>
						  </tbody>
                	</table>
					<div style="margin-left: 460px; margin-top: 20px;">
					    <button type="submit" class="btn btn-dark" style="color: white;">수정</button>
					</div>
	
					
                </form>	
			  </div>
            </div>
            
	<!-- 사업자등록번호 공공 api (100회 제한) -->  
    <script>
      $(document).ready(function () {
        $('#verifyBrn').click(function () {
	    	// 현재 '-' 하이픈을 통해 받고 있으므로 숫자만 받게 replace 해줌 
	       	let brn = $('input[id="res_brn"]').val().replace(/-/g, '');
		    var data = {
		      b_no: [brn] // 사업자 번호 
		    };
		
		    $.ajax({
		      url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=s3Z85p5TlpETkm4z6l3yjHc3ZD6sVqtThi2nYJzlNQM2%2BtdbfHkwpnBDVL2IpKLX%2F28l62eGORrVaKGtjKJivA%3D%3D",
		      type: "POST",
		      data: JSON.stringify(data),
		      dataType: "JSON",
		      contentType: "application/json",
		      accept: "application/json",
		      success: function (result) {
		    	  // 받아온 result 상태 판별 
		    	  if(result && result.data[0].b_stt_cd){
		          	const code = result.data[0].b_stt_cd;
		            	if(code === "01"){
		                	alert("인증 성공!");
		                } else if(code === "02" || code === "03"){
		                	alert("휴/폐업한 사업자번호 입니다.");
		                } else if(code === "00"){
		                	alert("등록되지 않은 사업자 등록 번호입니다.");
		                } else {
		                	alert("오류가 발생했습니다.");
		                }
		              } else {
		                alert("번호를 정확하게 입력해주세요.");
		              }
		            },
		            error: function() {
		                alert('존재하지 않는 사업자번호 입니다.');
		            }
		        });
			});
		});
     </script>
    <!-- 사업자등록번호 api 끝 -->
            
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

	// 주소 검색, 지도 표시
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
	
 	// 주소로 좌표를 검색합니다
    geocoder.addressSearch(document.getElementById("address").value, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });   
</script>
<!-- 다음 api -->         
		</div>
<!-- 가게수정 페이지 끝 -->



<script type="text/javascript">

	// 메뉴추가 버튼 클릭시 메뉴등록 폼 생성
	// 테이블 갯수를 세는 변수
	var tableCount = 0;
	$("#menu").on("click", function(event) {
		tableCount++;
	   $("#td_menu").prepend('<table id="menu_table_' + tableCount + '">'
				+ '<tr>'
				+ '<th><label for="me_name">메뉴 이름</label></th>'
				+ '<td>'
				+ '	<select name="me_name" id="me_name" class="form-select">	'									
				+ '			<option value="LUNCH">LUNCH</option>'
				+ '			<option value="DINNER">DINNER</option>'
				+ '	</select>	'									
				+ '</td>'
				+ '</tr>'
				+ '<tr>'
				+ '<th><label for="me_price">메뉴 가격</label></th>'
				+ '<td><input type="text" class="form-control"  name="me_price" id="me_price"'
				+ 'placeholder="숫자만 입력"  onKeyup="this.value=this.value.replace(/[^0-9]/g,\'\');" required></td>'
				+ '</tr>'
				+ '<tr>'
				+ '<th><label for="me_context">메뉴 설명</label></th>'
				+ '<td><textarea rows="5" cols="30" class="form-control" name="me_context" id="me_context"></textarea></td>'
				+ '</tr>'
				+ '<tr>'
				+ '<th><label for="me_photo">메뉴 사진</label></th>'
				+ '<td><input type="file" name="me_file" id="me_photo" class="form-control" ></td>'
				+ '</tr>'
				+ '<tr>'
				+ '<td colspan="2">'
				+ '<div class="d-flex justify-content-end">'
			    + '<button type="button" onclick="hideMenu(' + tableCount + ')" class="btn btn-dark me-2" style="color: white;">추가</button>'
			    + '<button type="button" onclick="deleteMenu(' + tableCount +')" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'
				+ '</div>'
				+ '</td>'
				+ '</tr>'
				+ '</table>');
	});  
	
	// 추가 버튼 클릭시 메뉴등록 폼 숨기기
	// required 처리
	function hideMenu(index) {
		// 
		var meName = $("#menu_table_" + tableCount).find("#me_name").val();
		var mePrice = $("#menu_table_" + tableCount).find("#me_price").val();
		var meContent = $("#menu_table_" + tableCount).find("#me_content").val();
		var mePhoto = $("#menu_table_" + tableCount).find("#me_photo").val();
		
// 		alert(typeof(meName));
// 		alert("메뉴 이름: " + meName + ", 메뉴 가격: " + mePrice);
		
		if(meName === "" || mePrice === "" || meContent === "" || mePhoto === "") { // 메뉴이름이나 메뉴가격이 널스트링일 경우(입력하지 않았을 경우)
			alert('모두 입력해주세요');
		} else {
			alert('메뉴가 등록되었습니다'); 
			// 추가 버튼 클릭시 메뉴등록 폼 숨기기
			$("#menu_table_" + index).hide();
			// 메뉴이름, 가격 출력
			$("#menuTable").append("<tr><td scope='col' class='col-5'>" + meName + "</td><td scope='col' class='col-3'>" + mePrice + "</td></tr>");
			
		}
		
	}
	// 닫기 버튼 클릭시 메뉴등록 테이블 삭제
	function deleteMenu(index) {
		$("#menu_table_" + index).remove();
	}
	
	// 예약 시간 timepicker
	$(document).on('focus', 'input.timepicker3', function() {
		  $(this).timepicker({
		      timeFormat: 'HH:mm',
		      interval: 30, // 시간 간격
		      minTime: '11:00', // 최소 시간
		      maxTime: '22:00', // 최대 시간
		      defaultTime: '11:00', // 기본값
// 		      startTime: '11:00', // 시작시간
		      dynamic: true,
		      dropdown: true,
		      scrollbar: true
		  });
	});
	
	// 추가 버튼 클릭시 예약시간을 입력받는 input태그 생성
	$("#t_timeInsert").on("click", function(event) {
		$("#td_Time").append("<input class='form-control timepicker3' type ='text' name='t_time' id='t_time' style='text-align: center; width: 200px;' placeholder='클릭하여 시간 선택''>");
	}); 


</script>
    
    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
	<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 
