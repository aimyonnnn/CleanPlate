<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Restaurant Detail</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      var isLiked = false;
      
      // 찜하기 버튼 클릭 이벤트
      $("#likeBtn").click(function() {
        if (isLiked) {
          $("#likeBtn").removeClass("liked").addClass("unliked");
        } else {
          $("#likeBtn").removeClass("unliked").addClass("liked");
        }
        
        // 찜하기 상태를 토글
        // 토글 : 두 가지 상태를 번갈아가며 전환하는 기능이며
        //		  isLiked라는 변수를 사용하여 토글 상태를 저장하고있다.
        isLiked = !isLiked;
        
        $.post("/toggleLikeStatus", 
        		{ restaurant_idx: '<%= request.getParameter("restaurant_idx") %>',
        		  member_id: '<%= request.getParameter("member_id") %>' });
      });
    });
  </script>
  <style>
    .liked {
      color: red;
    }
    .unliked {
      color: gray;
    }
  </style>
</head>
<body>
  <h1>Restaurant Detail</h1>
  <h2>식당 이름</h2>
  <button id="likeBtn" class="unliked">찜하기</button>
</body>
</html>
