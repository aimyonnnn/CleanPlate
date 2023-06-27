package com.itwillbs.test;

import java.io.*;
import java.nio.file.*;
import java.sql.Timestamp;
import java.text.*;
import java.time.LocalDateTime;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.itwillbs.test.handler.MyPasswordEncoder;
import com.itwillbs.test.service.*;
import com.itwillbs.test.vo.*;
import com.mysql.cj.protocol.x.*;

import edu.emory.mathcs.backport.java.util.Collections;

@Controller
public class OwnerController {
	
	@Autowired
	private RestaurantService service;
	@Autowired
	private ReservationService resService;
	@Autowired
	private CeoService ceoService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private TimesService timesService;
	
	
//	// 매출관리
//	@GetMapping("storeDashBoard")
//	public String storeDashBoard() {
//		return "owner/storeDashBoard";
//	}
	
	/* 예약관리 페이지 */
	//owner의 예약관리 페이지 이동 Mapping
	@GetMapping("restaurantReservation")
	public String restaurantReservation(Model model, HttpSession session) {
		
		System.out.println((String)session.getAttribute("cId"));
		
		List<ReservationVO> resList = service.getReservationList((String)session.getAttribute("cId"));
		List<RestaurantVO> restaurantList = resService.getOwnerRestaurantList((String)session.getAttribute("cId"));
		
		Set<String> uniqueDates = new LinkedHashSet<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");

		for (ReservationVO reservation : resList) {
		    Timestamp rDate = reservation.getR_date();
		    String dateString = dateFormat.format(rDate);
		    uniqueDates.add(dateString);
		}

		List<String> sortedDates = new ArrayList<>(uniqueDates);
		Collections.sort(sortedDates);
		Collections.reverse(sortedDates);
		
	    model.addAttribute("sortedDates", sortedDates);		
		model.addAttribute("restaurantList", restaurantList);
		model.addAttribute("resList",resList);
		
		return "owner/restaurantReservation";
	}
	
	/* 매출관리 페이지 */
	//그래프
	@GetMapping("ownerSalesGraph")
	public String ownerSalesGraph(){
		return "owner/ownerSalesGraph";
	}
	
	/* 식당관리 페이지 */
	// 가게 등록 버튼 클릭시 가게 등록 폼으로 이동 
	@GetMapping("restaurantInsertPage")
	public String restaurantInsertPage(HttpSession session, Model model) {
		// 미로그인, 점주 회원이 아닐 경우 
		String c_Id = (String)session.getAttribute("cId");
		if(c_Id == null) {
			model.addAttribute("msg", "로그인 해주세요");
			return "fail_back";
		}
		return "owner/restaurantInsertPage";
	}
	
