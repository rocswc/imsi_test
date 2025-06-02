package com.java.service;
import java.util.List;
import com.java.vo.ActivitySummaryVO;
import com.java.vo.AdminDashBoardVO;
import com.java.vo.BoardVO;
import com.java.vo.HikingLevelChartVO;
import com.java.vo.HumanVO;
import com.java.vo.MemberChartVO;

public interface AdminService {
	public List<HumanVO> getAdminHumanList(String searchOption,String keyword);
	public ActivitySummaryVO getActivitySummary();
	public List<MemberChartVO> getMemberChartList();
	public List<BoardVO> getBoardLikeList();
	public List<HikingLevelChartVO> getHikingLevelChartList();
	
	public HumanVO getAdminHuman(String id); 
	public Integer updateAdminHuman(HumanVO vo); 
	public AdminDashBoardVO getAdminDashBoard(); 
	public Integer updateProfile(HumanVO vo); 
}