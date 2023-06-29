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
	@Autowired
	private TimesService timeService;
	
	// 메뉴 삭제
	@GetMapping("menuDelete")
	public String menuDelete(@RequestParam int me_idx, @RequestParam int res_idx, Model model) {
		
		int deleteCount = service.deleteMenu(me_idx, res_idx);
		if(deleteCount > 0) {
			model.addAttribute("msg", "메뉴 삭제");
			model.addAttribute("targetURL", "restaurantUpdatePage?res_idx="+res_idx);
			return "success_forward";
			
		} else {
			model.addAttribute("msg", "메뉴 삭제 실패");
			return "fail_back";
		}
	}
	
	// 예약 시간 삭제
	@GetMapping("timeDelete")
	public String timeDelete(@RequestParam String t_time, @RequestParam int res_idx, Model model) {
		
		int me_idx = service.selectMeidxT(t_time, res_idx);
		
		int deleteCount = timeService.deleteTime(t_time, me_idx);
		
		if(deleteCount > 0) {
			model.addAttribute("msg", "예약 시간 삭제");
			model.addAttribute("targetURL", "restaurantUpdatePage?res_idx="+res_idx);
			return "success_forward";
			
		} else {
			model.addAttribute("msg", "예약 시간 삭제 실패");
			return "fail_back";
		}
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
