package com.java.service;

import java.util.List;

import com.java.vo.RunningVO;



public interface RunningService {

	public List<RunningVO> getNearbyCourses(RunningVO vo);
	public void insertRunning(RunningVO vo);

}
