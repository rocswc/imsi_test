package com.java.service;

import java.util.List;

import com.java.vo.WalkingVO;

public interface WalkingService {

	public List<WalkingVO> getNearbyCourses(WalkingVO vo);
	public void insertWalking(WalkingVO vo);

}
