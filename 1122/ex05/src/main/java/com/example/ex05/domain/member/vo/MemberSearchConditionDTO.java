package com.example.ex05.domain.member.vo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberSearchConditionDTO {
	
	private String unm;
	private String jobRank;
	private String inoffiSts;
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String endDate;
	
	private int pageNum;
	private int amount;
}
