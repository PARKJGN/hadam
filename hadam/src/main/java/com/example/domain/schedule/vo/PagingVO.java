package com.example.domain.schedule.vo;

import lombok.Data;

@Data
public class PagingVO {

	private int pageNum;
	private int pageSize = 10; // 한페이지에 정보 10개씩
	private int pageCount = 10; // 페이지버튼 10개씩
	private int currentBlock; // 현재 페이지가 속한 블록(일정 범위의 페이지) 
	private int totalCount; // 전체 데이터의 개수 이 값은 페이징 처리에서 전체 데이터의 개수를 파악하여 총 몇 페이지가 필요한지 계산하는 데 사용
	private int recordIndex; // 현재 페이지에서 첫 번째로 표시되는 데이터의 인덱스를 나타내어 해당 페이지의 데이터를 추출하는 데 사용
	private int totalpage; // 페이징 처리에서 필요한 전체 페이지의 수를 나타내며, 사용자에게 페이지 수를 보여주거나 특정 페이지로 이동할 때 사용
	private int startpage; // 현재 페이징 블록에서 시작하는 페이지 번호를 나타냄
	private int endpage; // 현재 페이징 블록에서 끝나는 페이지 번호를 나타냄
	private int lastPage; // 전체 데이터를 기준으로 마지막 페이지의 번호를 나타냄
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
