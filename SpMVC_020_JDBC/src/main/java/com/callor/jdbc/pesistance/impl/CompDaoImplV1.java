package com.callor.jdbc.pesistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.pesistance.CompDao;

import lombok.extern.slf4j.Slf4j;
/*
 * @Component
 * 모든 component를 대표하는 Annotation
 * 컴파일 과정에서 다소 비용이 많이 소요된다
 * 
 * Component Annotation
 * @Controller, @Service, @Repository 이러한 Annotation을 사용한다
 * Spring Container에게 이 표식이 부착된 클래스를 bean으로 생성하여
 * 보관해 달라 라는 지시어
 * 
 * CompVO c = new CompVO()
 * Object o = new CompVO()
 * 
 * CompServiceImplV1 cs = new CompServiceImplV1();
 * CompService cs1 = new CompServiceImplV2();
 */
@Slf4j
@Repository("compDaoV1")
public class CompDaoImplV1 implements CompDao{
	
	protected final JdbcTemplate jdbcTemplate;
	
	public CompDaoImplV1(JdbcTemplate jdbcTemplate) {
		// TODO Auto-generated constructor stub
		this.jdbcTemplate = jdbcTemplate; 
	}

	@Override
	public List<CompVO> selectAll() {
		// TODO Auto-generated method stub
		
		String sql = " SELECT * FROM tbl_company ";
		
		List<CompVO> comps = jdbcTemplate.query(sql,
				new BeanPropertyRowMapper<CompVO>(CompVO.class));
		
		log.debug("SELECT {}" ,comps.toString());
		return null;
	}

	@Override
	public CompVO findById(String pk) {
		// TODO Auto-generated method stub
		String sql = " SELECT * FROM tbl_company ";
		sql += " WHERE cp_code = ? ";
		
		Object[] params = new Object[] { pk };
		
		CompVO vo 
		= (CompVO) jdbcTemplate.query(sql, params,
				new BeanPropertyRowMapper<CompVO>(CompVO.class));
				
		return vo;
	}

	@Override
	public int insert(CompVO vo) {
		// TODO Auto-generated method stub
		String sql = " INSERT INTO tbl_company ";
		sql+= " ( cp_code, cp_title, cp_ceo, cp_tel, cp_addr ) ";
		sql+= " VALUES( ?,?,?,?,? ) ";
		
		Object[] params = new Object[] {
				vo.getCp_code(),
				vo.getCp_title(),
				vo.getCp_ceo(),
				vo.getCp_tel(),
				vo.getCp_addr()
		};
		
		return jdbcTemplate.update(sql,params);
	}

	@Override
	public int update(CompVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * jdbcTemplate을 사용하여 QUERY를 실행할때
	 * 각 method에서 매개변수를 받아
	 * QUERY에 전달할텐데
	 * 이때 매개변수는 primitive로 받으면 값을 변환시키는 어려움이 있다
	 * 권장사항으로 매개변수는 wrapper class type으로 설정
	 * 즉 숫자형일 경우 int, long 대신 Integer, Long 형으로 선언
	 * 
	 * vo에 담겨서 전달된 값은 Object[] 배열로 변환한 후
	 * jdbcTemplate에 전달해 주어야 한다
	 * 
	 * 하지만, 1 ~ 2개 정도의 값을 전달할때 Object[] 배열로 변환 후
	 * 전달을 하면 Object 객체 저장소가 생성되고 메모리를 사용한다
	 * 이때 전달되는 변수가 wrapper class type이면
	 * Object[] 배열로 만들지 않고 바로 주입될수 있다 
	 */
	@Override
	public int delete(String cpcode) {
		// TODO 출판사 정보 삭제
		String sql = " DELETE FROM tbl_company ";
		sql += " WHERE cp_code = ? ";
		
		// cpcode가 String wrapper class type 이므로
		// Object[] 배열로 변환하지 않고 바로 전달이 가능하다
		// Object[] params = new Object[] { cpcode };
		return jdbcTemplate.update(sql, cpcode);
	}

	@Override
	public List<CompVO> findByCName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> findByTel(String tel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> findByCeo(String ceo) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * tbl_company table에서 cpcode(출판사코드) 중
	 * 가장 큰값을 추출하기
	 */
	@Override
	public String findByMaxCode() {
		String sql = " SELECT MAX(cp_code) FROM tbl_company ";
		
		String cpCode
		= (String) jdbcTemplate.queryForObject(sql, String.class);
		
		return cpCode;
	}

}
