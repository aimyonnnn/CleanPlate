<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Clean Plate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"/>
    <!-- 이부분은 지우면 안됩니다 -->
    <!-- datepicker CSS 추가 -->
	<link href="${pageContext.request.contextPath }/resources/css/datepicker.css" rel="stylesheet">
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

	<!-- iamport -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


	<!-- 위로 가기 버튼 -->
   	<button id="go-top"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
	  class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
	  <path fill-rule="evenodd"
	    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
	</svg></button>
	<script>
	var backToTop = () => {
		  // Scroll | button show/hide
		  window.addEventListener('scroll', () => {
		    if (document.querySelector('html').scrollTop > 100) {
		      document.getElementById('go-top').style.display = "block";
		    } else {
		      document.getElementById('go-top').style.display = "none";
		    }
		  });
		  // back to top
		  document.getElementById('go-top').addEventListener('click', () => {
		    window.scrollTo({
		      top: 0,
		      left: 0,
		      behavior: 'smooth'
		    });
		  })
		};
		backToTop();
	</script>
   	<!-- 위로 가기 버튼 -->

	<!-- 예약하기 시작 -->
		<img src="${pageContext.request.contextPath }/resources/images/r_image.jpg" class="d-block w-100" alt="..." style="height: 50%;">
		<div class="container w-100">
			<div class="mt-4">
				<dl>
					<dt>다이닝 공지 및 안내사항</dt>
					<dd class="mt-2">· 좌석 배치는 사전 예약순으로 마감되며, 특정 좌석 지정은 불가능합니다.</dd>
					<dd>· 4인 이상 예약의 경우 두 테이블로 나눠 안내될 수 있으신 점 양해 부탁드리겠습니다.</dd>
					<dd>· 백일, 돌잔치, 칠순 등의 가족연회 또는 7인(영유아 포함) 이상 예약 건 문의 시 유선으로 연락해 주세요.</dd>
					<dd>· 베이비 체어 필요 시 요청사항에 기재해 주세요.</dd>
					<dd>· 특정 음식에 대한 알레르기가 있는 경우 요청 사항에 기재해 주세요.</dd>
					<dd>· 외부 음식 반입은 제한됩니다.</dd>
				</dl>
			</div>
		<!-- 날짜 및 인원 선택 버튼 -->
		<div>
			<div>
				<h2 class="fw-bold mt-5 mb-2">날짜 & 인원 선택</h2>
				<hr>
				<dl class="row fs-3 mt-6">
					<dt class="col-sm-3">인원</dt>
					<dd class="col-sm-9">
						<button id="minusButton" type="button" class="btn btn-outline-warning rounded-circle" onclick="count('minus')" value="-" style="width: 39px;">-</button>						
							<b id='countResult' style="padding: 20px;">1</b>
						<button id="plusButton" type="button" class="btn btn-outline-warning rounded-circle" onclick="count('plus')" value="+" >+</button>
					</dd>
				</dl>
			</div>
			
			<script>
			var countResultValue = 1; // 초기값 설정

			window.addEventListener('DOMContentLoaded', function() {
			  var minusButton = document.getElementById('minusButton');
			  var plusButton = document.getElementById('plusButton');

			  minusButton.addEventListener('click', function() {
			    var countResultElement = document.getElementById('countResult');
			    countResultValue = parseInt(countResultElement.innerText); // 최종값 업데이트
			    countResultValue--;
			    countResultElement.innerText = countResultValue;
			    sendFinalValue(countResultValue); // 변한 최종값을 함수의 파라미터로 보냄
			  });

			  plusButton.addEventListener('click', function() {
			    var countResultElement = document.getElementById('countResult');
			    countResultValue = parseInt(countResultElement.innerText); // 최종값 업데이트
			    countResultValue++;
			    countResultElement.innerText = countResultValue;
			    sendFinalValue(countResultValue); // 변한 최종값을 함수의 파라미터로 보냄
			  });

			  console.log(countResultValue);
			});

			function sendFinalValue(value) {
			  // 여기서 value를 이용하여 외부로 최종값을 보낼 수 있습니다.
// 			  console.log('최종값:', value);
			  // 추가적인 작업 수행 가능
			}
			</script>	
			
			<!-- 인원 선택 스크립트 -->
			<script>
			function count(type) {
			  // 결과를 표시할 element
			  const resultElement = document.getElementById('countResult');
			  // 현재 화면에 표시된 값
			  let number = parseInt(resultElement.innerText);
			  // 더하기/빼기
			  if (type === 'plus') {
			    number += 1;
			  } else if (type === 'minus') {
			    number -= 1;
			  }
			  // 기본값이 1로 설정 
			  if (number < 1) {
			    number = 1;
			  }
			  // 결과 출력
			  resultElement.innerText = number;
			
			  // 1 이하일 경우 마이너스 버튼 비활성화
			  const minusButton = document.querySelector(`button[value="-"][onclick="count('minus')"]`);
			  if (number === 1) {
			    minusButton.disabled = true;
			  } else {
			    minusButton.disabled = false;
			  }
			  
			  // 인원 -> 날짜 -> 시간 순으로 선택 후 다시 인원만 선택 못하게 버튼 숨김 (실시간 처리를 위해) 
			  hideTimeButtons();
			  
			}
			
			function hideTimeButtons() {
			  $('.time-buttons').css('display', 'none');
			}
			
			</script>
			<!-- 인원 선택 스크립트 -->
			
			<!-- datepicker -->
			<div class="row">
		    <div class="col-md-6">
		        <div class="datepicker"></div>
		    </div>
		    <div class="col-md-6">
		        <div style="margin-top: 110px;">
		            <div class="time-buttons" style="display: none;">
		                <div class="row w-100">
		                    <div class="col">
		                    	<div id="lunchArea">
			                        <div class="d-block p-2 text-bg-light" id="lunchButtons">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="var(--bs-dark)" class="bi bi-award-fill" viewBox="0 0 16 16">
										  <path d="m8 0 1.669.864 1.858.282.842 1.68 1.337 1.32L13.4 6l.306 1.854-1.337 1.32-.842 1.68-1.858.282L8 12l-1.669-.864-1.858-.282-.842-1.68-1.337-1.32L2.6 6l-.306-1.854 1.337-1.32.842-1.68L6.331.864 8 0z"/>
										  <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
										</svg>
										<strong style="margin-right: 35px;">LUNCH</strong>
										<c:forEach items="${timeList}" var="time">
								        <c:set var="hour" value="${fn:substring(time.t_time, 0, 2)}"/>
								        <c:set var="minute" value="${fn:substring(time.t_time, 3, 5)}"/>
									        <c:if test="${hour >= 11 && hour < 17}">
									            <input type="hidden" id="price1" value="${menuList[0].me_price}" />
									            <input type="hidden" id="menuName1" value="${menuList[0].me_name}" />
									            <button class="btn btn-outline-dark rounded-0" onclick="selectTime(this)" style="margin-left: 25px; margin-right: 25px;">${hour}:${minute}</button>
									        </c:if>
	    								</c:forEach>
			                    	</div>
								</div>
							<div class="col">
								<div id="dinnerArea">
	                        		<div class="d-block p-2 mt-4 text-bg-light" id="dinnerButtons">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="var(--bs-dark)" class="bi bi-award-fill" viewBox="0 0 16 16">
										  <path d="m8 0 1.669.864 1.858.282.842 1.68 1.337 1.32L13.4 6l.306 1.854-1.337 1.32-.842 1.68-1.858.282L8 12l-1.669-.864-1.858-.282-.842-1.68-1.337-1.32L2.6 6l-.306-1.854 1.337-1.32.842-1.68L6.331.864 8 0z"/>
										  <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
										</svg>
										<strong style="margin-right: 30px;">DINNER</strong>
										<c:forEach items="${timeList}" var="time">
								        <c:set var="hour" value="${fn:substring(time.t_time, 0, 2)}"/>
								        <c:set var="minute" value="${fn:substring(time.t_time, 3, 5)}"/>
									        <c:if test="${hour >= 17 && hour <= 23}">
									            <input type="hidden" id="price2" value="${menuList[1].me_price}" />
									            <input type="hidden" id="menuName2" value="${menuList[1].me_name}" />
									            <button class="btn btn-outline-dark rounded-0" onclick="selectTime(this)" style="margin-left: 25px; margin-right: 25px;">${hour}:${minute}</button>
									        </c:if>
								   		</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>		
				</div>
				</div>
			</div>
		</div>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
			<script>
			$(document).ready(function() {
				// 예약이 꽉 찬 날짜 데이터를 얻어온다고 가정하고, 아래 배열에 해당 날짜를 추가함
			    var fullyBookedDates = ['2023-06-20', '2023-06-22', '2023-06-25'];
			    
				// 휴무일 숫자를 가져옴
				var dayOff = ${restaurant.res_dayoff};
				
				function isDayOff(date) {
					return date.getDay() === dayOff;
				}
				
				function isFullyBooked(date) {
					var dateString = $.datepicker.formatDate('yy-mm-dd', date);
					return fullyBookedDates.includes(dateString);
				}
				
				function disableDates(date) {
					return [!(isDayOff(date) || isFullyBooked(date))];
				}
				$(".datepicker").datepicker({
					dateFormat: 'yy-mm-dd'
					,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
					,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
					,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
					,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
					,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,maxDate: "+6M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
					,beforeShowDay: disableDates
					,onSelect: function(date) {
				        // 날짜 선택 시 실행되는 런치/디너 선택 함수 
      					sendReservationData();
				    }
			    });
			
			    // 초기값을 오늘 날짜로 설정
			    $(".datepicker").datepicker("setDate", new Date());
			});
			<!-- datepicker 끝 -->
			
			<!-- 선택한 날짜&인원을 실시간으로 조회할 ajax -->
			function sendReservationData() {
			  var countResult = parseInt(document.getElementById('countResult').innerText);
			  var r_date = $('.datepicker').val();
			  var res_idx = getUrlParameter('res_idx');

			  $.ajax({
			    url: '<c:url value="/SelectedReservationInfo"/>',
			    method: 'POST',
			    data: {
			      selectedCount: countResult,
			      r_date: r_date,
			      res_idx: res_idx
			    },
			    success: function(response) {
					// 선택한 날짜를 예약일에 자동 작성
					$('#r_date').val(r_date + " ");
					
					// 날짜를 선택하면 time-buttons를 표시
					$('.time-buttons').css('display', 'flex');
					
					// ajax로 실시간 조회 후 버튼 표시 
					console.log(response.showLunchTimeButtons);
					console.log(response.showDinnerTimeButtons);

					// 런치에 예약 가능할 때
					if(response.showLunchTimeButtons) {
					 $("#lunchArea").show();
					} else {
					  $("#lunchArea").hide();
					}
	
				    // 디너에 예약 가능할 때
					if(response.showDinnerTimeButtons) {
					  $("#dinnerArea").show();
					} else {
					  $("#dinnerArea").hide();
					}
			    
			    },
			    error: function(error) {
			      console.error(error);
			    }
			  });
			}

			// URL에서 파라미터 값을 가져오는 함수
			function getUrlParameter(name) {
			  name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
			  var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
			  var results = regex.exec(location.search);
			  return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
			}
			<!-- 선택한 날짜&인원을 실시간으로 조회할 ajax 끝 -->

			<!-- 시간 선택 시 자동 입력 -->
			function selectTime(button) {
			    const selectedTime = button.innerText; // 시간
			    const currentValue = $('#r_date').val(); // 기존에 적혀져 있는 날짜
			    const date = currentValue.split(' ')[0]; // 날짜 부분만 가져옴
			    const newDateAndTime = date + ' ' + selectedTime; // 병합된 날짜와 선택한 시간으로 새로운 문자열 생성

			    // 예약 시간에 시간 자동 입력
			    $('#r_date').val(newDateAndTime);

			    // 가격 계산 및 출력
			    const hour = parseInt(selectedTime.split(':')[0], 10);
			    const numberOfPeople = parseInt(document.getElementById('countResult').innerText);
			    const price = (hour >= 11 && hour <= 16) ? document.getElementById('price1').value
			                                             : document.getElementById('price2').value;
			    var menuName = (hour >= 11 && hour <= 16) ? document.getElementById('menuName1').value
			    										: document.getElementById('menuName2').value;
			    const totalPrice = price * numberOfPeople;
			    document.getElementById("totalResult").innerText = totalPrice + '원';
			    document.getElementById("menuResult").innerText = menuName + " x " + numberOfPeople + "명";
			}
			</script>
			
			
			<!-- 예약자 정보 입력 -->
			<div>
				<h2 class="fw-bold mt-5 mb-2">예약자 정보 입력</h2>
				<hr>
				<form class="row g-3 needs-validation" action="reservationPayment" novalidate>
					<div class="input-container">
						<div class="col-md-6">
							<label for="r_name" class="form-label fw-bold fs-4">이름</label>
							<input type="text" class="form-control" id="r_name" maxlength="13" pattern="^[가-힣a-zA-Z]+$" value="${memberInfo.m_name}" required>
							<div class="invalid-feedback">
								이름은 한글 또는 영문으로만 입력하세요. 
							</div>
						</div>
					</div>
					<div class="input-container">
						<div class="col-md-6">
							<label for="r_date" class="form-label fw-bold fs-4">예약일</label>
							<input type="text" class="form-control" id="r_date" value="" readonly>
						</div>
					</div>
					<div class="input-container">
						<div class="col-md-6">
							<label for="r_tel" class="form-label fw-bold fs-4">전화번호</label>
							<input type="text" class="form-control" id="r_tel" placeholder="'-'빼고 숫자만 입력" maxlength="13" pattern="^[0-9]+$" value="${memberInfo.m_tel}" required>
							<div class="invalid-feedback">
								전화번호를 숫자만 입력해주세요.
							</div>
						</div>
					</div>
					<div class="input-container">
						<div class="col-md-6">
							<label for="r_email" class="form-label fw-bold fs-4">이메일</label>
							<input type="text" class="form-control" id="r_email" placeholder="xxx@xxxx.xxx 형식으로 입력" pattern="^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" value="${memberInfo.m_email}" required>
							<div class="invalid-feedback">
								이메일을 입력해주세요.
							</div>
						</div>
					</div>
					<div class="input-container">
						<div class="col-md-6">
							<label for="r_request" class="form-label fw-bold fs-4">요청사항</label>
							<textarea cols="20" rows="5" class="form-control" id="r_request"></textarea>
							<div>
								※ 요청사항은 업장 사정에 따라 제공이 불가능할 수 있으며 보장되는 항목이 아닙니다. 가능 여부는 방문 시 확인하실 수 있습니다.
							</div>
						</div>
					</div>
					<!-- 약관 시작 -->
           			<div class="cont_division" style="width: 574px;">
             			<span class="terms_agree fw-bold fs-4">약관</span>
             			<div class="agree_box border border-bottom mt-2" style="border-radius: 5px;">
               				<ul class="agree_article" style="margin-top:10px; margin-left: -15px;">
								<li style="list-style-type: none;">
								<div class="InpBox">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="agreeAll">
										<label class="form-check-label" for="agreeAll">
											<strong class="all_agree">전체 동의</strong>
										</label>
									</div>
									<input type="hidden" name="hidden_check_all" id="hidden_check_all">
								</div>
								</li>
							</ul>
							<ul class="agree_article depth2" style="margin-left: -15px;">
								<li style="list-style-type: none;">
								<div class="agree_desc">
								<div class="InpBox">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="agreeCheck" id="agree_rule1" required>
										<label class="form-check-label" for="agree_rule1">
											<span><strong>(필수) 회원 약관에 동의</strong></span>
										</label>
									</div>
								</div>
								</div>
								<a href="#" class="view_indetail" target="_blank">
									<span class="blind">회원 약관 상세보기</span>
								</a>
								</li>
                 				<li style="list-style-type: none;">
                   				<div class="agree_desc">
								<div class="InpBox">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="agreeCheck" id="agree_take1" required>
											<label class="form-check-label" for="agree_take1">
												<span><strong>(필수) 개인정보 수집 및 이용에 동의</strong></span>
											</label>
									</div>
								</div>
								</div>
								<a id="popupClausePrivacyPerson" href="#" class="view_indetail popup_clause_open" target="_blank">
									<span class="blind">개인정보 수집 및 이용에 동의 약관 상세보기</span>
								</a>
                 				</li>
                 				<li style="list-style-type: none;">
                   				<div class="agree_desc">
								<div class="InpBox">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="agreeCheck" id="agree_take1" required>
											<label class="form-check-label" for="agree_take1">
												<span><strong>(필수) 레스토랑 이용약관에 동의</strong></span>
											</label>
									</div>
								</div>
								</div>
								<a id="popupClausePrivacyPerson" href="#" class="view_indetail popup_clause_open" target="_blank">
									<span class="blind">레스토랑 이용약관 상세보기</span>
								</a>
                 				</li>
               				</ul>
						</div>
					</div>
					<!-- 약관 끝 -->
					<!-- 총금액 -->
					<div>
						<span class="form-label fw-bold fs-4">총금액</span>
						<div>
							<p class="mt-2 mb-2" id="menuResult"></p>
					    	<strong class="fs-3 text-danger" id="total Result"></strong>
					    </div>
					</div>
					<!-- 총금액 -->
					<div class="col-12">
						<button class="btn btn-danger mt-2 mb-4" type="submit" style="width: 564px;" id="requestPay">결제하기</button>
					</div>
				</form>
			</div>
			<!-- 예약자 정보 입력 끝 -->
			
			<!--  -->
			<script>
			   $(()=>{
				  
			      var IMP = window.IMP;
			      IMP.init("imp61372336");
			      
			       $('#requestPay').on('click', function(e) {
			    	  
			    	  // submit 버튼의 기본 동작을 막는다.
			    	  e.preventDefault();
			    	  
			    	  var totalResultElement = document.getElementById('totalResult');
		    	      var totalResultValue = totalResultElement.innerText;
		    	      console.log(totalResultValue);

		    	      var countResultElement = document.getElementById('countResult');
		    	      var countResultValue = countResultElement.innerText;
		    	      console.log(countResultValue);

		    	      var r_idx = ${param.res_idx}; // res_idx
		    	      var r_personnel = parseInt(countResultValue); // 인원수 가져오기 (숫자로 변환)
					  	
		    	      
		    	      
				      // 이후 작업 수행
				      console.log(r_personnel);
						 
			          IMP.request_pay({
		        		pg: "kakopay",
		            	pay_method: "card",
		                merchant_uid: createOrderNum(), // 주문번호 자동생성
		                name: "결제테스트",
		                amount: totalResultValue,
		                buyer_email: "${buyer_email}",
		                buyer_name: "${buyer_name}",
		                buyer_tel: "${buyer_tel}"
			          }, 
			          
			          function(rsp) {
			            console.log(rsp);
			            
			            // ================= 결제 성공 시 =================
			            if (rsp.success) {
			            	
			              alert('결제가 완료되었습니다.');
			              alert(JSON.stringify(rsp));
			              console.log('결제가 완료되었습니다.');
			              	 
						 // ================= DB 업데이트 처리 시작 =================
							 
							 
							 
							 
							 
				  		 	 
				         //================= DB 업데이트 처리 끝 =================
						  
			               location.href = "<c:url value='/'/>";
			            
			            // ================= 결제 실패 시 =================
			            } else {
			              var msg = '결제에 실패하였습니다.';
			              msg += '에러내용: ' + rsp.error_msg;
			              alert(msg);
			            }
			          });
			      });
			      //=====================================================================================
			    	  
			   }); // ready
			   
			   
			   // 주문번호 만들기
			   function createOrderNum(){
				   	const date = new Date();
				   	const year = date.getFullYear();
				   	const month = String(date.getMonth() + 1).padStart(2, "0");
				   	const day = String(date.getDate()).padStart(2, "0");
			   	
			   	let orderNum = year + month + day;
			   	for(let i=0;i<10;i++) {
			   		orderNum += Math.floor(Math.random() * 8);	
			   	}
			   		return orderNum;
			   }
			       
			   </script>
			<!--  -->
			
			<script>
			<!-- 체크박스 -->
				$(document).ready(function() {
					$("#agreeAll").click(function() {
						if($("#agreeAll").is(":checked")) $("input[name=agreeCheck]").prop("checked", true);
						else $("input[name=agreeCheck]").prop("checked", false);
					});
	
					$("input[name=agreeCheck]").click(function() {
						var total = $("input[name=agreeCheck]").length;
						var checked = $("input[name=agreeCheck]:checked").length;
	
						if(total != checked) $("#agreeAll").prop("checked", false);
						else $("#agreeAll").prop("checked", true); 
					});
				});
				<!-- 체크박스 -->
				
				<!-- 유효성 검사 스크립트 -->
				(() => {
				  const forms = document.querySelectorAll('.needs-validation')
	
				  Array.from(forms).forEach(form => {
				    form.addEventListener('submit', event => {
				      if (!form.checkValidity()) {
				        event.preventDefault()
				        event.stopPropagation()
				      }
	
				      form.classList.add('was-validated')
				    }, false)
				  })
				})()
			</script>
			<!-- 유효성 검사 스크립트 -->
			
			</div>
		</div>
		<!-- 예약하기 끝 -->
	
	<!-- footer -->
	<footer class="footer">
		<jsp:include page="../common/common_footer.jsp"/>
	</footer>
	<!-- footer -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 