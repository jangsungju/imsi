package com.example.ex05.domain.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.domain.vo.MemberVO;

@Repository
public interface BoardDAO {

	public void register(MemberVO member);
	public MemberVO get(Long uNo);
	public boolean modify(MemberVO member);
	public boolean remove(Long uNO);
	public List<MemberVO> getList();
	
}
