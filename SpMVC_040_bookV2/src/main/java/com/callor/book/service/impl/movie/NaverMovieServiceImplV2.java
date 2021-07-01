package com.callor.book.service.impl.movie;

import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.callor.book.config.NaverQualifier;
import com.callor.book.model.MovieDTO;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(NaverQualifier.NAVER_MOVIE_SERVICE_V2)
public class NaverMovieServiceImplV2 extends NaverMovieServiceImplV1 {
	
	// gSon을 사용하여 jsonString을 parsing하기 
		public List<MovieDTO> getNaverList(String jsonString) throws ParseException {
		
		log.debug("나는 ServiceV2 ");
		
		JsonElement jSonElement = JsonParser.parseString(jsonString);
		
		JsonElement oItems = jSonElement.getAsJsonObject()
										.get("items");
		Gson gson = new Gson();
		
		TypeToken<List<MovieDTO>> typeToken 
				= new TypeToken<List<MovieDTO>>() {} ;
		
		
		List<MovieDTO> movieList 
				= gson.fromJson(oItems, typeToken.getType());
		
		return movieList;
		}

}
