package com.java.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.java.service.AdminService;
import com.java.vo.ActivitySummaryVO;
import com.java.vo.AdminDashBoardVO;
import com.java.vo.BoardVO;
import com.java.vo.HikingLevelChartVO;
import com.java.vo.HumanVO;
import com.java.vo.MemberChartVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("admin/adminDashBoard")
	public void adminDashBoard(Model m){
		AdminDashBoardVO getAdminDashBoard = adminService.getAdminDashBoard();
		ActivitySummaryVO getActivitySummary = adminService.getActivitySummary();
		List<MemberChartVO> getMemberChartList = adminService.getMemberChartList();
		List<BoardVO> getBoardLikeList = adminService.getBoardLikeList();
		List<HikingLevelChartVO> getHikingLevelChartList = adminService.getHikingLevelChartList();
		
		m.addAttribute("adminDashBoard", getAdminDashBoard);
		m.addAttribute("getActivitySummary", getActivitySummary);
		m.addAttribute("memberChartList", getMemberChartList);
		m.addAttribute("getBoardLikeList", getBoardLikeList);	
		m.addAttribute("getHikingLevelChartList", getHikingLevelChartList);	
	}

	@RequestMapping("admin/getAdminHumanList") //회원관리 목록 조회 + 조건에 맞는 검색
	public void getAdminHumanList(@RequestParam(defaultValue="human_name") String searchOption
								, @RequestParam(defaultValue="") String keyword
								, Model m){	
		List<HumanVO> result = adminService.getAdminHumanList(searchOption,keyword);
		m.addAttribute("getAdminHumanList",result);
		m.addAttribute("searchOption",searchOption);
		m.addAttribute("keyword",keyword);
	}

	@RequestMapping("admin/getAdminHumanForm")//회원관리 상세 조회
	public void getAdminHuman(@RequestParam(value="human_id") String id, Model m){
		System.out.println("id: "+id);	
		HumanVO result = adminService.getAdminHuman(id); 
		m.addAttribute("getAdminHuman",result);	
	}

	@RequestMapping("admin/updateHuman") //회원관리 블랙리스트/상태 업데이트
	public String updateHuman(HumanVO vo){	
		adminService.updateAdminHuman(vo); 	;
		return "redirect:/admin/getAdminHumanList";
	}
	
	@RequestMapping("memberUpdate") //회원관리 블랙리스트/상태 업데이트
	public void memberUpdate(){}
	
	@RequestMapping("userUpdateProfile")
	public String updateProfile(HumanVO vo){
		adminService.updateProfile(vo);
		return "redirect:/getHuman";
	}

}