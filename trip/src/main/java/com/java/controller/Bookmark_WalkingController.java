package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.BookmarkWalkingService;

import com.java.vo.Bookmark_walkingVO;
import com.java.vo.HumanVO;



@Controller
public class Bookmark_WalkingController {
	@Autowired
	private BookmarkWalkingService bookmarkWalkingService;
	
	@RequestMapping("bookmark_walking")
	public void bookmark_walking() {
		
		
	} 
	
	@GetMapping("bookmarkwalking") // HTTP GET방식 요청 중 URL 경로가 /walkingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public Map<String,Object> getbookmarkwalking(Bookmark_walkingVO vo,HttpSession session){
		 HumanVO user = (HumanVO) session.getAttribute("loginUser");
		  vo.setHuman_id(user.getHuman_id());
		List<Bookmark_walkingVO> result = bookmarkWalkingService.getBookmarkWalking(vo);
		
		  Map<String, Object> response = new HashMap<>();
		    response.put("status", "success");
		    response.put("data", result);

		    return response;
		
	}
	
	
	@PostMapping("addbookmarkwalking")
	@ResponseBody
		public Map<String,Object> addbookmarkwalking(@RequestBody Bookmark_walkingVO vo, HttpSession session){
		
		 HumanVO user = (HumanVO) session.getAttribute("loginUser");
		  vo.setHuman_id(user.getHuman_id()); 
		 
		 
		 bookmarkWalkingService.insertBookmarkWalking(vo);
		 
		 Map<String, Object> response = new HashMap<>();
		 
		 response.put("status", "success");
		    response.put("message", "북마크가 추가되었습니다.");
		    return response;
		
	}
	
	@PostMapping("deletebookmarkwalking")
	@ResponseBody
		public Integer deletebookmarkwalking(@RequestBody String walking_id ,HttpSession session) {
			
		 HumanVO user = (HumanVO) session.getAttribute("loginUser");
		 String human_id = user.getHuman_id();
			
			
			return bookmarkWalkingService.deleteBookmarkwalking(human_id,walking_id);
		
	}
	
	
}
