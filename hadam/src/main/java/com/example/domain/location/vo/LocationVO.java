package com.example.domain.location.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationVO{

	private Integer locationId;
	
	private String locationName;
	
	private String averageTime;
	
	private String locationPlace;
	
	private Float locationRating;
	
	private String locationContent;
	
	private String locationOpenTime;
	
	private String locationCloseTime;
	
	private String locationMenusName;
	
	private String locationMenusPrice;
	
	private String locationLatitude;
	
	private String locationLongitude;
	
	// DB에 문자열이 들어옴
//	private Integer locationReviewCount;
	private String locationReviewCount;
	
	private Integer categoryId;
	
	// 장소 이미지 띄우기
	private String locationImageOriginalname;
		
	// 장소 이미지 띄우기
	private String locationImagePath;

	// 장소 이미지 띄우기
	private String locationImageName;
	
	// 장소 리뷰 띄우기
	private Integer locationReviewId;
	
	// 장소 리뷰 띄우기
	private String locationReviewContent1;
	
	private String locationReviewContent2;
	
	private String locationReviewContent3;
	
	private String locationReviewContent4;
	
	private String locationReviewContent5;
	
	// 장소 소분류
	private String smallCategory;
	
	// 장소 대분류
	private String largeCategory;
	
	// 장소 검색시 검색어
	private String locKeyword;
	
}
