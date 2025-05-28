package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.dao.ReplyDAO;
import com.java.vo.ReplyVO;

@Service("replyservice")
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO replydao;

	@Override
	public void insertReply(ReplyVO vo) {
		replydao.insertReply(vo);
	}
	
	@Override
	public List<ReplyVO> listReply(Integer board_id){
		
		return replydao.listReply(board_id);
	}
	
	@Override
	public Integer deleteReply(Integer reply_id) {
		return replydao.deleteReply(reply_id);
	}
	
	@Override
	public String modifyReply(ReplyVO vo) {
		return replydao.modifyReply(vo);
	}
	
	@Transactional
	@Override
	public Integer countReply(Integer board_id) {
		int reaplyCount = replydao.countReply(board_id);
		replydao.updateBoardReplyCount(board_id, reaplyCount);
		return reaplyCount;
	}
	
}
