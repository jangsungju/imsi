package com.example.ex05.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.dao.MemberDTOImpl;
import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberProjectDTO;
import com.example.ex05.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j

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


	@Override
	public List<MemberProjectDTO> readUserProject(Long uno) {
		
		return memberMapper.readUserProject(uno);
	}


	@Override
	public boolean updateUserProject(MemberProjectDTO memberProjectDTO) {
		
		return memberMapper.updateUserProject(memberProjectDTO);
	}


	@Override
	public boolean deleteUserProject(Long uno,int pjtNo) {
		
		return memberMapper.deleteUserProject(uno, pjtNo);
	}


	@Override
	public List<MemberProjectDTO> notAddUserProject(MemberProjectDTO searchNotAddUserProjects) {
		
		
		return memberMapper.notAddUserProject(searchNotAddUserProjects);
	}


	@Override
	public int getPjtTotalCount(MemberProjectDTO searchNotAddUserProjects) {
		
		return memberMapper.getPjtTotalCount(searchNotAddUserProjects);
	}


	@Override
	public boolean addUserProjects(MemberProjectDTO project) {
		log.info("=====================serviceImpl============"+ project);
		return memberMapper.addUserProjects(project);
	}


	@Override
	public int checkId(String uId) {
		
		return memberMapper.checkId(uId);
	}



	
	
	

}
