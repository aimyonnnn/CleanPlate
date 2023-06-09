<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String sId = (String) session.getAttribute("sId");
    pageContext.setAttribute("sId", sId);
%>
<html>
<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
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
    var kId = '<%= sId %>';
    $("input[name='id']").val(kId);
    $("input[name='id']").attr("readOnly", "readOnly");
});

</script>
	<title>Chat</title>
</head>
<c:choose>
	<c:when test="${empty sessionScope.sId}">
		<body>
			<script>
				alert("로그인 후에만 접근할 수 있습니다.");
				location.href = "<c:url value='/'/>"; // 로그인 페이지로 이동
			</script>
		</body>
	</c:when>
	<c:otherwise>
		 <div class="container">
	        <div class="panel panel-success">
	            <div class="panel-title">
	                <p>
	                Clean Plate는 개인 거래에 어떠한 관여도 하지 않습니다.
	                모든 거래는 사용자 간의 자유로운 합의에 기반하며, 
	                Clean Plate는 거래 내용이나 결과에 대해 어떠한 책임도 지지 않습니다.
	                자세한 내용은 이용 약관을 참고해주시기 바랍니다. 
	                </p>
	            </div>
	            <div class="panel-body">
	                <form id="login-form" method="post" action="assignAgreePro">
	                    <div>
	                        <input type="hidden" name="id" class="form-control" style="text-align: center;">
	                    </div>
	                    <div>
	                        <button type="submit" class="form-control btn btn-primary">동의하기</button>
	                    </div>
	                </form>
	            </div>
	        </div>
    	</div>
	</c:otherwise>
</c:choose>
</html>
