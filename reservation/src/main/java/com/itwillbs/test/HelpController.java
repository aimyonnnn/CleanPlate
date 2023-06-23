package com.itwillbs.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelpController {

	@GetMapping("helpHome")
	public String helpHome(@RequestParam(defaultValue = "1")int index, Model model) {
		
		return "help/help_home";
	}
}
