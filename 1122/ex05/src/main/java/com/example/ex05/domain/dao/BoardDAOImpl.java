package com.example.ex05.domain.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberVO;
import com.example.ex05.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public void register(MemberVO member) {
		boardMapper.insert(member);

	}

	@Override
	public MemberVO get(Long uNo) {
		
		return boardMapper.read(uNo);
	}

	@Override
	public boolean modify(MemberVO member) {

		return boardMapper.update(member) != 0;
	}

	@Override
	public boolean remove(Long uNO) {

		return boardMapper.delete(uNO) != 0;
	}

	@Override
	public List<MemberVO> getList() {

		return boardMapper.getList();
	}



}
