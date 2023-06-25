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

    @GetMapping("/storeDashBoard")
    public String getReservationCounts(
            Model model,
            @RequestParam(value = "period", required = false) String period,
            HttpServletRequest request) {
        List<StoredashVO> counts;

        if (period != null && period.equals("monthly")) {
            List<Map<String, Object>> reservationCounts = storedashService.getMonthlyReservationCounts();
            counts = convertToStoredashVOList(reservationCounts);
        } else {
            List<Map<String, Object>> reservationCounts = storedashService.getTodayReservationCounts();
            counts = convertToStoredashVOList(reservationCounts);
        }

        for (StoredashVO count : counts) {
            count.setC_id(getCIdFromSomeWhere(request)); 
        }

        model.addAttribute("reservationCounts", counts);
        return "owner/storeDashBoard";
    }
    
    // Map을 StoredashVO 리스트로 변환하는 메소드
    private List<StoredashVO> convertToStoredashVOList(List<Map<String, Object>> reservationCounts) {
        List<StoredashVO> storedashVOList = new ArrayList<>();
        for (Map<String, Object> reservationCount : reservationCounts) {
            StoredashVO storedashVO = new StoredashVO();
            storedashVO.setStoreId((int) reservationCount.get("storeId"));
            storedashVO.setReservationCount((int) reservationCount.get("reservationCount"));
            storedashVO.setC_id((String) reservationCount.get("c_id"));
            storedashVOList.add(storedashVO);
        }
        return storedashVOList;
    }
}
