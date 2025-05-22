package com.java.service;

import java.util.List;
import java.util.Map;

import com.java.vo.GameVO;




public interface GameService {

	
	
	public List<GameVO> selectGameByMonth(Map<String, Object> param);
	Integer countByMonth(String month);
	   

}
