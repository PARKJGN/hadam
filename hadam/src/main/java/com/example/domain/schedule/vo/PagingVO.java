package com.example.domain.schedule.vo;

import lombok.Data;

@Data
public class PagingVO {

	private int pageNum;
	private int pageSize = 10; // 한페이지에 정보 10개씩
	private int pageCount = 10; // 페이지버튼 10개씩
	private int currentBlock;
	private int totalCount;
	private int recordIndex;
	private int totalpage;
	private int startpage;
	private int endpage;
	private int lastPage;
	private String addrName;
	private String middleCate;
	private String locationName;
	private String largeCate;

	public int getTotalpage() {
		totalpage = totalCount % pageSize == 0 ? totalCount / pageSize : (totalCount / pageSize) + 1;
		return totalpage;
	}


	public int getStartpage() {
		startpage = (currentBlock - 1) * pageCount + 1;
		return startpage;
	}


	public int getEndpage() {
		endpage = startpage + pageCount - 1;
		if (endpage > totalpage)
			endpage = totalpage;
		return endpage;
	}


	public int getLastPage() {
		lastPage = totalCount % pageSize > 0 ? (totalCount / pageSize) + 1 : totalCount / pageSize;
		return lastPage;
	}


	public int getCurrentBlock() {
		currentBlock = pageNum % pageCount == 0 ? pageNum / pageCount : pageNum / pageCount + 1;
		return currentBlock;
	}
	
	public int getRecordIndex() {
		recordIndex = (pageNum-1) * pageSize;
		return recordIndex;
	}

}
