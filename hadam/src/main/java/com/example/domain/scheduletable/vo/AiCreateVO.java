package com.example.domain.scheduletable.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AiCreateVO {

	private Double lat;
	
	private Double lng;
	
	private List<Integer> memberIndexList;
	
	private List<String> categoryList;
	
	private String startDate;
	
	
}
