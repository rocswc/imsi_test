package com.java.service;

import com.java.vo.HumanVO;


public interface HumanService {

	
	
	// 글 등록
		void insertHuman(HumanVO vo);
		HumanVO getHuman(HumanVO vo);
		HumanVO getCheckId(HumanVO vo);
		HumanVO getHumanId(HumanVO vo);
		Integer insertKakaoUser(HumanVO vo); 
		HumanVO getHumanPass(HumanVO vo) ;
		Integer updatePass(HumanVO vo) ;
		Integer updateProfile(HumanVO vo);

}
