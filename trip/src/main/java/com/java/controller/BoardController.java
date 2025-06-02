package com.java.controller;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.service.BoardService;
import com.java.vo.BoardVO;
import com.java.vo.HumanVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardservice;
	
	//게시판 페이지
	@RequestMapping("board")
	public void board() {
	} 
	
	//게시판 페이지네이션
	@GetMapping("boardList")
	@ResponseBody
	public Map<String,Object> boardList(@RequestParam("page") int page, @RequestParam("size") int size) {
		
	    // 파일명, 리얼파일명 콘솔 출력
//	    for (BoardVO board : boardList) {
//	        System.out.println("게시글 ID: " + board.getBoard_id());
//	        System.out.println("파일명: " + board.getBoard_fname());
//	        System.out.println("리얼파일명: " + board.getBoard_realfname());
//	        System.out.println("댓글수:" + board.getReply_count());
//	        System.out.println("좋아요수:" + board.getLike_count());
//	    }
		Integer startRow = (page-1)*size;
		Integer endRow = page*size;
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		
		List<BoardVO> boardList = boardservice.boardList(param);
		Integer totalCount = boardservice.boardListCount();
		Integer totalPage = (int) Math.ceil((double) totalCount/size);
		
		Map<String, Object> result = new HashMap<>();
		result.put("boardList", boardList); 
		result.put("totalPages", totalPage);
	    result.put("currentPage", page);
		
	    //System.out.println(result.toString());
	    //System.out.println(result);
	    
		return result;
	}
	
	//게시글 작성페이지
	@GetMapping("boardInsert")
	public String boardForm(HttpSession session) {
		
		HumanVO loginUser = (HumanVO) session.getAttribute("loginUser");
		if( loginUser == null ) {
			return "getHuman";
		}
	    return "board_insert";
	}
	
	
	//게시글 등록 & 좋아요테이블 생성
	@PostMapping("boardRegister")
	public String insertBoard(BoardVO vo, MultipartFile file, HttpServletRequest request) {		
		System.out.println(vo.toString());
		
		// 경로 가져오기
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/");
		
		if (!file.isEmpty()) {
			String getOriginalFilename = file.getOriginalFilename();
			long getSize = file.getSize();
			System.out.println(uploadPath);
			UUID realfname = UUID.randomUUID();
		
			vo.setBoard_fname(getOriginalFilename);
			vo.setBoard_fsize(getSize);
			vo.setBoard_realfname(realfname.toString());
		
			//File f = new File("D:\\trip4\\trip\\src\\main\\webapp\\resources\\images\\"+realfname + "_" + getOriginalFilename);
			File f = new File(uploadPath + realfname + "_" + getOriginalFilename);
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		boardservice.insertBoard(vo);
		return "redirect:/board";
	}
	
	//게시글 보기
	@GetMapping("getBoard")
	public String getBoard(@RequestParam Integer board_id, Model m, HttpSession session) {
		BoardVO result = boardservice.getBoard(board_id);
		
		//System.out.println("파일명: " + result.getBoard_fname());
	    //System.out.println("리얼파일명: " + result.getBoard_realfname());
		
		m.addAttribute("board", result);
		
		
		HumanVO loginUser = (HumanVO) session.getAttribute("loginUser");
		if( loginUser == null ) {
			return "getHuman";
		}
		
		return "board_detail";
	}
		
	//게시글(board_detail) 좋아요 수
	@GetMapping("likeCount")
	@ResponseBody
	public int countLike(@RequestParam Integer board_id) {
		
		//System.out.println("cotroller 게시글번호: " + board_id);
		//System.out.println(boardservice.countLike(board_id));
		return boardservice.countLike(board_id);
	}
	
	//게시글(board_detail)페이지 로드시 ♡유지
	@GetMapping("likeHeart")
	@ResponseBody
	public boolean isLikedByUser(@RequestParam Integer board_id, HttpSession session) {
		HumanVO human_id = (HumanVO) session.getAttribute("loginUser");
		
		//System.out.println(board_id);
		
		boolean isLiked = false;
		
		if (human_id != null) {
		    isLiked = boardservice.isLikedByUser(board_id, human_id);
		}
		
		//System.out.println("boolean:" + isLiked);
		
		return isLiked;
	}
	
	
	
	// 좋아요 추가
	@GetMapping("addLike")
	@ResponseBody
	public String addLike(@RequestParam Integer board_id, HttpSession session, Model m) {
		HumanVO human_id = (HumanVO) session.getAttribute("loginUser");
		
		
	    if (human_id == null) {
	        return "not_logged_in";
	    }
	    
	    // 이미 좋아요 눌렀는지 확인
	    if (boardservice.isLikedByUser(board_id, human_id)) {
	    	return "already_liked";
	    }
	    
	    // 좋아요 추가
	    boardservice.addLike(board_id, human_id);
	    return "liked";
	}
	
	
	// 좋아요 감소
	@GetMapping("unLike")
	@ResponseBody
	public void unLike(@RequestParam Integer board_id, HttpSession session) {
		HumanVO human_id = (HumanVO) session.getAttribute("loginUser");
		
		boardservice.unLike(board_id, human_id);
	}
	
	
	// 게시글 수정
	@PostMapping("modifyBoard")
	@ResponseBody
	public void modifyBoard(BoardVO vo){
		System.out.println(vo.toString());
		boardservice.modifyBoard(vo);
	}
	
	
	// 게시글 삭제(+ 댓글DB, 좋아요DB 같이 삭제)
	@DeleteMapping("deleteBoard")
	@ResponseBody
	public void deleteBoard(Integer board_id){
		boardservice.deleteBoard(board_id);
	}
}