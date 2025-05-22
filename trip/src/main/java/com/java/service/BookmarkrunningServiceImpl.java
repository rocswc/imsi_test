package com.java.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.BookmarkrunningDAO;
import com.java.vo.Bookmark_runningVO;


@Service("bookmarkrunningService")   
public class BookmarkrunningServiceImpl implements BookmarkRunningService {
	@Autowired
	private BookmarkrunningDAO bookmarkrunningDAO; 
	      
	public void insertBookmarkRunning(Bookmark_runningVO vo) {
		  
		bookmarkrunningDAO.insertBookmarkRunning(vo);
		
	}            
	
	public List<Bookmark_runningVO> getBookmarkRunning(Bookmark_runningVO vo) { return bookmarkrunningDAO.getBookmarkrunning(vo); }
	
	public Integer deleteBookmarkrunning(String human_id, Integer running_id) {
	    return bookmarkrunningDAO.deleteBookmarkrunning(human_id, running_id);
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
