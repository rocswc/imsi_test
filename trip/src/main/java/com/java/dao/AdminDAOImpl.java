package com.java.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.vo.ActivitySummaryVO;
import com.java.vo.AdminDashBoardVO;
import com.java.vo.HikingLevelChartVO;
import com.java.vo.HumanVO;
import com.java.vo.MemberChartVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public AdminDashBoardVO getAdminDashBoard(){
		System.out.println("===> Mybatis getAdminDashBoard() 호출");
		return sqlsession.selectOne("AdminMapper.getAdminDashBoard");
	}
	
	public ActivitySummaryVO getActivitySummary() {
		System.out.println("===> Mybatis getActivitySummary() 호출");
		return sqlsession.selectOne("AdminMapper.getActivitySummary");
	};

	public List<MemberChartVO> getMemberChartList(){
		System.out.println("===> Mybatis getMemberChartList() 호출");
		return sqlsession.selectList("AdminMapper.getMemberChartList");
	}
	
	public List<HikingLevelChartVO> getHikingLevelChartList(){
		System.out.println("===> Mybatis getHikingLevelChartList() 호출");
		return sqlsession.selectList("AdminMapper.getHikingLevelChartList");
	}
	
	public List<HumanVO> getAdminHumanList(String searchOption,String keyword){
		System.out.println("===> Mybatis getAdminHumanList() 호출");
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlsession.selectList("AdminMapper.getAdminHumanList",map);
	}
	
	public HumanVO getAdminHuman(String id){
		System.out.println("===> Mybatis getAdminHuman() 호출");
		return sqlsession.selectOne("AdminMapper.getAdminHuman",id);
	}
	
	public Integer updateAdminHuman(HumanVO vo){
		System.out.println("===> Mybatis updateAdminHuman() 호출");
		return sqlsession.update("AdminMapper.updateAdminHuman",vo);
	}
	
	public Integer updateProfile(HumanVO vo){
		System.out.println("김갑중"+vo.toString());
		return sqlsession.update("AdminMapper.updateProfile",vo);
	}
	
}