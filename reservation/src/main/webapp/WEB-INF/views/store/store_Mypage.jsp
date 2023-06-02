<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Store_MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link href="top.css" rel="stylesheet" type="text/css">

    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
	<!-- 공통 상단바 구역 -->
<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row">
          <div class="col">
            <h2>점주 마이페이지</h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-2 align-items-center d-flex">
                <!-- 왼쪽 사이드바 구역 -->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <!-- 프로필 사진 -->
                    <div class="input-group mb-5 d-flex shadow-lg d-flex justify-content-center pe-3" style="border-radius: 10px;">
                        <img src="../image/profile.png" alt="" style="width: 100px; height: 100px;" class="justify-content-center">
                        <p class="d-flex align-items-center"><span>님 환영합니다</span></p>

                    </div>
                    <!-- 왼쪽 사이드바 버튼들-->
                    <!-- 클릭된 버튼은 색으로 따로 표시함-->
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_Mypage.jsp'">내 정보</button>
                    <button type="button" class="btn btn-outline-secondary active mt-4 text-black p-3" onclick="location.href='../store/store_Mypage.jsp'">가게 등록</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Reservation.jsp'">예약관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Sales.jsp'">매출관리</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../store/store_Coupon.jsp'">쿠폰/이벤트</button>
                    <button type="button" class="btn btn-outline-secondary text-black p-3" onclick="location.href='../ceo/ceo_MypageDelete.jsp'">회원탈퇴</button>
                </div>
            </div>

            <!-- 내용 구역 -->
            <div class="col-md-10">
				<div class="card" style="margin-top: 20px;">
				  <div class="card-body">
				  <div class="row">
					  <div class="col-6">
					  <br>
					  <h5 class="card-title">매장 상세사진</h5>
						  <div>
						  <input type="file" value="" class="real-upload" accept="image/*">
						  </div>
					  <br><br>
					  
					  <h5 class="card-title">기본 정보</h5>
					  <div>   
						  식당이름
						  <input type="text" name="name_Store" placeholder="내용을 입력해주세요" style="width:300px;"><br>
						  <br>사업자번호
						  <input type="text" name="name_StoreNum" placeholder="내용을 입력해주세요" style="width:300px;"> <input type="button" value="중복확인" ><br>
						  <br>우편 번호
						  <input type="text" name="zip_Code" placeholder="내용을 입력해주세요" style="width:200px;"> <input type="button" value="검색" ><br>
						  도로명주소
						  <input type="text" name="addresses" placeholder="내용을 입력해주세요" style="width:300px;"><br>
						  상세명주소
						  <input type="text" name="addresses_D" placeholder="내용을 입력해주세요" style="width:300px;">
					  </div>
					  <br><br>
						  
					  <div>
					  <h5 class="card-title">소개 정보</h5>
						  식당소개
						  <br><textarea name ="introduce" rows="8" cols="50" > </textarea><br>
					  </div> 
				  </div>
  
  
				  
				  <div class="col-6">
					  <div>
						  <br>영업시간
						  <input type ="time">~<input type ="time">  <input type="text" placeholder="브레이크 시간 00:00 ~ 00:00" style="width:220px;"><br>
						  <br>휴무일
						  <input type ="time">~<input type ="time"><br>
						  <br>전화번호
						  <input type="text" name = "tel1_ceo" style ="width:100px">-<input type="text"  name = "tel2_ceo" style ="width:100px">-<input type="text"  name = "tel3_ceo" style ="width:100px"><br>
						  <br>개업일시
						  <input type ="date" value = "2023-01-01" min = "1980-01-01"><br>
						  <br>식당편의시설<br>
						  <input type ="text" placeholder="식당 내 시설을 입력해주세요." style ="width:300px"><br>
											
					  </div>
					  <br><br>
					  
					  <h5 class="card-title">테이블 설정</h5>
					  <div>
						  <br>테이블설정 <input type="submit" value="생성"> <input type="submit" value="삭제">
						  <br>테이블규격
						  <select style="width:100px;margin-right:10px">
						  <option value="1인용" selected>1인용</option>
						  <option value="2인용">2인용</option>
						  <option value="3인용">3인용</option>
						  <option value="4인용">4인용</option>
						  </select>
						  <input type="text" placeholder="내용을 입력해주세요" style="width:300px;">
						  <br><br>메뉴설정 <input type="submit" value="생성"> <input type="submit" value="삭제">
						  <br>메뉴
						  <select style="width:100px;margin-right:10px">
						  <option value="LUNCH" selected>LUNCH</option>
						  <option value="DINNER">DINNER</option>
						  </select>
						  <input type="text" placeholder="내용을 입력해주세요" style="width:300px;"><br>
					  </div>
				  </div>
				  </div>
				  </div>
					  <br><br>
					  <div style="margin:0 auto">
					  <input type="submit" value="저장">&nbsp;&nbsp;
					  </div>
					  <br><br>
			  </div>
			  </div>
  
								
			 </div>
		  </div>
 
    
    <!-- 하단 부분 include 처리영역 -->
    <hr class="mt-5">
<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 