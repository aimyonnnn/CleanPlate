<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 이부분은 지우면 안됩니다. -->  
	<!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/help.css" rel="styleSheet" type="text/css">
</head>
<body>
	<%@ include file="../common/common_header.jsp" %>
	
	<!-- 여기부터 공지사항 메뉴 버튼 -->
	<div class="container mt-5">
		<div class="row">
			<div class="col">
				<h2 class="display-5 fst-italic fw-bold"><img src="${pageContext.request.contextPath }/resources/images/help.jpg" style="width: 100%;"></h2>
			</div>
		</div>
	</div>
	<div class="container mt-4">
    	<div class="row gy-3 justify-content-center text-center">
        	<div class="col-12">
	      		<div class="list-group list-group-horizontal">
		        	<a href="Notice" class="list-group-item-dark list-group-item-action active" aria-current="true">공지사항</a>
			        <a href="../help/help_fq.jsp" class="list-group-item-dark list-group-item-action">FAQ</a>
			        <a href="QNA" class="list-group-item-dark list-group-item-action">Q&A</a>
	      		</div>
			</div>
		</div>
		<!-- Notice 내용 -->
		<div class="row my-5 justify-content-center">
			<div class="col">
			<h4 class="fw-bold mb-2">공지사항</h4>
			<table class="table my-2">
                <tr>
                    <th class="col-1 table-secondary">제목</th>
                    <td class="fw-bold">${notice.no_subject}</td>
                    <th class="col-1 table-secondary">작성자</th>
                    <td>관리자</td>
                </tr>
                <tr>
                    <th class="col-1 table-secondary">내용</th>
                    <td class="col" colspan="3">${notice.no_content}</td>
                </tr>
                <tr>
                    <th class="col-1 table-secondary">파일첨부</th>
                    <td class="col" colspan="3">
                    	<c:if test="${not empty notice.no_file}">
						    <a href="${pageContext.request.contextPath }/resources/upload/${notice.no_file }" download="${notice.no_file }">${fn:split(notice.no_file, '_')[1] }</a><br>
						</c:if>
                    </td>
                </tr>
			</table>
<%-- 				<c:if test="${sessionScope.sId eq 'admin' }"> --%>
					<div class="d-flex justify-content-center">
					    <a href="NoticeModifyForm?no_idx=${param.no_idx}&pageNum=${param.pageNum}" class="btn btn-outline-dark" style="margin-right: 5px;">수정</a>
					    <a href="NoticeDelete?no_idx=${param.no_idx}&pageNum=${param.pageNum}" class="btn btn-outline-dark">삭제</a>
					</div>
<%-- 				</c:if> --%>
			</div>
    	</div>
	</div>
</body>
</html>