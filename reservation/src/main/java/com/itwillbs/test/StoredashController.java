package com.itwillbs.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.test.service.StoredashService;
import com.itwillbs.test.vo.StoredashVO;

@Controller
public class StoredashController {
    private StoredashService storedashService;

    public StoredashController(StoredashService storedashService) {
        this.storedashService = storedashService;
    }

    private String getCIdFromSomeWhere(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String cId = (String) session.getAttribute("c_id");
        return cId;
    }

    @GetMapping("storeDashBoard")
    public String storeDashBoard(HttpSession session, Model model) {
        // 오늘의 총 예약수
    	String cId = (String) session.getAttribute("c_id");
//    	session.setAttribute("cId", cId);
        int dailyStore = storedashService.getTodayReservationCounts(cId);
        model.addAttribute("dailyStore", dailyStore);

        // 이번 달 총 예약수
        int monthlyStore = storedashService.getMonthlyReservationCounts(cId);
        model.addAttribute("monthlyStore", monthlyStore);

        // 일간 매출 조회
        int todaySalesAmount = storedashService.getTodaySalesAmount(cId);
        model.addAttribute("todaySalesAmount", todaySalesAmount);

        // 일주일 매출 조회
        int weeklyAllSalesAmount = storedashService.getWeeklyallSalesAmount(cId);
        model.addAttribute("weeklyAllSalesAmount", weeklyAllSalesAmount);

        // 일간 예약 수 조회
        List<Integer> todayReservationCount = storedashService.getReservationCount(cId);
        model.addAttribute("todayReservationCount", todayReservationCount);
        
        // 최근 1주일 간 매출 금액 조회
        List<Integer> weeklySalesAmount = storedashService.getWeeklySalesAmount(cId);
        model.addAttribute("weeklySalesAmount", weeklySalesAmount);

        return "owner/storeDashBoard";
    }

    private List<StoredashVO> convertToStoredashVOList(List<Map<String, Object>> reservationCounts, HttpServletRequest request) {
        List<StoredashVO> storedashVOList = new ArrayList<>();
        HttpSession session = request.getSession();
        String cId = (String) session.getAttribute("c_id"); 
        for (Map<String, Object> reservationCount : reservationCounts) {
            StoredashVO storedashVO = new StoredashVO();
            storedashVO.setStoreId((int) reservationCount.get("storeId"));
            storedashVO.setReservationCount((int) reservationCount.get("reservationCount"));
            storedashVO.setC_id(cId);
            storedashVOList.add(storedashVO);
        }
        return storedashVOList;
    }

}