		// 가게 추가 클릭시 가게등록 작업, 가게 등록 완료 후 메뉴 등록, 예약시간 등록
		@PostMapping("restaurantInsertPro")
		public String restaurantInsertPro(RestaurantVO restaurant, MenuListVO arrMenuList, TimesListVO arrTimeList, Model model, HttpSession session) {
			// 가게
			System.out.println(restaurant);
			// 메뉴 목록
			System.out.println(arrMenuList);
			// 예약 시간
			System.out.println(arrTimeList);
			
			// 미로그인, 점주 회원이 아닐 경우
			String c_Id = (String)session.getAttribute("cId");
			if(c_Id == null) {
				model.addAttribute("msg", "로그인 해주세요");
				return "fail_back";
			}
			
			// ---------------------------------------------------------------
			// 업로드(upload) 폴더 생성 
			// 실제 업로드 경로
			String uploadDir = "/resources/upload";
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			System.out.println("실제 업로드 경로 : "+ saveDir);
			
			String subDir = ""; // 서브디렉토리(날짜 구분)
			
			// 날짜별 디렉토리 자동 분류 
			try {
				// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
				Date date = new Date(); 

				// 2. SimpleDateFormat 클래스 활용
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
				subDir = sdf.format(date);
				saveDir += "/" + subDir;
				
				// java.nio.file.Paths 클래스의 get() 메서드 호출
				Path path = Paths.get(saveDir);
				
				// Files 클래스의 createDirectories() 메서드 호출
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			// ---------------------------------------------------------------(파일 수정)
			// VO MultipartFile 객체 꺼내기
			MultipartFile mFile1 = restaurant.getRes_file1();
			MultipartFile mFile2 = restaurant.getRes_file2();
			MultipartFile mFile3 = restaurant.getRes_file3();
			// arrMenuList MenuListVO 객체 꺼내기 (배열)
			MultipartFile[] arrMenuFile = arrMenuList.getMe_file();
			// ---------------------------------------------------------------
			
			// 파일명 중복 방지
			// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
			String uuid = UUID.randomUUID().toString();
			// UUID 값 원본 파일명 앞에 결합(맨 앞자리 8자리 문자열만 활용)
			// VO객체 원본 파일에 저장
			// ---------------------------------------------------------------(파일 수정)
			// 기본값 널스트링 
			restaurant.setRes_photo1("");
			restaurant.setRes_photo2("");
			restaurant.setRes_photo3("");
			
			// arrMenuList 원본 파일명 기본값 널스트링 저장
			
			String[] np = new String[arrMenuList.getMe_name().length];
			for(int i = 0; i < arrMenuList.getMe_name().length; i++) {
				np[i] = "";
			}
			arrMenuList.setMe_photo(np);
			
			// 파일명을 저장할 변수 
			String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
			String fileName2 = uuid.substring(0, 8) + "_" + mFile2.getOriginalFilename();
			String fileName3 = uuid.substring(0, 8) + "_" + mFile3.getOriginalFilename();
			
			// 메뉴 파일명을 저장할 배열
			String[] arrFileName = new String[arrMenuList.getMe_name().length];
			for(int i = 0; i < arrFileName.length; i++) {
				String fileName = uuid.substring(0, 8) + "_" + arrMenuFile[i].getOriginalFilename();
				arrFileName[i] = fileName;
			}
			
			
			if(!mFile1.getOriginalFilename().equals("")) {
				restaurant.setRes_photo1(subDir + "/" + fileName1);
			}
			if(!mFile2.getOriginalFilename().equals("")) {
				restaurant.setRes_photo2(subDir + "/" + fileName2);
			}
			if(!mFile3.getOriginalFilename().equals("")) {
				restaurant.setRes_photo3(subDir + "/" + fileName3);
			}
			
			for(int i = 0; i < arrMenuList.getMe_name().length; i++) {
				if(!arrMenuFile[i].getOriginalFilename().equals("")) {
					np[i] = subDir + "/" + arrFileName[i];
				}
			}
			arrMenuList.setMe_photo(np);
			
			
			// ---------------------------------------------------------------
			System.out.println("실제 업로드 파일명1 : " + restaurant.getRes_photo1());
			System.out.println("실제 업로드 파일명2 : " + restaurant.getRes_photo2());
			System.out.println("실제 업로드 파일명3 : " + restaurant.getRes_photo3());
			
			for(int i = 0; i < arrMenuList.getMe_name().length; i++) {
				System.out.println("메뉴 파일명 " + i + arrMenuList.getMe_photo()[i]);
			}
			
			// c_idx 가져오기 위해 VO에 저장 
			restaurant.setC_id(c_Id);
			// 사업자등록번호 중복시 실패 => 사업자번호 인증 api
			int insertCount = service.registStore(restaurant);
			
			// 성공시 restaurantList 리다이렉트 
			// 실패시 fail_back.jsp 가게등록 실패 출력
			if(insertCount > 0) { // 성공
				// ----------------------------------------------(파일 수정)
				try {
					if(!mFile1.getOriginalFilename().equals("")) {
						mFile1.transferTo(new File(saveDir, fileName1));
					}
					if(!mFile2.getOriginalFilename().equals("")) {
						mFile2.transferTo(new File(saveDir, fileName2));
					}
					if(!mFile3.getOriginalFilename().equals("")) {
						mFile3.transferTo(new File(saveDir, fileName3));
					}
					
					// 메뉴 사진
					for(int i = 0; i < arrMenuList.getMe_name().length; i++) {
						if(!arrMenuFile[i].getOriginalFilename().equals("")) {
							arrMenuFile[i].transferTo(new File(saveDir, arrFileName[i]));
						}
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// ----------------------------------------------
				// 메뉴 추가 DB 작업 
				// 방금 등록한 가게의 res_idx 조회 (c_idx와 res_brn으로 조회)
				int c_idx = restaurant.getC_idx();
				String res_brn = restaurant.getRes_brn();
				int res_idx = service.selectRestaurantRes_idx(c_idx, res_brn);
				System.out.println(res_idx);
//				List<MenuVO> menuList = new ArrayList<MenuVO>();
				for(int i = 0; i < arrMenuList.getMe_name().length; i++) {
					
					MenuVO menu = new MenuVO();
					menu.setMe_name(arrMenuList.getMe_name()[i]);
					menu.setMe_price(arrMenuList.getMe_price()[i]);
					menu.setMe_context(arrMenuList.getMe_context()[i]);
					menu.setMe_photo(arrMenuList.getMe_photo()[i]);
					menu.setRes_idx(res_idx);
					
					
//					menuList.add(menu);
					// 메뉴 등록 요청
					// c_idx, res_brn 파라미터로 전달하여 mapper에서 조회도 가능
					int insertMenuCount = menuService.registMenu(menu);
					
					// 메뉴 idx 조회 
					int me_idx = menuService.getMeIdx(menu);
					
					
					
					if(insertMenuCount > 0) { // 메뉴 등록 성공시 예약 시간 등록요청
						
						// 중복값 발생 이유 => menu반복문안이라서
						for(int j = 0; j < arrTimeList.getT_time().length; j++) {
							TimesVO t_Time = new TimesVO();
							t_Time.setT_time(arrTimeList.getT_time()[j]);
							t_Time.setRes_idx(res_idx);
							// 조회한 메뉴idx 저장
							t_Time.setMe_idx(me_idx);
							timesService.insertTime(t_Time);
						}
					} else { // 메뉴 등록 실패시 
						model.addAttribute("msg", "가게 등록 실패!");
						return "fail_back";
					}
					
				}
				
				return "redirect:/restaurantList";
				
			} else { // 실패
				model.addAttribute("msg", "가게 등록 실패!");
				return "fail_back";
			}
			
		}
	
	
	//owner의 식당리스트로 이동 Mapping
	// 가게 목록 조회
	@GetMapping("restaurantList")
	public String restaurantList(Model model, HttpSession session) {
		// 미로그인, 점주 회원이 아닐 경우
		String c_Id = (String)session.getAttribute("cId");
		if(c_Id == null) {
			model.addAttribute("msg", "로그인 해주세요");
			return "fail_back";
		}
		List<RestaurantVO> restaurantList = service.getRestaurantList();
		model.addAttribute("restaurantList", restaurantList);
		return "owner/restaurantList";
	}
	
	//owner의 가게 수정 페이지로 이동 Mapping
	@GetMapping("restaurantUpdatePage")
	public String restaurantUpdatePage(@RequestParam int res_idx, Model model, HttpSession session) {
		// 미로그인, 점주 회원이 아닐 경우
		String c_Id = (String)session.getAttribute("cId");
		if(c_Id == null) {
			model.addAttribute("msg", "로그인 해주세요");
			return "fail_back";
		}
		
		// 가게 정보 불러오기
		RestaurantVO restaurant = service.getRestaurantInfo(res_idx);
		
//		model.addAttribute("res_idx", res_idx);
		model.addAttribute("restaurant", restaurant);
		return "owner/restaurantUpdatePage";
	}
	
	// 가게 정보 수정 작업
	@PostMapping("restaurantUpdate")
	public String restaurantUpdate(RestaurantVO restaurant, Model model, HttpSession session) {
		// 미로그인, 점주 회원이 아닐 경우
		String c_Id = (String)session.getAttribute("cId");
		if(c_Id == null) {
			model.addAttribute("msg", "로그인 해주세요");
			return "fail_back";
		}
		System.out.println(restaurant);
		// ---------------------------------------------------------------
		// 업로드(upload) 폴더 생성 
		// 실제 업로드 경로
		String uploadDir = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : "+ saveDir);
		
		String subDir = ""; // 서브디렉토리(날짜 구분)
		
		// 날짜별 디렉토리 자동 분류 
		try {
			// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
			Date date = new Date(); 

			// 2. SimpleDateFormat 클래스 활용
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			
			// java.nio.file.Paths 클래스의 get() 메서드 호출
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 createDirectories() 메서드 호출
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// ---------------------------------------------------------------(파일 수정)
		// VO MultipartFile 객체 꺼내기
		MultipartFile mFile1 = restaurant.getRes_file1();
		MultipartFile mFile2 = restaurant.getRes_file2();
		MultipartFile mFile3 = restaurant.getRes_file3();
		// ---------------------------------------------------------------
		
		// 파일명 중복 방지
		// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
		String uuid = UUID.randomUUID().toString();
		// UUID 값 원본 파일명 앞에 결합(맨 앞자리 8자리 문자열만 활용)
		// VO객체 원본 파일에 저장
		// ---------------------------------------------------------------(파일 수정)
		// 기본값 널스트링 
		restaurant.setRes_photo1("");
		restaurant.setRes_photo2("");
		restaurant.setRes_photo3("");
		// 파일명을 저장할 변수 
		String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		String fileName2 = uuid.substring(0, 8) + "_" + mFile2.getOriginalFilename();
		String fileName3 = uuid.substring(0, 8) + "_" + mFile3.getOriginalFilename();
		
		
		if(!mFile1.getOriginalFilename().equals("")) {
			restaurant.setRes_photo1(subDir + "/" + fileName1);
		}
		if(!mFile2.getOriginalFilename().equals("")) {
			restaurant.setRes_photo2(subDir + "/" + fileName2);
		}
		if(!mFile3.getOriginalFilename().equals("")) {
			restaurant.setRes_photo3(subDir + "/" + fileName3);
		}
		
		// ---------------------------------------------------------------
		System.out.println("실제 업로드 파일명1 : " + restaurant.getRes_photo1());
		System.out.println("실제 업로드 파일명2 : " + restaurant.getRes_photo2());
		System.out.println("실제 업로드 파일명3 : " + restaurant.getRes_photo3());
		
		
		// c_Id 의 가게인지 확인 필요?
		
		// 가게 정보 수정 작업
		int updateCount = service.ModifyRestaurant(restaurant);
		// 성공시  success_forward.jsp 로 이동 가게 정보 수정 완료 출력
		// 실패시 가게 정보 수정 실패! 출력
		if(updateCount > 0) {
			// ----------------------------------------------(파일 수정)
			try {
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				if(!mFile2.getOriginalFilename().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
				if(!mFile3.getOriginalFilename().equals("")) {
					mFile3.transferTo(new File(saveDir, fileName3));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// ----------------------------------------------
			model.addAttribute("msg", "가게 정보 수정 완료");
			model.addAttribute("targetURL", "restaurantList");
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
	
	@PostMapping("ownerWithdrawalPro")
	public String ownerWithdrawalPro(HttpSession session, @RequestParam(defaultValue = "") String c_passwd, Model model) {
		
		if(c_passwd.equals("")) {
			model.addAttribute("msg","비밀번호를 입력해주세요.");
			return "fail_back";
		}
		
		String id = (String)session.getAttribute("cId");
		
		CeoVO ceo = ceoService.SelectCeo(id);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(!passwordEncoder.matches(c_passwd, ceo.getC_passwd())) {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
			return "fail_back";
		}
		
		int deleteCount = ceoService.secessionCeo(ceo.getC_idx());
		
		if(deleteCount <= 0) {
			model.addAttribute("msg","회원탈퇴를 실패하였습니다.");
			return "fail_back";
		}
		
		session.invalidate();
		
		model.addAttribute("success","회원탈퇴 되었습니다.\\n이후에 다시 뵙길 기원하겠습니다.");
		return "secession_success";
	}

	
	//owner의 점주정보 페이지로 이동 Mapping
	@PostMapping("ownerInfo")
	public String ownerInfo(HttpSession session, @RequestParam String id, @RequestParam String passwd, HttpServletRequest request, HttpServletResponse response,
	        Model model) {
		
		CeoVO ceo = ceoService.SelectCeo(id);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(ceo == null || !passwordEncoder.matches(passwd, ceo.getC_passwd())) {
			try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w;
				w = response.getWriter();
				String msg = "비밀번호가 틀립니다!";
				w.write("<script>alert('"+msg+"');history.go(-1);</script>");
				w.flush();
				w.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		}
		ceo.setC_email1(ceo.getC_email().split("@")[0]);
		ceo.setC_email2(ceo.getC_email().split("@")[1]);
		
		
		model.addAttribute("ceo", ceo);
		
		return "owner/ownerInfo";
	
	}
	
	@PostMapping("OwnerInfoPro")
	public String OwnerInfoPro(CeoVO ceo, Model model) {
		
		//암호화
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		String securePasswd = passwordEncoder.getCryptoPassword(ceo.getC_passwd());
		ceo.setC_passwd(securePasswd);
		
		ceoService.updateCeo(ceo);
		model.addAttribute("ceo", ceo);
		System.out.println(ceo);
		
		return "redirect:ownerMypage";
		
	}
	
}
