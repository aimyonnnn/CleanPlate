<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/help.css" rel="styleSheet" type="text/css">
</head>
<body>
	<%@ include file="../common/common_header.jsp" %>
	<!-- 페이지 파라미터 저장 -->
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>

	<!-- 여기부터 공지사항 메뉴 버튼 -->
	<div class="container mt-5">
  		<div class="row">
    		<div class="col">
      			<h2 class="display-5 fst-italic fw-bold"><img src="${pageContext.request.contextPath }/resources/images/help.jpg" style="width: 100%;"></h2>
    		</div>
  		</div>
	</div>
	<div class="container mt-4">
  		<div class="row">
   			<div class="col text-center">
	      		<div class="list-group list-group-horizontal">
			        <a href="Notice" class="list-group-item-dark list-group-item-action active" aria-current="true">공지사항</a>
			        <a href="FAQ" class="list-group-item-dark list-group-item-action">FAQ</a>
			        <a href="QNA" class="list-group-item-dark list-group-item-action">Q&A</a>
	      		</div>
    		</div>
   		<!-- 게시판 -->
    	<div class="row gy-4">
      		<div class="col">
        		<table class="table">
					<thead class="text-center">
					    <tr>
					      <th scope="col" class="text-start">제목</th>
					      <th scope="col" style="width: 10%;">작성자</th>
					      <th scope="col" style="width: 10%;">날짜</th>
					      <th scope="col" style="width: 10%;">조회수</th>
					    </tr>
					</thead>
          			<tbody class="text-center">
          				<!-- 상위 고정 공지 출력 -->
          				<c:forEach items="${noticeList }" var="noticeList">
          					<c:if test="${noticeList.no_category == 2}">
					            <tr>
					            	<td class="text-start fw-bold">
					            		<a href="NoticeDetail?no_idx=${noticeList.no_idx }&pageNum=${pageNum}" style="text-decoration: none; color: black;">🔉 ${noticeList.no_subject }</a>
					            	</td>
					            	<td>관리자</td>
					            	<td>${noticeList.no_date }</td>
					            	<td>${noticeList.no_readcount }</td>
					            </tr>
				            </c:if>
				        </c:forEach>
				        
				        <!-- 일반 공지 출력 -->
				        <c:forEach items="${noticeList }" var="noticeList">
				            <c:if test="${noticeList.no_category == 1}">
					            <tr>
					            	<td class="text-start">
					            		<a href="NoticeDetail?no_idx=${noticeList.no_idx }&pageNum=${pageNum}" style="text-decoration: none; color: black;">${noticeList.no_subject }</a>
					            	</td>
					            	<td>관리자</td>
					            	<td>${noticeList.no_date }</td>
					            	<td>${noticeList.no_readcount }</td>
					            </tr>
				            </c:if>
			            </c:forEach>
					</tbody>
				</table>
				<c:if test="${sessionScope.sId eq 'admin' }">
					<div class="d-flex justify-content-end">
					    <a href="NoticeBoard" class="btn btn-outline-dark">글쓰기</a>
					</div>
				</c:if>
			</div>
		</div>
    <!-- 페이지 이동 버튼 -->
    <div class="row my-4">
	    <div class="col-12">
	        <nav aria-label="Page navigation example">
	            <ul class="pagination justify-content-center">
	                <!-- 이전 버튼 -->
	                <c:choose>
	                    <c:when test="${pageNum > 1}">
	                        <li class="page-item">
	                            <a class="page-link" href="Notice?pageNum=${pageNum - 1}" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                            </a>
	                        </li>
	                    </c:when>
	                    <c:otherwise>
	                        <li class="page-item disabled">
	                            <a class="page-link" href="#" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                            </a>
	                        </li>
	                    </c:otherwise>
	                </c:choose>
	
	                <!-- 페이지 번호 -->
	                <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	                    <c:choose>
	                        <c:when test="${pageNum eq i}">
	                            <li class="page-item active">
	                                <a class="page-link" href="#">${i}</a>
	                            </li>
	                        </c:when>
	                        <c:otherwise>
	                            <li class="page-item">
	                                <a class="page-link" href="Notice?pageNum=${i}">${i}</a>
	                            </li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	
	                <!-- 다음 버튼 -->
	                <c:choose>
	                    <c:when test="${pageNum < pageInfo.maxPage}">
	                        <li class="page-item">
	                            <a class="page-link" href="Notice?pageNum=${pageNum + 1}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:when>
	                    <c:otherwise>
	                        <li class="page-item disabled">
	                            <a class="page-link" href="#" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:otherwise>
	                </c:choose>
	            </ul>
	        </nav>
	    </div>
	</div>
	<!-- 페이지 이동 버튼 끝 -->
    
    
    	<!-- 검색창 -->
	    <div class="row justify-content-center">
		    <div class="col-4">
		        <form class="d-flex" role="search" method="get" action="Notice">
		            <select class="form-select me-2" name="searchType" id="searchType" aria-label="Search Type" style="width: 200px;">
		                <option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>
		                <option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>
		                <option value="subject_content" <c:if test="${param.searchType eq 'subject_content' }">selected</c:if>>제목&내용</option>
		            </select>
		            <input class="form-control me-2 w-100" type="search" name="searchKeyword" placeholder="Search" aria-label="Search" value="${searchKeyword}">
		            <button type="submit" class="btn btn-outline-dark">Search</button>
		        </form>
		    </div>
		</div>
		</div>
	</div>




<!-- 하단 부분은 나중에 inclue로 넣을꺼니깐 참고 -->
<!-- ==================================================================================================================================== -->

<%@ include file="../common/common_footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>