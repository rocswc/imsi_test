package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.HikingService;
import com.java.vo.HikingVO;
import com.java.vo.RunningVO;




@Controller
public class HikingController {
	@Autowired
	private HikingService hikingService;
	@RequestMapping("hiking")
	public void hikingPage() {
	}
	 
	@GetMapping("hikingMap") // HTTP GET방식 요청 중 URL 경로가 /walkingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public List<HikingVO> getNearbyCourses(HikingVO vo) {
		// System.out.println(vo.toString());
		List<HikingVO> result = hikingService.getNearbyCourses(vo);
		// System.out.println(result.toString());
		return result;
	}
	
	@PostMapping("inserthiking")
	@ResponseBody
	public String insertHiking(@RequestBody HikingVO vo) {
		hikingService.insertHiking(vo);
	    return "ok"; 
	}

	
	@PostMapping("recommendCourseHiking")
	@ResponseBody
	public  List<HikingVO> recommendCourses(@RequestBody HikingVO vo){
		
		List<HikingVO> result = hikingService.recommendCourses(vo);
		
		return result;
		
	}
}