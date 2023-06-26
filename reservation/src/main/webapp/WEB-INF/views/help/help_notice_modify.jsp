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
	<style>
		b {
		    color: red;
		    font-weight: normal;
		}
	</style>
</head>
<body>
<%@ include file="../common/common_header.jsp" %>

<!-- ==================================================================================================================================== -->
<!-- 상단 부분 inclue넣을꺼니깐 참고용 -->


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
		        	<a href="Notice" class="list-group-item list-group-item-action active" aria-current="true">공지사항</a>
			        <a href="../help/help_fq.jsp" class="list-group-item list-group-item-action">FAQ</a>
			        <a href="QNA" class="list-group-item list-group-item-action">Q&A</a>
	      		</div>
			</div>
		</div>
		<!-- Notice 내용 -->
    	<hr>
	    <form action="NoticeModifyPro" method="post" enctype="multipart/form-data">
	    	<input type="hidden" name="no_idx" value="${param.no_idx}">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<div class="row my-5 justify-content-center">
				<div class="col">
				<h4>공지사항</h4>
				<table class="table my-2">
	                <tr>
	                    <th class="col">구분<b>*</b></th>
	                    <td class="col">
		                    <input type="radio" id="normal_category" name="no_category" value="1" checked>
		                    <label for="normal_category">일반 공지</label>
		                    <input type="radio" id="top_category" value="2" name="no_category">
		                    <label for="top_category">상위 고정</label>
	                    </td>
	                </tr>
	                <tr>
	                    <th class="col-1">제목<b>*</b></th>
	                    <td><input type="text" class="form-control" name="no_subject" value="${notice.no_subject }" required="required"></td>
	                </tr>
	                <tr>
	                    <th class="col-1">내용<b>*</b></th>
	                    <td class="col">
	                        <textarea class="form-control" name="no_content" rows="8" value="${notice.no_content }" required="required"></textarea>
	                    </td>
	                </tr>
	                <tr>
	                    <th class="col-1">파일첨부</th>
	                    <td class="col">
	                        <c:choose>
								<c:when test="${empty notice.no_file }">
									<input type="file" name="file" /><br>
								</c:when>
								<c:otherwise>
									${fn:split(notice.no_file, '_')[1] }
									<input type="button" value="삭제">
								</c:otherwise>
							</c:choose>
						</td>
	                </tr>
				</table>
				</div>
    		</div>
    		<div class="row justify-content-center">
	        	<div class="col-3">
		            <div class="d-grid gap-2">
		                <button type="submit" class="btn btn-outline-primary">수정하기</button>
		                <button type="button" class="btn btn-outline-primary" onclick="history.back()">취소</button>
		            </div>
				</div>
			</div>
		</form>
	</div>

	<!-- footer 부분 -->
	<%@ include file="../common/common_footer.jsp" %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>