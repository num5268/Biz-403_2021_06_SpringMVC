package com.callor.book.controller.notuse.copy;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
//@RequestMapping(value="/news")
public class NaverNewsController {

	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home (Model model) {
		
	//	model.addAttribute("pHolder", "뉴스 검색어");
		model.addAttribute("CAT","NEWS");
		
		return "home";
		
	}
	
}
