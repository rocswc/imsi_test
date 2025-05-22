package com.java.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.GameDAO;
import com.java.vo.GameVO;


  
@Service("gameService")
public class GameServiceImpl implements GameService{
	@Autowired
	private GameDAO gameDAO; 
	
	   
	
	public List<GameVO> selectGameByMonth(Map<String, Object> param) {
	    return gameDAO.selectGameByMonth(param);
	}
	public Integer countByMonth(String month) {
		return gameDAO.countByMonth(month);
	}
	
	


	

}
