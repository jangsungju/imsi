package com.example.ex05.domain.project.vo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProjectVO {

	private int pjtNo;
	private String pjtNm;
	private String companyNm;
	private String compyNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtFromDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String pjtToDate;
	
	
	
}
