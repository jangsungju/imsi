package com.example.ex05.domain.member.vo;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Component
@Data
public class MemberDTO {

	private long uno;
   	private String unm;
	private String pwd;
	 
	@JsonProperty("uId")
	private String uId;
	private String authoNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String birth;
	private String photo;
	private String sex;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String entrDate;
	private String jobRank;
	private String jobSkill;
	private String devPt;
	private String inoffiSts;
	private String mblNo;
	private String emailAddr;
	private String deleteCol;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String endDate;
	
	private int totalCount;
	private int pageNum;
	private int amount;
	private int rn;
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next; 
	
}   
    