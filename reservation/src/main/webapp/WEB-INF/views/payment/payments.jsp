<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--결제 라이브러리--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<%-- 결제 취소 라이브러리 --%>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous">
</script>
</head>
<body>
	<h1>주문 페이지 테스트용</h1>
	
	<h3>테스트용 주문 정보 데이터</h3>
	<form action="memberUpdate" method="post">
		<table class="table" style="margin-left: 70px; width: 58%;">
		<tbody>
			<tr>
				<th scope="row" width="150"><label for="resName">가게명</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="default input example" value="${name }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="res_name" aria-label="Disabled input example"  value="${name }"></td>
			</tr>
			<tr>
				<th scope="row" width="150"><label for="goodsName">주문명</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="default input example" value="${goodsname }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="goodsname" aria-label="Disabled input example"  value="${goodsname }"></td>
			</tr>
			<tr>
				<th scope="row" width="150"><label for="merchant_uid">주문번호</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="default input example" value="${merchant_uid }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="merchant_uid" aria-label="Disabled input example"  value="${merchant_uid }"></td>
			</tr>
			<tr>
				<th scope="row" width="150"><label for="pay">결제금액</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="default input example" value="${amount }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="res_name" aria-label="Disabled input example"  value="${amount }"></td>
			</tr>
			<tr>
				<th scope="row"><label for="userName">고객명</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="Disabled input example"  value="${buyer_name }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="m_name" aria-label="Disabled input example"  value="${buyer_name }"></td>
			</tr>
			<tr>
				<th scope="row"><label for="userTel">고객 전화번호</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="Disabled input example"  value="${buyer_tel }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="m_tel" aria-label="Disabled input example"  value="${buyer_tel }"></td>
			</tr>
			<tr>
				<th scope="row"><label for="userAdr">고객 주소</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="Disabled input example"  value="${buyer_addr }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="res_adress" aria-label="Disabled input example"  value="${buyer_addr }"></td>
			</tr>
			<tr>
				<th scope="row"><label for="userEmail">고객 이메일</label></th>
				<td><input class="form-control" type="text" name="#" aria-label="Disabled input example"  value="${buyer_email }" readonly="readonly" disabled="disabled" ></td>
				<td><input class="form-control" type="hidden" name="m_email" aria-label="Disabled input example"  value="${buyer_email }"></td>
			</tr>
				
		</tbody>
		</table>
	</form>
	
	<br>	
	<button onclick="requestPay()">결제하기</button>
	<button onclick="cancelPay()">결제취소</button>
	
	<%-- 결제 스크립트 --%>
	<script>
	var IMP = window.IMP;
	IMP.init("imp30787507"); // 예: imp00000000
	
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "{merchant_uid }",
          name: "${goodsname }",
          amount: ${amount },
          buyer_email: "${buyer_email }",
          buyer_name: "${buyer_name }",
          buyer_tel: "${buyer_tel }",
          buyer_addr: "${buyer_addr }"
      }, function (rsp) {
    	    console.log(rsp);
    	    if (rsp.success) {
    	      var msg = '결제가 완료되었습니다.';
    	      alert(msg);
    	      location.href = "reservationResult"
    	    } else {
    	      var msg = '결제에 실패하였습니다.';
    	      msg += '에러내용 : ' + rsp.error_msg;
    	      alert(msg);
    	    }
    	  });
    }
	<%-- --------------------------------------------------------------------- --%>
	<%-- 결제 취소 스크립트  --%>
	  function cancelPay() {
	    jQuery.ajax({
	      "url": "{https://api.iamport.kr/payments/cancel}", 
	      "type": "POST",
	      "contentType": "application/json",
	      "data": JSON.stringify({
	        "merchant_uid": "{merchant_uid}", // 결제 uid
	        "cancel_request_amount": ${amount}, // 환불금액
	        "reason": "테스트 결제 환불" // 환불사유
	      }),
	      "dataType": "json"
	    });
	  }
	    
	<%-- --------------------------------------------------------------------- --%>
	</script>
</body>
</html>