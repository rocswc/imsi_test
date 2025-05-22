package com.java.service;

import java.util.List;

import com.java.vo.Bookmark_runningVO;




public interface BookmarkRunningService {

	  
	
	// 글 등록
		
	List<Bookmark_runningVO> getBookmarkRunning(Bookmark_runningVO vo);
		void insertBookmarkRunning(Bookmark_runningVO vo); 
		Integer deleteBookmarkrunning(String human_id, Integer running_id);
		/*
		 * HumanVO getHumanPass(HumanVO vo) ;
		 *  Integer updatePass(HumanVO vo) ;
		 */
		// 글 수정
		/*
		 * void updateHuman(HumanVO vo);
		 * 
		 * // 글 삭제 void deleteHuman(HumanVO vo);
		 * 
		 * // 로그인 
		 * 
		 * // 글 목록 조회 List<HumanVO> getHumanList(HashMap map);
		 * 
		 * 
		 *	아이디 찾기 
		 */

}
