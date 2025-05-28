package com.java.vo;

import lombok.Data;

@Data
public class RunningVO {
	Integer	running_id;
	Integer	running_cnt;;
	String	running_name;
	String	running_distance;
	String	running_time;
	String	running_info;
	String	running_date;
	double	running_latitude;
	double	running_longitude;
	private Double user_lat;
	private Double user_lon;
	private Double distance;
}
