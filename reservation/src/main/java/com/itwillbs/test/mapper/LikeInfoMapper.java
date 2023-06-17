package com.itwillbs.test.mapper;

import com.itwillbs.test.vo.LikeInfoVO;

public interface LikeInfoMapper {
	//LikeInfoVO 객체를 매개변수로 받아 찜하기 상태를 토글
    void toggleLikeStatus(LikeInfoVO likeInfo);
}
