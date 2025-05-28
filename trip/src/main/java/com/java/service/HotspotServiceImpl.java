package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.java.dao.HotspotDAO;

import com.java.vo.HotspotVO;
  

@Service("hotspotService")
public class HotspotServiceImpl implements HotspotService{
	@Autowired
	private HotspotDAO hotspotDAO; 
	
	    
	
	public List<HotspotVO> getNearbyCourses(HotspotVO vo){
		System.out.println("service출력");
		return hotspotDAO.getNearbyCourses(vo);
	}
	public  List<HotspotVO> getList(){
		
		return hotspotDAO.getList();
	}
	


	

}
