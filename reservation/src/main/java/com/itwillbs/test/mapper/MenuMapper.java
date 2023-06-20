package com.itwillbs.test.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.test.vo.*;

@Mapper
public interface MenuMapper {

	int insertMenu(MenuVO menu);

	List<MenuVO> selectMenuList();


}
