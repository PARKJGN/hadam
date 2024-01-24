package com.example.domain.reviews.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationReviewsVO {

	private Integer locationReviewId;
	
	private String locationReviewContent1;
	
	private String locationReviewContent2;
	
	private String locationReviewContent3;
	
	private String locationReviewContent4;
	
	private String locationReviewContent5;
	
	private Integer locationId;
	
}
