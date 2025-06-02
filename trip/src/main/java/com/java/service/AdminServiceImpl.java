package com.java.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.AdminDAO;
import com.java.vo.ActivitySummaryVO;
import com.java.vo.AdminDashBoardVO;
import com.java.vo.BoardVO;
import com.java.vo.HikingLevelChartVO;
import com.java.vo.HumanVO;
import com.java.vo.MemberChartVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	public AdminDashBoardVO getAdminDashBoard() {
		AdminDashBoardVO result = adminDAO.getAdminDashBoard();
		return result;
	}; 
	
	public ActivitySummaryVO getActivitySummary() {
		ActivitySummaryVO result = adminDAO.getActivitySummary();
		return result;
	};
	
	public List<MemberChartVO> getMemberChartList() {
		List<MemberChartVO> result = adminDAO.getMemberChartList();
		return result;
	}; 
	
	public List<BoardVO> getBoardLikeList() {
		List<BoardVO> result = adminDAO.getBoardLikeList();
		return result;
	}; 
	
	public List<HikingLevelChartVO> getHikingLevelChartList() {
		List<HikingLevelChartVO> result = adminDAO.getHikingLevelChartList();
		return result;
	}; 

	public List<HumanVO> getAdminHumanList(String searchOption,String keyword){
		List<HumanVO> result = adminDAO.getAdminHumanList(searchOption,keyword);
		return result;
	};	
	
	public HumanVO getAdminHuman(String id){
		HumanVO result = adminDAO.getAdminHuman(id);
		return result;
	};
	
	public Integer updateAdminHuman(HumanVO vo){
		Integer result = adminDAO.updateAdminHuman(vo);
		return result;
	};
	
	public Integer updateProfile(HumanVO vo){
		Integer result = adminDAO.updateProfile(vo);
		return result;
	};			
}