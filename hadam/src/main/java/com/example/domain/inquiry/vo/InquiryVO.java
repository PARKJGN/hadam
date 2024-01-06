package com.example.domain.inquiry.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryVO {

	private Integer inquiryId;
	
	private Integer memberIndex;
	
	private String inquiryContent;
	
	private Date inquiryRegisteDate;
	
	private Boolean replyStatus;
}
