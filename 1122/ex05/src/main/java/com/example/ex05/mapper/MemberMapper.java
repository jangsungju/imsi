package com.example.ex05.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberProjectDTO;

//@Mapper
//public interface MemberMapper {
//	public List<MemberDTO> search(MemberDTO formData,Criteria criteria);
//
//}

@Mapper
public interface MemberMapper {
	public List<MemberDTO> search(MemberDTO dateForm);

	public int getTotalCount(MemberDTO dateForm);
	
    public List<MemberProjectDTO> readUserProject(long uno);
    
    public boolean updateUserProject(MemberProjectDTO memberProjectDTO);
    
    boolean deleteUserProject(@Param("uno") Long uno, @Param("pjtNo") int pjtNo);
    
    public List<MemberProjectDTO> notAddUserProject(MemberProjectDTO searchNotAddUserProjects);
    
    public int getPjtTotalCount(MemberProjectDTO searchNotAddUserProjects );
    
    public boolean addUserProjects(MemberProjectDTO project);
    
}