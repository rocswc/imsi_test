package com.java.vo;
import lombok.Data;

@Data
public class QnABoardReplyVO {
	private Integer reply_id;
	private Integer board_id;
	private String writer_id;
	private String writer_type;   //'회원','관리자'
	private String reply_content;
	private String reply_date;
}