package com.example.ex05.exception;



//@Controller
//public class CustomError {
//  
//	@GetMapping("/error")
//	public String goErrorPage() {
//		 return "error/error";
//	}
//}


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomError {
	@GetMapping("/error")
	public String goErrorPage() {
		return "error/error";
	}
}
