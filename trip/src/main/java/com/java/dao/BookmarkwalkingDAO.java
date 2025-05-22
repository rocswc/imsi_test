package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.vo.Bookmark_walkingVO;


@Mapper
public interface BookmarkwalkingDAO {
	
	  
	public void insertBookmarkWalking(Bookmark_walkingVO vo);
	
	public List<Bookmark_walkingVO> getBookmarkwalking(Bookmark_walkingVO vo) ;
	Integer deleteBookmarkwalking(@Param("human_id") String human_id, @Param("walking_id") String walking_id);
	
	/*
	 * public HumanVO getCheckId(HumanVO vo);
	 * 
	 * public HumanVO getHumanId(HumanVO vo) ; public Integer
	 * insertKakaoUser(HumanVO vo); public HumanVO getHumanPass(HumanVO vo) ; public
	 * Integer updatePass(HumanVO vo) ;
	 */
	
	
	/*
	 * public void updateHuman(HumanVO vo) ;
	 * 
	 * public void deleteHuman(HumanVO vo);
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 * public List<HumanVO> getHumanList(HashMap map) ;
	 */
	
	
}
