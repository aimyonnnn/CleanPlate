package com.itwillbs.test;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.test.service.*;
import com.itwillbs.test.vo.*;

@Controller
public class OwnerController {
	
	@Autowired
	private StoreService service;
	@Autowired
	private ReservationService resService;
	
	// 가게 매출관리 DashBoard
	@GetMapping("storeDashBoard")
	public String storeDashBoard() {
		return "owner/storeDashBoard";
	}
	
	/* 예약관리 페이지 */
	//owner의 예약관리 페이지 이동 Mapping
	@GetMapping("StoreReservation")
	public String StoreReservation(Model model, HttpSession session) {
		
		List<ReservationVO> resList = service.getReservationList((String)session.getAttribute("sId"));
		List<Reservation_DetailVO> RDList = service.getRDList((String)session.getAttribute("sId"));
		List<RestaurantVO> restaurantList = resService.getOwnerRestaurantList((String)session.getAttribute("sId"));
		
		System.out.println(restaurantList);
		
		model.addAttribute("restaurantList", restaurantList);
		model.addAttribute("resList",resList);
		model.addAttribute("RDList",RDList);
		
		return "owner/store_Reservation";
	}
	
	//owner의 예약관리 페이지 이동 Post 방식 Mapping
	@PostMapping("StoreReservation")
	public String StoreReservationPost() {
		return "owner/store_Reservation";
	}
	
	/* 매출관리 페이지 */
	//그래프
	@GetMapping("ownerSalesGraph")
	public String storeSalesGraph(){
		return "owner/ownerSalesGraph";
	}
	
	/* 식당관리 페이지 */
	//owner의 식당추가로 이동 Mapping
	@GetMapping("StoreInsertPage")
	public String StoreInsertPage() {
		return "owner/store_InsertPage";
	}
	
	// 가게 추가 클릭시 가게등록 작업
	@PostMapping("storeInsertPro")
	public String storeInsertPro(RestaurantVO restaurant, Model model) {
		System.out.println(restaurant);
		
		int insertCount = service.registStore(restaurant);
		
		// 성공시 storeInsertSucess 리다이렉트 
		// 실패시 fail_back.jsp 가게등록 실패 출력
		if(insertCount > 0) {
			
			return "redirect:/storeInsertSucess";
		} else {
			
			model.addAttribute("msg", "가게 등록 실패!");
			return "fail_back";
		}
	}
	
	// 가게 등록 성공시 StoreList로 리다이렉트
	@GetMapping("storeInsertSucess")
	public String storeInsertSucess() {
		return "redirect:/StoreList";
	}
	
	//owner의 식당리스트로 이동 Mapping
	// 가게 목록 조회
	@GetMapping("ownerList")
	public String StoreList(Model model) {
		List<RestaurantVO> restaurantList = service.getRestaurantList();
		model.addAttribute("restaurantList", restaurantList);
		return "owner/ownerList";
	}
	
	//owner의 가게 수정 페이지로 이동 Mapping
	@GetMapping("StoreUpdatePage")
	public String StoreUpdatePage(@RequestParam String res_brn, Model model) {
		
		// 가게 상세 정보 저장
		RestaurantVO restaurant = service.getRestaurantInfo(res_brn);
		
		model.addAttribute("restaurant", restaurant);
		return "owner/store_UpdatePage";
	}
	// 가게 정보 수정 작업
	@PostMapping("storeUpdate")
	public String storeUpdate(RestaurantVO restaurant, Model model) {
		
		// 가게 정보 수정
		int updateCount = service.ModifyRestaurant(restaurant);
		// 성공시  success_forward.jsp 로 이동 가게 정보 수정 완료 출력
		// 실패시 가게 정보 수정 실패! 출력
		if(updateCount > 0) {
			model.addAttribute("msg", "가게 정보 수정 완료");
			model.addAttribute("targetURL", "StoreList");
			return "success_forward";
			
		} else {
			model.addAttribute("msg", "가게 정보 수정 실패!");
			return "fail_back";
			
		}
		
		
	}
	
	
	//owner의 식당마이페이지에서 수정후 이동 Mapping
	@PostMapping("StoreMypagePro")
	public String StoreMypagePro() {
		return "owner/ownerList";
	}
	
	/* 점주마이페이지 */
	//owner의 점주마이페이지로 이동 Mapping
	@GetMapping("ownerMypage")
	public String CeoMypage() {
		return "owner/ownerMypage";
	}
	
	//owner의 점주마이페이지에서 수정후 이동 Mapping
	@PostMapping("CeoMypagePro")
	public String CeoMypagePro() {
		return "owner/ownerMypage";
	}
	
	//owner의 점주회원탈퇴 페이지로 이동 Mapping
	@GetMapping("ownerWithdrawal")
	public String ownerWithdrawal() {
		return "owner/ownerWithdrawal";
	}
	
	//owner의 점주정보 페이지로 이동 Mapping
	@PostMapping("ownerInfo")
	public String ownerInfo() {
		return "owner/ownerInfo";
	}
	

	
	
}
