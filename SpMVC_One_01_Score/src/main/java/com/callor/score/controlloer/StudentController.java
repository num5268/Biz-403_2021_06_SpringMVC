package com.callor.score.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {

	public String student (Model model ) {
		
		return "student";
	}
}
