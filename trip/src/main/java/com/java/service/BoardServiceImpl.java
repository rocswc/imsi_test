package com.java.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.dao.BoardDAO;
import com.java.vo.BoardVO;
import com.java.vo.HumanVO;
import com.java.vo.LikeVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO boarddao;
	
	public List<BoardVO> boardList() {
		return boarddao.boardList();
	}
	
	@Transactional
	public void insertBoard(BoardVO vo) {
		boarddao.insertBoard(vo);
		
		LikeVO likeVO = new LikeVO();
		likeVO.setBoard_id(vo.getBoard_id());
		likeVO.setHuman_id(vo.getHuman_id());
		likeVO.setLike_count(0);
		
		boarddao.insertLike(likeVO);
	}

	public BoardVO getBoard(Integer board_id) {
		return boarddao.getBoard(board_id);
	}
	
	@Transactional
	public int countLike(Integer board_id) {
		//System.out.println("게시글번호:" + board_id.toString());
		int likeCount = boarddao.countLike(board_id);
		boarddao.updateBoardLikeCount(board_id, likeCount);   
		return likeCount;
	}
	
	@Override
	public void addLike(Integer board_id, HumanVO human_id) {
		Map<String, Object> param = new HashMap<>();
		param.put("board_id", board_id);
		param.put("liker_id", human_id.getHuman_id());
		
		System.out.println("liker_id : " + human_id.getHuman_id());
		
		boarddao.addLike(param);
	}

	@Override
	public boolean isLikedByUser(Integer board_id, HumanVO human_id) {
	    Map<String, Object> param = new HashMap<>();
	    param.put("board_id", board_id);
	    param.put("liker_id", human_id.getHuman_id());

	    return boarddao.isLikedByUser(param) > 0;
	}
	
	public void unLike(Integer board_id) {
		boarddao.unLike(board_id);
	}
	
	public void modifyBoard(BoardVO vo) {
		boarddao.modifyBoard(vo);
	}
	
	@Transactional
	public void deleteBoard(Integer board_id) {
		boarddao.deleteReplyDB(board_id);
		boarddao.deleteLikeDB(board_id);
		boarddao.deleteBoard(board_id);
	}

}
