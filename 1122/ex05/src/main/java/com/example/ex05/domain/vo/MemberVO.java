package com.example.ex05.domain.vo;

//테이블의 정보와 1:1로 맵핑이 될수있게 만들기 위해 필요
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberVO {

	
//	uNo varchar2(50) NOT NULL PRIMARY KEY,
//	uNm varchar2(100) NOT null,
//	pwd varchar2(100) NOT null,
//	birth varchar2(15),
//	photo varchar2(200) NULL,
//	sex varchar2(20),
//	entrDate varchar2(15) NOT NULL,
//	jobRank varchar2(2) NOT NULL,
//	jobSkill varchar2(2) NOT NULL,
//	devPt varchar2(2) NOT NULL,
//	inoffi_sts varchar2(2) NOT NULL,
//	mblNo varchar2(20),
//	emailAddr varchar2(100),
//	delete_col char(2)
	
	private long uno;
   	private String unm;
	private String pwd;
	
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
	

	
	
	
	
	}
	
	
	

