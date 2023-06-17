package com.itwillbs.test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.LikeInfoService;

@Controller
public class LikeInfoController {

    @Autowired
    private LikeInfoService likeInfoService;

    @PostMapping("/toggleLikeStatus")
    @ResponseBody
    public void toggleLikeStatus
    	
    	(@RequestParam("restaurant_idx") int restaurantIdx, //찜하기 상태를 토글할 식당의 인덱스
         @RequestParam("member_id") String memberId)  //찜하기를 한 회원의 아이디
    		{
        likeInfoService.toggleLikeStatus(restaurantIdx, memberId);
    }
}
