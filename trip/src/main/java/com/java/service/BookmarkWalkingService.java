package com.java.service;

import java.util.List;

import com.java.vo.Bookmark_walkingVO;



public interface BookmarkWalkingService {

	  
	
	// 글 등록
		
	List<Bookmark_walkingVO> getBookmarkWalking(Bookmark_walkingVO vo);
		void insertBookmarkWalking(Bookmark_walkingVO vo); 
		Integer deleteBookmarkwalking(String human_id, String walking_id);
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
