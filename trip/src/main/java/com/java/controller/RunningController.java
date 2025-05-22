package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.RunningService;
import com.java.vo.RunningVO;


@Controller
public class RunningController {
	@Autowired
	private RunningService runningService;
	@RequestMapping("running")
	public void walkingPage() {
	}
	 
	
	
	@GetMapping("runningMap") // HTTP GET방식 요청 중 URL 경로가 /walkingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public List<RunningVO> getNearbyCourses(RunningVO vo) {
		// System.out.println(vo.toString());
		List<RunningVO> result = runningService.getNearbyCourses(vo);
		// System.out.println(result.toString());
		return result;
	}
	 
	
	@PostMapping("insertRunning")
	@ResponseBody
	public String insertRunning(@RequestBody RunningVO vo) {
		runningService.insertRunning(vo); 
	    return "ok";
	}
}