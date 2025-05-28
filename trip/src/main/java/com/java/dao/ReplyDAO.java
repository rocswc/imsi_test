package com.java.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.vo.ReplyVO;

@Mapper
public interface ReplyDAO {

	public void insertReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(Integer board_id);
	
	public Integer deleteReply(Integer reply_id);

	public String modifyReply(ReplyVO vo);
	
	// 댓글 개수
	public Integer countReply(Integer board_id);
	public Integer updateBoardReplyCount(@Param("board_id") Integer board_id, @Param("reply_count") Integer reply_count); 
}
