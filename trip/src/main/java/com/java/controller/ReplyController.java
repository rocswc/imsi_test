package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.ReplyService;
import com.java.vo.ReplyVO;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyservice;
	
	//댓글입력
	@PostMapping("replynew")
	@ResponseBody
	public void insertReply(ReplyVO vo) {
		replyservice.insertReply(vo);
		System.out.println(vo.toString());
	}
	
	//댓글목록
	@GetMapping("replyList")
	@ResponseBody
	public List<ReplyVO> listReply(Integer board_id){
		//System.out.println("댓글:" + board_id);
		List<ReplyVO> result = replyservice.listReply(board_id);
		return result;
	}
	
	//댓글삭제
	@DeleteMapping("replyDelete/{reply_id}")
	@ResponseBody
	public void deleteReply(@PathVariable Integer reply_id) {
		System.out.println("삭제댓글번호:" + reply_id);
		replyservice.deleteReply(reply_id);
	}
	
	//댓글수정
	@PostMapping("replyModify")
	@ResponseBody
	public void modifyReply(ReplyVO vo) {
		try {
			String result = replyservice.modifyReply(vo);
			System.out.println("수정 결과: " + result);
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔에 예외 메시지 출력
		}
	}
	
	//댓글개수
	@GetMapping("replyCount")
	@ResponseBody
	public Integer countReply(Integer board_id) {
		return replyservice.countReply(board_id);
	}
}
