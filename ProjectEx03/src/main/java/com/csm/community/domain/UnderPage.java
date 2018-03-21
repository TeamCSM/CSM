package com.csm.community.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.rmi.server.UnicastRemoteObject;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class UnderPage extends PageMake{

	private int totalCount; //전체 데이터 개수
	private int startPage; //하단 시작 페이지
	private int endPage; //하단 끝 페이지
	private boolean prev;
	private boolean next;
	private int displayPageNum=10;// 하단에 보여지는 페이지 번호 갯수
	private PageMake pm;
	
	
	public String makeQuery(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", pm.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", pm.getPerPageNum())
				.queryParam("searchType", ((PageMake) pm).getSearchType())
				.queryParam("keyword", encoding(((PageMake) pm).getKeyword())).build();
		
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		}
		catch(UnsupportedEncodingException e) {
			return "";
		}
	}

	public void setPm(PageMake pm) {
		this.pm = pm;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	private void calcData() {
		
		//startPage를 구하기 위해 올림처리 해서 구한 endPage
		endPage = (int)(Math.ceil(pm.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage = (endPage-displayPageNum)+1;
		
		//실제 하단에 표시되는 페이지 끝 번호
		int tempEndPage = (int)(Math.ceil(totalCount/(double)pm.getPerPageNum()));
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * pm.getPerPageNum() >= totalCount ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public PageMake getPm() {
		return pm;
	}

	@Override
	public String toString() {
		return "UnderPage [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", pm=" + pm + "]";
	}
	
}
