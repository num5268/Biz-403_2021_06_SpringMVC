package com.callor.score.service;

import java.util.List;

import com.callor.score.model.StudentVO;

public interface StudentService {
	
	public List<StudentVO> listAll();
	
	public Integer insert(StudentVO stVO);
	public Integer update(StudentVO stVO);
	public Integer delete();
	
}
