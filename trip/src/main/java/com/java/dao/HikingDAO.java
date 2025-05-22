package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.vo.HikingVO;



@Mapper
public interface HikingDAO {
	public List<HikingVO> getNearbyCourses(HikingVO vo);
	void insertHiking(HikingVO vo);
}
