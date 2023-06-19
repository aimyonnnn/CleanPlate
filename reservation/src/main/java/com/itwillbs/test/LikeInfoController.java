package com.itwillbs.test;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.LikeInfoService;

@Controller
public class LikeInfoController {

    @Autowired
    private LikeInfoService likeInfoService;

    @ResponseBody
    @RequestMapping(value = "/toggleLikeStatus", method = RequestMethod.GET)
    public String toggleLikeStatus(HttpServletRequest request) {
        System.out.println("likeInfoService.toggleLikeStatus");
        String response = "ok";

        String rex_idx_st = request.getParameter("rex_idx");
        int rex_idx = Integer.parseInt(rex_idx_st);
        String m_id = request.getParameter("m_id"); 
        String liked = request.getParameter("liked");

        System.out.println(rex_idx);
        likeInfoService.toggleLikeStatus(rex_idx, m_id, liked);

        return response;
    }

}
