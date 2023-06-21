package com.itwillbs.test.mapper;

import java.util.List;
import java.util.Map;

import com.itwillbs.test.vo.LikeInfoVO;

public interface LikeInfoMapper {
	//LikeInfoVO 객체를 매개변수로 받아 찜하기 상태를 토글
    public void toggleLikeStatus(Map<String, Object> map);
    
    //찜한 가게 출력
	public List<LikeInfoVO> selectLikeList();

	//찜하기 취소
	public void deletcount(int res_idx, String m_id, String liked);
	
}
