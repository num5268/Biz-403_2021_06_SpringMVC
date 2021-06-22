package com.callor.score.service;

import java.util.List;

import com.callor.score.model.ListVO;
import com.callor.score.model.ScoreVO;

public interface ListService {


	public List<ListVO> listScore();
	public List<ScoreVO> listScore2();
	public List<ListVO> viewStudentAndScore();
}
