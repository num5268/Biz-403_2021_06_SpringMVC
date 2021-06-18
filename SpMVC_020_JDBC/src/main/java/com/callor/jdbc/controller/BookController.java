package com.callor.jdbc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.jdbc.model.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping( value="/books" )
public class BookController {
	
	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public String books(HttpSession hSession, Model model) {
		// HttpSession에서 USERVO 정보 찾기
		Object obj = hSession.getAttribute("USERVO");
		UserVO userVO = (UserVO)obj;
		// USERVO 정보가 없으면
		if(userVO == null) {
			// Login 화면으로 점프
			model.addAttribute("MSG", "LOGIN");
			return "redirect:/member/login";
		}
		log.debug("books Root");
		return "books/list";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert() {
		return "books/input";
	}

}
