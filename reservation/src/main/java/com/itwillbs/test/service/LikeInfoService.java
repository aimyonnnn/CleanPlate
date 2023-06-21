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
	  System.out.println("service_check");
	  Map<String, Object> map = new HashMap<>();
	  map.put("res_idx", res_idx);
	  map.put("m_id", m_id);
	  map.put("liked", liked);
	  mapper.toggleLikeStatus(map);
   }
   
    //찜한 가게 목록 출력
	  public List<LikeInfoVO> getMemberLike() {
			return mapper.selectLikeList();
	};
	
	// 찜하기 취소
	public void deletcount(int res_idx, String m_id, String liked) { 
		mapper.deletcount(res_idx, m_id, liked);
	}
	
}
