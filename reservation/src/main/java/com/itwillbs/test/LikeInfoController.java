package com.itwillbs.test;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.LikeInfoService;
import com.itwillbs.test.service.RestaurantService;
import com.itwillbs.test.vo.LikeInfoVO;

@Controller
public class LikeInfoController {

    @Autowired
    private LikeInfoService likeInfoService;
    
	@Autowired
	private RestaurantService restaurantService;
    
    @ResponseBody
    @RequestMapping(value = "/toggleLikeStatus", method = RequestMethod.GET)
    public String Count(HttpServletRequest request, @RequestParam int res_idx, @RequestParam String m_id, @RequestParam String liked) {
      String response = "ok";
      System.out.println(res_idx);
      System.out.println(m_id);
      System.out.println(liked);
      
      if(liked.equals("true")) {//이미 눌러져있는 상황
    	  likeInfoService.deletcount(res_idx, m_id, liked);
      }else {//안 눌러져있는 상황
    	  likeInfoService.toggleLikeStatus(res_idx, m_id, liked);
      }
      
      return response;
    }
    
	// 찜한 가게 목록 조회
    @GetMapping("/memberLike")
    public String memberLike(Model model) {
        List<LikeInfoVO> memberLike = likeInfoService.getMemberLike();
        System.out.println(memberLike);
        model.addAttribute("memberLike", memberLike);
        
        List<Map<String, Object>> RestaurantService = restaurantService.getRestaurantReviewScores();
        model.addAttribute("RestaurantService", RestaurantService);
        
        return "member/memberLike";
        
        
    }
	
    

}
