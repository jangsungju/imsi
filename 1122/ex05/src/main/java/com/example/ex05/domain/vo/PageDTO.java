package com.example.ex05.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageDTO {
//	현재 페이지를 기준으로 시작 페이지
 	private int start;
//	현제 페이지를 기준으로 마지막 페이지
 	private int end;
//	실제 마지막 페이지
	private int realEnd;
//	이전 버튼과 다음 버튼의 유무 검사
	private boolean prev,next;
	
//    전체 게시글 수	
	private int total;
	
	private Criteria criteria;
//	private int pageNum;
//	
//	private int amount;
	
	public PageDTO(int total,Criteria criteria) {
		super();
		this.total = total;
//		this.pageNum = pageNum;
//		this.amount = amount;
		
		
//		ceil(실수 값): 올림처리 페이지에 게시글이 한 개라도 있다면, 올림을 하여 해당 페이지를 표시하기 위함
      this.end = (int)(Math.ceil(criteria.getPageNum()/(double)criteria.getAmount())) * criteria.getAmount();
//	  endpage에서 -9를 하면 startPage를 구할 수 있다.
      this.start = end - (criteria.getAmount() -1);
//     실제 마지막 페이지는 전체 게시글 개수에서 amount를 나누어 주게 된다. 하지만 1개의 게시륵이 있더라고 페이지를
//      표현해야 하기 때문에 실수로 나누어 준 다음 소수점을 올림하여 페이지를 +1 해준다.
       this.realEnd = (int) Math.ceil( total * 1.0 / criteria.getAmount());

//       endPage는 10의 배수이기 때문에 realEnd보다 더 커지면 realEnd를 넣어준다.
	   if(this.realEnd < this.end) {
		   this.end = this.realEnd;
	   }
//	1~10: 1단위
//	   11~20: 2단위
	  
//	 이전단위가 있는 경우  
	   this.prev = this.start > 1;
//	 다음 단위가 있는 경우
	   this.next = this.end <  this.realEnd;
	   
	   
	}
	
	
	
}
