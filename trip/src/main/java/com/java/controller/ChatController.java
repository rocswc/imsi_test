package com.java.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.java.service.HikingService;
import com.java.service.HotspotService;
import com.java.service.RunningService;
import com.java.service.WalkingService;
import com.java.vo.HikingVO;
import com.java.vo.HotspotVO;
import com.java.vo.RunningVO;
import com.java.vo.WalkingVO;

@RestController
@RequestMapping("/trip")  
public class ChatController {
	
	
	 @Autowired
	    private HikingService hikingService;

	    @Autowired
	    private RunningService runningService;

	    @Autowired
	    private WalkingService walkingService;

	    @Autowired
	    private HotspotService hotspotService;
	    
	    
	    @PostMapping("/recommendapi")
	    public String getCoursesFromSentence(@RequestBody Map<String, String> payload) throws Exception {
	        // 질문 분석
	    	  String question = payload.get("question");
	        String type = null;
	        String lower = question.toLowerCase();
	      
	        if (lower.contains("달리기") || lower.contains("러닝") || lower.contains("조깅")) {
	            type = "running";
	        } else if (lower.contains("산책") || lower.contains("걷기")) {
	            type = "walking";
	        } else if (lower.contains("등산") || lower.contains("산")) {
	            type = "hiking";
	        } else if (lower.contains("명소") || lower.contains("관광") || lower.contains("주변")) {
	            type = "hotspot";
	        } else {
	            return "❗ 어떤 활동인지 이해하지 못했어요.";
	        }

	        // DB에서 꺼내서 프롬프트 만들고
	        StringBuilder prompt = new StringBuilder();
	        switch (type) {
	            case "running":
	                for (RunningVO vo : runningService.getList()) {
	                    prompt.append("- 코스명: ").append(vo.getRunning_name()).append("\n");
	                    prompt.append("  설명: ").append(vo.getRunning_info()).append("\n");
	                   prompt.append("  거리: ").append(vo.getRunning_distance()).append("\n\n");
	                }
	                break;
	            case "walking":
	                for (WalkingVO vo : walkingService.getList()) {
	                    prompt.append("- 산책코스명: ").append(vo.getWalking_name()).append("\n");
	                    prompt.append("  설명: ").append(vo.getWalking_info()).append("\n");
	                    prompt.append("  거리: ").append(vo.getWalking_distance()).append("\n\n");
	                }
	                break;
	            case "hiking":
	                List<HikingVO> hikingList = hikingService.getList();
	                prompt.append("사용자 질문: ").append(question).append("\n\n");
	                prompt.append("💡 이 목록 외에는 절대 참고하지 마. 조건(거리 5km 이하, 난이도 하)에 맞는 등산 코스만 필터링해서 2~3개 추천해줘.\n");
	                prompt.append("각 코스마다 추천 이유도 간결하게 설명해줘.\n\n");

	                for (HikingVO vo : hikingList) {
	                    prompt.append("- 산명: ").append(vo.getHiking_name()).append("\n");
	                    prompt.append("  설명: ").append(vo.getHiking_info()).append("\n");
	                    prompt.append("  거리: ").append(vo.getHiking_distance()).append("km\n");
	                    prompt.append("  난이도: ").append(vo.getHiking_level()).append("\n\n");
	                }

	                System.out.println("🚩 Flask로 보낼 prompt 내용:\n" + prompt);
	                break;
	            case "hotspot":
	                for (HotspotVO vo : hotspotService.getList()) {
	                    prompt.append("- 명소명: ").append(vo.getHotspot_name()).append("\n");
	                    prompt.append("  설명: ").append(vo.getHotspot_info()).append("\n\n");
	                }
	                break;
	        }

	        try {
	            RestTemplate restTemplate = new RestTemplate();

	            HttpHeaders headers = new HttpHeaders();
	            headers.setContentType(MediaType.APPLICATION_JSON);

	            String body = "{\"question\":\"" 
	            	    + prompt.toString().replace("\"", "'").replace("\n", "\\n") 
	            	    + "\"}";

	            HttpEntity<String> entity = new HttpEntity<>(body, headers);

	            String flaskUrl = "http://127.0.0.1:5000/recommendapi";
	            ResponseEntity<String> response = restTemplate.postForEntity(flaskUrl, entity, String.class);

	            return response.getBody();
	        } catch (HttpClientErrorException e) {
	            return "❗ Flask 서버에서 데이터를 찾을 수 없습니다.\n" + e.getStatusText();
	        }
	        
	    }
	}