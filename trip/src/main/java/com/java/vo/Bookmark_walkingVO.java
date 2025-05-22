package com.java.vo;

import lombok.Data;

@Data
public class Bookmark_walkingVO {
	
	
	private String walking_id ;
	private String	walking_name;
	private String	walking_distance;
	private String	walking_info;
	private String walking_date;
	private double	walking_latitude;
	private double	walking_longitude;
	Integer	walking_cnt;
	private String user_id;
	private String human_id;

}
