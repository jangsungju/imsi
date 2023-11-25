package com.example.ex05.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ex05.domain.vo.Criteria;
import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.domain.vo.PageDTO;

@Service
public interface MemberService {
	
	public List<MemberDTO> search(MemberDTO searchRequest);
	
	public int getTotalCount(MemberDTO searchRequest);

}
