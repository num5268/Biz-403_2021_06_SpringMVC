package com.callor.score.pesistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.StudentVO;
import com.callor.score.pesistance.StudentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class StudentDaoImplV1 implements StudentDao{
	
	private final JdbcTemplate jdbcTemplate;
	
	public StudentDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<StudentVO> listAll() {
		// TODO Auto-generated method stub
		
		String sql = " SELECT * FROM tbl_student ";
		
		List<StudentVO> stlist = jdbcTemplate.query(sql, 
				new BeanPropertyRowMapper<StudentVO>(StudentVO.class));
		log.debug("SELECT {}", stlist.toString());
		return stlist;
	}

}
