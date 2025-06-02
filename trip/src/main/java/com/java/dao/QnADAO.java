package com.java.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.java.vo.QnABoardReplyVO;
import com.java.vo.QnABoardVO;

@Mapper
public interface QnADAO {
	public List<QnABoardVO> getQnAList(QnABoardVO vo);
	public void qnaBoardRegister(QnABoardVO vo);
	List<QnABoardReplyVO> getQnAReplyList(QnABoardVO vo);
	void qnaBoardReplyRegister(QnABoardReplyVO vo);
	Integer qnaDeleteReply(QnABoardReplyVO vo);
	Integer qnaUpdateReply(QnABoardReplyVO vo);
}