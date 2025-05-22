package com.java.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.vo.Bookmark_hikingVO;

@Mapper
public interface BookmarkHikingDAO {
	List<Bookmark_hikingVO> getBookmarkHiking(Bookmark_hikingVO vo);
	void insertBookmarkHiking(Bookmark_hikingVO vo); 
	Integer deleteBookmarkHiking(@Param("human_id") String human_id, @Param("hiking_id") Integer hiking_id);
}
