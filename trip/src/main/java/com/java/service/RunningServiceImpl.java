package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.RunningDAO;

import com.java.vo.RunningVO;
import com.java.vo.WalkingVO;


@Service("runningService")
public class RunningServiceImpl implements RunningService{
	
	@Autowired     
	public RunningDAO runningdao;

	public List<RunningVO> getNearbyCourses(RunningVO vo){
		System.out.println("service출력");
		return runningdao.getNearbyCourses(vo);
	}
	
	public void insertRunning(RunningVO vo) {runningdao.insertRunning(vo);}
	
	public List<RunningVO> getList(){
		
		return runningdao.getList();
	}
	
public List<RunningVO> recommendCourses(RunningVO vo ){
		
		
		return runningdao.recommendCourses(vo);  
	}
}
  