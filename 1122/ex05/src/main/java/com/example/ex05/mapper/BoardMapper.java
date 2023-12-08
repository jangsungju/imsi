package com.example.ex05.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.domain.vo.MemberVO;

@Mapper
public interface BoardMapper {

//	@Select("SELECT * FROM MEMBER")
	public List<MemberVO> getList();
	
	public void insert(MemberVO member);
	
	public MemberVO read(Long uno);
	
	public int delete(Long uno);
	
	public int update(MemberVO member);
	
	
}
