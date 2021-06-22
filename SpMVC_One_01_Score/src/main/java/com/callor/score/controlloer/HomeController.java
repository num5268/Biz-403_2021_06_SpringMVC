package com.callor.score.controlloer;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ListVO;
import com.callor.score.service.ListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	protected ListService listService;
	
	public HomeController(ListService listService) {
		this.listService = listService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<ListVO> listVO = listService.viewStudentAndScore();
		
		model.addAttribute("LIST",listVO);
		return "home";
	}
	
}

