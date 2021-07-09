package com.callor.gallery.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.gallery.model.FileDTO;
import com.callor.gallery.model.GalleryDTO;
import com.callor.gallery.model.GalleryFilesDTO;
import com.callor.gallery.persistance.ext.FileDao;
import com.callor.gallery.persistance.ext.GalleryDao;
import com.callor.gallery.service.FileService;
import com.callor.gallery.service.GalleryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service("galleryServiceV1")
public class GalleryServiceImplV1 implements GalleryService {

	protected final GalleryDao gaDao;
	protected final FileDao fDao;

	@Qualifier("fileServiceV2")
	protected final FileService fService;

	/*
	 * @Autowired가 설정된 변수, method, 객체 등을 만나면
	 * Spring framework는 변수를 초기화,
	 * 		method를 싱행하여 또 변수 초기화
	 * 		이미 생성되어 준비된 객체에 주입등을 수행한다
	 */
	@Autowired
	public void create_table(GalleryDao gDao) {
		Map<String, String> maps = new HashMap<String, String>();
		gaDao.create_table(maps);
		fDao.create_table(maps);

	}

	@Override
	public int insert(GalleryDTO galleryDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void input(GalleryDTO gaDTO,
			MultipartFile one_file, 
			MultipartHttpServletRequest m_file) throws Exception {

		// 대표이미지가 업로드 되면...
		// 이미지를 서버에 저장하고 
		// 저장된 파일의 이름을 return 받기
		String strUUID = fService.fileUp(one_file);

		// DTO에 이미지 이름을 저장하기
		gaDTO.setG_image(strUUID);

		log.debug("INSERT 전 seq {}", gaDTO.getG_seq());

		// GalleryDTO에 담긴 데이터를 tbl_gallery table에 insert 하기
		// mapper에서 insert를 수행한 후 새로 새성된 g_seq값을
		//		selectKey 하여 gaDTO의 g_seq변수에 담아놓은 상태이다
		gaDao.insert(gaDTO);
		log.debug("INSERT 후 seq {}", gaDTO.getG_seq());
		// 갤러리 게시판 seq 값과 파일들을 묶음으로 insert하기 위한
		// 준비하기
		Long g_seq = gaDTO.getG_seq();

		List<FileDTO> files = new ArrayList<FileDTO>();
		// 업로드된 멀티파일을 서버에 업로드 하고
		// 원래 파일이름과 UUID 가 첨가된 파일ㅇ름을 추출하여
		// FileDTO에 담고
		// 다시 list에 담아놓는다
		
		List<MultipartFile> mfiles = m_file.getFiles("m_file");
		for (MultipartFile file : mfiles) {
			String filrOriginName = file.getOriginalFilename();
			String fileUUName = fService.fileUp(file);

			FileDTO fDto = FileDTO.builder().
					file_gseq(g_seq). // 갤러리 데이터의 PK값
					file_original(filrOriginName).
					file_upname(fileUUName)
					.build();
			files.add(fDto);
		}
		log.debug("이미지들 {}", files.toString());
		
		fDao.insertWithList(files);
	}

	@Override
	public List<GalleryDTO> selectAll() throws Exception {
		// TODO Auto-generated method stub

		List<GalleryDTO> gaList = gaDao.selectAll();
		log.debug("갤러리 리스트 {}", gaList.toString());
		return gaList;
	}

	@Override
	public List<GalleryFilesDTO> findByIdGalleryFiles(Long g_seq) {
		
		/*
		 * dao로 부터 select를 한 후 데이터검증하기 위해 사용하는 코드
		 * gfList가 데이터가 조회되지 않아 null이 발생할수 있다
		 */
		List<GalleryFilesDTO> gfList = gaDao.findByIdGalleryFiles(g_seq);
		if(gfList != null && gfList.size() < 0) {
			
		}
		
		
		return gfList;
	}

	@Override
	public GalleryDTO findByIdGallery(Long g_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Long g_seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
