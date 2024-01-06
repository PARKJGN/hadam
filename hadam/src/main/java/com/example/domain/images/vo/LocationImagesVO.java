package com.example.domain.images.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LocationImagesVO {

	private Integer locationImageId;
	
	private String locationImageType;
	
	private String locationImagePath;
	
	private String locationImageName;
	
	private String locationImageOriginalname;
	
	private Integer locationId;
}
