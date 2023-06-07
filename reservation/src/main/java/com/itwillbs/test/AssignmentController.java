package com.itwillbs.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AssignmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(AssignmentController.class);
	
	@GetMapping("/assignment")
	public String Assignment() {
		return "assignment/assignment";
	}
	
	@GetMapping("/assignAgree")
	public String login() {
		return "assignment/assignAgree";
	}
	
	@PostMapping("/assignAgreePro")
	public String loginProcess(@RequestParam String id, HttpServletRequest request) {
//		
//		logger.info("Welcome "+id);
//		
//    	HttpSession session = request.getSession();
//    	session.setAttribute("id", id);
		return "assignment/assignmentChat";
	}
	
}
