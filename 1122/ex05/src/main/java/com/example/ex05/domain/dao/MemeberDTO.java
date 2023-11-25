package com.example.ex05.domain.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.ex05.domain.vo.MemberDTO;


@Repository
public interface MemeberDTO {
	
	public List<MemberDTO> search(MemberDTO formData);
	
}
