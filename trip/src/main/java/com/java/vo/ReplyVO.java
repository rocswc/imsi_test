package com.java.vo;

import lombok.Data;

@Data
public class ReplyVO {
	Integer reply_id;
	Integer board_id;
	String reply_content;
	String reply_writer;
	String reply_date;
}
