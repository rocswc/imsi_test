package com.java.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.java.vo.GameVO;



@Mapper
public interface GameDAO {

	

	 List<GameVO> selectGameByMonth(Map<String, Object> param);
	Integer countByMonth(String month);   
	  
}
