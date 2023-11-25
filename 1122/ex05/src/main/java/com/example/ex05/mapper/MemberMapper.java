package com.example.ex05.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.ex05.domain.vo.Criteria;
import com.example.ex05.domain.vo.MemberDTO;

//@Mapper
//public interface MemberMapper {
//	public List<MemberDTO> search(MemberDTO formData,Criteria criteria);
//
//}

@Mapper
public interface MemberMapper {
	public List<MemberDTO> search(MemberDTO dateForm);

	public int getTotalCount(MemberDTO dateForm);
	

}