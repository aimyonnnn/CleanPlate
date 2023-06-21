package com.itwillbs.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.MenuService;
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.service.RestaurantService;
import com.itwillbs.test.vo.MenuVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;


@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MenuService menuService;
	
	// 가게 메인 페이지 
	@GetMapping("reservationMain")
	public String reservationMain(Model model) {
		
	    // 전체 식당 조회
	    List<RestaurantVO> restaurantList = service.getRestaurantList();
	    
	    // 가게별 리뷰 점수 조회
	    List<Map<String, Object>> reviewScores = restaurantService.getRestaurantReviewScores();
	    
	    // 예약이 많은 순서로 식당 조회
	    List<Map<String, Object>> reservationCounts = reservationService.getReservationCountByRestaurant();
	    
	    model.addAttribute("restaurantList", restaurantList);
	    model.addAttribute("reviewScores", reviewScores);
	    model.addAttribute("reservationCounts", reservationCounts);
	    
	    return "reservation/reservation_main";
	}

	// 가게 정보 조회하기
   @GetMapping("getRestaurantInfo")
   public String getRestaurantInfo(@RequestParam int res_idx, Model model) {
       RestaurantVO restaurantInfo = restaurantService.getRestaurantInfo(res_idx);
       
       // 가게 상세페이지에서 메뉴 조회하기 
       List<MenuVO> menusList = menuService.getMenusList(res_idx);
       
    // 각 가게의 리뷰 불러오기
		List<ReviewVO> reviewList = service.getReviewList(res_idx);
		model.addAttribute("reviewList",reviewList);
       
       model.addAttribute("restaurantInfo", restaurantInfo);
       model.addAttribute("menusList", menusList);
       return "reservation/reservation_store";
   }
	
	// 예약 페이지
	@GetMapping("reservationReserve")
	public String reservationReserve() {
		return "reservation/reservation_reserve";
	}
	
	// 가게 상세페이지
	@GetMapping("reservationStore")
	public String reservationStore() {
		return "reservation/reservation_store";
	}
	
	// 결제 후 예약 내역 페이지
	@GetMapping("reservationResult")
	public String reservationResult() {
		return "reservation/reservation_result";
	}
	
	// Reservation탭의 식당 이름 검색하기
	// 글자 하나 입력할 때 마다 실시간으로 조회됨
	@PostMapping("getRestaurantName")
	@ResponseBody
	public List<RestaurantVO> getRestaurantName(@RequestParam("name") String resName, Model model) {
		List<RestaurantVO> restaurantName = service.getRestaurantName(resName);
		model.addAttribute("restaurantName", restaurantName);
		return restaurantName;
	}
	
	// 예약취소 버튼을 눌렀을 때 상태 처리
	@GetMapping("resCancel")
	public String resCancel(@RequestParam int r_idx, @RequestParam int r_status, Model model) {
		
		int updateCount = service.CancelStatus(r_idx, r_status);
		
		if(updateCount < 0) {
			model.addAttribute("msg", "취소 실패");
			return "fail_back";
		}
		
		return "redirect:restaurantReservation";
	}
	
	
	
}
