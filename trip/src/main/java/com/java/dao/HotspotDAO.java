package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.java.vo.HotspotVO;


@Mapper
public interface HotspotDAO {

	public List<HotspotVO> getNearbyCourses(HotspotVO vo);
}
