package com.java.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java.dao.BookmarkHikingDAO;
import com.java.vo.Bookmark_hikingVO;

@Service("bookmarkHikingService")  
public class BookmarkHikingServiceImpl implements BookmarkHikingService{
	@Autowired
	private BookmarkHikingDAO bookmarkHikingDAO; 
	      
	public void insertBookmarkHiking(Bookmark_hikingVO vo) {	  
		bookmarkHikingDAO.insertBookmarkHiking(vo);	
	}         
	
	public List<Bookmark_hikingVO> getBookmarkHiking(Bookmark_hikingVO vo) {
		return bookmarkHikingDAO.getBookmarkHiking(vo); 
	}
	
	public Integer deleteBookmarkHiking(String human_id, Integer hiking_id) {
	    return bookmarkHikingDAO.deleteBookmarkHiking(human_id, hiking_id);
	}
}  