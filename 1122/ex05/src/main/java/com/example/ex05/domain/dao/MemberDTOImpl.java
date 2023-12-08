package com.example.ex05.domain.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.domain.vo.MemberProjectDTO;
import com.example.ex05.mapper.MemberMapper;

@Repository
public class MemberDTOImpl implements MemeberDTO {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<MemberDTO> search(MemberDTO formData) {
		return null;
	}
	
	@Override
	public List<MemberProjectDTO> readUserProject(Long uno) {
		return null;
	}
	
	
	
}
