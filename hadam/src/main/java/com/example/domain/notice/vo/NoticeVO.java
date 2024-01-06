package com.example.domain.notice.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {

	private Integer noticeId;
	
	private String noticeTitle;
	
	private String noticeContent;
	
	private Date noticeRegisteDate;
	
	private Date noticeUpdateDate;
	
	private Integer noticeViews;
}
