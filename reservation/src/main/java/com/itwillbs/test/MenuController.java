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
	
	// 메뉴 삭제
	@GetMapping("menuDelete")
	public String menuDelete(@RequestParam int me_idx, Model model) {
		
		int deleteCount = service.deleteMenu(me_idx);
		return "";
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
