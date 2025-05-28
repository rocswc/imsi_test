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
import com.java.service.BookmarkHikingService;
import com.java.vo.Bookmark_hikingVO;
import com.java.vo.HumanVO;
@Controller
public class Bookmark_HikingController {
	
	@Autowired
	private BookmarkHikingService bookmarkHikingService;

	@RequestMapping("bookmark_hiking")
	public void bookmark_hiking() {} 
	
	@GetMapping({"bookmarkhiking", "bookmark_hiking"}) // HTTP GET방식 요청 중 URL 경로가 /hikingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public Map<String,Object> getbookmarkhiking(Bookmark_hikingVO vo,HttpSession session){
		 HumanVO user = (HumanVO) session.getAttribute("loginUser");
		 vo.setHuman_id(user.getHuman_id());
		List<Bookmark_hikingVO> result = bookmarkHikingService.getBookmarkHiking(vo);
		
		  Map<String, Object> response = new HashMap<>();
		    response.put("status", "success");
		    response.put("data", result);
		    return response;		
	}
	
	@PostMapping("addbookmarkhiking")
	@ResponseBody
		public Map<String,Object> addbookmarkHiking(@RequestBody Bookmark_hikingVO vo, HttpSession session){
		System.out.println("컨트롤러임");
		 HumanVO user = (HumanVO) session.getAttribute("loginUser");
		  vo.setHuman_id(user.getHuman_id()); 
		 
		  bookmarkHikingService.insertBookmarkHiking(vo);
		 
		 Map<String, Object> response = new HashMap<>();
		 
		 	response.put("status","success");
		    response.put("message","북마크가 추가되었습니다.");
		    return response;
	}
	
	@PostMapping("deletebookmarkhiking")
	@ResponseBody
		public Integer deletebookmarkHiking(@RequestBody Integer hiking_id ,HttpSession session) {
			
		 HumanVO user = (HumanVO) session.getAttribute("loginUser");
		 String human_id = user.getHuman_id();	
		return bookmarkHikingService.deleteBookmarkHiking(human_id, hiking_id);	
	}
}