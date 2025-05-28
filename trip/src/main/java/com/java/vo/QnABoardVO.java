package com.java.vo;
import lombok.Data;

@Data
public class QnABoardVO {
	private Integer board_id;
	private String human_id;
	private String board_title;
	private String board_content;
	private String board_date;
	private String board_status;
}