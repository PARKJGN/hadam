package com.example.domain.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private Integer memberIndex;
	
	private Boolean adminStatus;
	
	private String memberId;
	
	private String memberPassword;
	
	private String memberPhoneNumber;
	
	private String memberNickname;
	
	private String memberSex;
	
	private String memberBirth;
	
	private Date memberLastLoginDate;
	
	private String memberStatus;
	
	private Date memberRegisteDate;
	
	private Date memberUpdateDate;
	
	private Date memberLeaveDate;
	
	private Integer memberApi;
	
	
	// 관리자
	// 유저가 작성한 스케줄 수, 게시글 수, 댓글 수 서브쿼리로 불러오기
	private Integer scheduleCnt;
	
	private Integer boardCnt;
	
	private Integer commentCnt;
}
