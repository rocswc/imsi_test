package com.java.vo;

import lombok.Data;

@Data
public class LikeVO {
	Integer like_id;
	String human_id;
	Integer board_id;
	Integer like_count;
}
