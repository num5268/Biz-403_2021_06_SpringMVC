package com.callor.book.controller.notuse.copy;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.book.model.MovieDTO;
import com.callor.book.service.NaverMovieService;

import lombok.RequiredArgsConstructor;

//@Controller
@RequiredArgsConstructor
//@RequestMapping(value="/movie")
public class NaverMovieController {

	protected final NaverMovieService nMovieService;
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home (@RequestParam(name="/search", required = false, defaultValue = "")
		String search, Model model) throws MalformedURLException, IOException, ParseException {
		
	//	model.addAttribute("pHolder", "영화 검색어");
		model.addAttribute("CAT","MOVIE");
		if (search != null && !search.equals("")) {
			String queryURL = nMovieService.queryURL(search.trim());
			String jsonString = nMovieService.getJsonString(queryURL);
			List<MovieDTO> movieList = nMovieService.getNaverList(jsonString);
			model.addAttribute("MOVIES", movieList);
		}
		return "home";
		
	}
	
}
