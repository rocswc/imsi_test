package com.java.service;

import java.util.List;

import com.java.vo.ReplyVO;

public interface ReplyService {
	
	//댓글입력
	void insertReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(Integer board_id);
	
	public Integer deleteReply(Integer reply_id);
	
	public String modifyReply(ReplyVO vo);
	
	public Integer countReply(Integer board_id);
}
