package com.example.domain.location.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationVO {

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
	
	private Integer locationReviewCount;
	
	private Integer categoryId;
}
