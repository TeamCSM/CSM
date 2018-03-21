package com.csm.matching.domain;

public class Criteria {

	private int page;		//현재 페이지
	private int perPageNum; //리스트 갯수
	private int start;		//시작 리스트
	private int end;		//끝 리스트
	
	/*
		
		Criteria 생성시 default로 page값과 perPageNum의 초기값
		start, end의 연산값이 들어감
		end = 현재페이지 X 리스트갯수
		start = 끝리스트 - (리스트갯수-1)
	*/
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.end = page * perPageNum;
		this.start = end - (perPageNum-1);
	}
	/*
		페이지 이동시 발생되는 메서드
		page의 변환값에 따라 page, end, start값이 변함
	*/
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
		this.end = page * perPageNum;
		this.start = end - (perPageNum-1);
	}
	/*
		리스트 갯수 변화시 발생되는 메서드
		perPageNum의 변환값에 따라 perPageNum, end, start값이 변함
	*/
	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
		this.end = page * perPageNum;
		this.start = end - (perPageNum-1);
	}
	
	public int getPage() {
		return this.page;
	}
	// method for mapper
	public int getStart() {
		return this.start;
	}
	// method for mapper
	public int getEnd() {
		return this.end;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", start=" + start + ", end=" + end + "]";
	}
}
