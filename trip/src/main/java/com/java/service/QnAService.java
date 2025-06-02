package com.java.service;
import java.util.List;
import com.java.vo.QnABoardReplyVO;
import com.java.vo.QnABoardVO;

public interface QnAService {
	List<QnABoardVO> getQnAList(QnABoardVO vo);
	void qnaBoardRegister(QnABoardVO vo);
	List<QnABoardReplyVO> getQnAReplyList(QnABoardVO vo);
	void qnaBoardReplyRegister(QnABoardReplyVO vo);
	Integer qnaDeleteReply(QnABoardReplyVO vo);
	Integer qnaUpdateReply(QnABoardReplyVO vo);
}
