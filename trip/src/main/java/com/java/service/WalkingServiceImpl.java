package com.java.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.java.dao.WalkingDAO;
import com.java.vo.WalkingVO;

@Service("walkingservice")
public class WalkingServiceImpl implements WalkingService{
	
	@Autowired
	public WalkingDAO walkingdao;

	public List<WalkingVO> getNearbyCourses(WalkingVO vo){
		System.out.println("service출력");
		return walkingdao.getNearbyCourses(vo);
	}
	public void insertWalking(WalkingVO vo) {walkingdao.insertWalking(vo);}
	
	public  List<WalkingVO> getList(){
		
		return walkingdao.getList();
		 
	}
	
	public List<WalkingVO> recommendCourses(WalkingVO vo ){
		
		
		return walkingdao.recommendCourses(vo);  
	}
}


