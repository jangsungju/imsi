package com.example.ex05.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.ex05.domain.member.vo.MemberProjectDTO;
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
	
	public boolean updateProjectMembers(ProjectDTO members);
	
	//못 찾는다고 하면 param으로 이름을 써주자
	public boolean deleteProjectMembers(@Param("uno") long uno, @Param("pjtNo") int pjtNo);
	
	public List<ProjectDTO> notAPM(ProjectDTO formData);
	
	public int notAPMCount(ProjectDTO formData);
	
	public boolean addProjectMembers(ProjectDTO selectedMembers);
}
