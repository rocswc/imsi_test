package com.java.service;

import java.util.List;
import com.java.vo.HikingVO;

public interface HikingService {
	public List<HikingVO> getNearbyCourses(HikingVO vo);
	public void insertHiking(HikingVO vo);
}
