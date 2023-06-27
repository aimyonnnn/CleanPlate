<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/ceoWithdrawal.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerMypage'">내 정보</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantList'">가게리스트 </button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
					<button type="button" class="btn btn-outline-dark text-white active p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10 mt-4">
            	 <div class="input-container" style="margin-top: 35px; margin-left: 120px;">
	                <label for="agree_privacy">아래 내용을 꼭 확인해 주세요.<br></label>
	                <textarea id="agree_privacy" rows="14" readonly style="width: 80%;">
회원탈퇴 즉시 회원정보는 모두 삭제되며, 재가입시에도 복원되지 않습니다.

삭제되는 정보 : 예약하신 식당내역, 개인정보, 작성글

회원탈퇴 시 판매계정 및 판매자회원 자격이 자동으로 상실됩니다.
회원탈퇴 시 본 사이트에서 회원으로 서비스 이용이 불가합니다.
회원탈퇴 시 구매하신 예약내역도 모두 삭제됩니다. 회원탈퇴 후 타 ID로 사용 권한을 양도하실 수 없습니다.
탈퇴 후 연결된 이용기록(ex.상품리뷰)은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다.

1개월간 회원 재가입 제한
회원탈퇴 후, 1개월간은 회원 재가입이 불가능합니다.

탈퇴 후 정보보관
전자상거래 등에서의 소비자보호에 관한 법률 제6조에 의거 성명, 주소 등 거래의 주체를 식별할 수 있는 정보에 한하여 서비스 이용에 관한 동의를 철회한 경우에도 이를 보존할 수 있으며, 동법 시행령 제6조에 의거 다음과 같이 거래 기록을 보관합니다.

-표시, 광고에 관한 기록 : 6개월
-계약 또는 청약철회 등에 관한 기록 : 5년
-대금결제 및 재화등의 공급에 관한 기록 : 5년
-소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
					</textarea>
	              </div>
            
				<form action="ownerWithdrawalPro" method="post">
			    	<div class="mb-3 mt-3 row" style="margin-left: 120px;">
			            <label for="id" class="col-sm-2 col-form-label">아이디</label>
			            <div class="col-md-6">
			                <input type="text" readonly class="form-control-plaintext fw-bold" id="id" value="${sessionScope.cId }">
			            </div>
			        </div>
			        <div class="mb-3 row" style="margin-left: 120px;">
			            <label for="passwd" class="col-sm-2 col-form-label">비밀번호</label>
			            <div class="col-md-6">
			                <input type="password" name="c_passwd" class="form-control" id="passwd" style="width: 180px;">
			            </div>
			        </div>
			        <div class="mb-3 row">
			            <div class="col-md-7 d-flex" style="margin-left: 500px;">
			                <button type="submit" class="btn btn-dark" style="color: white;" onclick="return deletebtn()">탈퇴하기</button>
			            </div>
			        </div>
			    </form>
			</div>
		</div>
	</div>
	<!-- 내용 끝 -->
	<script type="text/javascript">
		function deletebtn() {
			let result = confirm("회원 탈퇴를 하면 서비스를 더 이상 이용하실 수 없습니다.\n 정말 회원 탈퇴를 진행하시겠습니까?)");
			if(result){
				return result;
			} else {
				return result;
			}
		}
	</script>

	
    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
	<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 