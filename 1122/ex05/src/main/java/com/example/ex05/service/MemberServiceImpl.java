package com.example.ex05.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.dao.MemberDTOImpl;
import com.example.ex05.domain.vo.Criteria;
import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.domain.vo.PageDTO;
import com.example.ex05.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	
	@Override
	public List<MemberDTO> search(MemberDTO dateForm) {
		return memberMapper.search(dateForm);
	}


	@Override
	public int getTotalCount(MemberDTO dateForm) {
		
		return memberMapper.getTotalCount(dateForm);
	}
	

}
