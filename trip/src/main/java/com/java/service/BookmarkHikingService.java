package com.java.service;
import java.util.List;
import com.java.vo.Bookmark_hikingVO;

public interface BookmarkHikingService {
	List<Bookmark_hikingVO> getBookmarkHiking(Bookmark_hikingVO vo);
	void insertBookmarkHiking(Bookmark_hikingVO vo); 
	Integer deleteBookmarkHiking(String human_id, Integer hiking_id);
}
