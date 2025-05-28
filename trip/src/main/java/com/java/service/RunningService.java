package com.java.service;

import java.util.List;

import com.java.vo.RunningVO;
import com.java.vo.WalkingVO;



public interface RunningService {

	public List<RunningVO> getNearbyCourses(RunningVO vo);
	public void insertRunning(RunningVO vo);
	 List<RunningVO> getList();
	 public List<RunningVO> recommendCourses(RunningVO vo );
}
