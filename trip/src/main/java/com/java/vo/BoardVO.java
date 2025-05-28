package com.java.vo;
import lombok.Data;

@Data
public class BoardVO {
	Integer board_id;
	String board_cata;
	String board_title;
	String board_date;
	String board_content;
	Integer board_view; // 조회수
	String board_tag;
	String human_id;
	String board_fname; // 파일명
	String board_realfname; // 저장된 파일이름
	long board_fsize; // 파일크기
	Integer reply_count; // 댓글수
	Integer like_count; // 좋아요수
	String liker_id; // 좋아요한 유저id
}