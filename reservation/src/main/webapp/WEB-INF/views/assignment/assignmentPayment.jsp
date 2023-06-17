<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- AOS 라이브러리 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    
	<!-- iamport -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<!-- 채널톡 API 시작 -->
	<script>
	  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	
	  ChannelIO('boot', {
	    "pluginKey": "1389a4f2-b052-41e3-8f07-442396576322"
	  });
	</script>
	<!-- 채널톡 API 끝 -->
	
    <!-- jQuery CDN -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    
 	<style>
		body {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
			background-color: #f1f1f1;
		}

		.container {
			width: 450px;
			padding: 20px;
			border: 1px solid #ccc;
			border-radius: 5px;
			font-family: Arial, sans-serif;
			background-color: #ffffff;
		}

		h3 {
			text-align: center;
		}

		table {
			width: 100%;
		}

		th, td {
			padding: 10px;
		}

		.form-control {
			width: 100%;
			padding: 5px;
			border-radius: 5px;
			border: 1px solid #ccc;
		}

		button {
			display: block;
			margin: 0 auto;
			padding: 10px 20px;
			border-radius: 5px;
			border: none;
			background-color: #4CAF50;
			color: white;
			font-size: 16px;
			cursor: pointer;
		}

		button:hover {
			background-color: #45a049;
		}

		button:disabled {
			background-color: #cccccc;
			cursor: not-allowed;
		}
	</style>
</head>
<body style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(${pageContext.request.contextPath }/resources/images/1.jpg); background-size: cover;">
  
  <div class="container" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
		<h3>주문자 정보</h3>
		<form action="#" method="post">
			<table>
				<tbody>
					<tr>
						<th scope="row" width="150"><label for="companyName">결제처</label></th>
						<td><input class="form-control" type="text" name="#" aria-label="default input example" value="Clean Plate" readonly="readonly" disabled="disabled"></td>
						<td><input class="form-control" type="hidden" name="companyName" aria-label="Disabled input example" value="Clean Plate"></td>
					</tr>
					<tr>
						<th scope="row" width="150"><label for="resName">가게명</label></th>
						<td><input class="form-control" type="text" name="#" aria-label="default input example" value="${res_name}" readonly="readonly" disabled="disabled"></td>
						<td><input class="form-control" type="hidden" name="resName" aria-label="Disabled input example" value="${res_name}"></td>
					</tr>
					<tr>
						<th scope="row" width="150"><label for="pay">결제금액</label></th>
						<td><input class="form-control" type="text" name="#" aria-label="default input example" value="${a_price}" readonly="readonly" disabled="disabled"></td>
						<td><input class="form-control" type="hidden" name="a_price" aria-label="Disabled input example" value="${a_price}"></td>
					</tr>
					<tr>
						<th scope="row"><label for="userName">고객명</label></th>
						<td><input class="form-control" type="text" name="#" aria-label="Disabled input example" value="${member.m_name }" readonly="readonly" disabled="disabled"></td>
						<td><input class="form-control" type="hidden" name="m_name" aria-label="Disabled input example" value="${member.m_name }"></td>
					</tr>
         			<tr>
						<th scope="row"><label for="userTel">고객 전화번호</label></th>
						<td><input class="form-control" type="text" name="#" aria-label="Disabled input example" value="${member.m_tel }" readonly="readonly" disabled="disabled"></td>
						<td><input class="form-control" type="hidden" name="m_tel" aria-label="Disabled input example" value="${member.m_tel }"></td>
					</tr>
					<tr>
						<th scope="row"><label for="userEmail">고객 이메일</label></th>
						<td><input class="form-control" type="text" name="#" aria-label="Disabled input example" value="${member.m_email }" readonly="readonly" disabled="disabled"></td>
						<td><input class="form-control" type="hidden" name="m_email" aria-label="Disabled input example" value="${member.m_email }"></td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<div class="d-flex justify-content-center">
			<button id="requestPay" class="btn btn-warning mt-3 me-3 w-100">결제하기</button>
			<button class="btn btn-warning w-100 mt-3" onclick="location.href='assignment'">목록으로</button>
<!-- 			<button id="cancelPay" class="btn btn-warning">결제취소</button> -->
		</div>
		
	</div>
   
   <script>
   
   // 1. 구매자가 결제를 할 때!
   $(()=>{
      
      var IMP = window.IMP;
      IMP.init("imp61372336");
      
       $('#requestPay').on('click', function() {
          IMP.request_pay({
        	pg: "kakopay",
        	pay_method: "card",
            merchant_uid: createOrderNum(), // 주문번호 자동생성
            name: "${res_name}", // 주문명, restaurant -> res_name
            amount: "${a_price}", // 결제금액, assignment -> a_price
            buyer_email: "${buyer_email}", // members -> m_email
            buyer_name: "${buyer_name}", // members -> m_name
            buyer_tel: "${buyer_tel}" // members -> m_tel
          }, 
          
          function(rsp) {
            console.log(rsp);
            
            // ================= 결제 성공 시 =================
            if (rsp.success) {
            	
              alert('결제가 완료되었습니다.');
              alert(JSON.stringify(rsp));
              console.log('결제가 완료되었습니다.');
              	 
			 // ================= DB 업데이트 처리 시작 =================
		     // 1. 예약 테이블의 회원번호를 구매자의 회원번호로 업데이트 및 예약상태 컬럼을 '4-양도' 변경함
			 // => 구매자의 회원번호는 sId 세션값으로 아이디를 조회하여 가져옴
			 // 2. 양도 테이블의 양도상태 컬럼을 '2-거래완료'로 변경
			 // 3. 양도 게시판으로 다시 접속 시 '2-거래완료' 처리된 글은 보이지 않음
			 
	  		 	 var a_sellerId = '${a_sellerId}';
	  		 	 var r_idx = '${r_idx}';
	  		 	 
				 $.ajax({
				    url: '<c:url value="assignUpdate"/>',
				    type: 'POST',
				    data: {
				        a_sellerId: a_sellerId,
				        r_idx: r_idx
				    },
				    dataType: 'json',
				    success: function(response) {
				    	
				    	var result = response.result;
				    	console.log(result);
				    	
				    	if(result  === 1) {
					        alert('예약내역 업데이트 성공!');
					        location.href = '<c:url value="assignment"/>';
					        
				    	}
										        
				    },
				    error: function(xhr, status, error) {
				        console.log('Ajax 오류 발생가 발생했습니다');
				        console.log('상태 코드: ' + xhr.status);
				        console.log('에러 메시지: ' + error);
				    }
				});
	         //================= DB 업데이트 처리 끝 =================
			  
//               location.href = "<c:url value='/'/>";
            
            // ================= 결제 실패 시 =================
            } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용: ' + rsp.error_msg;
              alert(msg);
            }
          });
      });
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
   
  	<!-- AOS 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script> AOS.init();</script> 
   
    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>