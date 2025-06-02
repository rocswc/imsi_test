package com.java.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java.dao.QnADAO;
import com.java.vo.QnABoardReplyVO;
import com.java.vo.QnABoardVO;

@Service("qnAService")
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	private QnADAO qnADAO; 
	
	public List<QnABoardVO> getQnAList(QnABoardVO vo){
		return qnADAO.getQnAList(vo);
	};	
	
	public void qnaBoardRegister(QnABoardVO vo){
		qnADAO.qnaBoardRegister(vo);
	}
	
	public List<QnABoardReplyVO> getQnAReplyList(QnABoardVO vo){
		return qnADAO.getQnAReplyList(vo);
	};
	
	public void qnaBoardReplyRegister(QnABoardReplyVO vo){
		qnADAO.qnaBoardReplyRegister(vo);
	}
	
	public Integer qnaDeleteReply(QnABoardReplyVO vo){
		return qnADAO.qnaDeleteReply(vo);
	}
	
	public Integer qnaUpdateReply(QnABoardReplyVO vo){
		return qnADAO.qnaUpdateReply(vo);
	}
	
}