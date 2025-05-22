package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.vo.RunningVO;


@Mapper
public interface RunningDAO {
 
	public List<RunningVO> getNearbyCourses(RunningVO vo);
	public void insertRunning(RunningVO vo);
}
