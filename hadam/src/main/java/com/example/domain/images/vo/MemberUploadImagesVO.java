package com.example.domain.images.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberUploadImagesVO {
	
	private Integer memberUploadImageId;
	
	private String memberUploadImageType;
	
	private String memberUploadImagePath;
	
	private String memberUploadImageName;
	
	private String memberUploadImageOriginalname;	
	
	private Integer boardId;
	
	private Integer messageId;
	
	private Integer memberIndex;
	
}
