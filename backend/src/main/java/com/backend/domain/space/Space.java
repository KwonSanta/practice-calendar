package com.backend.domain.space;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Space {
    private int id;
    private String title; // 제목
    private String subtitle; // 부제 : 한줄 소개글
    private String description; // 설명
    private String address; // 주소
    private String capacity; // 수용인원
    private String numberOfAvailableParking; // 주차가능 차량수
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
