package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
