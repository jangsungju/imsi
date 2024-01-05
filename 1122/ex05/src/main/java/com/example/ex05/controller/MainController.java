package com.example.ex05.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.example.ex05.domain.member.vo.MemberDTO;
import com.example.ex05.main.service.MainService;
import com.example.ex05.menu.vo.MenuDTO;
import com.example.ex05.sha.UserSha256;

import io.jsonwebtoken.Jwt;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")
public class MainController {

 
	@Autowired
	private MainService mainService;

	@Autowired
	private MemberDTO memberDTO;
	
	@GetMapping("/login")
	public void loginPage() {
		
		log.info("======loginpage====");
	}
	
	@PostMapping("/login")
	@ResponseBody
	 public ResponseEntity<Map<String,Object>> login(@RequestBody @Validated  MemberDTO formData, HttpSession session) {

		Map<String, Object> map = new HashMap<>();
		 // 사용자가 입력한 아이디와 비밀번호를 받아옴
		log.info("====login===");
		log.info("userId,pwd 등등"+formData);
		

		 
		 // DB에서 해당 userId의 사용자 정보를 가져옴
	    MemberDTO loginList = mainService.login(formData.getUId());
	    
	    // 사용자 정보가 null인 경우 (아이디가 존재하지 않음)
	    if (loginList == null) {
	        map.put("loginResult", false);
	        map.put("errorMessage", "아이디가 존재하지 않습니다.");
	        return new ResponseEntity<>(map, HttpStatus.OK);
	    }
	    
	    
	    log.info("pwd"+loginList.getPwd());
	    // 사용자가 입력한 비밀번호를 암호화
	    String encryptedPwd = UserSha256.encrypt(formData.getPwd());

	    // DB에 저장된 비밀번호와 사용자가 입력한 비밀번호의 암호화된 값을 비교
	    if (loginList.getPwd() != null && loginList.getPwd().equals(encryptedPwd)) {
	    	
	    	String authoNo = mainService.getAuthoNo(loginList.getUno());
    	   	List<MenuDTO> menuItems = mainService.getMenu(authoNo);
	    	session.setAttribute("uno", loginList.getUno());
	        session.setAttribute("authoNo",authoNo);
	        session.setAttribute("unm", loginList.getUnm());
	        session.setAttribute("menuItems", menuItems);
	     
	        map.put("loginResult", true);
	    
	    } else { // 로그인 실패
	       
	    	map.put("loginResult", false);
	        map.put("errorMessage", "아이디 또는 비밀번호가 틀립니다.");
	    
	    }
	    
	    
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@PostMapping("/logout")
	@ResponseBody
	public ResponseEntity<?> logout(HttpSession session) {
	    log.info("==== Logout ====");
	    session.invalidate();
	    return ResponseEntity.ok().build(); // 성공 응답만 보냄
	}
	
}
