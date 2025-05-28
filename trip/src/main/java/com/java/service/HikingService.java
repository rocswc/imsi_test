package com.java.service;

import java.util.List;
import com.java.vo.HikingVO;
import com.java.vo.RunningVO;

public interface HikingService {
	public List<HikingVO> getNearbyCourses(HikingVO vo);
	public void insertHiking(HikingVO vo);
	public  List<HikingVO> getList();
	public List<HikingVO> recommendCourses(HikingVO vo );
}
