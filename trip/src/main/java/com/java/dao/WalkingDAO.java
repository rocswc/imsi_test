package com.java.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestBody;

import com.java.vo.WalkingVO;

@Mapper
public interface WalkingDAO {

	public List<WalkingVO> getNearbyCourses(WalkingVO vo);
	void insertWalking(WalkingVO vo);
	List<WalkingVO> getList();
	public List<WalkingVO> recommendCourses(WalkingVO vo);
}
