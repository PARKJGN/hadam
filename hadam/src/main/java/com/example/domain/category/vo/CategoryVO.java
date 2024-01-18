package com.example.domain.category.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryVO {

	private Integer categoryId;
	
	private String largeCategory;
	
	private String middleCategory;
	
	private String smallCategory;

	public String getMiddleCategory() {
		// TODO Auto-generated method stub
		return null;
	}
}
