package com.java.vo;

import lombok.Data;

@Data
public class HikingVO {
	Integer	hiking_id;
	String	hiking_name;
	Integer	hiking_distance;
	Integer	hiking_height;
	String	hiking_level;
	String	hiking_info;
	String	hiking_date;
	double	hiking_latitude;
	double	hiking_longitude;
	Integer	hiking_cnt;
}
