package com.java.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.HumanService;
import com.java.vo.HumanVO;


@Controller
public class HumanController {

	@Autowired
	private HumanService humanService;


	@RequestMapping("{step}")
	//스탭을 변수로 받음 db를 건드리지 않은 애들은 이걸로 가능
	public String viewpage(@PathVariable String step) {

		return step;
	}


	@RequestMapping("saveHumanVO")
	public String saveHuman(HumanVO vo)
	{
		System.out.println("★ [Controller] 넘어온 값 확인: " + vo);
		humanService.insertHuman(vo);
		return "redirect:memberForm";
	}


	@RequestMapping("logincheck")
	@ResponseBody
	public Map<String, String> logincheck(HumanVO vo) {

		HumanVO result = humanService.getCheckId(vo);

		Map<String, String> response = new HashMap<String, String>();

		if(result != null) {

			response.put("status", "success");
			response.put("human_id", result.getHuman_id());
		}else {
			response.put("status", "fail"); // 이미 존재
		}

		return response;
	}  

	@RequestMapping("getLogin")
	@ResponseBody
	public Map<String, String> getHuman(HumanVO vo ,HttpSession session) {

		HumanVO result = humanService.getHuman(vo);

		Map<String, String> response = new HashMap<String, String>();

		if(result != null) {
			session.setAttribute("loginUser",result);
			response.put("status", "success");
		}else {
			response.put("status", "fail"); // 이미 존재
		}

		return response;
	}  

	@RequestMapping("findId")
	@ResponseBody
	public Map<String, String> findId(HumanVO vo) {

		HumanVO result = humanService.getHumanId(vo);

		Map<String, String> response = new HashMap<String, String>();

		if(result != null) {

			response.put("status", "success");
			response.put("human_id", result.getHuman_id());
		}else {
			response.put("status", "fail"); // 이미 존재
		}

		return response;
	}  

	@RequestMapping("findPass")
	@ResponseBody
	public Map<String, String> findPass(HumanVO vo, HttpSession session){

		HumanVO result = humanService.getHumanPass(vo);
		Map<String, String> response = new HashMap<String, String>();
		if(result != null) {
			session.setAttribute("human_id", result.getHuman_id());
			response.put("status", "success");

		}else {
			response.put("status", "fail"); // 이미 존재
		}

		return response;
	}  
	@RequestMapping("updatepass")
	@ResponseBody
	public Map<String, String> updatePass(HumanVO vo){

		Integer result = humanService.updatePass(vo);
		 System.out.println("업데이트 결과: " + result); 
		Map<String, String> response = new HashMap<String, String>();
		if(result > 0 ) {

			response.put("status", "success");

		}else {
			response.put("status", "fail"); // 이미 존재
		}

		return response;
	}  





	@RequestMapping("logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:index.jsp";
	}

	@RequestMapping("updateProfile")
	public String updateProfile(HumanVO vo){
		humanService.updateProfile(vo);
		return "redirect:/getHuman";
	}

	

}




