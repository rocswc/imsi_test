package com.java.vo;
import lombok.Data;

@Data
public class AdminDashBoardVO {
	private String totalMembers; 		//전체회원수
	private String activeMembers; 		//활성회원수
	private String todayJoinedMembers; 	//오늘 가입 회원수
	private String monthJoinedMembers; 	//이번달 가입 회원수
	private String dormantMembers;		//휴면회원수
	private String withdrawnMember;		//탈퇴회원수
}