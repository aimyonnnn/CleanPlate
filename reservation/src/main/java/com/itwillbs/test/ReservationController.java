package com.itwillbs.test;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.MemberService;
import com.itwillbs.test.service.MenuService;
import com.itwillbs.test.service.PayService;
import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.service.RestaurantService;
import com.itwillbs.test.service.TimesService;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.MenuVO;
import com.itwillbs.test.vo.ReservationVO;
import com.itwillbs.test.vo.RestaurantVO;
import com.itwillbs.test.vo.ReviewVO;
import com.itwillbs.test.vo.TimesVO;
import com.mysql.cj.Session;


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
	@Autowired
	private TimesService timesService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PayService payService;
	
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
	public String reservationReserve(@RequestParam int res_idx, Model model, HttpSession session) {
		// 특정 가게의 예약을 받을 수 있는 영업 시간 목록을 조회 
		List<TimesVO> timeList = timesService.getTimesInfo(res_idx);
		model.addAttribute("timeList", timeList);
		
		// 특정 가게의 정보 조회
		RestaurantVO restaurant = restaurantService.getRestaurantInfo(res_idx);
		model.addAttribute("restaurant", restaurant);
		
		// 특정 가게의 메뉴 리스트 조회
		List<MenuVO> menuList = menuService.getMenusList(res_idx);
		model.addAttribute("menuList", menuList);
		
		// 예약하기로 가기 전 세션으로부터 회원 정보 받아오기
		String sId = (String)session.getAttribute("sId");
		if(sId == null) { // 로그인 안했을 경우 
			model.addAttribute("msg", "먼저 로그인을 해주세요.");
			return "fail_back";
		} else {
			// 로그인한 사용자인 경우
	        MemberVO memberInfo = memberService.selectMember(sId);
	        model.addAttribute("memberInfo", memberInfo);
	        return "reservation/reservation_reserve";
		}
	}
	
	// 실시간 예약 조회 
	@PostMapping("/SelectedReservationInfo")
	@ResponseBody
	public Map<String, Object> selectedReservationInfo(@RequestParam("selectedCount") int selectedCount,
	                                                   @RequestParam("r_date") String r_date,
	                                                   @RequestParam("res_idx") int res_idx) {
	    // 레스토랑 정보에서 예약할 수 있는 총 테이블 수 조회
	    RestaurantVO restaurant = restaurantService.getRestaurantInfo(res_idx);
	    int res_total_table = restaurant.getRes_total_table();
	    
	    // 예약 정보에서 예약된 테이블 수 조회
	    int lunch_tables = reservationService.getLunchReservationTables(res_idx, r_date);
	    int dinner_tables = reservationService.getDinnerReservationTables(res_idx, r_date);

	    int r_tables = 0; // 예약 인원수에 따른 예약할 테이블 갯수

	    if (selectedCount % 4 == 0) { // 인원수를 4인용 테이블로 나눠서 예약할 테이블 수 지정
	        r_tables = selectedCount / 4;
	    } else {
	        r_tables = selectedCount / 4 + 1;
	    }
	    
	    lunch_tables += r_tables; // 런치에 예약된 테이블 수 + 예약할 테이블 수
	    dinner_tables += r_tables; // 예약된 테이블 수 + 예약할 테이블 수
	    
	    boolean showLunchTimeButtons = (lunch_tables <= res_total_table); // 런치 가능
	    boolean showDinnerTimeButtons = (dinner_tables <= res_total_table); // 디너 가능
//	    boolean fullDate = (lunch_tables > res_total_table && dinner_tables > res_total_table); // 런치+디너 불가능

	    Map<String, Object> response = new HashMap<>();
	    response.put("showLunchTimeButtons", showLunchTimeButtons);
	    response.put("showDinnerTimeButtons", showDinnerTimeButtons);
	    return response;
	}
	
	// 가게 상세페이지
	@GetMapping("reservationStore")
	public String reservationStore() {
		return "reservation/reservation_store";
	}
	
	// 결제 완료 후 DB에 예약내역 입력
	@PostMapping("reservationUpdate")
	@ResponseBody
	public String reservationUpdate(
			 // vo객체로 받으니깐 시간쪽에서 변환하다가 에러나서 따로 분리함
			 // DB순서대로 적음
			 HttpSession session,
			 @RequestParam("r_personnel") int r_personnel,
			 @RequestParam("r_date") String r_date,
			 @RequestParam("r_request") String r_request,
			 @RequestParam("r_amount") int r_amount,
			 @RequestParam("r_status") int r_status,
			 @RequestParam("m_idx") int m_idx,
			 @RequestParam("res_idx") int res_idx,
		     @RequestParam("r_tables") int r_tables,
		     @RequestParam("me_idx") int me_idx,
		     @RequestParam("p_orderNum") String p_orderNum, // 주문번호-자동생성한것
	         @RequestParam("payment_num") String payment_num, // 아임포트 주문번호
	         @RequestParam("payment_total_price") int payment_total_price // 결제가격
	         ) {
		
		System.out.println("reservationUpdate");
		String sId = (String) session.getAttribute("sId");
		
		int insertCount = reservationService.registReservation(
				r_personnel, r_date, r_request, r_amount, 
				r_status, m_idx, res_idx, r_tables, me_idx);
		
		if(insertCount != 0) { 
			
			// ======================= 결제정보 payment 테이블에 저장  =======================
			int ReservationPayInfoCount = payService.registReservationPayInfo(p_orderNum, payment_num, payment_total_price, sId);
			
			System.out.println(ReservationPayInfoCount);
			
			return "1"; 
			
		}
		
		return "0"; // 실패시
	}
	
	// 예약 완료 페이지
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
	public String resCancel(@RequestParam int r_idx, @RequestParam int r_status, Model model, HttpSession session) {
		
		int updateCount = service.CancelStatus(r_idx, r_status);
		
		if(updateCount < 0) {
			model.addAttribute("msg", "취소 실패");
			return "fail_back";
		}
		
		if(session.getAttribute("sId")==null) {
			return "redirect:restaurantReservation";
		} else {
			return "redirect:memberRSList";
		}
	}
	
	
	
}
