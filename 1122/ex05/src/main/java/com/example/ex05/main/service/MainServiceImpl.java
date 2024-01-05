package com.example.ex05.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.mapper.MainMapper;
import com.example.ex05.menu.vo.MenuDTO;
import com.example.ex05.project.service.ProjectServiceImpl;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mainMappper;
	
	@Override
	public MemberDTO login(String userId) {
		
		return mainMappper.login(userId);
	}

	@Override
	public String getAuthoNo(long uno) {
		
		return mainMappper.getAuthoNo(uno);
	}

	@Override
	public List<MenuDTO> getMenu(String authoNo) {
	
		return mainMappper.getMenu(authoNo);
	}
	
	
	

}
