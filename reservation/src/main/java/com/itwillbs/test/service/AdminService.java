package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.AdminMapper;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.ReservationVO;

@Service
public class AdminService {

	@Autowired
	AdminMapper mapper;

	public List<ReservationVO> getReservationList() {
		return mapper.getReservationList();
	}
}
