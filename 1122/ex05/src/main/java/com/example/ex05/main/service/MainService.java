package com.example.ex05.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.menu.vo.MenuDTO;

@Service
public interface MainService {

	public MemberDTO login(String userId);
	
	public String getAuthoNo(long uno);
	
	public List<MenuDTO> getMenu(String authoNo);
	
}
