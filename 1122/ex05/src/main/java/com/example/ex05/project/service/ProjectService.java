package com.example.ex05.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ex05.domain.project.vo.ProjectDTO;
import com.example.ex05.domain.project.vo.ProjectVO;

@Service
public interface ProjectService {

	public List<ProjectDTO> search(ProjectDTO formData);
	
	public int totalCount(ProjectDTO formData);
	
	public ProjectVO readProject(int pjtNo);
	
	public boolean modifyProjcet(ProjectVO formData);
	
	public boolean registerProject(ProjectVO formData);
	
	public List<ProjectDTO> projectMembers(int pjtNo);
	
	
}
