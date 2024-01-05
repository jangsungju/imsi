package com.example.ex05.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.menu.vo.MenuDTO;


@Mapper
public interface MainMapper {
	
	public MemberDTO  login(String userId);
	
	public String getAuthoNo(long uno);
	
	public List<MenuDTO> getMenu(String authoNo);
	

}
