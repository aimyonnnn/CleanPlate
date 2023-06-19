package com.itwillbs.test.mapper;

import java.util.Map;

public interface LikeInfoMapper {
	//LikeInfoVO 객체를 매개변수로 받아 찜하기 상태를 토글
    public void toggleLikeStatus(Map<String, Object> map);
}
