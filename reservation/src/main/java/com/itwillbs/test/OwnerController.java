package com.itwillbs.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class OwnerController {

	@GetMapping("storeSalesGraph")
	public String storeSalesGraph(){
		return "owner/store_SalesGraph";
	}
	
	
	
	
}
