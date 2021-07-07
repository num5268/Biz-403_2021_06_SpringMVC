package com.callor.gallery.persistance.ext;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.gallery.model.FileDTO;
import com.callor.gallery.persistance.GenericDao;

public interface FileDao extends GenericDao<FileDTO, Long>{

	public int insertOrUpdate(FileDTO fileDTO);
	public int insertWithList(@Param("filesList") List<FileDTO> filesList);
	public int insertOrWithList(@Param("filesList") List<FileDTO> filesList);
}
