package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.GameService;
import com.java.vo.GameVO;


@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	
	@RequestMapping("game")
	public void game() {
		
		
	} 
	
	@GetMapping("gameMap") // HTTP GET방식 요청 중 URL 경로가 /walkingMap 인 요청을 처리
	@ResponseBody //반환값을 JSON 같은 형태로 바로 HTTP 응답 본문에 담아서 보내겠다
	 public Map<String,Object> getgame(@RequestParam("month") String month,
									   @RequestParam("page") int page,
							           @RequestParam("size") int size){
		
		Integer startRow = (page-1)*size;
		Integer endRow = page*size;
		
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("month", month);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		List<GameVO> gameList = gameService.selectGameByMonth(param);
		Integer totalCount = gameService.countByMonth(month);
		Integer totalPages = (int) Math.ceil((double) totalCount / size);
		
		 Map<String, Object> result = new HashMap<>();
		    result.put("games", gameList);
		    result.put("totalPages", totalPages);
		    result.put("currentPage", page);
		    
		    return result;
		
	}
	
}
