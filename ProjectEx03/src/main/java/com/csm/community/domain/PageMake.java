package com.csm.community.domain;

public class PageMake extends QuestionboardVO{

	private int page;
	private int perPageNum;
	private int start;
	private int end;
	private String searchType;
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public PageMake() {
		this.page = 1;
		this.perPageNum = 10;
		this.end = page*perPageNum;
		this.start = end-(perPageNum-1);
	}

	public void setPage(int page) {
		
		if(page <= 0) {
			this.page=1;
			return;
		}
		
		this.page=page;
		this.end = page*perPageNum;
		this.start = end-(perPageNum-1);
	}
	
	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum=10;
			return;
		}
		
		this.perPageNum=perPageNum;
		this.end = page*perPageNum;
		this.start = end-(perPageNum-1);
	}
	
	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	@Override
	public String toString() {
		return "PageMake [page=" + page + ", perPageNum=" + perPageNum + ", start=" + start + ", end=" + end
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
