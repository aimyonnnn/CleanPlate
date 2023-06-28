<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/help.css" rel="styleSheet" type="text/css">
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
	        <a href="Notice" class="list-group-item-dark list-group-item-action" aria-current="true">
	          공지사항
	        </a>
	        <a href="FAQ" class="list-group-item-dark list-group-item-action">FAQ</a>
	        <a href="QNA" class="list-group-item-dark list-group-item-action active">Q&A</a>
	      </div>
        </div>
        <div class="col-6 mt-4">
            <div class="list-group list-group-horizontal">
                <a href="QNABoard" class="list-group-item-dark list-group-item-action">문의하기</a>
                <a href="QNA" class="list-group-item-dark list-group-item-action active" aria-current="true">문의내역</a>
            </div>
        </div>
    </div>
</div>


<!-- 문의 내역 영역 -->
<div class="container mt-5">
	<c:choose>
		<c:when test="${QNAList eq null }">
			<h5 style="text-align: center; color: gray;">아직 문의사항이 없습니다.</h5>
		</c:when>
		<c:otherwise>
			  <div class="accordion" id="accordionExample">
				<c:forEach items="${QNAList }" var="QNAList">
			    <div class="accordion-item">
			      <h2 class="accordion-header">
			        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${QNAList.q_idx }" aria-expanded="false" aria-controls="collapse${QNAList.q_idx }">
			        <div class="container text-center">
			          <div class="row">
			            <div class="col-7" style="text-align: left;">
			              ${QNAList.q_subject }
			            </div>
			            <div class="col-2">
			              <fmt:formatDate value="${QNAList.q_date }" pattern="yyyy-MM-dd"/>
			            </div>
			            <div class="col-2"> 
			              <c:choose>
			              	<c:when test="${QNAList.q_re_context eq null }">
			              		문의 진행중
			              	</c:when>
			              	<c:otherwise>
			              		문의 완료
			              	</c:otherwise>
			              </c:choose>
			            </div>
			          </div>
			        </div>
			        </button>
			      </h2>
			      <div id="collapse${QNAList.q_idx }" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
			        <div class="accordion-body">
			         ${QNAList.q_context }
			         <br><br>
					<c:if test="${not empty QNAList.q_file}">
		         		첨부파일 : <a
								href="${pageContext.request.contextPath }/resources/upload/${QNAList.q_file }"
								download="${fn:split(QNAList.q_file, '_')[1] }">
								${fn:split(QNAList.q_file, '_')[1] } </a>
					</c:if>
					<hr>
					<c:if test="${QNAList.q_re_context ne null }">
				         답변 : ${QNAList.q_re_context }
			         </c:if>
			         <c:choose>
				         <c:when test="${QNAList.q_re_context eq null and sessionScope.sId eq 'admin' }">
				         	<form action="QNAAnswer" method="post">
				         		<input type="hidden" value="${QNAList.q_idx }" name="q_idx">
						         <textarea class="form-control" name="q_re_context" id="exampleFormControlTextarea2" rows="5" required="required"></textarea>
						         <div class="btn-group-sm text-end" role="group" aria-label="Basic outlined example">
						            <button type="submit" class="btn btn-outline-dark mt-3" >답변</button>
						         </div>
					        </form>
			         	</c:when>
			         	<c:otherwise>
			         		<c:if test="${QNAList.q_re_context eq null and sessionScope.sId ne 'admin' }">
					         	<div class="btn-group-sm text-end" role="group" aria-label="Basic outlined example">
						            <button class="btn btn-outline-dark" onclick="location.href='DeleteQna?q_idx=${QNAList.q_idx}'">삭제</button>
						        </div>
					    	</c:if>
			         	</c:otherwise>
			         </c:choose>
			        </div>
			      </div>
			    </div>
		  		</c:forEach>
			  </div>
		</c:otherwise>
	</c:choose>
  <!-- 페이지 이동 영역 -->
    <div class="row my-4">
	    <div class="col-12">
	        <nav aria-label="Page navigation example">
	            <ul class="pagination justify-content-center">
	                <!-- 이전 버튼 -->
	                <c:choose>
	                    <c:when test="${pageNum > 1}">
	                        <li class="page-item">
	                            <a class="page-link" href="QNA?pageNum=${pageNum - 1}" aria-label="Previous">
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
	                                <a class="page-link" href="QNA?pageNum=${i}">${i}</a>
	                            </li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	
	                <!-- 다음 버튼 -->
	                <c:choose>
	                    <c:when test="${pageNum < pageInfo.maxPage}">
	                        <li class="page-item">
	                            <a class="page-link" href="QNA?pageNum=${pageNum + 1}" aria-label="Next">
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
</div>
	<!-- 페이지 이동 버튼 끝 -->
    
    
    	<!-- 검색창 -->
	    <div class="row justify-content-center">
		    <div class="col-4">
		        <form class="d-flex" role="search" method="get" action="QNA">
		            <select class="form-select me-2" name="searchType" id="searchType" aria-label="Search Type" style="width: 200px;">
		                <option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>
		                <option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>
		                <option value="subject_content" <c:if test="${param.searchType eq 'subject_content' }">selected</c:if>>제목&내용</option>
		            </select>
		            <input class="form-control me-2" type="search" name="searchKeyword" placeholder="Search" aria-label="Search" value="${searchKeyword}">
		            <button type="submit" class="btn btn-outline-dark">Search</button>
		        </form>
		    </div>
		</div>

<!-- 하단 부분은 나중에 inclue로 넣을꺼니깐 참고 -->
<!-- ==================================================================================================================================== -->

<%@ include file="../common/common_footer.jsp" %>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>