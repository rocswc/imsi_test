package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.HikingDAO;
import com.java.vo.HikingVO;
import com.java.vo.RunningVO;


@Service("hikingService")
public class HikingServiceImpl implements HikingService{
	@Autowired
	private HikingDAO hikingDAO; 
	
	public List<HikingVO> getNearbyCourses(HikingVO vo){
		System.out.println("service출력");
		return hikingDAO.getNearbyCourses(vo);
	}
	
	public void insertHiking(HikingVO vo) {hikingDAO.insertHiking(vo);}
	
	public List<HikingVO> getList(){
		
		
		return hikingDAO.getList(); 
	}
public List<HikingVO> recommendCourses(HikingVO vo ){
		
		
		return hikingDAO.recommendCourses(vo);  
	}
	
}