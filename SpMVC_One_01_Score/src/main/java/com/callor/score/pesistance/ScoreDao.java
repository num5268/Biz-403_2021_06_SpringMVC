package com.callor.score.pesistance;

import java.util.List;

import com.callor.score.model.ScoreVO;

public interface ScoreDao {
	
	public String findByMaxCode();
	
	public List<ScoreVO> findByStNum(String stNum);
	
}
