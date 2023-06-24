<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- iamport -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	 <!-- jQuery CDN -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
	<!-- Sweet Alert 플러그인 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
	<h1>결제 취소 테스트</h1>
	<button id="cancelPay" class="btn btn-warning" onclick="cancelPay()">결제취소</button>
	
	<script>
	function cancelPay() {
		// 필요한 값 변수에 저장
// 		let payment_num = $("#payment_num").val();
// 		let order_num = $("#order_num").val();
// 		let payment_total_price = $("#payment_total_price").val();

		$.ajax({
			url: "payCancel", // {환불정보를 수신할 가맹점 서비스 URL}
			type: "POST",
			data: {
// 			'order_num': order_num, // 생략가능
			'payment_num': "imp_879961221562", // "{결제건의 주문번호}" 예: ORD20180131-0000011
			'payment_total_price': 100, // 2000, 환불금액
			'reason': "테스트 결제 환불" // 환불사유
			},
				success: function(data) {
				// -----------안내 파트(마음대로)---------------
				// 환불 완료 swal창으로 안내
					swal({
					title: "환불 성공!",
					text: "예약이 성공적으로 취소되었습니다.",
					icon: "success",
					button: "확인"}, function() {
					// 환불 완료 후 전 화면으로 이동
					location.href = "myPage";
					});
					// ----------------------------
					},
			error: function(xhr, status, error) {
			swal("환불 실패!" + error);
			}
		});
	} // cancelPay() 끝
	</script>
	
	
	
	
</body>
</html>