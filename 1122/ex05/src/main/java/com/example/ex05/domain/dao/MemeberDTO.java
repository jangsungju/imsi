package com.example.ex05.domain.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberProjectDTO;


@Repository
public interface MemeberDTO {
	
	public List<MemberDTO> search(MemberDTO formData);
	
	public List<MemberProjectDTO> readUserProject(Long uNo);
	
}
