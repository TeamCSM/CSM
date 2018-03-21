package com.csm.customer.domain;



import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.csm.customer.domain.Criteria;

public class PageMaker {

  private int totalCount;//SQL의 결과로 나온 데이터의 전체 개수
  private int startPage;//시작 페이지
  private int endPage;//끝 페이지
  private boolean prev;//이전
  private boolean next;//다음
  private int displayPageNum = 10;//10
  private Criteria cri;//현재 페이지의 기준

  public void setCri(Criteria cri) {
    this.cri = cri;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;

    calcData();
  }

  private void calcData() {
////끝페이지10      cri에서 페이지 얻어옴	  1					 10 			*		10			
    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
//시작페이지			10	    -	 10		   + 1
    startPage = (endPage - displayPageNum) + 1;
//
    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

    if (endPage > tempEndPage) {
      endPage = tempEndPage;
    }

    prev = startPage == 1 ? false : true;

    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

  }

  public int getTotalCount() {
    return totalCount;//총갯수
  }

  public int getStartPage() {
    return startPage;//시작 페이지
  }

  public int getEndPage() {
    return endPage;//끝 페이지
  }

  public boolean isPrev() {
    return prev;//전
  }

  public boolean isNext() {
    return next;//다음
  }

  public Criteria getCri() {
    return cri;
  }

 public String makeQuery(int page) {

    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
        .queryParam("perPageNum", cri.getPerPageNum()).build();

    return uriComponents.toUriString();
  }

  public String makeSearch(int page){
    
    UriComponents uriComponents =
              UriComponentsBuilder.newInstance()
              .queryParam("page", page)
              .queryParam("perPageNum", cri.getPerPageNum())
              .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
              .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
              .build();             
    
    return uriComponents.toUriString();
  }
}
