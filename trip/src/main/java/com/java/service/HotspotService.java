package com.java.service;

import java.util.List;


import com.java.vo.HotspotVO;
import com.java.vo.WalkingVO;



public interface HotspotService {

	public List<HotspotVO> getNearbyCourses(HotspotVO vo);
	 List<HotspotVO> getList();
	 public List<HotspotVO> recommendCourses(HotspotVO vo );
}
