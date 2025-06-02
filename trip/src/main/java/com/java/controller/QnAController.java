package com.java.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.QnAService;
import com.java.vo.HumanVO;
import com.java.vo.QnABoardReplyVO;
import com.java.vo.QnABoardVO;
import com.sun.jdi.connect.Connector.IntegerArgument;

@Controller
public class QnAController {

	@Autowired
	private QnAService qnAService;
	
	@RequestMapping("qna/qnaboard_insert")
	public void qnaboard_insertPage() {
	}
	
	@RequestMapping("qna/qna_list")//문의글 목록
	public void getQnAList(QnABoardVO vo,Model m, HttpSession session) {		
		HumanVO user = (HumanVO) session.getAttribute("loginUser");
		vo.setHuman_id(user.getHuman_id()); //테스트용 값 넣기
		List<QnABoardVO> result = qnAService.getQnAList(vo);
		m.addAttribute("getQnAList", result);
	}
	
	@RequestMapping("qna/qnaBoardRegister") //문의글 등록
	public String qnaBoardRegister(QnABoardVO vo, HttpSession session) {
		HumanVO user = (HumanVO) session.getAttribute("loginUser");
		vo.setHuman_id(user.getHuman_id()); //테스트용 값 넣기
		qnAService.qnaBoardRegister(vo);
		return "redirect:qna_list";
	}
	
	@RequestMapping("qna/qna_replyboard") //문의 상세 조회
	public void getQnAReplyList(QnABoardVO vo, Model m) {	
		List<QnABoardVO> getQnAList = qnAService.getQnAList(vo);		
		List<QnABoardReplyVO> getQnAReplyList = qnAService.getQnAReplyList(vo);
		m.addAttribute("getQnAList", getQnAList);
		m.addAttribute("getQnAReplyList", getQnAReplyList);
	}
		
	@RequestMapping("qna/qnaBoardReplyRegister") //덧글 등록
	public String qnaBoardReplyRegister(QnABoardReplyVO vo, HttpSession session) {
		HumanVO user = (HumanVO) session.getAttribute("loginUser");
		if(user.getHuman_id().equals("admin")) {
			vo.setWriter_type("관리자");
		}else{
			vo.setWriter_type("회원");	
		};		
		vo.setWriter_id(user.getHuman_id());
		qnAService.qnaBoardReplyRegister(vo);		
		return "redirect:qna_replyboard?board_id="+vo.getBoard_id()+"&human_id="+vo.getWriter_id();
	}		
	
	@RequestMapping("qna/qnadeleteReply") //문의글 삭제
	@ResponseBody
	public String qnaDeleteReply(QnABoardReplyVO vo) {	
		Integer result = qnAService.qnaDeleteReply(vo);
		System.out.println(vo.toString());
		return "삭제성공?";
	}
	
	@RequestMapping("qna/qnaUpdateReply") //문의글 삭제
	@ResponseBody
	public String qnaUpdateReply(QnABoardReplyVO vo) {	
		Integer result = qnAService.qnaUpdateReply(vo);
		System.out.println(vo.toString());
		return "갱신성공?";
	}
	
}