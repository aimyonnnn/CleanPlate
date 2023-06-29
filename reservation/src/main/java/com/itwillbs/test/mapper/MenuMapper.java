package com.itwillbs.test.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.test.vo.*;

@Mapper
public interface MenuMapper {

	// 가게 등록
	int insertMenu(MenuVO menu);

	// 메뉴리스트 조회
	List<MenuVO> selectMenuList();

	// 특정 가게의 메뉴리스트 조회 
	List<MenuVO> selectedRestaurantMenuList(int res_idx);
	
	// me_idx를 가져옴
	int getIdx(MenuVO menu);

	int deleteMenu(int me_idx);



}
