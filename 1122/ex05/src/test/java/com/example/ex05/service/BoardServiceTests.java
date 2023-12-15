package com.example.ex05.service;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.ex05.domain.member.vo.MemberVO;
import com.example.ex05.member.service.BoardService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService boardService;
	
	@Test
	public void serviceTest() {
		log.info(boardService);
	}
	
//	@Test
//	public void registerTest() {
//		MemberVO member = new MemberVO();
//		member.setUNo(8302932);
//		member.setUNm("막둥이");
//		member.setPwd("mjjy0207=");
//		member.setBirth("19840420");
//		member.setPhoto("null");
//		member.setSex("01");
//		member.setEntrDate("20230319");
//		member.setJobRank("08");
//		member.setJobSkill("04");
//		member.setDevPt("01");
//		member.setInoffi_sts("01");
//		member.setMblNo("01044332490");
//		member.setEmailAddr("deato@daum.net");
//		member.setDelete_col("02");
//		
//		boardService.register(member);
//
//	}

	
//	@Test
//	public void getTest() {
//		MemberVO memberVO = boardService.get(8302932L);
//		
//		if(memberVO != null) {
//			log.info(memberVO);
//		}
//		log.info("NO User!!!!");
//		
//	}
	


//	@Before
//	public void modifyTest() {
//		MemberVO memberVO = boardService.get(8302932L);
//		if(memberVO == null) {
//			log.info("NO UserNumber!!!");
//			return;
//		}
//		memberVO.setUNm("막둥이");
//		memberVO.setPwd("makdy0107@");
//		memberVO.setBirth("19890722");
//		memberVO.setPhoto("null");
//		memberVO.setSex("01");
//		memberVO.setEntrDate("20230319");
//		memberVO.setJobRank("08");
//		memberVO.setJobSkill("04");
//		memberVO.setDevPt("01");
//		memberVO.setInoffi_sts("01");
//		memberVO.setMblNo("01022333990");
//		memberVO.setEmailAddr("deadto@daum.net");
//		memberVO.setDelete_col("02");
//		
//		if(boardService.modify(memberVO)) {
//			
//			
//		   log.info("UPDATE SUCCESS!!!");
//		   
//		   return;
//		}
//		
//		log.info("UPDATE FAILURE");
//				
//	}


//	@Before
//	public void removeTest() {
//		MemberVO memberVO = boardService.get(null);
//		
//		if(memberVO == null) {
//			log.info("NO USER!!!");
//			return;
//		}
//		
//		if(boardService.remove(memberVO.getUNo())) {
//		
//			log.info("REMOVE SUCCESS!!!!");
//			return;
//		}
//		
//		log.info("REMOVE FAILURE");
//		
//			
//	}
	

	@Test
	public void getListTest() {
		boardService.getList().forEach(log::info);
	}
	
	
}
