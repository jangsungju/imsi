package com.example.ex05.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.dao.BoardDAO;
import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	 private BoardDAO boardDAO;
	
	@Override
	public void register(MemberVO memberVO) {
	
		boardDAO.register(memberVO);
	
	}

	@Override
	public MemberVO get(Long uNo) {
		
		return boardDAO.get(uNo);
	}

	@Override
	public boolean modify(MemberVO member) {
		
		return boardDAO.modify(member);
	}

	@Override
	public boolean remove(Long uNo) {
			
		return boardDAO.remove(uNo);
	}

	@Override
	public List<MemberVO> getList() {

		return boardDAO.getList();
	}

	
		
	}
