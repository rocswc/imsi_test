package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.HumanDAO;
import com.java.vo.HumanVO;

@Service("HumanService")
public class HumanServiceImpl implements HumanService{
	@Autowired
	private HumanDAO humanDAO; 
	
	public void insertHuman(HumanVO vo) {
		 System.out.println("★ [ServiceImpl] 값 받음: " + vo);
		humanDAO.insertHuman(vo);
	}
	
	public HumanVO getHuman(HumanVO vo) { return humanDAO.getHuman(vo); }
	public HumanVO getCheckId(HumanVO vo) { return humanDAO.getCheckId(vo); }
	public HumanVO getHumanId(HumanVO vo){ return humanDAO.getHumanId(vo); }
	public Integer insertKakaoUser(HumanVO vo){ return humanDAO.insertKakaoUser(vo); }
	public HumanVO getHumanPass(HumanVO vo) { return humanDAO.getHumanPass(vo); };
	public Integer updatePass(HumanVO vo) { return humanDAO.updatePass(vo); };
	public Integer updateProfile(HumanVO vo){
		Integer result = humanDAO.updateProfile(vo);
		return result;
	};	

	
	
	

	

}
