package com.example.ex05.domain.vo;

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
	private String pjtFromDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtToDate;
	
	private String action;

	
	
	
}
