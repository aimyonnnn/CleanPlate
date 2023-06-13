<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--아임포트 라이브러리--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
	<h1>주문 페이지 테스트용</h1>
	<button onclick="requestPay()">결제하기</button>
	
	
	<script>
	var IMP = window.IMP;
	IMP.init("imp30787507"); // 예: imp00000000
	
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "Clpt_" + "now()",
          name: "레스토랑 예약",
          amount: 348000,
          buyer_email: "hong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-1234-5678",
          buyer_addr: "부산광역시 부산진구 부전동",
          buyer_postcode: "01181"
      }, function (rsp) {
    	    console.log(rsp);
    	    if (rsp.success) {
    	      var msg = '결제가 완료되었습니다.';
    	      alert(msg);
    	      location.href = "결제 완료 후 이동할 페이지 url"
    	    } else {
    	      var msg = '결제에 실패하였습니다.';
    	      msg += '에러내용 : ' + rsp.error_msg;
    	      alert(msg);
    	    }
    	  });
    }
  </script>
</body>
</html>