package com.itwillbs.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OwnerController {
	
	/* 예약관리 페이지 */
	//owner의 예약관리 페이지 이동 Mapping
	@GetMapping("StoreReservation")
	public String StoreReservation() {
		return "owner/store_Reservation";
	}
	
	//owner의 예약관리 페이지 이동 Post 방식 Mapping
	@PostMapping("StoreReservation")
	public String StoreReservationPost() {
		return "owner/store_Reservation";
	}
	
	/* 리뷰관리 페이지 */
	//owner의 리뷰관리및 편집 페이지 이동 Mapping
	@GetMapping("StoreReservationEdit")
	public String StoreReservationEdit() {
		return "owner/store_ReservationEdit";
	}
	
	/* 매출관리 페이지 */
	//owner의 매출관리 페이지 이동 Mapping
	@GetMapping("StoreSales")
	public String StoreSales() {
		return "owner/store_Sales";
	}
	
	//owner의 매출관리및 편집 페이지 이동 Mapping
	@GetMapping("StoreSalesinOut")
	public String StoreSalesinOut() {
		return "owner/store_SalesinOut";
	}
	
	// 그래프
	@GetMapping("storeSalesGraph")
	public String storeSalesGraph(){
		return "owner/store_SalesGraph";
	}
	
	/* 식당관리 페이지 */
	//owner의 식당추가로 이동 Mapping
	@GetMapping("StoreInsertPage")
	public String StoreInsertPage() {
		return "owner/store_InsertPage";
	}
	//owner의 식당수정로 이동 Mapping
	@GetMapping("StoreUpdatePage")
	public String StoreUpdatePage() {
		return "owner/store_UpdatePage";
	}
	//owner의 식당리스트로 이동 Mapping
	@GetMapping("StoreList")
	public String StoreList() {
		return "owner/store_List";
	}
	
	//owner의 식당마이페이지에서 수정후 이동 Mapping
	@PostMapping("StoreMypagePro")
	public String StoreMypagePro() {
		return "owner/store_List";
	}
	
	/* 점주마이페이지 */
	//owner의 점주마이페이지로 이동 Mapping
	@GetMapping("CeoMypage")
	public String CeoMypage() {
		return "owner/ceo_Mypage";
	}
	
	//owner의 점주마이페이지에서 수정후 이동 Mapping
	@PostMapping("CeoMypagePro")
	public String CeoMypagePro() {
		return "owner/ceo_Mypage";
	}
	
	//owner의 점주회원탈퇴 페이지로 이동 Mapping
	@GetMapping("CeoMypageDelete")
	public String CeoMypageDelete() {
		return "owner/ceo_MypageDelete";
	}
	
	//owner의 점주회원탈퇴 입력 정보 가지고 이동 Mapping
	@PostMapping("CeoMypageDeletePro")
	public String CeoMypageDeletePro() {
		return "main";
	}
	
	//owner의 점주정보 페이지로 이동 Mapping
	@PostMapping("ceoMypageInfo")
	public String ceoMypageInfo() {
		return "owner/ceo_Info";
	}
	
	
	
}
