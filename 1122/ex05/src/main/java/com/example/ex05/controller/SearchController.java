package com.example.ex05.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.ex05.domain.vo.MemberDTO;
import com.example.ex05.service.MemberService;

@RestController
@RequestMapping("/api")
public class SearchController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/search")
    public List<MemberDTO> search(@RequestBody MemberDTO dataForm) {
        return memberService.search(dataForm);
    }

    @PostMapping("/totalCount")
    public int getTotalCount(@RequestBody MemberDTO dataForm) {
        return memberService.getTotalCount(dataForm);
    }

}