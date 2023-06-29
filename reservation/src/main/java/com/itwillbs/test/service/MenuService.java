package com.itwillbs.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.test.mapper.*;
import com.itwillbs.test.vo.*;

@Service
public class MenuService {
	@Autowired MenuMapper mapper;
	
	// 메뉴 추가
	public int registMenu(MenuVO menu) {
		return mapper.insertMenu(menu);
	}
	// 메뉴 리스트 조회
	public List<MenuVO> getMenuList() {
		return mapper.selectMenuList();
	}
	
	// 특정 가게의 메뉴 리스트 조회
	public List<MenuVO> getMenusList(int res_idx) {
		return mapper.selectedRestaurantMenuList(res_idx);
	}
	
	// 메뉴 최고 번호 가져오기
	public int getMeIdx(MenuVO menu) {
		return mapper.getIdx(menu);
	}
	
	// 메뉴 삭제
	public int deleteMenu(int me_idx) {
		return mapper.deleteMenu(me_idx);
	}
	

}
