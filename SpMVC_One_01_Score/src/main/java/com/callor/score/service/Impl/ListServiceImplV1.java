package com.callor.score.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.ListVO;
import com.callor.score.model.ScoreVO;
import com.callor.score.pesistance.ListDao;
import com.callor.score.service.ListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("listServiceV1")
public class ListServiceImplV1 implements ListService{

	protected final ListDao listDao;
	
	public ListServiceImplV1(ListDao listDao) {
		this.listDao = listDao;
	}
	@Override
	public List<ListVO> viewStudentAndScore() {
		
		return listDao.listAll();
	}
//	@Override
//	public List<ScoreVO> viewStudentAndScore2() {
//		
//		return listDao.listAll();
//	}
	@Override
	public List<ListVO> listScore() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<ScoreVO> listScore2() {
		// TODO Auto-generated method stub
		return null;
	}

}
