<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <button id="requestPay">결제하기</button>
   <button id="cancelPay">결제취소</button>
   
   <script>
   
   // 1. 구매자가 결제를 할 때!
   $(()=>{
      
      var IMP = window.IMP;
      IMP.init("imp61372336");
     
      
       $('#requestPay').on('click', function() {
          // 결제 요청
          IMP.request_pay({
        	pg: "inicis",
        	pay_method: "card",
            merchant_uid: "${merchant_uid}",
            name: "${goodsname}",
            amount: ${amount},
            buyer_email: "${buyer_email}",
            buyer_name: "${buyer_name}",
            buyer_tel: "${buyer_tel}",
            buyer_addr: "${buyer_addr}"
          }, 
          function(rsp) {
            console.log(rsp);
            
            // 결제 성공 시 
            if (rsp.success) {
              alert('결제가 완료되었습니다.');
              alert(JSON.stringify(rsp));
              console.log('결제가 완료되었습니다.');
              
              
 	          // ================= 2. 결제 정보 검증 ajax요청 시작 ================= 
              $.ajax({
                  headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                  url: "/pay/complete",
                  method: "POST",
                  dataType : "JSON",
                  data: {
                      imp_uid: rsp.imp_uid,
                      merchant_uid: rsp.merchant_uid,
                      //pay_auth_id : pay_auth_id,
                      //goods_id : goods_id,
                  },
                  success: function(data) {
                	  
                	  // ================= 2. 결제 정보 검증 실패 시 ================= 	
                      if(data.result.code!=200){
                          //결제실패(웹서버측 실패)   
                          alert("위조된 결제 시도에 의해 결제에 실패했습니다.");  
                          //removePayAuth(pay_auth_id);// pay_auth 값 지우기
                          
                      // ================= 2. 결제 정보 검증 성공 시 ================= 	    
                      } else {
                          //결제성공(웹서버측 성공)
                          alert("결제에 성공했습니다." + data);
                          
                     
		                       // ================= 3. 부분 환불 ajax 요청 시작 ================= 	       
		                       // 변수 선언
		                       var refundAmount = ${amount}; // 모델에서 환불금액을 읽어옴
		                       var commissionRate = 0.05; // 수수료율 (0.05%)
		                       var commission = refundAmount * (commissionRate / 100); // 수수료 계산
		                       var finalAmount = refundAmount - commission; // 최종 환불금액
		                       
		                       // 전달할 데이터
		                       var cancel_request_amount = finalAmount; // 최종 환불금액
		                       var merchant_uid = "ORD20230616-0000015"; // 결제 uid
		                       
		                      $.ajax({
		                          url: 'https://api.iamport.kr/payments/cancel',
// 		                          url: '<c:url value="assignCancle"/>',
		                          type: 'POST',
		            //               contentType: 'application/json',
		            			  headers: {
							           Authorization: accessToken, // 아임포트 서버로부터 발급받은 엑세스 토큰
					        	  },	
		                          data: {
		                               merchant_uid: merchant_uid, // 결제 uid
		                               cancel_request_amount: finalAmount, // 환불금액
		                               reason: '테스트 결제 환불'
		                          },
		                          dataType: 'json',
		                          success: function(response) {
		                             
		                            console.log(JSON.stringify(response));
		                            console.log('환불 요청이 성공적으로 처리되었습니다.');
		                            alert('환불 요청이 성공적으로 처리되었습니다.');
		                            
		                            //
		                            location.href = "reservationResult";
		                            
		                          },
		                          error: function(xhr, status, error) {
		                            console.log('환불 요청을 처리하는 중 오류가 발생했습니다.');
		                            console.log('상태 코드: ' + xhr.status);
		                            console.log('에러 메시지: ' + error);
		                          }
		                          
		                     }); // ajax    
	                         // ================= 3. 부분 환불 ajax 요청 시작 =================  
                         
                          
                      }
                  },
                  error: function(data) {
                      console.log("error" +data);
                  }
              });
           // ================= 2. 결제 정보 검증 ajax요청 끝 ================= 
              
            
            	  
            	  
              
//               location.href = "reservationResult";
            
            // ================= 결제 실패 시 ================= 
            } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용: ' + rsp.error_msg;
              alert(msg);
            }
            
          });
      });
       
   }); // ready
   
	// 현재 사용자의 정보를 가져오는 함수
	   function getCurrentUserInfo() {
	       $.ajax({
	           headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
	           url: "/users/getCurrentUser",
	           type: "get",
	           async:false, // 동기방식(전역변수에 값 저장하려면 필요)
	           dataType : "json",
	           success : function(data) {
	               buyer_name = data.name;
	               buyer_tel = data.tel;
	           },
	           error: function(request,status,error){ 
	               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
	               console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	           }
	       });
	   }
   
   
   
//     var refundAmount = ${amount}; // 모델에서 환불금액을 읽어옴
//     var commissionRate = 0.05; // 수수료율 (0.05%)

//     var commission = refundAmount * (commissionRate / 100); // 수수료 계산
//     var finalAmount = refundAmount - commission; // 최종 환불금액

//     // 환불 요청에 사용할 변수들
//     var merchant_uid = "ORD20230615-0000001";
//     var cancel_request_amount = finalAmount;
//     var reason = "테스트 결제 환불";
      
     // 2. 결제 취소
     $(()=>{
        
       $('#cancelPay').on('click', ()=>{
          console.log("cancelPay");
          
//           // 변수 선언
//            var refundAmount = ${amount}; // 모델에서 환불금액을 읽어옴
//            var commissionRate = 0.05; // 수수료율 (0.05%)
//            var commission = refundAmount * (commissionRate / 100); // 수수료 계산
//            var finalAmount = refundAmount - commission; // 최종 환불금액
           
//            // 전달할 데이터
//            var cancel_request_amount = finalAmount; // 최종 환불금액
//           var merchant_uid = "${merchant_uid}"; // 결제 uid
          
//           $.ajax({
// //               url: 'https://api.iamport.kr/payments/cancel',
//               url: '<c:url value="assignCancle"/>',
//               type: 'POST',
// //               contentType: 'application/json',
//               data: {
//                    merchant_uid: merchant_uid, // 결제 uid
//                    cancel_request_amount: finalAmount, // 환불금액
//                    reason: '테스트 결제 환불'
//               },
//               dataType: 'json',
//               success: function(response) {
                 
//                 console.log(JSON.stringify(response));
//                 console.log('환불 요청이 성공적으로 처리되었습니다.');
//                 alert('환불 요청이 성공적으로 처리되었습니다.');
                
//                 //  
                
//               },
//               error: function(xhr, status, error) {
//                 console.log('환불 요청을 처리하는 중 오류가 발생했습니다.');
//                 console.log('상태 코드: ' + xhr.status);
//                 console.log('에러 메시지: ' + error);
//               }
              
//          }); // ajax    
          
       }); // click
       
     }); // readay
     
       
   </script>
</body>
</html>