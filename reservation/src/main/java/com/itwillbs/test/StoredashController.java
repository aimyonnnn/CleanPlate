package com.itwillbs.test;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.test.service.StoredashService;

@Controller
public class StoredashController {
    private StoredashService storedashService;

    public StoredashController(StoredashService storedashService) {
        this.storedashService = storedashService;
    }

    private String getCIdFromSomeWhere(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String cId = (String) session.getAttribute("cId");
        System.out.println("Retrieved c_id value from session: " + cId);

        return cId;
    }

    @GetMapping("storeDashBoard")
    public String storeDashBoard(Model model, HttpServletRequest request) {
        String cId = getCIdFromSomeWhere(request);
        model.addAttribute("cId", cId);

        int dailyStore = storedashService.getTodayReservationCounts(cId);
        model.addAttribute("dailyStore", dailyStore);

        int monthlyStore = storedashService.getMonthlyReservationCounts(cId);
        model.addAttribute("monthlyStore", monthlyStore);

        int todaySalesAmount = storedashService.getTodaySalesAmount(cId);
        model.addAttribute("todaySalesAmount", todaySalesAmount);

        int weeklyAllSalesAmount = storedashService.getWeeklyallSalesAmount(cId);
        model.addAttribute("weeklyAllSalesAmount", weeklyAllSalesAmount);

//        List<Map<String, Object>> dailyOrderCounts = storedashService.getDailyOrderCounts(cId);
//        model.addAttribute("dailyOrderCounts", dailyOrderCounts);

        return "owner/storeDashBoard";
    }

}
