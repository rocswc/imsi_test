package com.java.dao;

import org.apache.ibatis.annotations.Mapper;

import com.java.vo.HumanVO;

@Mapper
public interface HumanDAO {
	
	
	public void insertHuman(HumanVO vo);	
	public HumanVO getHuman(HumanVO vo) ;	
	public HumanVO getCheckId(HumanVO vo);	
	public HumanVO getHumanId(HumanVO vo) ;
	public Integer insertKakaoUser(HumanVO vo);
	public HumanVO getHumanPass(HumanVO vo) ;
	public Integer updatePass(HumanVO vo) ;
	public Integer updateProfile(HumanVO vo);
	
	
	
}
