package com.example.ex05.menu.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MenuDTO {

	private int menuId; // 메뉴 ID
    private String menuName; // 메뉴 이름
    private String menuUrl; // 메뉴 URL
    
}
