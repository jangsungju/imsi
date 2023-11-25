package com.example.ex05.domain.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SearchRequest {
    private String unm;
    private String jobSkill;
    private String inoffiSts;
    private String startDate;
    private String endDate;
}