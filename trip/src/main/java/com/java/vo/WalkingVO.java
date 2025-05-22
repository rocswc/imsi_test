package com.java.vo;

import lombok.Data;

@Data
public class WalkingVO {
	private Integer walking_id ;
	private String	walking_name;
	private String	walking_name2;
	private String	walking_distance;
	private String	walking_info;
	private String walking_date;
	private double	walking_latitude;
	private double	walking_longitude;
	Integer	walking_cnt;
}
