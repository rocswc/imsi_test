package com.java.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java.dao.BookmarkwalkingDAO;
import com.java.vo.Bookmark_walkingVO;

@Service("bookmarkwalkingService")   
public class BookmarkwalkingServiceImpl implements BookmarkWalkingService {
	@Autowired
	private BookmarkwalkingDAO bookmarkwalkingDAO; 
	      
	public void insertBookmarkWalking(Bookmark_walkingVO vo) {
		  
		bookmarkwalkingDAO.insertBookmarkWalking(vo);
		
	}         
	
	public List<Bookmark_walkingVO> getBookmarkWalking(Bookmark_walkingVO vo) { return bookmarkwalkingDAO.getBookmarkwalking(vo); }
	
	public Integer deleteBookmarkwalking(String human_id, String walking_id) {
	    return bookmarkwalkingDAO.deleteBookmarkwalking(human_id, walking_id);
	}
	/*
	 * public HumanVO getCheckId(HumanVO vo) { return humanDAO.getCheckId(vo); }
	 * public HumanVO getHumanId(HumanVO vo){ return humanDAO.getHumanId(vo); }
	 * public Integer insertKakaoUser(HumanVO vo){ return
	 * humanDAO.insertKakaoUser(vo); } public HumanVO getHumanPass(HumanVO vo) {
	 * return humanDAO.getHumanPass(vo); }; public Integer updatePass(HumanVO vo) {
	 * return humanDAO.updatePass(vo); };
	 */
	
	
	/*
	 * public void updateHuman(HumanVO vo) { humanDAO.updateHuman(vo); }
	 * 
	 * public void deleteHuman(HumanVO vo) { humanDAO.deleteHuman(vo); }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * public List<HumanVO> getHumanList(HashMap map) { return
	 * humanDAO.getHumanList(map); }
	 */

	

}
