package com.csm.customer.domain;

public class Criteria {

	private int page;			
	private int perPageNum; 	
	private int startPage; 
	private int endPage; 

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.endPage = page * perPageNum;
		//   		10		  1 * 10
		this.startPage = endPage - (perPageNum-1);
		//           1          10	 -		10	-	1
	}

	public void setPage(int page) {

		if (page <= 0) {//留뚯빟 �쁽�옱 議고쉶�븯�뒗 �럹�씠吏�媛� 0�씠�씪硫�
			this.page = 1;
			return;
		}
		this.page = page;
		this.endPage = page * perPageNum;
		//10     1	* 10
		this.startPage = endPage - (perPageNum-1);
		//1	-	 10	 -	 10 		-	1
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		//20
		this.perPageNum = perPageNum;

		this.endPage = page * perPageNum;
		//20     1	* 20
		this.startPage = endPage - (perPageNum-1);
		//1	  -	  20	 -	  20	-	1
	}

	public int getPage() {
		return page;
	}

	// method for MyBatis SQL Mapper -
	public int getPageStart() {

		return (this.page - 1) * perPageNum;
	}

	// method for MyBatis SQL Mapper
	public int getPerPageNum() {

		return this.perPageNum;
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

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", startPage=" + startPage + ", endPage=" + endPage
				+ "]";
	}

}
