package com.example.ex05.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class BoardControllerTests {
	@Autowired
	private WebApplicationContext webApplicationContext;
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}
	
//	@Test
//	public void listTest() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
//	}

//	@Test
//	public void registerTest()throws Exception{
//		
//	log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
//			.param("uNo","1239909")
//			.param("uNm", "강주아")
//			.param("pwd", "kang09@1")
//			.param("birth", "20010205")
//			.param("photo", "null")
//			.param("sex", "02")
//			.param("entrDate", "20231019")
//            .param("jobRank", "08")
//            .param("jobSkill", "04")
//            .param("devPt", "01")
//            .param("inoffiSts", "01")
//            .param("mblNo", "01099050211")
//            .param("emailAddr","kangjua@naver.com")
//            .param("deleteCol", "01")			
//			).andReturn().getFlashMap());	
//	
//	}

//	@Test
//	public void readTest()throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/read")
//				.param("uNo", "1239909")
////				어디로 가는지 경로가 알고 싶으면 getModelAndView뒤에 getViewName()를
////				쓰고 전달자(모든정보)가 알고 싶으면 getModelMap을 쓴다
//				).andReturn().getModelAndView().getModelMap());
//	}
//	
	
//	@Test
//	public void removeTest()throws Exception{
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/remove")
//				.param("uNo", "")
//				).andReturn().getFlashMap());
//	}
//	
//	

//	@Test
//	public void modifyTest()throws Exception{
//		
//	log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
//			.param("uno", "1239909")
//			.param("unm", "강주아")
//			.param("pwd", "jua09@1")
//			.param("birth", "20040205")
//			.param("photo", "null")
//			.param("sex", "02")
//			.param("entrDate", "20231019")
//            .param("jobRank", "08")
//            .param("jobSkill", "04")
//            .param("devPt", "01")
//            .param("inoffiSts", "01")
//            .param("mblNo", "01099050211")
//            .param("emailAddr","kangjua@naver.com")
//            .param("deleteCol", "01")	
//			).andReturn().getFlashMap());	
//	
//	}
	

//	@Test
//	public void goModifyTest()throws Exception{
//		
//		mockMvc.perform(MockMvcRequestBuilders.get("/board/modify").param("uno", "1239909"));
//		
//	}
	
	
}
	