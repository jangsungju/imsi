package com.example.ex05.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.example.ex05.domain.member.vo.MemberProjectDTO;
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
	
	public boolean updateProjectMembers(ProjectDTO members);
	
	//public boolean deleteProjectMembers(@Param("uno") long uno, @Param("pjtNo") int pjtNo);

	public boolean deleteProjectMembers(long uno, int pjtNo);
	
	public List<ProjectDTO> notAPM(ProjectDTO formData);
	
	public int notAPMCount(ProjectDTO formData);
	
	public boolean addProjectMembers(ProjectDTO selectedMembers);
	
}
