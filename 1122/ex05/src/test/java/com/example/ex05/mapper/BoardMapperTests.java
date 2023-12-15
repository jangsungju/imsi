package com.example.ex05.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.ex05.domain.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;

//	@Test
//	public void getListTest() {
//		boardMapper.getList().forEach(log::info);
//	}

//	사원의 정보 입력
//	@Test
//	public void insertTest() {
//		MemberVO member = new MemberVO();
//		member.setUNo(8922332);
//		member.setUNm("맨자구");
//		member.setPwd("mjjy0207=");
//		member.setBirth("19890722");
//		member.setPhoto("null");
//		member.setSex("02");
//		member.setEntrDate("20231019");
//		member.setJobRank("08");
//		member.setJobSkill("04");
//		member.setDevPt("01");
//		member.setInoffi_sts("01");
//		member.setMblNo("01022333990");
//		member.setEmailAddr("deadstar18@daum.net");
//		member.setDelete_col("02");
//		
//		boardMapper.insert(member);
//
//	}
	
//	@Test
//	public void readTests() {
//		MemberVO memberVO = boardMapper.read(8922332L);
//		log.info(memberVO);
//		
//	}
	
    
//	@Test
//	public void deleteTests() {
//		Long uNo = 8922332L;
//		MemberVO memberVO = boardMapper.read(uNo);
//		if(memberVO !=null) {
//			
//		log.info("DELETE COUNT : " + boardMapper.delete(memberVO.getUNo()));
//		
//		return;
//		}
//		log.info("NO UserNumber!!!");
//		
//	}
	

//	@Test
//	public void updateTests() {
//		MemberVO memberVO = boardMapper.read(8922332L); 
//		if(memberVO !=null) {
//			memberVO.setUNm("맨자구");
//			memberVO.setPwd("mjjy0207=");
//			memberVO.setBirth("19890722");
//			memberVO.setPhoto("null");
//			memberVO.setSex("02");
//			memberVO.setEntrDate("20231019");
//			memberVO.setJobRank("08");
//			memberVO.setJobSkill("04");
//			memberVO.setDevPt("01");
//			memberVO.setInoffi_sts("01");
//			memberVO.setMblNo("01022333990");
//			memberVO.setEmailAddr("dead18@daum.net");
//			memberVO.setDelete_col("02");
//			
//		   log.info("UPDATE COUNT : " + boardMapper.update(memberVO));
//		   
//		   return;
//		}
//		log.info("NO UserNumber!!!");
//	}
//	
	
	
	
	
}
