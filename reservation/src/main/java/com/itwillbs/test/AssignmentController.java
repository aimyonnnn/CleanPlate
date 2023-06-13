package com.itwillbs.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.itwillbs.test.service.AssignmentService;
import com.itwillbs.test.vo.AssignmentVO;

@Controller
public class AssignmentController {
	
	@Autowired
	private AssignmentService assignmentService;
	
	private static final Logger logger = LoggerFactory.getLogger(AssignmentController.class);
	
	@GetMapping("/assignment")
	public String getAssignment(Model model) {
		
		// 양도 리스트 전체 조회
	    List<AssignmentVO> assignmentList = assignmentService.getAssignmentList();
//	    System.out.println(assignmentList);

	    model.addAttribute("assignmentList", assignmentList);
	    
	    return "assignment/assignment";
	}
	
	@GetMapping("/assignAgree")
	public String login() {
		return "assignment/assignAgree";
	}
	
	@PostMapping("/assignAgreePro")
	public String loginProcess(@RequestParam String id, HttpServletRequest request) {
		logger.info("Welcome "+id);
		return "assignment/assignmentChat";
	}
	

	
}
