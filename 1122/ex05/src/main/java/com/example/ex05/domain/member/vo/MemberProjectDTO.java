package com.example.ex05.domain.member.vo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class MemberProjectDTO {
	private long uno;
   	private String unm;
   	private String jobRank;
   	
   	private String pjtRole;
	private int pjtNo;
	private String pjtNm;
	private String companyNm;
	private String compyNo;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String entrDate;
	

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String inpDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String wdpDate;
	
		
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtFromDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtToDate;
	
	private String action;

	private int pageNum;
	private int pjtTotalCount;
	private int amount;
	private int rn;
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next;
	
	
}
