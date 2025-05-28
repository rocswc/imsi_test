package com.java.vo;

import lombok.Data;

@Data
public class HotspotVO {
	Integer	hotspot_id;
	Integer	hotspot_cnt;
	String	hotspot_name;
	String	hotspot_distance;
	Integer	hotspot_height;
	String	hotspot_level;
	String	hotspot_info;
	String	hotspot_date;
	double	hotspot_latitude;
	double	hotspot_longitude;
	private Double user_lat;
	private Double user_lon;
	private Double distance;
}
