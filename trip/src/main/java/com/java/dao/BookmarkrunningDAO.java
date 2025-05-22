package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.vo.Bookmark_runningVO;



@Mapper
public interface BookmarkrunningDAO {
	  
	  
	public void insertBookmarkRunning(Bookmark_runningVO vo);
	
	public List<Bookmark_runningVO> getBookmarkrunning(Bookmark_runningVO vo) ;
	Integer deleteBookmarkrunning(@Param("human_id") String human_id, @Param("running_id") Integer running_id);
	
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
