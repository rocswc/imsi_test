package com.java.service;

import java.util.List;
import java.util.Map;

import com.java.vo.BoardVO;
import com.java.vo.HumanVO;

public interface BoardService {
	
	public List<BoardVO> boardList(Map<String, Object> param);
	
	public Integer boardListCount();
	
	public void insertBoard(BoardVO vo);
	
	public BoardVO getBoard(Integer board_id);

	public int countLike(Integer board_id);
	
	public void addLike(Integer board_id, HumanVO human_id);
	
	public boolean isLikedByUser(Integer board_id, HumanVO human_id);
	
	public void unLike(Integer board_id, HumanVO human_id);
	
	public void modifyBoard(BoardVO vo);
	
	public void deleteBoard(Integer board_id);
}
