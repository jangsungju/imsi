package com.example.ex05.domain.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.event.TransactionalEventListener;

import com.example.ex05.domain.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardDAOTests {


	@Autowired
	BoardDAO boardDAO;
	
	@Test
	public void daoTest() {
		log.info(boardDAO);
	}
	
//	@Test
//	public void registerTest() {
//		MemberVO memberVO = new MemberVO();
//		memberVO.setUNo(2053121);
//		memberVO.setUNm("김밤비");
//		memberVO.setPwd("dambi007!=");
//		memberVO.setBirth("19880420");
//		memberVO.setPhoto("null");
//		memberVO.setSex("02");
//		memberVO.setEntrDate("20191020");
//		memberVO.setJobRank("06");
//		memberVO.setJobSkill("03");
//		memberVO.setDevPt("01");
//		memberVO.setInoffiSts("01");
//		memberVO.setMblNo("01044220990");
//		memberVO.setEmailAddr("dambi@naver.com");
//		memberVO.setDeleteCol("02");
//		
//		boardDAO.register(memberVO);
//
//	}

//	@Test
//	public void getTest() {
//		log.info(boardDAO.get(1442232L));
//	}
//	
//	@Test
//	public void modifyTest() {
//		
//		MemberVO memberVO = boardDAO.get(1442232L);
//		
//		if(memberVO == null) {
//			log.info("NO USER!!!");
//			return;
//		}
//		memberVO.setUNm("김담비");
//		memberVO.setJobRank("08");
//		
//		
//		log.info("UPDATE : " + boardDAO.modify(memberVO));
//	}

//	@Test
//	public void removeTest() {
//		MemberVO memberVO = boardDAO.get(1442232L);
//		
//		if(memberVO == null) {
//			log.info("NO USER!!!!");
//			return;
//		}
//		log.info("DELETE : " +boardDAO.remove(1442232L));
//	}
//
	@Test
	public void getListTest() {
		boardDAO.getList().forEach(log::info);
	}
	
}
