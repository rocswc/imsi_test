package com.java.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.java.vo.WalkingVO;

public interface WalkingService {

	public List<WalkingVO> getNearbyCourses(WalkingVO vo);
	public void insertWalking(WalkingVO vo);
	 List<WalkingVO> getList();
	 public List<WalkingVO> recommendCourses(WalkingVO vo );

}
