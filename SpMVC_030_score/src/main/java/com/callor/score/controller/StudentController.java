package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	protected final StudentService stService;
	
	@RequestMapping(value={"/",""} , method=RequestMethod.GET)
	public String studentList (Model model) {
		
		List<StudentVO> stList = stService.selectAll();
		
		log.debug("Student {}", stList.toString());
		
		model.addAttribute("STUDENTS", stList);
		
		model.addAttribute("BODY","STUDENT_LIST");
		
		return "home";
		
	}
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert(Model model) {
		
		model.addAttribute("BODY", "STUDENT_INPUT");
		
		return "home";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(StudentVO studentVO, Model model) {
		
		
		model.addAttribute("BODY", "STUDENT_INPUT");
		
		return "home";
	}
	
	
	
}
