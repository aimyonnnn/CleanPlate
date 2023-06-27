<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String sId = (String) session.getAttribute("sId");
    pageContext.setAttribute("sId", sId);
%>
<html>
<head>
  	<!-- AOS 라이브러리 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    
    <!-- jQuery CDN -->
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
	
	<!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
	<!-- CSS -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
	   body {
	        background: #f8f8f8;
	        padding: 60px 0;
	    }
	    
	    .container {
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        height: 100%;
	    }
	    
	    .panel {
	        max-width: 500px;
	        text-align: center;
	        padding: 20px;
	    }
	    
	    .panel-title {
	        font-size: 18px;
	        margin-bottom: 20px;
	        word-break: break-word;
	    }
	</style>
<script>

$(document).ready(function() {
    var sId = '<%= sId %>';
    $("input[name='id']").val(sId);
    $("input[name='id']").attr("readOnly", "readOnly");
});

</script>
	<title>Chat</title>
</head>
<body style="
  background-image:linear-gradient(
  rgba(0, 0, 0, 0.8),
  rgba(0, 0, 0, 0.8)),
  url(${pageContext.request.contextPath }/resources/images/1.jpg); background-size: cover;">
  
	<div class="container" data-aos="fade-up" data-aos-anchor-placement="center-bottom">
		<div class="panel panel-success"  style="background-color: white; border-radius: 10px">
	     	<div class="panel-title">
                <p>
	                Clean Plate는 개인 거래에 어떠한 관여도 하지 않습니다.
	                모든 거래는 사용자 간의 자유로운 합의에 기반하며, 
	                Clean Plate는 거래 내용이나 결과에 대해 어떠한 책임도 지지 않습니다.
	                자세한 내용은 이용 약관을 참고해주시기 바랍니다.
	                채팅방으로 입장하시겠습니까?
                </p>
            </div>
            <div class="panel-body">
<!--                 <form id="login-form" method="get" action="assignAgreePro"> -->
                    <div>
                    	<!-- hidden 태그로 전송 - 양도번호, 회원번호 -->
                        <input type="hidden" name="id" class="form-control" style="text-align: center;">
                        <input type="hidden" name="a_idx" class="form-control" style="text-align: center;">
                        <input type="hidden" name="m_idx" class="form-control" style="text-align: center;">
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-dark mb-1" style="margin-bottom: -10px;"
                        onclick="location.href='<c:url value="assignAgreePro"/>' 
						+ '?r_idx=${param.r_idx}&r_date=${param.r_date}&a_price=${param.a_price}&res_name=${param.res_name}&a_sellerId=${param.a_sellerId}'">동의하기</button>
                    </div>
<!--                 </form> -->
            </div>
        </div>
   	</div>

	<!-- AOS 라이브러리 -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script> AOS.init();</script> 
</body>
</html>
