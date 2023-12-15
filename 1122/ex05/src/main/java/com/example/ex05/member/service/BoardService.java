package com.example.ex05.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.domain.member.vo.MemberVO;

@Service
public interface BoardService {

	//게시글 등록
	public void register(MemberVO memberVO);

	//특정 게시글 가져오기
	public MemberVO get(Long uNo);

	// 게시글 수정
	public boolean modify(MemberVO member);

	// 게시글 삭제
	public boolean remove(Long uNo);

	//전체 게시글 가져오기
    public List<MemberVO> getList();
    
    
    
}
