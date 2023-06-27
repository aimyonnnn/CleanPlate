package com.itwillbs.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String storeDashBoard(Model model) {
        //일일 예약수
        List<Integer> dailystore = storedashService.getTodayReservationCounts();
        model.addAttribute("dailystore", dailystore.get(0));
        
        //1주일 예약수
        List<Integer> monthlystore = storedashService.getMonthlyReservationCounts();
        model.addAttribute("monthlystore", monthlystore.get(0));
        
        //일일 매출
        List<Integer> todaySalesAmount = storedashService.getTodaySalesAmonut();
        model.addAttribute("todaySalesAmount", todaySalesAmount);
        
        //1주일 매출 총액
        List<Integer> weeklyallSalesAmount = storedashService.getWeeklyallSalesAmount();
        model.addAttribute("weeklyallSalesAmount", weeklyallSalesAmount);
        
        //1주일 예약 수 그래프
        List<Integer> weeklyReservationCounts = storedashService.getReservationCountsByWeek();
        model.addAttribute("weeklyReservationCounts", weeklyReservationCounts);

        //1주일 매출 그래프
        List<Integer> weeklySalesAmount = storedashService.getWeeklySalesAmount();
        model.addAttribute("weeklySalesAmount", weeklySalesAmount);

        return "owner/storeDashBoard";
    }

    private List<StoredashVO> convertToStoredashVOList(List<Map<String, Object>> reservationCounts, HttpServletRequest request) {
        List<StoredashVO> storedashVOList = new ArrayList<>();
        for (Map<String, Object> reservationCount : reservationCounts) {
            StoredashVO storedashVO = new StoredashVO();
            storedashVO.setStoreId((int) reservationCount.get("res_idx"));
            storedashVO.setReservationCount((int) reservationCount.get("today_reservation_count"));
            storedashVO.setC_id(getCIdFromSomeWhere(request));
            storedashVOList.add(storedashVO);
        }
        return storedashVOList;
    }
    
}
