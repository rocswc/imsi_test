package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.WalkingService;
import com.java.vo.WalkingVO;

@Controller
public class WalkingController {

	@Autowired
	private WalkingService walkingservice;
	
	@RequestMapping("walking")
	public void walkingPage() {
	}
	
	
	@GetMapping("walkingMap") // HTTP GET방식 요청 중 URL 경로가 /walkingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public List<WalkingVO> getNearbyCourses(WalkingVO vo,Model m) {
		// System.out.println(vo.toString());
		List<WalkingVO> result = walkingservice.getNearbyCourses(vo);
		
		
		// System.out.println(result.toString());
		return result;
	}
	
	@PostMapping("insertWalking")
	@ResponseBody
	public String insertWalking(@RequestBody WalkingVO vo) {
		walkingservice.insertWalking(vo);
	    return "ok";
	}
}
