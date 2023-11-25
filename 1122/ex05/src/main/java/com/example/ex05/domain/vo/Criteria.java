package com.example.ex05.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.extern.log4j.Log4j;


@Data
@Log4j
public class Criteria{

//              현재페이지, 
	private int pageNum;
//	            컬럼갯수
	private int amount;
	
	
	public Criteria() {
		this(1,10);
	log.info("들어오냐?");
	}
    
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
