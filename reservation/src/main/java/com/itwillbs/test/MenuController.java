package com.itwillbs.test;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.test.service.*;
import com.itwillbs.test.vo.*;

@Controller
public class MenuController {
	@Autowired
	private MenuService service;
	
	
	// 모달창의 MenuVO 값 가져오기
	@ResponseBody
	@PostMapping("menuVOInsert")
	public MenuVO menuVOInsert(@ModelAttribute MenuVO menu, HttpSession session) throws Exception {
//		System.out.println(menu);
		// 파일 업로드
		
		return menu;
	}
	 
	
	
	// 메뉴 추가
	@ResponseBody
	@PostMapping("menuInsert")
	public String menuInsert(@ModelAttribute List<MenuVO> menuList, Model model) {
		System.out.println("menuInsert 안 " + menuList);
		
		return "";
		
		// 메뉴 추가 작업 
//		int insertCount = service.registMenu(menu);
		
		// 성공시 가게 목록 조회 작업
		// 실패시 이전페이지 
//		if(insertCount > 0) {
//			model.addAttribute("menu", menu);
//			return "success";
//			
//		} else {
//			model.addAttribute("msg", "메뉴 등록 실패!");
//			return "fail";
//		}
		
	}
	
	
	
	// 메뉴 목록 조회
	@GetMapping ("menuInfo")
	public String menuInfo(Model model, HttpSession session) {
		
		if(session.getAttribute("sId") != null || session.getAttribute("cId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		List<MenuVO> menuList = service.getMenuList();
		model.addAttribute("menuList", menuList);
		return "owner/restaurantInsertPage";
	}

}
