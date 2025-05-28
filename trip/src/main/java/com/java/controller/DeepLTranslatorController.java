package com.java.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.deepl.api.Translator;
import com.java.vo.HikingVO;
import com.java.vo.HotspotVO;
import com.java.vo.RunningVO;
import com.java.vo.WalkingVO;



@Controller
public class DeepLTranslatorController {
	
	
	
	@RequestMapping(value= "/translate", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, String> translate(@RequestBody WalkingVO vo) {
	    Map<String, String> result = new HashMap<>();

	    String authKey = "ed4e6564-acb6-47b8-afd4-fe4de6ef3a54:fx";
	    Translator translator = new Translator(authKey);

	    try {
	        result.put("walking_name", translator.translateText(vo.getWalking_name(), "KO", "en-US").getText());
	        result.put("walking_distance", vo.getWalking_distance());  // 숫자는 번역 안 함
	        result.put("walking_info", translator.translateText(vo.getWalking_info(), "KO", "en-US").getText());
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "번역 실패");
	    }

	    return result;
	}
		
	
	@RequestMapping(value= "/translatehiking", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, String> translate(@RequestBody HikingVO vo) {
	    Map<String, String> result = new HashMap<>();

	    String authKey = "ed4e6564-acb6-47b8-afd4-fe4de6ef3a54:fx";
	    Translator translator = new Translator(authKey);

	    try {
	        result.put("hiking_name", translator.translateText(vo.getHiking_name(), "KO", "en-US").getText());
	        result.put("hiking_distance", vo.getHiking_distance());    // 숫자는 번역 안 함
	        result.put("hiking_info", translator.translateText(vo.getHiking_info(), "KO", "en-US").getText());
	        result.put("hiking_height", vo.getHiking_height());
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "번역 실패");
	    }

	    return result;
	}
	
	@RequestMapping(value= "/translatehotspot", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, String> translate(@RequestBody HotspotVO vo) {
	    Map<String, String> result = new HashMap<>();

	    String authKey = "ed4e6564-acb6-47b8-afd4-fe4de6ef3a54:fx";
	    Translator translator = new Translator(authKey);

	    try {
	        result.put("hotspot_name", translator.translateText(vo.getHotspot_name(), "KO", "en-US").getText());
	           // 숫자는 번역 안 함
	        result.put("hotspot_info", translator.translateText(vo.getHotspot_info(), "KO", "en-US").getText());
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "번역 실패");
	    }

	    return result;
	}
	
	
	@RequestMapping(value= "/translaterunning", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, String> translate(@RequestBody RunningVO vo) {
	    Map<String, String> result = new HashMap<>();

	    String authKey = "ed4e6564-acb6-47b8-afd4-fe4de6ef3a54:fx";
	    Translator translator = new Translator(authKey);

	    try {
	        result.put("running_name", translator.translateText(vo.getRunning_name(), "KO", "en-US").getText());
	        result.put("running_distance", vo.getRunning_distance());    // 숫자는 번역 안 함
	        result.put("running_info", translator.translateText(vo.getRunning_info(), "KO", "en-US").getText());
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("error", "번역 실패");
	    }

	    return result;
	}
		
		
	

}
