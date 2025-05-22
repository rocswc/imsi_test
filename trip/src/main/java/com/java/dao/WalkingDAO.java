package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.vo.WalkingVO;

@Mapper
public interface WalkingDAO {

	public List<WalkingVO> getNearbyCourses(WalkingVO vo);
	void insertWalking(WalkingVO vo);
}
