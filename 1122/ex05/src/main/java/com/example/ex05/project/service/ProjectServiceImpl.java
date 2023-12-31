package com.example.ex05.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.member.vo.MemberProjectDTO;
import com.example.ex05.domain.project.vo.ProjectDTO;
import com.example.ex05.domain.project.vo.ProjectVO;
import com.example.ex05.mapper.ProjectMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProjectServiceImpl implements ProjectService {


	@Autowired
	private ProjectMapper projectMapper;
	
	@Override
	public List<ProjectDTO> search(ProjectDTO formData) {

		log.info("=============ProjectserviceImpl=============:" +formData);
		return projectMapper.search(formData);
	}

	@Override
	public int totalCount(ProjectDTO formData) {

		return projectMapper.totalCount(formData);
	
	}

	@Override
	public ProjectVO readProject(int pjtNo) {

		return projectMapper.readProject(pjtNo);
	
	}

	@Override
	public boolean modifyProjcet (ProjectVO formData) {
		return projectMapper.modifyProjcet(formData);
	}

	@Override
	public boolean registerProject(ProjectVO formData) {
		
		log.info("=============registerProjectImple================"+formData);
		return projectMapper.registerProject(formData);
	}

	@Override
	public List<ProjectDTO> projectMembers(int pjtNo) {
		
		return projectMapper.projectMembers(pjtNo);
	}

	@Override
	public boolean updateProjectMembers(ProjectDTO members) {
		
		return projectMapper.updateProjectMembers(members);
	}

	@Override
	public boolean deleteProjectMembers(long uno, int pjtNo) {
		
		return projectMapper.deleteProjectMembers(uno, pjtNo);
	}

	@Override
	public List<ProjectDTO> notAPM(ProjectDTO formData) {
		
		return projectMapper.notAPM(formData);
	
	}

	@Override
	public int notAPMCount(ProjectDTO formData) {
		
		return projectMapper.notAPMCount(formData);
	}

	@Override
	public boolean addProjectMembers(ProjectDTO selectedMembers) {

		return projectMapper.addProjectMembers(selectedMembers);

	}

	
	

	
}
