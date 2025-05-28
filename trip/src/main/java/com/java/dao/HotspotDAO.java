package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.java.vo.HotspotVO;
import com.java.vo.WalkingVO;


@Mapper
public interface HotspotDAO {

	public List<HotspotVO> getNearbyCourses(HotspotVO vo);
	List<HotspotVO> getList();
	public List<HotspotVO> recommendCourses(HotspotVO vo);
}
