package com.example.ex05.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.ex05.domain.project.vo.ProjectDTO;
import com.example.ex05.domain.project.vo.ProjectVO;

@Mapper
public interface ProjectMapper {

	public List<ProjectDTO> search (ProjectDTO formData);

	public int totalCount (ProjectDTO formData);
	
	public ProjectVO readProject(int pjtNO);
	
	public boolean modifyProjcet(ProjectVO formData);
	
	public boolean registerProject(ProjectVO formData);
	
	public List<ProjectDTO> projectMembers(int pjtNo);
	
	
}
