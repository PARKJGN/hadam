package com.example.domain.preference.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PreferenceVO {

	private Integer preferenceId;
	
	private Integer categoryId;
	
	private Integer memberIndex;
}
