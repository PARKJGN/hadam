package com.example.domain.reviews.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationReviewsVO {

	private Integer locationReviewId;
	
	private String locationReviewContent;
	
	private Integer locationId;
	
}
