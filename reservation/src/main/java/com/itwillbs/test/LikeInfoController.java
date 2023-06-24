package com.itwillbs.test;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
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

    @ResponseBody
    @RequestMapping(value = "/deletecount", method = RequestMethod.GET)
    public String deleteCount(HttpServletRequest request) {
    	String res_idxString = request.getParameter("res_idx");
    	int res_idx = Integer.parseInt(res_idxString);
        String m_id = request.getParameter("m_id");
        System.out.println(res_idx);
        System.out.println(m_id);
        
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("res_idx", res_idx);
        paramMap.put("m_id", m_id);
        
        likeInfoService.deleteFromLikes(paramMap); // 사용자의 찜 목록에서 해당 식당 삭제
        
        return "찜이 해제되었습니다.";
    }


	@GetMapping("/memberLike")
    public String memberLike(Model model) {
        List<Map<String, Object>> memberLike = likeInfoService.memberLikelist();
        System.out.println(memberLike);

        for (Map<String, Object> restaurant : memberLike) {
            Object averageScore = restaurant.get("rv_scope");

            if (averageScore instanceof BigDecimal) {
                BigDecimal decimalScore = (BigDecimal) averageScore;
                decimalScore = decimalScore.setScale(1, BigDecimal.ROUND_HALF_UP);
                String roundedScore = decimalScore.toString();
                String starString = generateStarString(roundedScore);
                System.out.println(starString);

                restaurant.put("rv_scope", starString);
            }
        }

        model.addAttribute("memberLike", memberLike);

        return "member/memberLike"; 
    }

    private String generateStarString(String roundedScore) {
        double score = Double.parseDouble(roundedScore);
        int fullStars = (int) score;
        int remainingStars = 5 - fullStars;

        StringBuilder starString = new StringBuilder();
        for (int i = 0; i < fullStars; i++) {
            starString.append("★");
        }
        for (int i = 0; i < remainingStars; i++) {
            starString.append("☆");
        }

        return starString.toString();
    }
}
