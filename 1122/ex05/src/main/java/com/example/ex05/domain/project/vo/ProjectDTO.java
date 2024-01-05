package com.example.ex05.domain.project.vo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProjectDTO {

	private int pjtNo;
	private String pjtNm;
	private String companyNm;
	private String compyNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String inpDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String wdpDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtFromDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtToDate;
	
	private int pageNum;
	private int TotalCount;
	private int amount;
	private int rn;
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next;
	
	private long uno;
	private String unm;
	private String pjtRole;
	private String action;
	
	private String jobRank;
	private String jobSkill;
	
	
}
