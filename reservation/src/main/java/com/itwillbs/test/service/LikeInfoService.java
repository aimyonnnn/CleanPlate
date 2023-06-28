package com.itwillbs.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.LikeInfoMapper;
import com.itwillbs.test.vo.LikeInfoVO;

@Service
public class LikeInfoService {
	
	@Autowired
	private LikeInfoMapper mapper;

	public void toggleLikeStatus(int res_idx, String m_id, String liked) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("res_idx", res_idx);
	    map.put("m_id", m_id);
	    map.put("liked", liked);
	    
	    LikeInfoVO likeInfo = mapper.getLikeInfo(map);
	    if (likeInfo != null) {
	        // 이미 존재하는 경우에는 삭제
	        mapper.deleteFromLikes(map);
	    } else {
	        // 존재하지 않는 경우에는 추가
	        mapper.toggleLikeStatus(map);
	    }
	}
   
    //찜한 가게 목록 출력
	  public List<Map<String, Object>> memberLikelist(String sId) {
			return mapper.memberLikelist(sId);
	};
	
	// 찜하기 취소(하트)
	public void deletcount(int res_idx, String m_id, String liked) { 
		mapper.deletcount(res_idx, m_id, liked);
	}

	// 찜하기 해제(버튼)
	public void deleteFromLikes(Map<String, Object> paramMap) {
		mapper.deleteFromLikes(paramMap);		
	}

	
}
