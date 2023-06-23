package com.itwillbs.test;

import java.util.*;

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
	
	// 모달창의 menuVO 값 가져오기
	@PostMapping("menuVOInsert")
	@ResponseBody
	public MenuVO menuVOInsert(@ModelAttribute MenuVO menu) throws Exception {
		System.out.println(menu);
		
		return menu;
	}
	
	// 메뉴 추가
	@PostMapping("menuInsert")
	public String menuInsert(MenuVO menu, Model model) {
		System.out.println(menu);
		
		
		
		// 메뉴 추가 작업 
		int insertCount = service.registMenu(menu);
		
		// 성공시 가게 목록 조회 작업
		// 실패시 이전페이지 
		if(insertCount > 0) {
			model.addAttribute("menu", menu);
			return "success";
			
		} else {
			model.addAttribute("msg", "메뉴 등록 실패!");
			return "fail";
		}
		
	}
	
	
	
	// 메뉴 목록 조회
	@GetMapping ("menuInfo")
	public String menuInfo(Model model) {
		List<MenuVO> menuList = service.getMenuList();
		model.addAttribute("menuList", menuList);
		return "owner/restaurantInsertPage";
	}

}
