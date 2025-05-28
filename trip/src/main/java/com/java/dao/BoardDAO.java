package com.java.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.vo.BoardVO;
import com.java.vo.LikeVO;

@Mapper
public interface BoardDAO {

	public List<BoardVO> boardList();

	public void insertBoard(BoardVO vo);
	
	public void insertLike(LikeVO vo);
	
	public BoardVO getBoard(Integer board_id);
	
	public Integer countLike(Integer board_id);
	public Integer updateBoardLikeCount(@Param("board_id") Integer board_id, @Param("like_count") Integer like_count);  
	
	public void addLike(Map<String, Object> param);
	public int isLikedByUser(Map<String, Object> param);
	
	public void unLike(Integer board_id);
	
	public void modifyBoard(BoardVO vo);
	
	// 게시글 삭제(댓글DB, 좋아요DB 같이 제거)
	public void deleteBoard(Integer board_id);
	
	public void deleteReplyDB(Integer board_id);
	
	public void deleteLikeDB(Integer board_id);
}
