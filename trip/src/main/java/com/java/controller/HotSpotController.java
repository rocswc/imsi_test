package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.HotspotService;
import com.java.vo.HotspotVO;
import com.java.vo.RunningVO;


@Controller
public class HotSpotController {

	@Autowired
	private HotspotService hotspotservice;
	
	@RequestMapping("hotspot")
	public void hotspotPage() {
	}
	
	
	@GetMapping("hotspotMap") // HTTP GET방식 요청 중 URL 경로가 /walkingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public List<HotspotVO> getNearbyCourses(HotspotVO vo) {
		// System.out.println(vo.toString());
		List<HotspotVO> result = hotspotservice.getNearbyCourses(vo);
		// System.out.println(result.toString());
		return result;
	}
	
	
	@PostMapping("recommendCourseHotspot")
	@ResponseBody
	public  List<HotspotVO> recommendCourses(@RequestBody HotspotVO vo){
		
		List<HotspotVO> result = hotspotservice.recommendCourses(vo);
		
		return result;
		
	}
}
