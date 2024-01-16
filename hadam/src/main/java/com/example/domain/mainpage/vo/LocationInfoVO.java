package com.example.domain.mainpage.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationInfoVO {
	/*
	 * 이름 , 평점, 리뷰갯수,주소,정보
	 * */
	private String locationName;
	private String locationRating;
	private String locationReviewCount;
	private String locationPlace;
	private String locationContent;
	private Integer locationId;

}
