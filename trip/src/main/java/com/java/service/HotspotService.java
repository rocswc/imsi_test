package com.java.service;

import java.util.List;


import com.java.vo.HotspotVO;



public interface HotspotService {

	public List<HotspotVO> getNearbyCourses(HotspotVO vo);
	 List<HotspotVO> getList();

}
