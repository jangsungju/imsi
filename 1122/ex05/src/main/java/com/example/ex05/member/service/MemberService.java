package com.example.ex05.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberProjectDTO;

@Service
public interface MemberService {
	
	public List<MemberDTO> search(MemberDTO searchRequest);
	
	public int getTotalCount(MemberDTO searchRequest);
	
	public List<MemberProjectDTO> readUserProject(Long uno);
	
	public boolean updateUserProject(MemberProjectDTO memberProjectDTO);

	public boolean deleteUserProject(Long uno,int pjtNo);
	
	public List<MemberProjectDTO> notAddUserProject(MemberProjectDTO searchNotAddUserProjects);
	
	public int getPjtTotalCount(MemberProjectDTO searchNotAddUserProjects);

    public boolean addUserProjects(MemberProjectDTO project);
    
    public int checkId(String memberDto);
    
}
